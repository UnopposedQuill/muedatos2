from django.urls import path

from . import views

urlpatterns = [
    path('<int:uid>/<int:sid>', views.compra, name='compra'),
    path('<int:uid>/<int:sid>/resolve', views.facturar, name='factuar'),
]