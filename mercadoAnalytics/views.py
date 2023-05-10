from django.shortcuts import render

from django.shortcuts import render
import matplotlib.pyplot as plt
import io
import urllib, base64

from decouple import config

import pandas as pd
import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import GaussianNB
from keras.callbacks import ModelCheckpoint
from sklearn.metrics import confusion_matrix

from sklearn.linear_model import LinearRegression

#tipo de foto gerada
import matplotlib
matplotlib.use('agg')

x = []
y = []
model = Sequential()
vectorizer = []
labelencoder = []
uri_prod = ""
uri_cat = ""
df = pd.DataFrame()
categorias_dataset = pd.DataFrame()
produtos_mercado_solidario = []
categorias_produtos = [] 
datas_atendimento = []

#Se colocar dentro de config retorna um erro de recursão
PATH_CATEGORIA = config('PATH_CATEGORIA')
PATH_VENDAS = config('PATH_VENDAS')

#Método de configuração do APP - carregamento arquivos e treinamento IA
def config(request):
	global uri_cat
	global uri_prod
	
	global produtos_mercado_solidario
	global datas_atendimento
	global df
	global categorias_dataset
	
	global categorias_produtos
	global x
	global y
	global labelencoder
	global vectorizer
	global model
	
	global PATH_CATEGORIA
	global PATH_VENDAS
	
	categorias_dataset = pd.read_csv(PATH_CATEGORIA)
	categorias_produtos = categorias_dataset.iloc[:,1].unique()
	
	df = pd.read_excel(PATH_VENDAS)
	datas_atendimento = df['Última Venda'].unique().tolist()
	produtos_mercado_solidario = df['Produto'].unique().tolist()
	
	x, y, labelencoder, vectorizer = pre_processamento()
	model = treinamento_rn()
	
	home_total_produtos_doados(request)
	home_categorias_produtos_doados(request)
	
	return render(request,'analise.html',{'data_prod':uri_prod, 'data_cat':uri_cat})

#cria dicionario para utilizar na categorização dos produtos	
def dict_categorias_produtos_doados(categorias_produtos, valores_preditos):
    
	total_produtos_categoria = {}
	for categoria in categorias_produtos:
		total_produtos_categoria[categoria] = 0
		
	for valor_predito in valores_preditos:
		v_max = np.argmax(valor_predito)
		total_produtos_categoria[categorias_produtos[v_max]] = total_produtos_categoria[categorias_produtos[v_max]] + 1

	return total_produtos_categoria

#cria a imagem para exibir na tela 
def cria_imagem_uri(plt):
	fig = plt.gcf()
	buf = io.BytesIO()
	
	fig.savefig(buf,format='png')
	buf.seek(0)
	string = base64.b64encode(buf.read())
	uri =  urllib.parse.quote(string)
	plt.clf()
	plt.close()
	return uri

#processamento dos dados
def pre_processamento():
	global x, y, labelencoder, vectorizer, categorias_dataset
	
	dataset = categorias_dataset
	x, y = dataset.iloc[:,0], dataset.iloc[:,1]
	
	labelencoder = LabelEncoder() #Contabiliza as categorias
	y = labelencoder.fit_transform(y)
	
	#Dicionario com as palavras que serão retiradas dos nomes dos produtos
	words = ['un', '1lt', 'em', '1kg', '500ml', '800g', '250',
      '200g','5kg','400g','pct','500','liq', '200ml', 'un', 'hig',
      'liq', '1und', '500g', '340g', '300g', '1kg800g', '400300g', '250g', '250200g']

	vectorizer = CountVectorizer(min_df = 1, lowercase = True, strip_accents = 'unicode', stop_words = words)
	vectorizer.fit_transform(x)
	x = vectorizer.transform(x).toarray()
	
	return x, y, labelencoder, vectorizer

#TODO aplicar save do treinamento
def treinamento_rn():
	global x, y, model, vectorizer, labelencoder
	
	#criar os grupos de treino e teste
	x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.33, random_state = 40)
	
	naivebayes = GaussianNB()
	naivebayes.fit(x_train, y_train)
	naivebayes.score(x_test, y_test)
	
	# REDE NEURAL DENSA local de configuração da rede

	model.add(Dense(units = 74, activation = 'relu', input_dim = x_train.shape[1]))
	model.add(Dense(units = 6, activation = 'softmax')) #quantidade de valores de saida de acordo com o numero de classes
	model.compile(optimizer = 'adam', loss = 'sparse_categorical_crossentropy', metrics = ['accuracy'])

	model.fit(x_train, y_train, validation_data = (x_test, y_test), batch_size=256, epochs = 25, verbose = 0)
	
	return model

	
#É preciso realizar o treinamento antes de iniciar o uso do sistema home/index
def home(request):
	#Para atribuir a variavel global é preciso declarar dentro do metodo com global
	global uri_cat
	global uri_prod
	
	'''Antes de iniciar o uso do sistema deve treinar a rn e carregar 
	o df com os dados e preencher os valores das páginas para evitar 
	ficar carregando tudo novamente'''
	
	return render(request,'analise.html',{'data_prod':uri_prod, 'data_cat':uri_cat})

#Analisa e exibe o gráfico com o total de produtos doados ao longo do tempo [Home]
def home_total_produtos_doados(request):
	global uri_prod
	global df
	
	df_local = df
	indx = 0
	qtde_produto_por_data = {}
	
	data = df_local[['Quantidade','Última Venda']]

	#Agrupa por data de atendimento e soma as ocorrências
	datas_group = data.groupby(['Última Venda']).sum()
	d = pd.DataFrame(datas_group, columns=['Quantidade'])

	#cria o dicionario para unir o resultado da agregação
	for i in d.items():
		for j,k in i[1].items():
			qtde_produto_por_data[indx] = j, k
			indx = indx + 1

	data_total_doado_mes = pd.DataFrame.from_dict(qtde_produto_por_data, orient='index', columns = ['Data','Produtos Doados'])
	
	data_total_doado_mes.plot.bar(
		title="Total de produtos doados por mês de atendimento do Mercado", x='Data', y='Produtos Doados', rot=0)
	
	plt.xticks(rotation = 25)
	uri_prod = cria_imagem_uri(plt)
	plt.clf()
	return render(request,'analise.html',{'data_prod':uri_prod})
	

#Analisa e exibe o gráfico com as categorias dos produtos doados ao longo do tempo [Home]
def home_categorias_produtos_doados(request):
	global uri_cat
	global model
	global vectorizer
	global x
	#print(len(vectorizer.vocabulary_)) #Para exibir o vocabulario utilizado para analisar os nomes
	
	#Produtos presentes no mercado solidario
	produtos = produtos_mercado_solidario
	produtos_convertidos_array = vectorizer.transform(produtos).toarray()
	
	#retorna os valores preditos
	y_pred = model.predict(produtos_convertidos_array)
	
	#Cria o dicionario para apresentar os resultados
	total_produtos_categoria = dict_categorias_produtos_doados(labelencoder.classes_, y_pred)
	
	labels = []
	sizes = []
	for key, value in total_produtos_categoria.items():
		if value != 0: #Retira as categorias que retornaram 0 (sem ocorrências)
			labels.append(key)
			sizes.append(value)

	fig, ax = plt.subplots()
	ax.pie(sizes, labels=labels, startangle = 90)
	plt.title("Categorias dos produtos doados.")
	plt.get_current_fig_manager().set_window_title('Categorias Produtos Doados')
    #plt.legend(title = "Categorias")

	uri_cat = cria_imagem_uri(plt)
	plt.clf()
	return render(request,'index.html',{'data_cat':uri_cat})

#Carrega todos os nomes dos produtos da base de dados e retorna
def produtos_por_atendimento(request):
	#todos os produtos do mercado solidario
	produtos = produtos_mercado_solidario
	
	return render(request,'acompanha_produtos.html', {'data_produtos':produtos})
	
#recupera a data informada e analisa os produtos doados nesta data
def analisa_produtos_por_atendimento(request, data):
	global df
	
	#Produtos presentes no mercado solidario
	produtos = produtos_mercado_solidario
	df_local = df
	
	#Pesquisa um produto especifico na base de dados
	df_local = df_local.loc[df_local['Produto']==data]
	#para adicionar - na separação, procurar melhor forma de fazer
	#df_local['Última Venda'] = df_local['Última Venda'].str.replace('-20','-')
	
	df_local.plot.bar(title="Total de "+ data +" doados por dia de atendimento do Mercado", x='Última Venda', y='Quantidade', rot=0)
	
	plt.xticks(rotation = 25)
	uri_prod_hist = cria_imagem_uri(plt)
	plt.clf()
	
	uri_prod_prev, pred_min, pred_max = previsao_produto(data)

	return render(request,'acompanha_produtos.html', {'data_produtos':produtos, 'uri_prod_hist':uri_prod_hist, 'uri_prod_prev':uri_prod_prev, 'pred_min':pred_min, 'pred_max':pred_max})

def previsao_produto(data):
	global df
	df_local = df
	
	#total de produtos doados por dia de atendimento
	total_doacao_por_atendimento = df_local.groupby(['Última Venda']).agg('Quantidade').sum()
	
	datas = df_local.loc[df_local['Produto']==data]
	prod_vendas = datas[['Produto', 'Quantidade', 'Última Venda']]
	
	#e.g. prod_doado = {'05/11/2022': [770, 0], '08/10/2022': [733, 64]}
	prod_doado_por_data = {}

	for i, j in total_doacao_por_atendimento.items():
		p = prod_vendas.loc[prod_vendas['Última Venda'] == i]
		#.tolist() converte saida em lista
		if len(p['Quantidade'].tolist()) != 0:
			prod_doado_por_data[i] = [j, p['Quantidade'].tolist()[0]]
		else:
			prod_doado_por_data[i] = [j, 0]

	y = []
	X = []

	for i, j in prod_doado_por_data.items():
		X.append(j[0]) #valores do total de atendimentos
		y.append(j[1]) #valores do total do produto doado por atendimento

	X = np.array(X)
	y = np.array(y)

	X = np.array(X).reshape(-1,1)

	lin = LinearRegression()
	lin.fit(X, y)
	lin.predict(X) #gera uma lista
	
	v_preditos = lin.predict(X)
	
	pred_min = "{:.2f}".format(min(v_preditos))
	pred_max = "{:.2f}".format(max(v_preditos))
	
	plt.scatter(X, y, color = 'blue')
	  
	plt.plot(X, v_preditos, color = 'red')
	plt.title('Produto ' +data)
	plt.xlabel("Quantidade Total de produtods Doados por atendimento")
	plt.ylabel("Total "+data+" Doado por atendimento")
	plt.xticks(rotation = 45)
	
	uri_prod_prev = cria_imagem_uri(plt)
	plt.clf()
	return uri_prod_prev, pred_min, pred_max

#Preve os produtos contidos numa lista
def previsao_produtos_lista(produtos):
	global df
	df_local = df
	
	produtos_mercado_previsao = {}
	for produto in produtos:
		#total de produtos doados por dia de atendimento
		total_doacao_por_atendimento = df_local.groupby(['Última Venda']).agg('Quantidade').sum()
		
		datas = df_local.loc[df_local['Produto']==produto]
		prod_vendas = datas[['Produto', 'Quantidade', 'Última Venda']]
		
		#e.g. prod_doado = {'05/11/2022': [770, 0], '08/10/2022': [733, 64]}
		prod_doado_por_data = {}

		for i, j in total_doacao_por_atendimento.items():
			p = prod_vendas.loc[prod_vendas['Última Venda'] == i]
			#.tolist() converte saida em lista
			if len(p['Quantidade'].tolist()) != 0:
				prod_doado_por_data[i] = [j, p['Quantidade'].tolist()[0]]
			else:
				prod_doado_por_data[i] = [j, 0]

		y = []
		X = []

		for i, j in prod_doado_por_data.items():
			X.append(j[0]) #valores do total de atendimentos
			y.append(j[1]) #valores do total do produto doado por atendimento

		X = np.array(X)
		y = np.array(y)
		X = np.array(X).reshape(-1,1)

		lin = LinearRegression()
		lin.fit(X, y)
		lin.predict(X) #gera uma lista
		
		v_preditos = lin.predict(X)
		
		pred_min = "{:.2f}".format(min(v_preditos))
		pred_max = "{:.2f}".format(max(v_preditos))
		
		#TODO retirar a formatação '-' daqui
		produtos_mercado_previsao[produto] = pred_min+ " - ", pred_max
	return produtos_mercado_previsao
	

def atendimento_anterior(request):
	#periodos = datas_atendimento
	datas = datas_atendimento
		
	return render(request,'atendimentos_anteriores.html', {'datas':datas})	
	
def atendimento_anterior_data(request, data):
	global df
	
	df_local = df
	datas = datas_atendimento
	
	#exibe data do atendimento
	data_atendimento = data
	
	produtos_doados_atendimento = {}
	
	#Pesquisa um produto especifico na base de dados
	df_local = df_local.loc[df_local['Última Venda']==data]
	
	df_local[['Produto','Quantidade']] #Cria o dataframe para criar tabela produto/quantidade
	
	quantidade = df_local[['Quantidade']]
	produto = df_local[['Produto']]
	
	#TODO otimizar o código para gerar a lista de produtos/quantidade
	q = pd.DataFrame(quantidade, columns=['Quantidade'])
	p = pd.DataFrame(produto, columns=['Produto'])
	
	p = p.values.tolist()
	q = q.values.tolist()
	
	for i in range(0, len(p)):
		produtos_doados_atendimento[p[i][0]] = q[i][0]

	return render(request,'atendimentos_anteriores.html', {'produtos_atendimento':produtos_doados_atendimento, 'data_atendimento':data_atendimento, 'datas':datas})

#TODO carregar dados DB e criar formulario para salvar a lista em algum formato
def proximo_atendimento(request):
	#'produto':[qtde_estoque_atual, {'v_pred':[min, max]}]
	global produtos_mercado_solidario
	
	produtos = produtos_mercado_solidario	
	p = previsao_produtos_lista(produtos)
	#print(p)
	return render(request,'lista_compras.html', {'produtos':p})
	
def lista_proximo_atendimento():
	pass