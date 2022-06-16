from django import forms
from django.forms.models import ModelForm
from .models import Estoque,ItensAtendimento,Atendimento,CodBarProdSol,ProdutoSolidario,Categoria,FonteDoacao

class FormEntradaEstoqueCodBar(forms.Form):
    codigo_produto = forms.IntegerField(required=True)

#https://www.youtube.com/watch?v=fUaJpQ5vYbQ - Bootstrap Class values nos formulários do Django
class FormEntradaEstoqueProduto(forms.Form):
    id_produto = forms.CharField(required=True,label='Produto Solidario')
    id_produto.widget.attrs['class'] = 'form-control'
    id_produto.widget.attrs['readonly'] = '1'
    quantidade =forms.IntegerField(required=True)
    quantidade.widget.attrs['class'] = 'form-control'
    dataValidade = forms.DateTimeField(required=True,widget=forms.SelectDateWidget(),label='Data de Validade')
    dataValidade.widget.attrs['class'] = 'form-control'
    id_fonte = forms.ModelChoiceField(queryset=FonteDoacao.objects.all().order_by('nome'),label='Fonte de Doação')
    id_fonte.widget.attrs['class'] = 'form-control'
    quem_cadastrou = forms.CharField(required=True)
    quem_cadastrou.widget.attrs['class'] = 'form-control'
    idp = forms.IntegerField(required=True,widget=forms.HiddenInput(),label="")
    
class FormAtendimento(forms.Form):
    #id_produto = forms.ModelChoiceField(queryset=ProdutoSolidario.objects.all().order_by('id_produto'))
    dataValidade = forms.DateTimeField(required=True,widget=forms.SelectDateWidget(),label='Data')
    quantidade =forms.IntegerField(required=True)


class FormEntradaEstoque(forms.Form):
    idProdutoSolidario = forms.IntegerField(required=True,widget=forms.HiddenInput())
    