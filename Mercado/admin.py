from django.contrib import admin

# Register your models here.
from .models import Categoria, ProdutoSolidario, ProdutoSolidarioCodigoDeBarras, FontesDoacao

class CategoriaAdmin(admin.ModelAdmin):
    fields = ['categoria']
    list_display = ('id','categoria')

admin.site.register(Categoria,CategoriaAdmin)

class ProdutoSolidarioAdmin(admin.ModelAdmin):
    fields =['id_categoria','quantidade','unidade','preco']
    list_display = ('id','id_categoria','quantidade','unidade')

admin.site.register(ProdutoSolidario,ProdutoSolidarioAdmin)

class ProdutoSolidarioCodigoDeBarrasAdmin(admin.ModelAdmin):
    fields =['id_produto','codigo_barras']
    list_display = ('id','id_produto','codigo_barras')

admin.site.register(ProdutoSolidarioCodigoDeBarras,ProdutoSolidarioCodigoDeBarrasAdmin)

class FontesDoacaoAdmin(admin.ModelAdmin):
    fields =['nome']
    list_display = ('id','nome')

admin.site.register(FontesDoacao,FontesDoacaoAdmin)

