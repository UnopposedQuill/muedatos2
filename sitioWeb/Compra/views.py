from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.db import connection, connections

def compra(request,uid=0,sid=0):
    ## POST, muestra la informacion del cliente para que este de un ultimo vistazo
    if request.method == 'POST':
        carrito = [int(x) for x in request.POST['carrito'].split(',')];
        carrito = {x:y for x,y in zip(carrito[::2],carrito[1::2])};
        context = {'uid':uid,'sid':sid, 'telefonos':{},'correos':{},'ubicacion':[],'carrito':carrito}
        with connections['taller'].cursor() as cursor: #coneccion a taller
            cursor.execute("EXEC [dbo].[spGetInfoCliente] %s",[uid]);
            rows = [row for row in cursor.fetchall()]; #id,nombre,apellidos,tel,desc,corr,desc,lat,long
            context['nombre'] = rows[0][1];
            context['apellidos'] = rows[0][2];
            context['telefonos'] = {row[3]:row[4] for row in rows};
            context['correos'] = {row[5]:row[6] for row in rows};
            context['ubicacion'] = [rows[0][7],rows[0][8]];
            return render(request,'Compra/compra.html',context);
    else:
        return redirect('sucursales',uid=uid,permanent=True);

def facturar(request,uid=0,sid=0):
    ## EXEC [dbo].[spFacturar] uid sid [carrito] 
    ## POST, envia a la bd todo lo de facturacion y retorna una pagina con el resultado de la compra
    if request.method == 'POST':
        carrito = [int(x) for x in request.POST['carrito'].split(',')];
        carrito = {x:y for x,y in zip(carrito[::2],carrito[1::2])};
        context = {'carrito':carrito,'uid':uid,'sid':sid};
        return render(request,'Compra/facturar.html',context);
    else:
        return redirect('sucursales',uid=uid,permanent=True);
