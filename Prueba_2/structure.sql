/* author: Victor Escalante */
create database test;
use test;

create table logDial
(
	idLlamada varchar(10) null,
	fechaDeLlamada datetime null,
	tiempoDialogo smallint null,
	telefono varchar(10) null,
	tipoDeLlamada varchar(15) null
)
comment 'Log Dial Table';

create table costos
(
	tipoDeLlamada varchar(15) null,
	costo decimal(10,4) null
)
comment 'Cost Table';
