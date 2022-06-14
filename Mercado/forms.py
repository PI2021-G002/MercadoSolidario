from django import forms
from django.forms.models import ModelForm
from .models import Estoque,ItensAtendimento,Atendimento,CodBarProdSol,ProdutoSolidario,Categoria

class FormAtendimento(forms.Form):
    #id_produto = forms.ModelChoiceField(queryset=ProdutoSolidario.objects.all().order_by('id_produto'))
    dataValidade = forms.DateTimeField(required=True,widget=forms.SelectDateWidget(),label='Data')
    quantidade =forms.IntegerField(required=True)

class FormEntradaEstoqueProduto(forms.Form):
    codigo_produto = forms.IntegerField(required=True)

class FormEntradaEstoque(forms.Form):
    idProdutoSoludario = forms.IntegerField(required=True,widget=forms.HiddenInput())
    