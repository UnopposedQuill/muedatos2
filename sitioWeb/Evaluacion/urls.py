from django.urls import path

from . import views

urlpatterns = [
    path('<int:uid>/', views.evaluar, name='evaluar'),
    path('<int:uid>/enviar', views.enviar, name='enviarevaluacion'),
]