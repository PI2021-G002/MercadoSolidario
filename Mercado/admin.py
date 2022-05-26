from django.contrib import admin

# Register your models here.
from .models import Categoria, ProdutoSolidario, ProdutoSolidarioCodigoDeBarras, FontesDoacao

class CategoriaAdmin(admin.ModelAdmin):
    fields = ['categoria']
    list_display = ('id','Categoria')

admin.site.register(Categoria,CategoriaAdmin)

class ProdutoSolidarioAdmin(admin.ModelAdmin):
    fields =['preço','quantidade','unidade','id_categoria']
    list_display = ('id','produto','quantidade','unidade','categoria')

admin.site.register(ProdutoSolidario,ProdutoSolidarioAdmin)

class ProdutoSolidarioCodigoDeBarrasAdmin(admin.ModelAdmin):
    fields =['id_produto','codigo_barras']
    list_display = ('id','produto','codigo_barras')

admin.site.register(ProdutoSolidarioCodigoDeBarras,ProdutoSolidarioCodigoDeBarrasAdmin)

class FontesDoacaoAdmin(admin.ModelAdmin):
    fields =['nome']
    list_display = ('id','nome')

admin.site.register(FontesDoacao,FontesDoacaoAdmin)

