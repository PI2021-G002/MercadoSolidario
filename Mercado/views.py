from copy import copy
from unittest import result
from django.shortcuts import render
from django.utils.formats import date_format
from pkg_resources import require
from .models import AtendimentoRascunho, Estoque, Atendimento, ItensAtendimento, ProdutoSolidario, FonteDoacao, CodBarProdSol
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
def iniciaRascunho(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
      solidarios = request.POST.__getitem__('solidario')
      rascunho = AtendimentoRascunho.objects.create(tipo='mercado',atendente=request.user.username,data=datetime.now(),finalizado=False,solidarios=solidarios);
      if rascunho:
        response = HttpResponse("Rascunho de Atendimento Criado com sucesso")
        response.set_cookie('rascunho_id',rascunho.id)
        context = {
            'rascunho' : rascunho
        }
    else:
        return render(request, 'atendimentos/atendimentos_solidarios.html')
    return render(request, 'atendimentos/atendimentos_rascunho.html', {'context':context})

def codigoMercado(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
      form=FormAtendimento()
    else:
        return render(request, 'atendimentos/atendimentos_solidarios.html')
    return render(request, 'atendimentos/atendimentos_rascunho.html', {'form': form})