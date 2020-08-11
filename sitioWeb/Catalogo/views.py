from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.db import connection, connections
from collections import Counter

# Create your views here.
def sucursales(request,uid=0):
    ## EXEC [dbo].[spGetSucursales] uid
    context = {'sucursales':[],'uid':uid}
    with connections['taller'].cursor() as cursor: #coneccion a taller
        cursor.execute("EXEC [dbo].[spGetSucursales] %s",[uid]);
        context['sucursales'] = [row for row in cursor.fetchall()];
    return render(request,'Catalogo/sucursales.html',context);

def catalogo(request,uid=0,sid=0):
    ## EXEC [dbo].[spGetProductos] sid
    context = {'productos':[],'uid':uid,'sid':sid}
    with connections['taller'].cursor() as cursor: #coneccion a taller
        cursor.execute("EXEC [dbo].[spGetProductos] %s",[sid]);
        context['productos'] = [row for row in cursor.fetchall()];
    return render(request,'Catalogo/catalogo.html',context);

def carrito(request,uid=0,sid=0):
    ## POST, solo muestra el carrito y permite eliminar productos de la lista
    if request.method == 'POST':
        carrito = [int(x) for x in request.POST['carrito'].split(',')];
        carrito = {x:y for x,y in zip(carrito[::2],carrito[1::2])};
        context = {'carrito':carrito,'uid':uid,'sid':sid};
        return render(request,'Catalogo/carro.html',context);
    else:
        return redirect('sucursales',uid=uid,permanent=True);