from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection, connections

# Create your views here.
def sucursales(request,uid=0):
    ## EXEC [dbo].[spGetSucursales] uid
    return render(request,'Catalogo/sucursales.html',{});

def catalogo(request,uid=0,sid=0):
    ## EXEC [dbo].[spGetProductos] sid
    return render(request,'Catalogo/catalogo.html',{});

def carrito(request,uid=0,sid=0):
    ## POST, solo muestra el carrito y permite eliminar productos de la lista
    return render(request,'Catalogo/carro.html',{});