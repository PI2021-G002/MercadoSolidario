from asyncio.proactor_events import _ProactorBasePipeTransport
from copy import copy
from unittest import result
from django.shortcuts import render
from django.utils.formats import date_format
from pkg_resources import require
from .models import AtendimentoRascunho, Categoria, Estoque, Atendimento, ItensAtendimento, ItensAtendimentoRascunho, ProdutoSolidario, FonteDoacao, CodBarProdSol
from django.shortcuts import render
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth import logout
from django.http import HttpResponseRedirect, HttpResponse
from .forms import FormEntradaEstoqueCodBar, FormEntradaEstoqueProduto,FormAtendimento
from datetime import date, datetime
from django.db import connection
from django.contrib import messages
from datetime import date, datetime
from django.db.models.functions import Concat
from django.forms import model_to_dict

# Create your views here.


def logout_view(request):
    logout(request)
    return render(request, 'index.html')


def fromCursorToTableData(cursor, rows):
    x = cursor.description
    resultsList = []
    for r in rows:
        i = 0
        d = {}
        while i < len(x):
            d[x[i][0]] = r[i]
            i = i+1
        resultsList.append(d)
    return resultsList


@login_required
def estoque_listagem(request):
    return render(request, 'estoque/estoque_lista.html',
                  {
                      'estoque': Estoque.objects.all().order_by('id_produto')
                  })

@login_required
def estoque_listagem_validade(request):
    return render(request, 'estoque/estoque_lista_validade.html',
                  {
                      'estoque': Estoque.objects.all().order_by('validade').annotate(test=Concat('validade','validade'))
                  })

@login_required
def estoque_listagem_prodSol(request):
    return render(request, 'estoque/estoque_lista_quantidade.html',
                  {
#                      'estoque': Estoque.objects.annotate(Total=Sum('id_produto__quantidade'))
                      'estoque': getEstoquePorProduto()
                  })

def getEstoquePorProduto():
    with connection.cursor() as cursor:
        cursor.execute(
            'select concat(cat.Categoria," ",pro.quantidade,pro.unidade) as produto ,sum(est.quantidade) as quantidade, pro.estoque_minimo from Mercado_estoque est, Mercado_categoria cat, Mercado_produtosolidario pro where cat.id = pro.id_categoria_id and est.id_produto_id = pro.id group by est.id_produto_id ORDER BY produto;')
        row = cursor.fetchall()
        result = fromCursorToTableData(cursor, row)
    return result

@login_required
def entradaEstoque(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        form = FormEntradaEstoqueProduto(request.POST)
        # É o post com os dados para cadastrar
        if request.POST.__contains__('quantidade'):
            # check whether it's valid: e data de validade maior que hoje.
            if form.is_valid() and (form.cleaned_data['dataValidade'].isoformat() >= datetime.now().isoformat()):
                # save data
                id_produto = ProdutoSolidario(request.POST.__getitem__('idp'))
                #id_produto.id = 
                quantidade = request.POST.__getitem__('quantidade')
                validade = request.POST.__getitem__('dataValidade_year') + '-' + request.POST.__getitem__('dataValidade_month') + '-' + request.POST.__getitem__('dataValidade_day')
                id_fonte = FonteDoacao()
                id_fonte.id = request.POST.__getitem__('id_fonte')
                data = datetime.now()
                quem_cadastrou = request.POST.__getitem__('quem_cadastrou')
                # Cria registro e mostra mensagem de sucesso.
                estoque = Estoque.objects.create(id_produto=id_produto,quantidade=quantidade,validade=validade,id_fonte=id_fonte,quem_cadastrou=quem_cadastrou,data=data);
                messages.success(request, "Item de Estoque Criado com Sucesso")
                # sai da classe e volta na tela de scan com a mensagem
            else:
                form = FormEntradaEstoqueProduto(request.POST)
                messages.error(request,"Data de validade menor ou igual a hoje. O produto está vencido?")
        else:
            # É o post com o código para procurar na base
            codigo_barras=request.POST.__getitem__('codigo')
            form = FormEntradaEstoqueCodBar(request.POST)
            # verifica se o código já está associado a um produto solidário
            produtoSolidario = CodBarProdSol.objects.filter(codigo_barras=codigo_barras)
            # Se o código já está associado a um produto solidário mostrar o formulário completo de entrada de estoque
            if produtoSolidario.count() > 0:
                form = FormEntradaEstoqueProduto(initial={'id_produto': produtoSolidario.first().id_produto,'quem_cadastrou':request.user.username,'idp':produtoSolidario.first().id_produto_id})
            # se não tiver associado avisa o usuário
            else:
                messages.error(request,"Código não foi cadastrado ainda.",extra_tags="SEMCADASTRO")
                # mostrar tela para escolher produto solidário  

    # if a GET (or any other method) we'll create a blank form
    else:
        form = FormEntradaEstoqueCodBar()

    return render(request, 'estoque/entrada_estoque_codigo.html', {'form': form})

@login_required
def informaSolidarios(request):
#    path('Atendimento/mercado',TemplateView.as_view(template_name='atendimentos/atendimentos_solidarios.html'),name='Atendimentos'),
    context = { }
    if request.method == 'GET':
        value = request.COOKIES.get('rascunho_id')
        if value is None: # exibe form de início
            return render(request, 'atendimentos/atendimentos_solidarios.html')
        else:
            context = { 'rascunho_id': value, 'solidarios':request.COOKIES.get('solidarios')}
            return render(request, 'atendimentos/atendimentos_solidarios.html', {'context':context})
    else:
        pass
    return render(request, 'atendimentos/atendimentos_solidarios.html', {'context':context})

@login_required
def iniciaRascunho(request):
    # if this is a POST request we need to process the form data
    context = {}
    if request.method == 'POST':
        solidarios = request.POST.__getitem__('solidario')
        value = request.COOKIES.get('rascunho_id')

        if value is None:
            rascunho = AtendimentoRascunho.objects.create(tipo='mercado',atendente=request.user.username,data=datetime.now(),finalizado=False,solidarios=solidarios);
            if rascunho:
        #        response = HttpResponse("Rascunho de Atendimento Criado com sucesso")
                response = HttpResponseRedirect('rascunho')
                response.set_cookie('rascunho_id',rascunho.id)
                response.set_cookie('solidarios',solidarios)
                context = {
                    'rascunho' : rascunho
                }
                return response
    rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
    itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
    context = {
       'rascunho':rascunho,
       'itens':itens
    }
    return render(request, 'atendimentos/atendimentos_rascunho.html', {'context':context})

@login_required
def codigoMercado(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        # É o post com os dados para cadastrar
        if request.POST.__contains__('quantidade'):
            form = FormAtendimento(request.POST)
             # check whether it's valid: e data de validade maior que hoje.
            if form.is_valid() and (form.cleaned_data['dataValidade'].isoformat() >= datetime.now().isoformat()):
                # save data
                #id_produto = ProdutoSolidario(request.POST.__getitem__('idp'))
                #id_produto.id = 
                quantidade = request.POST.__getitem__('quantidade')
                validade = request.POST.__getitem__('dataValidade_year') + '-' + request.POST.__getitem__('dataValidade_month') + '-' + request.POST.__getitem__('dataValidade_day')
                # Cria registro e mostra mensagem de sucesso.
                atendimento = AtendimentoRascunho.objects.filter(id=request.COOKIES.get('rascunho_id')).first()
                codbar = CodBarProdSol.objects.filter(codigo_barras=request.POST.__getitem__('codigo_barras')).first()
                produto = request.POST.__getitem__('produto')
                solidarios = int(float((request.POST.__getitem__('solidarios'))))
                item = ItensAtendimentoRascunho.objects.create( id_atendimento=atendimento,
                                                                id_codigo=codbar,
                                                                produto=produto,
                                                                quantidade=quantidade,
                                                                validade=validade,
                                                                solidarios=solidarios
                                                                )
                messages.success(request, "Item Inserido na Lista com Sucesso")
                # sai da classe e volta na tela de scan com a mensagem
                rascunho = AtendimentoRascunho.objects.get(id__exact=atendimento.id)   
                itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
                context = {
                    'rascunho':rascunho,
                    'itens':itens,
                    'produto':produto,
                    'codigo':codbar
                }

                return render(request, 'atendimentos/atendimentos_rascunho.html', {'context':context,'form':form})
            else:
                form = FormAtendimento(request.POST)
                messages.error(request,"Data de validade menor ou igual a hoje. O produto está vencido?")
                rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
                context = {
                   'rascunho':rascunho,
                }
                return render(request, 'atendimentos/atendimentos_rascunho_produto.html', {'context':context,'form':form})
        else:
            codigo_barras=request.POST.__getitem__('codigo')
            prodsol=CodBarProdSol.objects.filter(codigo_barras=codigo_barras).first()
            
            produto=ProdutoSolidario.objects.get(id__exact=prodsol.id_produto_id)
            categoria=Categoria.objects.get(id__exact=produto.id_categoria_id)
            form=FormAtendimento(initial={
                'idp':produto.id,
                'produto':categoria.categoria + ' ' + str(produto.quantidade) + produto.unidade,
                'max_fam':produto.max_familia,
                'solidarios':produto.preco_solidario,
                'codigo_barras':codigo_barras,
                'id_prodsol':prodsol.id
                })
            rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
            itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
            context = {
                'rascunho':rascunho,
                'itens':itens,
                'produto':produto,
                'codigo':codigo_barras,
                'srestantes':request.POST.__getitem__('srestantes')
            }
            return render(request, 'atendimentos/atendimentos_rascunho_produto.html', {'context':context,'form':form})
    else:
        rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
        itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
        context = {
        'rascunho':rascunho,
        'itens':itens
        }
        return render(request, 'atendimentos/atendimentos_rascunho.html', {'context':context,'form':form})

def cancelarRascunho(request):
    # if this is a POST request we need to process the form data
    if request.method == 'GET':
        response = HttpResponseRedirect('../Atendimento')
        ItensAtendimentoRascunho.objects.filter(id_atendimento=request.COOKIES.get('rascunho_id')).delete()
        AtendimentoRascunho.objects.filter(id=request.COOKIES.get('rascunho_id')).delete()
        response.delete_cookie('rascunho_id')
        response.delete_cookie('solidarios')
        messages.success(request, "Atendimento Cancelado com sucesso")
    return response

def removerItem(request,id=0):
    # if this is a POST request we need to process the form data
    if request.method == 'GET':
        response = HttpResponseRedirect('../rascunho')
        ItensAtendimentoRascunho.objects.filter(id=id).delete()
        messages.success(request, "Item removido com sucesso")
    return response

@login_required
def concluirAtendimento(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        value = request.COOKIES.get('rascunho_id')
        # copia a tabela para a tabela atendimento
        rascunho = AtendimentoRascunho.objects.get(id__exact=value)
        kwargs = model_to_dict(rascunho,exclude=['id'])
        kwargs['data'] = datetime.now()
        atendimento = Atendimento.objects.create(**kwargs)
        # copia os itens da tabela itensRascunho para a tabela itens
        itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
        for item in itens:
            kwargs = model_to_dict(item,exclude=['id'])
            kwargs['id_atendimento']=atendimento
            tmp = CodBarProdSol.objects.get(id__exact=kwargs['id_codigo'])
            kwargs['id_codigo']=tmp
            tmp = ItensAtendimento.objects.create(**kwargs)
            
        #Seta atendimento como concluido
        atendimento.finalizado = True
        
        #apaga rascunhos
        itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id).delete()
        rascunho = AtendimentoRascunho.objects.filter(id__exact=value).delete()
        #remove cookies
        #retorna na tela de atendimentos
        response = HttpResponseRedirect('/Mercado/Atendimento')
        messages.success(request, "Atendimento Encerrado com sucesso")
        response.delete_cookie('rascunho_id')
        response.delete_cookie('solidarios')

        return response

def emDesenvolvimento(request):
    return render(request,'em_desenvolvimento.html')