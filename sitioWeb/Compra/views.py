from django.shortcuts import render

def compra(request,uid=0,sid=0):
    ## EXEC [dbo].[spGetSucursales] uid
    return render(request,'Compra/compra.html',{});

def facturar(request,uid=0,sid=0):
    ## EXEC [dbo].[spGetProductos] sid
    return render(request,'Compra/factuar.html',{});
