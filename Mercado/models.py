from email.policy import default
from django.db import models

class Categoria(models.Model):
    categoria = models.CharField(max_length=50)
    def __str__(self):
        return self.categoria
    class Meta:
        ordering = ['categoria']
    
class ProdutoSolidario(models.Model):
    id_categoria = models.ForeignKey(
       Categoria,
       on_delete = models.PROTECT,
       verbose_name = "categoria"
    )
    quantidade = models.IntegerField()
    unidade = models.CharField(max_length=20)
    preco_solidario = models.FloatField()
    estoque_minimo = models.IntegerField(default=0)
    max_familia = models.IntegerField(default=0)
    def __str__(self):
        return str(self.id_categoria) + " " + str(self.quantidade) + self.unidade 
    class Meta:
        verbose_name = "Produto Solidário"
        verbose_name_plural = "Produtos Solidários"

class CodBarProdSol(models.Model):
    id_produto = models.ForeignKey(
       ProdutoSolidario,
       on_delete = models.PROTECT,
       verbose_name="Produto Solidário"
    )
    codigo_barras = models.BigIntegerField(unique=True,verbose_name="código de barras") 
    class Meta:
        verbose_name = "Código do Produto"
        verbose_name_plural = "Códigos dos Produtos"
        ordering = ['id_produto','codigo_barras']

class FonteDoacao(models.Model):
    nome = models.CharField(max_length=50)
    descricao = models.CharField(max_length=255,verbose_name="descrição")
    class Meta:
        verbose_name = "Fonte de Doação"
        verbose_name_plural = "Fontes de Doações"
        ordering = ['nome']

class Estoque(models.Model):
    id_produto = models.ForeignKey(
       ProdutoSolidario,
       on_delete = models.PROTECT
    )
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 
    id_fonte = models.ForeignKey(
       FonteDoacao,
       on_delete = models.PROTECT
    )
    data = models.DateField(auto_now=False, auto_now_add=True,null=True)
    quem_cadastrou = models.CharField(max_length=50)

class AtendimentoRascunho(models.Model):
    tipo = models.CharField(max_length=50)
    atendente = models.CharField(max_length=50)
    data = models.DateField(auto_now=False, auto_now_add=True)
    finalizado = models.BooleanField(default=False)
    solidarios = models.IntegerField(default=0)

class ItensAtendimentoRascunho(models.Model):
    id_atendimento = models.ForeignKey(
       AtendimentoRascunho,
       on_delete = models.DO_NOTHING
    )
    id_codigo = models.ForeignKey(
       CodBarProdSol,
       on_delete = models.DO_NOTHING
    )
    id_produto = models.ForeignKey(
       ProdutoSolidario,
       on_delete = models.DO_NOTHING,
       default=0
    )
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 
 
class Atendimento(models.Model):
    tipo = models.CharField(max_length=50)
    atendente = models.CharField(max_length=50)
    data = models.DateField(auto_now=False, auto_now_add=False)
    finalizado = models.BooleanField(default=False)
    solidarios = models.IntegerField(default=0)

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
    descricao = models.CharField(max_length=255)
    class Meta:
        verbose_name = "Modelo de Atendimento"
        verbose_name_plural = "Modelos de Atendimento"
        ordering = ['tipo']
    def __str__(self):
        return self.tipo 

class ItensAtendimentoTemplate(models.Model):
    id_atendimento = models.ForeignKey(
       AtendimentoTemplate,
       on_delete = models.DO_NOTHING,
       verbose_name="modelo de atendimento"
    )
    id_produto = models.ForeignKey(
       ProdutoSolidario,
       on_delete = models.DO_NOTHING,
       verbose_name="produto solidario"
    )
    quantidade = models.IntegerField()
    def __str__(self):
        return str(self.id_produto) + " " + str(self.quantidade) 
    class Meta:
        verbose_name = "Itens"
        verbose_name_plural = "Modelo de Itens"
        ordering = ['id_atendimento','id_produto']

