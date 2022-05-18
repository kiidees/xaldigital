---  ( 1 )muestra la tabla con el numero de vuelos y nombres de los aeropuertos en orden descendente
SELECT (nombre_aeropuerto) as nombre, count(vuelos.id_movimiento) as totalvuelos 
	FROM public.aeropuertos full join vuelos on aeropuertos.id_aeropuerto = vuelos.id_aeropuerto 
	group by nombre_aeropuerto order by totalvuelos desc;


---  ( 2 )muestra la tabla con las el numero de vuelos de las aerolineas en orden descendente
SELECT (nombre_aerolinea) as nombre, count(vuelos.id_movimiento) as totalvuelos 
	FROM public.aerolineas full join vuelos on aerolineas.id_aerolinea = vuelos.id_aerolinea 
	group by nombre_aerolinea order by totalvuelos desc;


---  ( 3 )muestra la fecha en la que mas se realizaron movimientos
SELECT max(dia)
	FROM public.vuelos;


