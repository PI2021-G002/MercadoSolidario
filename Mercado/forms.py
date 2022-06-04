from django import forms
from django.forms.models import ModelForm
from .models import Estoque,ItensAtendimento,Atendimento,CodBarProdSol,ProdutoSolidario,Categoria

class FormAtendimento(forms.Form):
    id_produto = forms.ModelChoiceField(queryset=ProdutoSolidario.objects.all())
    dataValidade = forms.DateTimeField(required=True,widget=forms.SelectDateWidget(),label='Data')
    quantidade =forms.IntegerField(required=True)