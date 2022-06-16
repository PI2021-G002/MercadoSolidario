"""MercadoSolidario URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from django.views.generic import TemplateView
from Mercado.views import *

admin.site.site_header = "Administração do Mercado"
admin.site.site_title  = "Administração do Mercado"
admin.site.index_title = "Mercado Solidário"
admin.site.site_url = "/Mercado/"

urlpatterns = [
    path('admin/', admin.site.urls),
    path('Mercado/',include('Mercado.urls')),
    path('ajuda/',TemplateView.as_view(template_name='ajuda.html'), name='Ajuda'),
    path('accounts/', include('django.contrib.auth.urls')),
    path('',TemplateView.as_view(template_name='index.html'), name='index'),
]

