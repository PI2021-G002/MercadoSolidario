from django.test import TestCase
from Mercado.models import Categoria, ProdutoSolidario, ProdutoSolidarioCodigoDeBarras, FontesDoacao, Estoque, Atendimento, ItensAtendimento
import datetime
from django.utils import timezone

class BaseModelTestCase(TestCase):
	@classmethod
	def setUpClass(cls):
		super(BaseModelTestCase, cls).setUpClass()
		cls.categoria = Categoria(categoria='Perecivel')
		cls.categoria.save()
		cls.produto_solidario = ProdutoSolidario(preco=70, quantidade=15, id_categoria=cls.categoria, unidade='kg')
		cls.produto_solidario.save()
		cls.produto_barras = ProdutoSolidarioCodigoDeBarras(id_produto=cls.produto_solidario, codigo_barras=123123123)
		cls.produto_barras.save()
		cls.fonte_doacao = FontesDoacao(nome='Loja Atacado')
		cls.fonte_doacao.save()
		cls.estoque = Estoque(id_codigo=cls.produto_barras, quantidade=10, validade=datetime.datetime.now(tz=timezone.utc), fonte=cls.fonte_doacao)
		cls.estoque.save()
		cls.atendimento = Atendimento(tipo='Mercado Social', atendente='Nome da pessoa', data=datetime.datetime.now(tz=timezone.utc), finalizado=True)
		cls.atendimento.save()
		cls.items_atendimento = ItensAtendimento(id_codigo=cls.produto_barras, quantidade=10, validade=datetime.datetime.now(tz=timezone.utc))
		cls.items_atendimento.save()

class CategoriaModelTestCase(BaseModelTestCase):
	def test_categoria_model(self):
		self.assertEqual(self.categoria.categoria, 'Perecivel')
		
	def test_categoria_retorna_valores(self):
		self.assertEqual(1, len(Categoria.objects.filter()))
		self.assertEqual('Perecivel', Categoria.objects.filter(categoria__contains='Perecivel').values_list().get()[1])
		
class ProdutoSolidarioModelTestCase(BaseModelTestCase):
	def test_produto_solidario_model(self):
		self.assertEqual(self.produto_solidario.quantidade, 15)
		self.assertEqual(self.produto_solidario.preco, 70)
		
	def test_produto_solidario_retorna_valores(self):
		self.assertEqual(1, len(ProdutoSolidario.objects.filter()))
		self.assertEqual('kg', ProdutoSolidario.objects.filter(unidade__contains='kg').values_list().get()[4])
		
		
class ProdutoSolidarioCodigoDeBarrasModelTestCase(BaseModelTestCase):
	def test_produto_solidario_codigo_barras_model(self):
		#Testa o relacionamento TODO Refatorar
		id_produto_cb = ProdutoSolidario.objects.filter(unidade__contains='kg').values_list().get()[3]
		id_produto_com_barras = ProdutoSolidarioCodigoDeBarras.objects.filter().values_list().get()[1]
		
		self.assertEqual(id_produto_com_barras, id_produto_cb)
		
		self.assertEqual(123123123, self.produto_barras.codigo_barras)
		
class FontesDoacaoModelTestCase(BaseModelTestCase):
	def test_fonte_doacao_model(self):
		self.assertEqual('Loja Atacado', self.fonte_doacao.nome)
		
	def test_fonte_doacao_retorna_valores(self):
		self.assertEqual(1, len(FontesDoacao.objects.filter()))
		self.assertEqual('Loja Atacado', FontesDoacao.objects.filter(nome__contains='Loja Atacado').values_list().get()[1])
		
class EstoqueModelTestCase(BaseModelTestCase):
	def test_estoque_model(self):
		self.assertEqual(10, self.estoque.quantidade)
	
	def test_estoque_retorna_valores(self):
		#Testa o relacionamento TODO Refatorar
		#TODO implementar algum teste com a data
		id_estoque_produto_codigo_barras = Estoque.objects.filter().values_list().get()[0]
		self.assertEqual(3, id_estoque_produto_codigo_barras)

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
		id_estoque_produto_codigo_barras = ProdutoSolidarioCodigoDeBarras.objects.filter().values_list().get()[0]
		self.assertEqual(5, id_estoque_produto_codigo_barras)