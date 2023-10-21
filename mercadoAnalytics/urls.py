from django.contrib import admin
from django.urls import path,include
from django.views.generic import TemplateView
from mercadoAnalytics.views import *
from . import views

urlpatterns = [
	#path('',TemplateView.as_view(template_name='analise.html'), name='analise'),
	
	path("config/", views.config,name='IAconfig'),
    path("home/", views.home,),
    path("", views.home,name='analiticsHome'),
    path("produtos_doados/", views.home_total_produtos_doados),
    path("produtos_atendimento/", views.produtos_por_atendimento,name='AcompanhamentoProdutos'),
    path("produtos_atendimento/<str:data>", views.analisa_produtos_por_atendimento),
    path("categorias_doadas/", views.home_categorias_produtos_doados),
	
	path("atendimento_anterior/<str:data>", views.atendimento_anterior_data),
	path("atendimento_anterior/", views.atendimento_anterior,name="AtendimentoAnterior"),
	
	path("proximo_atendimento/gerarListaCompras/", views.lista_compra_produtos),
	
	path("proximo_atendimento/", views.proximo_atendimento,name='PrevisaoProximoAtendimento')
]