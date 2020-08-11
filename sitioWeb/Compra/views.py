from django.shortcuts import render

def compra(request,uid=0,sid=0):
    ## POST, muestra la informacion del cliente para que este de un ultimo vistazo
    if request.method == 'POST':
        with connections['taller'].cursor() as cursor: #coneccion a taller
            cursor.execute("EXEC [dbo].[spGetInfoCliente] %s",[sid]);
            context['productos'] = [row for row in cursor.fetchall()];
            carrito = [int(x) for x in request.POST['carrito'].split(',')];
            carrito = {x:y for x,y in zip(carrito[::2],carrito[1::2])};
            context = {'carrito':carrito,'uid':uid,'sid':sid};
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
        return render(request,'Compra/compra.html',context);
    else:
        return redirect('sucursales',uid=uid,permanent=True);
