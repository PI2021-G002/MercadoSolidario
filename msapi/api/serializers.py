from rest_framework import serializers

from api.models import AtendimentosMercadoModel

class AtendimentosMercadoSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = AtendimentosMercadoModel
		fields = ['tipo_atendimento', 'atendente', 'data_atendimento', 'solidarios_inicial', 'quantidade', 'registro_atendimento', 'produto','preco_produto']
		