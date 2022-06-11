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
		
	def test_adicionar_fontedoacao(self):
		driver = self.driver
		
		#Acessa o menu Fonte doacaos na lateral esquerda
		elem = driver.find_element(by=By.LINK_TEXT, value="Fonte doacaos").click()
		sleep(1)
		
		elem = driver.find_element(by=By.LINK_TEXT, value="ADICIONAR FONTE DOACAO").click()
		sleep(2)
		
		elem = driver.find_element(by=By.NAME, value="nome")
		elem.send_keys("Mercado Princial")
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