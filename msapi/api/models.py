from django.db import models

# Create your models here.
	
# erro migrate https://stackoverflow.com/questions/35494035/django-migrate-doesnt-create-tables

from email.policy import default

'''Tabela criada para receber os dados que foram serialziados geralmente uso sem ter criar apenas para receber os valores serializados'''
class AtendimentosMercadoModel(models.Model):
	tipo_atendimento = models.CharField(max_length=50)
	atendente = models.CharField(max_length=50)
	data_atendimento = models.DateField(auto_now=False, auto_now_add=False)
	solidarios_inicial = models.IntegerField(default=0)
	preco_produto = models.IntegerField(default=0)
	quantidade = models.IntegerField(default=0)
	registro_atendimento = models.CharField(max_length=50)
	produto = models.CharField(max_length=50)
