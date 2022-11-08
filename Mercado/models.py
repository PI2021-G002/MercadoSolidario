from email.policy import default
from django.db import models
from datetime import date, datetime,timedelta
#from dateutil.relativedelta import relativedelta

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
    codigo_solidario=models.CharField(max_length=13)
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
    def __str__(self):
        return self.nome 
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
    quantidade_saida = models.IntegerField(default=0)
    validade = models.DateField(auto_now=False, auto_now_add=False) 
    id_fonte = models.ForeignKey(
       FonteDoacao,
       on_delete = models.PROTECT,
       verbose_name = 'Fonte da Doação'
    )
    data = models.DateField(auto_now=False, auto_now_add=True,null=True)
    quem_cadastrou = models.CharField(max_length=50)
    class Meta:
        verbose_name = "Estoque"
        verbose_name_plural = "Estoque" 
        ordering = ['id_produto','validade','id_fonte']
    @property
    def em_estoque(self):
        return self.quantidade - self.quantidade_saida
    def vence_trinta_dias(self):
        return  self.validade < date.today()+timedelta(30)
    def vence_em_noventa_dias(self):
        return self.validade < date.today()+timedelta(90)


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
       ProdutoSolidario,
       on_delete = models.DO_NOTHING
    )
    produto = models.CharField(max_length=50) # gravado para facilitar relatórios
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 
    solidarios = models.IntegerField()
 
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
       ProdutoSolidario,
       on_delete = models.DO_NOTHING
    )
    produto = models.CharField(max_length=50) # gravado para facilitar relatórios
    quantidade = models.IntegerField()
    validade = models.DateField(auto_now=False, auto_now_add=False) 
    solidarios = models.IntegerField()

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

