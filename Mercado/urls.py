from django.contrib import admin
from django.urls import include, path
from django.views.generic import TemplateView
from .views import *
from django.http import HttpRequest,HttpResponse

urlpatterns = [
    path('',TemplateView.as_view(template_name='index.html'), name='index'),
    path('accounts/logout',logout_view, name='Logout'),
    #path('admin/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    path('ajuda/',TemplateView.as_view(template_name='ajuda.html'), name='Ajuda'),
    #path('agendamentos/',ViewAgendamentos, name='agendamento'),  
    #path('agendamentos/novo/programa',NovoAgendamentoPrograma,name = 'NovoAgendamento'),
    #path('agendamentos/novo/programa/<int:id>/',ReAgendamentoPrograma,name = 'ReAgendamento'),
    #path('agendamentos/novo/voluntario',NovoAgendamentoVoluntario,name = 'NovoAgendamentoVolParc'),
    #path('agendamentos/novo/voluntario/<int:id>/',ReAgendamentoVoluntario,name = 'ReAgendamentoVolParc'),
    #path('agendamentos/novo/parceiro',NovoAgendamentoParceiro,name = 'NovoAgendamentoVolParc'),
    #path('agendamentos/novo/parceiro/<int:id>/',ReAgendamentoParceiro,name = 'ReAgendamentoVolParc'),
    #path('acompanhamentos',ViewAcompanhamentos,name = 'Acompanhamentos'),

]