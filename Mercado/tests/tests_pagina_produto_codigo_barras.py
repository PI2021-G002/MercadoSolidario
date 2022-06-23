from django.test import TestCase

# Create your tests here.
from decouple import config
from selenium import webdriver
import unittest
from random import randint

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep

class Test_pagina_produto_codigo_barras(unittest.TestCase):

	def setUp(self):
		#Insere um código único para o código de barras
		self.codigo = randint(9878545200000, 9878545299999)
		PATH = config('PATH_WEBDRIVER')
		#self.driver = webdriver.Firefox(executable_path=PATH)
		self.driver = webdriver.Firefox()
		
		#Realiza o login e permanece logado até que todos os testes sejam executados.
		self.driver.get("http://localhost:8000/admin/login/?next=/admin/")
        
		self.assertIn("Acessar | Administração do Mercado", self.driver.title)
		self.assertEqual("Acessar | Administração do Mercado", self.driver.title)
		elem = self.driver.find_element(by=By.NAME, value="username")
		elem.send_keys("root")
		elem.send_keys(Keys.ENTER)
		elem = self.driver.find_element(by=By.NAME, value="password")
		elem.send_keys("root")
		elem.send_keys(Keys.ENTER)

        #Tempo de espera para carregar a mensagem na tela
		sleep(2)
		self.assertIn("Mercado Solidário | Administração do Mercado", self.driver.title)
		
	def test_adicionar_produto_solidario_codigo_barras(self):
		
		#TODO Criar um banco de dados temporario para testes, pois a constraint UNIQUE não permite testar mais de uma vez
		#TODO Criar o produto solidario antes de iniciar este teste para não dar erro
		elem = self.driver.find_element(by=By.LINK_TEXT, value="Códigos dos Produtos").click()
		sleep(1)
		
		elem = self.driver.find_element(by=By.LINK_TEXT, value="ADICIONAR CÓDIGO DO PRODUTO").click()
		sleep(2)
		
		elem = self.driver.find_element(by=By.NAME, value="id_produto")
		elem.send_keys("arroz 1kg")
		elem = self.driver.find_element(by=By.NAME, value="codigo_barras")
		#elem.send_keys(78900011301)
		elem.send_keys(self.codigo)
		
		elem = self.driver.find_element(by=By.NAME, value="_save").click()
		sleep(2)
		
		#É possivel concatenar o teste com o resultado, verificar a necessidade para validar
		success_message = "O codigo de barras foi adicionado com sucesso."
		success = self.driver.find_elements(By.CLASS_NAME, "success")[0]
		self.assertIn("adicionado com sucesso", success.text)
		
	def test_adicionar_produto_solidario_codigo_barras_repetido(self):
		
		#TODO o código de barras para testar a constraint UNIQUE deve ser igual ao utilizado no test_adicionar_produto_solidario_codigo_barras
		elem = self.driver.find_element(by=By.LINK_TEXT, value="Códigos dos Produtos").click()
		sleep(1)
		
		elem = self.driver.find_element(by=By.LINK_TEXT, value="ADICIONAR CÓDIGO DO PRODUTO").click()
		sleep(2)
		
		elem = self.driver.find_element(by=By.NAME, value="id_produto")
		elem.send_keys("arroz 1kg")
		elem = self.driver.find_element(by=By.NAME, value="codigo_barras")
		elem.send_keys(78900011301)
		
		elem = self.driver.find_element(by=By.NAME, value="_save").click()
		sleep(2)
		
		error_message = "Código do Produto com este Código de barras já existe."
		error = self.driver.find_elements(By.CLASS_NAME, "errorlist")[0]
		self.assertIn("Código do Produto com este", error.text)
	
	def tearDown(self):
		self.driver.quit()
		#self.driver.close()


if __name__ == "__main__":
    unittest.main()