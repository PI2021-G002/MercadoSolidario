from django.contrib import admin

# Register your models here.
from .models import Categoria, ProdutoSolidario, CodBarProdSol, FonteDoacao,AtendimentoTemplate,ItensAtendimentoTemplate,Estoque

class CategoriaAdmin(admin.ModelAdmin):
    fields = ['categoria']
    list_display = ('categoria',)

admin.site.register(Categoria,CategoriaAdmin)

class ProdutoSolidarioAdmin(admin.ModelAdmin):
    fields =['id_categoria','quantidade','unidade','preco_solidario','estoque_minimo','max_familia']
    list_display = ('id_categoria','quantidade','unidade','estoque_minimo','preco_solidario','max_familia')

admin.site.register(ProdutoSolidario,ProdutoSolidarioAdmin)

class CodBarProdSolAdmin(admin.ModelAdmin):
    fields =['id_produto','codigo_barras']
    list_display = ('id_produto','codigo_barras')

admin.site.register(CodBarProdSol,CodBarProdSolAdmin)

class FontesDoacaoAdmin(admin.ModelAdmin):
    fields =['nome','descricao']
    list_display = ('nome','descricao')

admin.site.register(FonteDoacao,FontesDoacaoAdmin)

class AtendimentoTemplateAdmin(admin.ModelAdmin):
    fields = ('tipo','descricao')
    list_display = ('tipo','descricao')

admin.site.register(AtendimentoTemplate,AtendimentoTemplateAdmin)

class ItensAtendimentoTemplateAdmin(admin.ModelAdmin):
    fields = ('id_atendimento','id_produto','quantidade')
    list_display = ('id_atendimento','id_produto','quantidade')

admin.site.register(ItensAtendimentoTemplate,ItensAtendimentoTemplateAdmin)

class EstoqueAdmin(admin.ModelAdmin):
    fields = ('id_produto','validade','quantidade')
    list_display = ('id_produto','validade','quantidade')

admin.site.register(Estoque,EstoqueAdmin)