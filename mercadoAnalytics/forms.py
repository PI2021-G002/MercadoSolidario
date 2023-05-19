from django import forms

class FormListaCompras(forms.Form):
	produto = forms.CharField(required=True,label='Produto Solidario')
	estoque_atual = forms.IntegerField(required=True)
	previsao = forms.IntegerField(required=True)
	qtde_comprar = forms.IntegerField(required=True)
	chk_comprar = forms.BooleanField(required=False, initial=True)#inicia aceitando todos os produtos
	#https://docs.djangoproject.com/en/4.2/ref/forms/fields/