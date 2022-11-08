from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from rest_framework import permissions
#from tutorial.quickstart.permissions import IsOwnerOrReadOnly
from api.serializers import AtendimentoSerializer, ItemAtendimentoSerializer

from Mercado.models import Atendimento, ItensAtendimento

from django.core import serializers
from django.db import connection
from django.http import HttpResponseRedirect, HttpResponse

# Não atualiza quando faz um novo atendimento e aperta F5
class AtendimentosMercadoViewSet(viewsets.ModelViewSet):
	"""
	API endpoint atendimentosMercado retorna a pesquisa agregada dos atendimentos realizados pelo mercado e os produtos doados.
	"""
	
	sql = 'SELECT ma.id, ma.tipo AS tipo_atendimento, ma.atendente, ma.data AS data_atendimento, ma.solidarios AS solidarios_inicial, mi.id, mi.quantidade, mi.id_atendimento_id AS registro_atendimento, mi.produto, mi.solidarios AS preco_produto FROM Mercado_atendimento as ma INNER JOIN Mercado_itensatendimento as mi ON mi.id_atendimento_id = ma.id;'
	
	queryset = ItensAtendimento.objects.raw(sql)
	serializer_class = ItemAtendimentoSerializer
	permission_classes = [permissions.IsAuthenticatedOrReadOnly]

# O retorno precisa melhorar o formato.
class AtendimentosViewSet(viewsets.ViewSet):
	"""
	API endpoint atendimentosMercado retorna a pesquisa agregada dos atendimentos realizados pelo mercado e os produtos doados.
	"""
	def list(self, request):
	
		sql = 'SELECT ma.id, ma.tipo AS tipo_atendimento, ma.atendente, ma.data AS data_atendimento, ma.solidarios AS solidarios_inicial, mi.id, mi.quantidade, mi.id_atendimento_id AS registro_atendimento, mi.produto, mi.solidarios AS preco_produto FROM Mercado_atendimento as ma INNER JOIN Mercado_itensatendimento as mi ON mi.id_atendimento_id = ma.id;'
	
		queryset = ItensAtendimento.objects.raw(sql)
		serializer_class = ItemAtendimentoSerializer
		atendimentos_list = serializers.serialize('json', queryset)
		
		return HttpResponse(atendimentos_list, content_type="application/json")