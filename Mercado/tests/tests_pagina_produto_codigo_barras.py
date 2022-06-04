from django.test import TestCase

# Create your tests here.
from decouple import config
from selenium import webdriver
import unittest

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep

class Test_pagina_produto_codigo_barras(unittest.TestCase):

	def setUp(self):
		PATH = config('PATH_WEBDRIVER')
		self.driver = webdriver.Firefox(executable_path=PATH)
		
		#Realiza o login e permanece logado até que todos os testes sejam executados.
		driver = self.driver
		driver.get("http://localhost:8000/admin/login/?next=/admin/")
        
		self.assertIn("Acessar | Site de administração do Django", driver.title)
		self.assertEqual("Acessar | Site de administração do Django", driver.title)
		elem = driver.find_element(by=By.NAME, value="username")
		elem.send_keys("root")
		elem.send_keys(Keys.ENTER)
		elem = driver.find_element(by=By.NAME, value="password")
		elem.send_keys("root")
		elem.send_keys(Keys.ENTER)

        #Tempo de espera para carregar a mensagem na tela
		sleep(2)
		self.assertIn("Administração do Site | Site de administração do Django", driver.title)
		
	def test_adicionar_produto_solidario_codigo_barras(self):
		driver = self.driver
		#TODO Criar um banco de dados temporario para testes, pois a constraint UNIQUE não permite testar mais de uma vez
		
		#Acessa o menu Cod bar prod sols na lateral esquerda
		elem = driver.find_element(by=By.LINK_TEXT, value="Cod bar prod sols").click()
		sleep(1)
		
		elem = driver.find_element(by=By.LINK_TEXT, value="ADICIONAR COD BAR PROD SOL").click()
		sleep(2)
		
		elem = driver.find_element(by=By.NAME, value="id_produto")
		elem.send_keys("arroz 1kg 2KG")
		elem = driver.find_element(by=By.NAME, value="codigo_barras")
		elem.send_keys(78900011300)
		
		elem = driver.find_element(by=By.NAME, value="_save").click()
		sleep(2)
		
		#É possivel concatenar o teste com o resultado, verificar a necessidade para validar
		success_message = "O codigo de barras foi adicionado com sucesso."
		success = driver.find_elements(By.CLASS_NAME, "success")[0]
		self.assertIn("adicionado com sucesso", success.text)
		
	def test_adicionar_produto_solidario_codigo_barras_repetido(self):
		driver = self.driver
		#TODO o código de barras para testar a constraint UNIQUE deve ser igual ao utilizado no test_adicionar_produto_solidario_codigo_barras
		elem = driver.find_element(by=By.LINK_TEXT, value="Cod bar prod sols").click()
		sleep(1)
		
		elem = driver.find_element(by=By.LINK_TEXT, value="ADICIONAR COD BAR PROD SOL").click()
		sleep(2)
		
		elem = driver.find_element(by=By.NAME, value="id_produto")
		elem.send_keys("arroz 1kg 2KG")
		elem = driver.find_element(by=By.NAME, value="codigo_barras")
		elem.send_keys(78900011300)
		
		elem = driver.find_element(by=By.NAME, value="_save").click()
		sleep(2)
		
		error_message = "Cod bar prod sol com este Codigo barras já existe."
		error = driver.find_elements(By.CLASS_NAME, "errorlist")[0]
		self.assertIn("Codigo barras já existe", error.text)
	
	def tearDown(self):
		self.driver.quit()
		#self.driver.close()


if __name__ == "__main__":
    unittest.main()