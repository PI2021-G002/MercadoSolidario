from django.test import TestCase

# Create your tests here.
from decouple import config
from selenium import webdriver
import unittest

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep

class Test_pagina_fontedoacao(unittest.TestCase):

	def setUp(self):
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
		
	def test_adicionar_fontedoacao(self):
		
		#Acessa o menu Fonte doacaos na lateral esquerda
		elem = self.driver.find_element(by=By.LINK_TEXT, value="Fontes de Doações").click()
		sleep(1)
		
		elem = self.driver.find_element(by=By.LINK_TEXT, value="ADICIONAR FONTE DE DOAÇÃO").click()
		sleep(2)
		
		elem = self.driver.find_element(by=By.NAME, value="nome")
		elem.send_keys("Mercado Princial")
		elem = self.driver.find_element(by=By.NAME, value="descricao")
		elem.send_keys("Fornecedor Mercadoria Princiap")
		elem = self.driver.find_element(by=By.NAME, value="_save").click()
		sleep(2)
		
		#É possivel concatenar o teste com o resultado, verificar a necessidade para validar
		success_message = "A fonte de doacao foi adicionada com sucesso."
		success = self.driver.find_elements(By.CLASS_NAME, "success")[0]
		self.assertIn("adicionado com sucesso", success.text)
	
	def tearDown(self):
		self.driver.quit()
		#self.driver.close()


if __name__ == "__main__":
    unittest.main()