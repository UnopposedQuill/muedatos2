from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.db import connection, connections

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
        context = {'carrito':request.POST['carrito'],'uid':uid,'sid':sid};
        return render(request,'Catalogo/carro.html',{});
    else:
        return redirect('sucursales/'+uid+'/',uid=uid,permanent=True);