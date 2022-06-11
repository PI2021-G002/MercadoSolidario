from django.contrib import admin

# Register your models here.
from .models import Categoria, ProdutoSolidario, CodBarProdSol, FonteDoacao

class CategoriaAdmin(admin.ModelAdmin):
    fields = ['categoria']
    list_display = ('id','categoria')

admin.site.register(Categoria,CategoriaAdmin)

class ProdutoSolidarioAdmin(admin.ModelAdmin):
    fields =['id_categoria','quantidade','unidade','preco_solidario','estoque_minimo','max_familia']
    list_display = ('id','id_categoria','quantidade','unidade','estoque_minimo','preco_solidario','max_familia')
    verbose_name = "produtos solidários"

admin.site.register(ProdutoSolidario,ProdutoSolidarioAdmin)

class CodBarProdSolAdmin(admin.ModelAdmin):
    fields =['id_produto','codigo_barras']
    list_display = ('id','id_produto','codigo_barras')

admin.site.register(CodBarProdSol,CodBarProdSolAdmin)

class FontesDoacaoAdmin(admin.ModelAdmin):
    fields =['nome']
    list_display = ('id','nome')

admin.site.register(FonteDoacao,FontesDoacaoAdmin)
