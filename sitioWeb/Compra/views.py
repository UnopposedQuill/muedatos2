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
            colname = [col[0] for col in cursor.description];
            rows = [dict(zip(colname,row)) for row in cursor.fetchall()];
            context['nombre'] = rows[0]['nombre'];
            context['apellidos'] = rows[0]['apellidos'];
            context['telefonos'] = {row['telefono']:    row['tel_descripcion'] for row in rows if not row['telefono']    ==None};
            context['correos']   = {row['correo']:      row['cor_descripcion'] for row in rows if not row['correo']      ==None};
            context['metodos']   = {row['idMetodoPago']:row['met_descripcion'] for row in rows if not row['idMetodoPago']==None};
            context['ubicacion'] = [rows[0]['Lat'],rows[0]['Long']];
            return render(request,'Compra/compra.html',context);
    else:
        return redirect('sucursales',uid=uid,permanent=True);

def facturar(request,uid=0,sid=0):
    ## EXEC [dbo].[spFacturar] uid sid [carrito] 
    ## POST, envia a la bd todo lo de facturacion y retorna una pagina con el resultado de la compra
    if request.method == 'POST':
        mid = int(request.POST['mid']);
        carrito = [int(x) for x in request.POST['carrito'].split(',')];
        carrito = {x:y for x,y in zip(carrito[::2],carrito[1::2])};
        with connections['taller'].cursor() as cursor: #coneccion a taller
            cursor.execute("EXEC [dbo].[spFacturarWeb] %s, %s, %s, %s",[uid,sid,mid,','.join(','.join([str(k)]*n) for k,n in list(carrito.items()))]);
            row = cursor.fetchone(); #id,code,detalle retorno
            context = {'id':row[0],'code':row[1],'detalle':row[2],'sid':sid};
            return render(request,'Compra/facturar.html',context);
    else:
        return redirect('sucursales',uid=uid,permanent=True);
