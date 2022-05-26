from django import forms
from django.forms.models import ModelForm
from .models import Estoque,ItensAtendimento,Atendimento,ProdutoSolidarioCodigoDeBarras,ProdutoSolidario,Categoria

class FormAtendimento(forms.Form):
    produto = forms.ModelChoiceField(queryset=ProdutoSolidario.objects.all().order_by('produto'))
    dataValidade = forms.DateTimeField(required=True,widget=forms.SelectDateWidget(),label='Data')
    quantidade =forms.IntegerField(required=True)
    