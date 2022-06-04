from email.policy import default
from django.db import models

class Categoria(models.Model):
    categoria = models.CharField(max_length=50)
    def __str__(self):
        return self.categoria
    
class ProdutoSolidario(models.Model):
    id_categoria = models.ForeignKey(
       Categoria,
       on_delete = models.PROTECT
    )
    quantidade = models.IntegerField()
    unidade = models.CharField(max_length=20)
    preco_solidario = models.FloatField()
    estoque_minimo = models.IntegerField(default=0)
    max_familia = models.IntegerField(default=0)
    def __str__(self):
        return str(self.id_categoria) + " " + str(self.quantidade) + self.unidade 

class CodBarProdSol(models.Model):
    id_produto = models.ForeignKey(
       ProdutoSolidario,
       on_delete = models.PROTECT
    )
    codigo_barras = models.BigIntegerField(unique=True) 

class FonteDoacao(models.Model):
    nome = models.CharField(max_length=50)
    descricao = models.CharField(max_length=255)

class Estoque(models.Model):
    id_codigo = models.ForeignKey(
       CodBarProdSol,
       on_delete = models.PROTECT
    )
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 
    id_fonte = models.ForeignKey(
       FonteDoacao,
       on_delete = models.PROTECT
    )

class AtendimentoRascunho(models.Model):
    tipo = models.CharField(max_length=50)
    atendente = models.CharField(max_length=50)
    data = models.DateField(auto_now=False, auto_now_add=False)
    finalizado = models.BooleanField(default=False)

class ItensAtendimentoRascunho(models.Model):
    id_codigo = models.ForeignKey(
       CodBarProdSol,
       on_delete = models.DO_NOTHING
    )
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 
    fonte = models.ForeignKey(
       FonteDoacao,
       on_delete = models.DO_NOTHING
    )
 
class Atendimento(models.Model):
    tipo = models.CharField(max_length=50)
    atendente = models.CharField(max_length=50)
    data = models.DateField(auto_now=False, auto_now_add=False)
    finalizado = models.BooleanField(default=False)

class ItensAtendimento(models.Model):
    id_atendimento = models.ForeignKey(
       Atendimento,
       on_delete = models.DO_NOTHING
    )
    id_codigo = models.ForeignKey(
       CodBarProdSol,
       on_delete = models.DO_NOTHING
    )
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 

class AtendimentoTemplate(models.Model):
    tipo = models.CharField(max_length=50)

class ItensAtendimentoTemplate(models.Model):
    id_atendimento = models.ForeignKey(
       AtendimentoTemplate,
       on_delete = models.DO_NOTHING
    )
    id_codigo = models.ForeignKey(
       CodBarProdSol,
       on_delete = models.DO_NOTHING
    )
    quantidade = models.IntegerField()
