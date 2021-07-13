/* Check results in document result.pdf */


/* 1 **/
select idLlamada, fechaDeLlamada, tiempoDialogo, telefono, tipoDeLlamada
from logDial
where tipoDeLlamada = 'Cel LD' and MONTH(fechaDeLlamada) = 2;

/* 2 **/
select avg(tiempoDialogo)
from logDial
where tipoDeLlamada = 'Cel LD' and MONTH(fechaDeLlamada) = 2;

/* 3 **/
select llamadas.tipoDeLlamada, sum(llamadas.subtotal) as total
from (select c.tipoDeLlamada, c.costo, l.tiempoDialogo, (c.costo * l.tiempoDialogo) as subtotal
from logDial l join costos c on l.tipoDeLlamada = c.tipoDeLlamada
where  MONTH(fechaDeLlamada) = 1) as llamadas
group by llamadas.tipoDeLlamada
