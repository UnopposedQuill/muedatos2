import html
from django.shortcuts import render, redirect
from django.db import connection, connections

def evaluar(request,uid):
    with connections['taller'].cursor() as cursor: #coneccion a taller
        vid = request.GET['vid'];
        sid = int(vid.split(':')[0]);
        vid = int(vid.split(':')[1]);
        cursor.execute('EXEC [dbo].[spGetInformacionVenta] %s,%s,%s',[uid,sid,vid]);
        colname = [col[0] for col in cursor.description];
        rows = [dict(zip(colname,row)) for row in cursor.fetchall()];
        if(len(rows)<=0):
            return redirect('sucursales',uid=uid,permanent=True);
        productos = {row['idProducto']:row['Producto'] for row in rows};
        venta = {
            'vid':rows[0]['Venta'],
            'uid':rows[0]['Cliente'],
            'sid':sid,
            'metodoPago':rows[0]['Pago'],
            'fecha':rows[0]['Fecha']
        }
        if rows[0]['Recibo']==None:
            venta['evaluacion'] = "<xml>"+''.join([f"<prod id=\"{id}\"><nombre>{nombre}</nombre><evaluacion></evaluacion></prod>" for id,nombre in productos.items()])+"</xml>";
        else:
            venta['evaluacion'] = html.unescape(rows[0]['Recibo']);
    return render(request,'Evaluacion/evaluar.html',venta);

def enviar(request,uid):
    if request.method == 'POST':
        contexto = {'uid':uid,'productos':{}};
        for k,p in request.POST.items():
            if(k=='vid'): contexto['vid']=int(p);
            elif(k=='sid'): contexto['sid']=int(p);
            elif(k[0]=='p'):
                if k[1::] not in contexto['productos']: contexto['productos'][k[1::]]={};
                contexto['productos'][k[1::]]['evaluacion']=p;
            elif(k[0]=='n'):
                if k[1::] not in contexto['productos']: contexto['productos'][k[1::]]={};
                contexto['productos'][k[1::]]['nombre']=p;
        xml = "<xml>"+''.join([f"<prod id=\"{id}\"><nombre>{producto['nombre']}</nombre><evaluacion>{producto['evaluacion']}</evaluacion></prod>" for id,producto in contexto['productos'].items()])+"</xml>"
        with connections['taller'].cursor() as cursor: #coneccion a taller
            cursor.execute('EXEC [dbo].[spEvaluarVenta] %s,%s,%s,%s',[contexto['uid'],contexto['sid'],contexto['vid'],xml]);
    return redirect('sucursales',uid=uid,permanent=True);
