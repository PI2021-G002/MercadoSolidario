from django.test import TestCase

# Create your tests here.
from decouple import config
from selenium import webdriver
import unittest

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep

class Test_pagina_login(unittest.TestCase):

    def setUp(self):
        PATH = config('PATH_WEBDRIVER')
        self.driver = webdriver.Firefox(executable_path=PATH)
        

    def test_tentativa_acesso_com_erro(self):
        driver = self.driver

        driver.get("http://localhost:8000/admin/login/?next=/admin/")
        
        self.assertIn("Acessar | Site de administração do Django", driver.title)
        self.assertEqual("Acessar | Site de administração do Django", driver.title)
        elem = driver.find_element(by=By.NAME, value="username")
        elem.send_keys("roots")
        elem.send_keys(Keys.ENTER)
        elem = driver.find_element(by=By.NAME, value="password")
        elem.send_keys("root")
        elem.send_keys(Keys.ENTER)

        #Conseguir carregar a mensagem na tela
        sleep(2)
        error_message = "Por favor, insira um usuário e senha corretos para uma conta de equipe. Note que ambos campos são sensíveis a maiúsculas e minúsculas. "
        errors = driver.find_elements(By.CLASS_NAME, "errornote")[0]
        self.assertIn("Por favor, insira um usuário e senha corretos para uma conta de equipe", errors.text)

    def test_tentativa_acesso_com_sucesso(self):
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

        #Conseguir carregar a mensagem na tela
        sleep(2)
        self.assertIn("Administração do Site | Site de administração do Django", driver.title)

    def test_deslogando(self):
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

        #Conseguir carregar a mensagem na tela
        sleep(2)
        self.assertIn("Administração do Site | Site de administração do Django", driver.title)
        
        elem = driver.find_element(by=By.LINK_TEXT, value="ENCERRAR SESSÃO").click()
        sleep(2)
        self.assertIn("Sessão encerrada | Site de administração do Django", driver.title)

    def tearDown(self):
        self.driver.quit()
        #self.driver.close()


if __name__ == "__main__":
    unittest.main()