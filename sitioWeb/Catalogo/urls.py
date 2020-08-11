from django.urls import path

from . import views

urlpatterns = [
    path('<int:uid>/', views.sucursales, name='sucursales'),
    path('<int:uid>/<int:sid>', views.catalogo, name='catalogo'),
    path('<int:uid>/<int:sid>/carro', views.carrito, name='carrito'),
]