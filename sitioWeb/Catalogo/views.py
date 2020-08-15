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
        colname = [col[0] for col in cursor.description];
        rows = [dict(zip(colname,row)) for row in cursor.fetchall()];
        context['productos'] = [(x,y,z) for x,y,z in zip(rows[::3],rows[1::3],rows[2::3])]
        if len(rows)%3 == 1: context['productos'] += [ (rows[-1],None,None) ];
        if len(rows)%3 == 2: context['productos'] += [ (rows[-2],rows[-1],None) ];
    return render(request,'Catalogo/catalogo.html',context);

def carrito(request,uid=0,sid=0):
    ## POST, solo muestra el carrito y permite eliminar productos de la lista
    if request.method == 'POST':
        carrito = [int(x) for x in request.POST['carrito'].split(',')];
        carrito = {x:y for x,y in zip(carrito[::2],carrito[1::2])};
        detalle = {key:value for key, value in carrito.items()}
        with connections['taller'].cursor() as cursor: #coneccion a taller
            cursor.execute("EXEC [dbo].[spGetDetalleProductos] %s",[','.join(str(n) for n in list(carrito.keys()))]);
            colname = [col[0] for col in cursor.description];
            colname[0] = 'cantidad'
            total = 0;
            for row in cursor.fetchall(): #P.id, P.nombre, P.descripcion, P.precio
                detalle[row[0]] = dict(zip(colname,[carrito[row[0]]]+list(row[1::])))
                total += float(detalle[row[0]]['precio'])
            context = {'detalle':detalle,'carrito':carrito,'uid':uid,'sid':sid,'total':total};
        return render(request,'Catalogo/carro.html',context);
    else:
        return redirect('sucursales',uid=uid,permanent=True);