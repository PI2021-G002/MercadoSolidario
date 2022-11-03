#!/bin/bash

#echo "---------------------------------------------------------------------------------------------------------" 
#echo "---------------------------------------------------------------------------------------------------------" 

#env | sort

echo "---------------------------------------------------------------------------------------------------------" 
echo "--- Criando pastas novas ou pela primeira vez" 
echo "---------------------------------------------------------------------------------------------------------" 

for a in `find . -mtime 0 -type d -ls | grep -v .git | gawk '{print substr($NF,3)}'`
do
    mkdir -p "/var/www/html/MercadoSolidario/$a"
done

echo "---------------------------------------------------------------------------------------------------------" 
echo "--- Copiando arquivos para o deploy do python - django"
echo "---------------------------------------------------------------------------------------------------------" 
for a in `find . -mtime 0 -type f -ls  | grep -v .git | grep -v txt | grep -v sql | grep -v Install | grep -v xlsx | grep -v cache | grep -v settings.py | grep -v python-wheels | gawk '{print substr($NF,3)}'`
do
    cp -v $a /var/www/html/MercadoSolidario/`dirname $a`/
done

echo "---------------------------------------------------------------------------------------------------------" 
echo "--- Aplicando alteraçãoes no banco de dados com comandos do django"
echo "---------------------------------------------------------------------------------------------------------" 
cd /var/www/html/MercadoSolidario/
source mercado/bin/activate
python3 manage.py migrate
python3 manage.py migrate


echo "---------------------------------------------------------------------------------------------------------" 
echo "--- Reiniciando o servidor apache"
echo "---------------------------------------------------------------------------------------------------------" 
ssh mercadocs@localhost sudo systemctl restart apache2.service

