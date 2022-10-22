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
    idp = forms.IntegerField(required=True,widget=forms.HiddenInput(),label="")
    codigo_barras = forms.IntegerField(required=True,widget=forms.HiddenInput(),label="")
    id_prodsol = forms.IntegerField(required=True,widget=forms.HiddenInput(),label="")
    produto = forms.CharField(required=True,label='Produto Solidario')
    produto.widget.attrs['class'] = 'form-control'
    produto.widget.attrs['readonly'] = '1'
    solidarios = forms.CharField(required=True,label='Solidários')
    solidarios.widget.attrs['class'] = 'form-control'
    solidarios.widget.attrs['readonly'] = '1'    
    max_fam = forms.CharField(required=True,label='Máximo por Família')
    max_fam.widget.attrs['class'] = 'form-control'
    max_fam.widget.attrs['readonly'] = '1'    
    quantidade =forms.IntegerField(required=True)
    quantidade.widget.attrs['class'] = 'form-control'
    dataValidade = forms.DateTimeField(required=True,label='Data de Validade')
    dataValidade.widget.attrs['class'] = 'form-control'


class FormEntradaEstoque(forms.Form):
    idProdutoSolidario = forms.IntegerField(required=True,widget=forms.HiddenInput())
    