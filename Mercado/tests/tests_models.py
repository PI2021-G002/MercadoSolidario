from django.test import TestCase
from Mercado.models import Categoria, ProdutoSolidario, CodBarProdSol, FonteDoacao, Estoque, Atendimento, ItensAtendimento, AtendimentoRascunho, ItensAtendimentoRascunho, AtendimentoTemplate, ItensAtendimentoTemplate

import datetime
from django.utils import timezone

class BaseModelTestCase(TestCase):
	@classmethod
	def setUpClass(cls):
		super(BaseModelTestCase, cls).setUpClass()
		cls.categoria = Categoria(categoria='Perecivel')
		cls.categoria.save()
		cls.produto_solidario = ProdutoSolidario(preco_solidario=70, quantidade=15, id_categoria=cls.categoria, unidade='kg', estoque_minimo=2, max_familia=2)
		cls.produto_solidario.save()
		cls.produto_barras = CodBarProdSol(id_produto=cls.produto_solidario, codigo_barras=123123123)
		cls.produto_barras.save()

#		cls.fonte_doacao = FonteDoacao(nome='Loja Atacado', descricao='Mercado de alimentos')

		cls.fonte_doacao = FonteDoacao(nome='Loja Atacado')

		cls.fonte_doacao.save()
		cls.estoque = Estoque(id_codigo=cls.produto_barras, quantidade=10, validade=datetime.datetime.now(tz=timezone.utc), id_fonte=cls.fonte_doacao)
		cls.estoque.save()
		cls.atendimento = Atendimento(tipo='Mercado Social', atendente='Nome da pessoa', data=datetime.datetime.now(tz=timezone.utc), finalizado=True)
		cls.atendimento.save()
		cls.items_atendimento = ItensAtendimento(id_atendimento=cls.atendimento, id_codigo=cls.produto_barras, quantidade=10, validade=datetime.datetime.now(tz=timezone.utc))
		cls.items_atendimento.save()
		cls.atendimento_rascunho = AtendimentoRascunho(tipo='Mercado', atendente='Priscila', data=datetime.datetime.now(tz=timezone.utc), finalizado='True')
		cls.atendimento_rascunho.save()
		cls.itens_rascunho = ItensAtendimentoRascunho(id_codigo=cls.produto_barras, quantidade=4, validade=datetime.datetime.now(tz=timezone.utc), fonte=cls.fonte_doacao)
		cls.itens_rascunho.save()
		cls.atendimento_template = AtendimentoTemplate(tipo='Cesta Básica')
		cls.atendimento_template.save()
		cls.itens_atend_template = ItensAtendimentoTemplate(id_atendimento=cls.atendimento_template, id_codigo=cls.produto_barras, quantidade=2)
		cls.itens_atend_template.save()
		
class CategoriaModelTestCase(BaseModelTestCase):
	def test_categoria_model(self):
		self.assertEqual(self.categoria.categoria, 'Perecivel')
		
	def test_categoria_retorna_valores(self):
		self.assertEqual(1, len(Categoria.objects.filter()))
		self.assertEqual('Perecivel', Categoria.objects.filter(categoria__contains='Perecivel').values_list().get()[1])
	
class ProdutoSolidarioModelTestCase(BaseModelTestCase):
	def test_produto_solidario_model(self):
		self.assertEqual(self.produto_solidario.quantidade, 15)
		self.assertEqual(self.produto_solidario.preco_solidario, 70)
		
	def test_produto_solidario_retorna_valores(self):
		self.assertEqual(1, len(ProdutoSolidario.objects.filter()))
		self.assertEqual('kg', ProdutoSolidario.objects.filter(unidade__contains='kg').values_list().get()[3])
				
class CodBarProdSolModelTestCase(BaseModelTestCase):
	def test_produto_solidario_codigo_barras_model(self):
		#Testa o relacionamento TODO Refatorar
		id_produto_cb = ProdutoSolidario.objects.filter(unidade__contains='kg').values_list().get()[1]

		id_produto_com_barras = CodBarProdSol.objects.filter().values_list().get()[1]
		
		self.assertEqual(id_produto_com_barras, id_produto_cb)
		
		self.assertEqual(123123123, self.produto_barras.codigo_barras)


class FonteDoacaoModelTestCase(BaseModelTestCase):
	def test_fonte_doacao_model(self):
		self.assertEqual('Loja Atacado', self.fonte_doacao.nome)
		
	def test_fonte_doacao_retorna_valores(self):
		self.assertEqual(1, len(FonteDoacao.objects.filter()))
		self.assertEqual('Loja Atacado', FonteDoacao.objects.filter(nome__contains='Loja Atacado').values_list().get()[1])
		
class EstoqueModelTestCase(BaseModelTestCase):
	def test_estoque_model(self):
		self.assertEqual(10, self.estoque.quantidade)
	
	def test_estoque_retorna_valores(self):
		#Testa o relacionamento TODO Refatorar
		#TODO implementar algum teste com a data
		id_estoque_produto_codigo_barras = Estoque.objects.filter().values_list().get()[0]
		self.assertEqual(6, id_estoque_produto_codigo_barras)

class AtendimentoModelTestCase(BaseModelTestCase):
	def test_atendimento_model(self):
		#Testa o relacionamento TODO Refatorar
		#TODO implementar algum teste com a data
		self.assertEqual('Mercado Social', self.atendimento.tipo)
		self.assertEqual('Nome da pessoa', self.atendimento.atendente)
		self.assertEqual(True, self.atendimento.finalizado)
		
class ItensAtendimentoModelTestCase(BaseModelTestCase):
	def test_items_atendimento_model(self):
		self.assertEqual(10, self.items_atendimento.quantidade)
			
	def test_items_atendimento_retorna_valores(self):
		id_estoque_produto_codigo_barras = CodBarProdSol.objects.filter().values_list().get()[0]

		self.assertEqual(8, id_estoque_produto_codigo_barras)
		
class AtendimentoRascunhoModelTestCase(BaseModelTestCase):
	def test_atendimento_rascunho_model(self):
		self.assertEqual('Priscila', self.atendimento_rascunho.atendente)
		
	def test_atendimento_rascunho_retorna_valores(self):
		self.assertEqual('Priscila', AtendimentoRascunho.objects.filter(atendente__contains='Priscila').values_list().get()[2])
		
class ItensAtendimentoRascunhoModelTestCase(BaseModelTestCase):
	def test_itens_rascunho_model(self):
		self.assertEqual(4, self.itens_rascunho.quantidade)
	
	def test_itens_rascunho_retorna_valores(self):
		self.assertEqual(4, ItensAtendimentoRascunho.objects.filter(quantidade__contains='4').values_list().get()[2])
		
class AtendimentoTemplateModelTestCase(BaseModelTestCase):
	def test_atendimento_template_model(self):
		self.assertEqual('Cesta Básica', self.atendimento_template.tipo)
		
	def test_atendimento_template_retorna_valores(self):
		self.assertEqual('Cesta Básica', AtendimentoTemplate.objects.filter(tipo__contains='Cesta Básica').values_list().get()[1])
		
	
class ItensAtendimentoTemplateModelTestCase(BaseModelTestCase):
	def test_itens_atend_template(self):
		self.assertEqual(2, self.itens_atend_template.quantidade)
		
	def test_itens_atend_template_retorna_valores(self):
		self.assertEqual(2, ItensAtendimentoTemplate.objects.filter(quantidade__contains='2').values_list().get()[3])

		self.assertEqual(5, id_estoque_produto_codigo_barras)

