from socket import TIPC_CONN_TIMEOUT
from django.db import models

# Create your models here.

class Categoria(models.Model):
    categoria = models.CharField(max_length=50)
    def __str__(self):
        return self.categoria

class ProdutoSolidario(models.Model):
    produto = models.CharField(max_length=50)
    preco = models.FloatField()
    quantidade = models.IntegerField()
    id_categoria = models.ForeignKey(
       Categoria,
       on_delete = models.DO_NOTHING
    )
    unidade = models.CharField(max_length=50)
    def __str__(self):
        return self.Produto

class ProdutoSolidarioCodigoDeBarras(models.Model):
    id_produto = models.ForeignKey(
       ProdutoSolidario,
       on_delete = models.DO_NOTHING
    )
    codigo_barras = models.BigIntegerField() 

class FontesDoacao(models.Model):
    nome = models.CharField(max_length=50)
    
class Estoque(models.Model):
    id_codigo = models.ForeignKey(
       ProdutoSolidarioCodigoDeBarras,
       on_delete = models.DO_NOTHING
    )
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 
    fonte = 

class Atendimento(models.Model):
    tipo = models.CharField(max_length=50)
    atendente = models.CharField(max_length=50)
    data = models.DateField(auto_now=False, auto_now_add=False)
    finalizado = models.BooleanField(default=False)

class ItensAtendimento(models.Model):
    id_codigo = models.ForeignKey(
       ProdutoSolidarioCodigoDeBarras,
       on_delete = models.DO_NOTHING
    )
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 

