from django.test import TestCase

# Create your tests here.
from decouple import config
from selenium import webdriver
import unittest

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep

class Test_pagina_produto_solidarios(unittest.TestCase):

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
		
	def test_adicionar_produto_solidario(self):
		driver = self.driver
		
		#Acessa o menu Produto solidarios na lateral esquerda
		elem = driver.find_element(by=By.LINK_TEXT, value="Produto solidarios").click()
		sleep(1)
		
		elem = driver.find_element(by=By.LINK_TEXT, value="ADICIONAR PRODUTO SOLIDARIO").click()
		sleep(2)
		
		elem = driver.find_element(by=By.NAME, value="id_categoria")
		elem.send_keys("arroz 1kg")
		elem = driver.find_element(by=By.NAME, value="quantidade")
		elem.send_keys(2)
		elem = driver.find_element(by=By.NAME, value="unidade")
		elem.send_keys("KG")
		elem = driver.find_element(by=By.NAME, value="preco_solidario")
		elem.send_keys(4)
		elem = driver.find_element(by=By.NAME, value="estoque_minimo")
		elem.send_keys(0)
		elem = driver.find_element(by=By.NAME, value="max_familia")
		elem.send_keys(3)
		elem = driver.find_element(by=By.NAME, value="_save").click()
		sleep(2)
		
		#É possivel concatenar o teste com o resultado, verificar a necessidade para validar
		success_message = "O fonte doacao foi adicionado com sucesso."
		success = driver.find_elements(By.CLASS_NAME, "success")[0]
		self.assertIn("adicionado com sucesso", success.text)
	
	def tearDown(self):
		self.driver.quit()
		#self.driver.close()


if __name__ == "__main__":
    unittest.main()