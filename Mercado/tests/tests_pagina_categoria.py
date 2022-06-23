from django.test import TestCase

# Create your tests here.
from decouple import config
from selenium import webdriver
import unittest

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep

class Test_pagina_categoria(unittest.TestCase):

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
		
	def test_adicionar_categoria(self):
		
		#Acessa o menu categorias na lateral esquerda
		elem = self.driver.find_element(by=By.LINK_TEXT, value="Categorias").click()
		sleep(1)
		
		elem = self.driver.find_element(by=By.LINK_TEXT, value="ADICIONAR CATEGORIA").click()
		sleep(2)
		
		elem = self.driver.find_element(by=By.NAME, value="categoria")
		elem.send_keys("arroz")
		elem = self.driver.find_element(by=By.NAME, value="_save").click()
		sleep(2)
		
		success_message = "O categoria foi adicionado com sucesso."
		success = self.driver.find_elements(By.CLASS_NAME, "success")[0]
		self.assertIn("adicionado com sucesso", success.text)
	
	def tearDown(self):
		self.driver.quit()
		#self.driver.close()


if __name__ == "__main__":
    unittest.main()