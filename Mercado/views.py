from asyncio.proactor_events import _ProactorBasePipeTransport
from copy import copy
from doctest import testfile
from email import message
from imp import acquire_lock
from unittest import result
from django.shortcuts import render
from django.utils.formats import date_format
from pkg_resources import require
from .models import AtendimentoRascunho, Categoria, Estoque, Atendimento, ItensAtendimento, ItensAtendimentoRascunho, ProdutoSolidario, FonteDoacao, CodBarProdSol, PessoasAtendimento
from django.db.models import Q,F,Sum
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

def numberOfDays( y, m):
      leap = 0
      if y% 400 == 0:
         leap = 1
      elif y % 100 == 0:
         leap = 0
      elif y% 4 == 0:
         leap = 1
      if m==2:
         return 28 + leap
      list = [1,3,5,7,8,10,12]
      if m in list:
         return 31
      return 30

@login_required
def estoque_listagem(request):
    return render(request, 'estoque/estoque_lista.html',
                  {   # o filter remove da listagem os itens com quantidade de Entrada = quantidade_saida, ou seja, zero de estoque
                      'estoque': Estoque.objects.all().filter(~Q(quantidade=F('quantidade_saida'))).order_by('id_produto')
                  })

@login_required
def estoque_listagem_validade(request):
    return render(request, 'estoque/estoque_lista_validade.html',
                  {   # o filter remove da listagem os itens com quantidade de Entrada = quantidade_saida, ou seja, zero de estoque
                      'estoque': Estoque.objects.all().filter(~Q(quantidade=F('quantidade_saida'))).order_by('validade')
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
            'select concat(cat.Categoria," ",pro.quantidade,pro.unidade) as produto ,sum(est.quantidade - est.quantidade_saida) as quantidade, pro.estoque_minimo from Mercado_estoque est, Mercado_categoria cat, Mercado_produtosolidario pro where cat.id = pro.id_categoria_id and est.id_produto_id = pro.id group by est.id_produto_id ORDER BY produto;')
        row = cursor.fetchall()
        result = fromCursorToTableData(cursor, row)
    return result

@login_required
def estoque_listagem_categoria(request):
    #avaliar a necessidade dessa função
    return render(request, 'estoque/estoque_lista_categoria.html',
                  {
#                      'estoque': Estoque.objects.annotate(Total=Sum('id_produto__quantidade'))
                      'estoque': getEstoquePorCategoria()
                  })

def getEstoquePorCategoria():
    with connection.cursor() as cursor:
        cursor.execute(
            'select concat(cat.Categoria," ",pro.quantidade,pro.unidade) as produto ,sum(est.quantidade) as quantidade, pro.estoque_minimo from Mercado_estoque est, Mercado_categoria cat, Mercado_produtosolidario pro where cat.id = pro.id_categoria_id and est.id_id = pro.id group by est.id_produto_id ORDER BY produto;')
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
                return HttpResponseRedirect('../entrada/')
            else:
                form = FormEntradaEstoqueProduto(request.POST)
                messages.error(request,"Data de validade menor ou igual a hoje. O produto está vencido ou sem estoque?")
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
            return render(request, 'atendimentos/atendimentos_solidarios.html',{'assistidos':PessoasAtendimento.objects.all().filter(ativo=True)})
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
    produtoSolidario=ProdutoSolidario.objects.all().order_by('id_categoria','quantidade','unidade')
    context = {
       'rascunho':rascunho,
       'itens':itens,
       'produtoSolidario':produtoSolidario
    }
    return render(request, 'atendimentos/atendimentos_rascunho.html', {'context':context})

@login_required
def codigoMercado(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        # É o post com os dados para cadastrar
        form = FormAtendimento(request.POST)
        if request.POST.__contains__('quantidade'):
            # check whether it's valid: e data de validade maior que hoje.
            if form.is_valid() and (form.cleaned_data['dataValidade'].isoformat() >= datetime.now().isoformat()):
                # save data
                #id_produto = ProdutoSolidario(request.POST.__getitem__('idp'))
                #id_produto.id = 
                quantidade = request.POST.__getitem__('quantidade')
                # com o uso do widget do forms -> validade = request.POST.__getitem__('dataValidade_year') + '-' + request.POST.__getitem__('dataValidade_month') + '-' + request.POST.__getitem__('dataValidade_day')
                validade = request.POST.__getitem__('dataValidade')
                # Cria registro e mostra mensagem de sucesso.
                atendimento = AtendimentoRascunho.objects.filter(id=request.COOKIES.get('rascunho_id')).first()
                codbar = CodBarProdSol.objects.filter(codigo_barras=request.POST.__getitem__('codigo_barras')).first()
                produto = request.POST.__getitem__('produto')
                solidarios = int(float((request.POST.__getitem__('solidarios'))))
                pesquisaItem = ItensAtendimentoRascunho.objects.filter(id_atendimento=atendimento,id_codigo=codbar.id_produto).first()
                if pesquisaItem : # caso exista um item do tipo da lista não deixa colocar novamente
                    response = HttpResponseRedirect('rascunho')
                    messages.error(request, "Já existe um item desse tipo na lista. Tente outro produto solidário.")
                    return response
                item = ItensAtendimentoRascunho.objects.create( id_atendimento=atendimento,
                                                                id_codigo=codbar.id_produto,
                                                                produto=produto,
                                                                quantidade=quantidade,
                                                                validade=validade,
                                                                solidarios=solidarios,
                                                                )
                messages.success(request, "Item Inserido na Lista com Sucesso")
                # sai da classe e volta na tela de scan com a mensagem
                rascunho = AtendimentoRascunho.objects.get(id__exact=atendimento.id)   
                itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
                produtoSolidario=ProdutoSolidario.objects.all().order_by('id_categoria','quantidade','unidade')
                context = {
                    'rascunho':rascunho,
                    'itens':itens,
                    'produto':produto,
                    'codigo':codbar,
                    'produtoSolidario':produtoSolidario
                }
                return render(request, 'atendimentos/atendimentos_rascunho.html', {'context':context,'form':form})
            else:
                form = FormAtendimento(request.POST)
                messages.error(request,"Data de validade menor ou igual a hoje. O produto está vencido ou sem estoque?")
                rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
                estoque = Estoque.objects.filter(id_produto_id=request.POST.__getitem__('idp')).order_by('validade')
                context = {
                   'rascunho':rascunho,
                   'estoque':estoque,
                }
                return render(request, 'atendimentos/atendimentos_rascunho_produto.html', {'context':context,'form':form})
        else:
            #É o post para procurar o produto
            codigo_barras=request.POST.__getitem__('codigo')
            if codigo_barras.startswith("202210") : 
               # para QRCode
               produto = ProdutoSolidario.objects.filter(codigo_solidario=codigo_barras).first()
               prodsol = CodBarProdSol.objects.filter(id_produto_id=produto.id).first()
               if produto and prodsol:
                   codigo_barras = prodsol.codigo_barras
               else:
                    #não encontrou o produto
                    messages.error(request,"Produto não encontrado. Tente novamente. Se persistir, informe ao administrador do mercado. (qrok)")
                    rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
                    itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
                    produtoSolidario=ProdutoSolidario.objects.all().order_by('id_categoria','quantidade','unidade')
                    context = {
                    'rascunho':rascunho,
                    'itens':itens,
                    'produtoSolidario':produtoSolidario
                    }
                    return render(request, 'atendimentos/atendimentos_rascunho.html', {'context':context,'form':form})
            else :
               #  para códigos de barras
               prodsol=CodBarProdSol.objects.filter(codigo_barras=codigo_barras).first()
              
            # se o código já está cadastrado
            if prodsol :
                produto=ProdutoSolidario.objects.get(id__exact=prodsol.id_produto_id)
                categoria=Categoria.objects.get(id__exact=produto.id_categoria_id)
                form=FormAtendimento(initial={
                    'idp':produto.id,
                    'produto':categoria.categoria + ' ' + str(produto.quantidade) + produto.unidade,
                    'max_fam':produto.max_familia,
                    'solidarios':produto.preco_solidario,
                    'codigo_barras':codigo_barras,
                    'id_prodsol':prodsol.id,
                    })
                rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
                itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
                estoque = Estoque.objects.filter(id_produto_id=produto.id).filter(~Q(quantidade=F('quantidade_saida'))).order_by('validade')
                context = {
                    'rascunho':rascunho,
                    'itens':itens,
                    'produto':produto,
                    'codigo':codigo_barras,
                    'srestantes':request.POST.__getitem__('srestantes'),
                    'estoque':estoque
                }
                return render(request, 'atendimentos/atendimentos_rascunho_produto.html', {'context':context,'form':form})
            else:
                #não encontrou o produto
                messages.error(request,"Produto não encontrado. Tente novamente. Se persistir, informe ao administrador do mercado.")
                rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
                itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
                produtoSolidario=ProdutoSolidario.objects.all().order_by('id_categoria','quantidade','unidade')
                context = {
                    'rascunho':rascunho,
                    'itens':itens,
                    'produtoSolidario':produtoSolidario
                }
                return render(request, 'atendimentos/atendimentos_rascunho.html', {'context':context,'form':form})
    else: # é um GET - informar o form e carregar os dados
        rascunho = AtendimentoRascunho.objects.get(id__exact=request.COOKIES.get('rascunho_id'))
        itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
        produtoSolidario=ProdutoSolidario.objects.all()
        context = {
            'rascunho':rascunho,
            'itens':itens,
            'produtoSolidario':produtoSolidario
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
        # pega os dados do post e prepara para o processamento
        rascunho = AtendimentoRascunho.objects.get(id__exact=value)
        itens = ItensAtendimentoRascunho.objects.filter(id_atendimento_id=rascunho.id)
        
        # verifica se há itens no estoque que podem ser dado baixa.
        flag = 0
        for item in itens:
            #print(codProdSol)
            estoques = Estoque.objects.filter(id_produto=item.id_codigo,validade=item.validade)
            for estoque in estoques:
              if estoque.quantidade - estoque.quantidade_saida >= item.quantidade:
                flag += 1
                break
       
        # se tiver todos os itens dá baixa no estoque
        if len(itens) == flag:
            for item in itens:
              estoques = Estoque.objects.filter(id_produto=item.id_codigo,validade=item.validade)
              for estoque in estoques:
                  estoque.quantidade_saida = estoque.quantidade_saida + item.quantidade
                  estoque.save()
        # se não tiver todos os itens gera mensagem de erro.
        else:
            response = HttpResponseRedirect("rascunho")
            messages.error(request, "Para um ou mais itens não foi encontrado estoque suficiente para dar baixa.")
            return response
        # copia a tabela para a tabela atendimento
        kwargs = model_to_dict(rascunho,exclude=['id'])
        kwargs['data'] = datetime.now()
        atendimento = Atendimento.objects.create(**kwargs)
        # copia os itens da tabela itensRascunho para a tabela itens
        for item in itens:
            kwargs = model_to_dict(item,exclude=['id'])
            kwargs['id_atendimento']=atendimento
            tmp = ProdutoSolidario.objects.get(id__exact=kwargs['id_codigo'])
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

    
@login_required
def relatoriosConsumoPeriodo(request):
    # if this is a POST request we need to process the form data
    if request.method == 'GET':
      # Se for o primeiro GET (a partir do menu) mostra o relátorio do mês corrente
      #https://stackoverflow.com/questions/37396329/finding-first-day-of-the-month-in-python
      #https://www.tutorialspoint.com/number-of-days-in-a-month-in-python#:~:text=Practical%20Data%20Science%20using%20Python&text=Suppose%20we%20have%20one%20year,then%20the%20result%20is%2029.&text=if%20m%20is%20in%20the,31%2C%20otherwise%2C%20return%2030.
      inicial = datetime.today().replace(day=1)
      final  = datetime.today().replace(day=numberOfDays( inicial.year,inicial.month ))
    else:
      # se for um POST
      inicial = datetime.strptime(request.POST.__getitem__('inicial'), '%d/%m/%Y').date()
      final  = datetime.strptime(request.POST.__getitem__('final'), '%d/%m/%Y').date()

    #with connection.cursor() as cursor:
    #    cursor.execute(
    #        'select * from concat(cat.Categoria," ",pro.quantidade,pro.unidade) as produto ,sum(est.quantidade) as quantidade, pro.estoque_minimo from Mercado_estoque est, Mercado_categoria cat, Mercado_produtosolidario pro where cat.id = pro.id_categoria_id and est.id_id = pro.id group by est.id_produto_id ORDER BY produto;')
    #    row = cursor.fetchall()
    #    result = fromCursorToTableData(cursor, row)

    atendimentos = Atendimento.objects.filter(data__gte=inicial,data__lte=final).values_list('id')
    #print(atendimentos)
    itensAtendimentos = ItensAtendimento.objects.filter(id_atendimento_id__in=atendimentos).values('produto').annotate(tot_itens=Sum('quantidade'))
    #print(itensAtendimentos)
    context = {
        'atendimentos' : atendimentos,
        'itens_atendimentos' : itensAtendimentos,
        'inicial': inicial,
        'final': final
    }
    return render(request,'relatorios/consumo_periodo.html',{ 'context': context })

@login_required
def relatoriosNecessidadePeriodo(request):
    # if this is a POST request we need to process the form data
    if request.method == 'GET':
      # Se for o primeiro GET (a partir do menu) mostra o relátorio do mês corrente
      #https://stackoverflow.com/questions/37396329/finding-first-day-of-the-month-in-python
      #https://www.tutorialspoint.com/number-of-days-in-a-month-in-python#:~:text=Practical%20Data%20Science%20using%20Python&text=Suppose%20we%20have%20one%20year,then%20the%20result%20is%2029.&text=if%20m%20is%20in%20the,31%2C%20otherwise%2C%20return%2030.
      inicial = datetime.today().replace(day=1)
      final  = datetime.today().replace(day=numberOfDays( inicial.year,inicial.month ))
    else:
      # se for um POST
      inicial = datetime.strptime(request.POST.__getitem__('inicial'), '%d/%m/%Y').date()
      final  = datetime.strptime(request.POST.__getitem__('final'), '%d/%m/%Y').date()

    #with connection.cursor() as cursor:
    #    cursor.execute(
    #        'select * from concat(cat.Categoria," ",pro.quantidade,pro.unidade) as produto ,sum(est.quantidade) as quantidade, pro.estoque_minimo from Mercado_estoque est, Mercado_categoria cat, Mercado_produtosolidario pro where cat.id = pro.id_categoria_id and est.id_id = pro.id group by est.id_produto_id ORDER BY produto;')
    #    row = cursor.fetchall()
    #    result = fromCursorToTableData(cursor, row)

    atendimentos = Atendimento.objects.filter(data__gte=inicial,data__lte=final).values_list('id')
    #print(atendimentos)
    itensAtendimentos = ItensAtendimento.objects.filter(id_atendimento_id__in=atendimentos).values('produto').annotate(tot_itens=Sum('quantidade'))
    #print(itensAtendimentos)
    estoques = getEstoquePorProduto()

    context = {
        'atendimentos' : atendimentos,
        'itens_atendimentos' : itensAtendimentos,
        'inicial': inicial,
        'final': final,
        'estoques' : estoques
    }
    return render(request,'relatorios/necessidade_periodo.html',{ 'context': context })

