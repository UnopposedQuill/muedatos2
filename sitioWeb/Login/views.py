from django.shortcuts import render, redirect
from django.db import connection, connections

def login(request,success=True):
    context = {'success':success};
    #login comun y corriente, con inputs para username y pass
    return render(request,'Login/login.html',context);

def resolve(request):
    #consulta la bd, revisa la validez del login y redirects a login or sucursales segun .
    if request.method == 'POST':
        with connections['taller'].cursor() as cursor: #coneccion a taller
            #TODO
            #esto no es seguro, es necesario escapar los parametros para evitar potencial inyeccion de SQL
            cursor.execute("EXEC [dbo].[spLogin] %s, %s",[request.POST['uid'],request.POST['pwd']]);
            row = cursor.fetchone();
            if(row[0]!=0):
                return redirect('sucursales',uid=row[1],permanent=True);
            else:
                return redirect('/',success=False,permanent=True);