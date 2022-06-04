from django.shortcuts import render
from django.utils.formats import date_format
from .models import Estoque, Atendimento,ItensAtendimento,ProdutoSolidario,FonteDoacao,CodBarProdSol
from django.shortcuts import render
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth import logout
from django.http import HttpResponseRedirect, HttpResponse
from .forms import FormAtendimento
from datetime import date, datetime
from django.db import connection
from django.contrib import messages

# Create your views here.
def logout_view(request):
    logout(request)
    return render(request,'index.html')