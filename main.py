
import json
import requests
import operator
from datetime import datetime

respuesta = requests.get('https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow')
datos = respuesta.json()
contestada = 0
no_contestada = 0
minimo = []
respuesta_minima = []
antiguedad = []

reputacion_maxima = []

for items in datos['items']:
    
    if(items['is_answered']==True):
        contestada = contestada + 1
        vistas = items['view_count']

        respuestas = items['link']
        minimo.append(vistas)
        respuesta_minima.append(respuestas)

        fechas = items['last_activity_date']
        antiguedad.append(fechas)
  
        reputacion = items['owner']['reputation']
        reputacion_maxima.append(reputacion)
                
    else:
        no_contestada = no_contestada + 1
        

print('Numero de respuestas contestadas: ',contestada,', numero de respuestas no contestadas: ',  no_contestada)


vistas_min = min(minimo)
i_vista = minimo.index(vistas_min) 
print('El link de la respuesta con menor numero de vistas es: ',respuesta_minima[i_vista],', el numero de vistas es: ',vistas_min)

antiguo = min(antiguedad)
actual = max(antiguedad)

i_antiguo = antiguedad.index(antiguo)
i_actual = antiguedad.index(actual)

formato_antiguo = datetime.fromtimestamp(antiguo)
formato_actual = datetime.fromtimestamp(actual)

print('la fecha mas antigua es: ', formato_antiguo, ' su link es: ', respuesta_minima[i_antiguo])
print('la fecha mas actual es: ', formato_actual, ' su link es: ', respuesta_minima[i_actual])

reputacion = max(reputacion_maxima)
i_reputacion = reputacion_maxima.index(reputacion)
print('la respuesta del owner con mejor calificacion es: ',respuesta_minima[i_reputacion])
