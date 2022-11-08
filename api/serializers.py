
from rest_framework import serializers

from Mercado.models import Atendimento, ItensAtendimento

class AtendimentoSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = Atendimento
		fields = ['tipo','atendente','data','solidarios']

class ItemAtendimentoSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = ItensAtendimento
		fields = ['quantidade', 'produto','solidarios','validade']

