create database practica;

--DROP TABLE marca
CREATE TABLE marca
(
    codmarca serial not null primary key,
    descripcion varchar(200) not null
);

--DROP TABLE producto
CREATE TABLE producto
(
	codproducto serial not null primary key,
    codmarca int not null,
    descripcion varchar(200) not null,
	foreign key (codmarca) references marca(codmarca)
);

--DROP TABLE cliente
CREATE TABLE cliente
(
    codcliente serial not null,
	nombre  varchar(100) not null,
	cedula  varchar(14) not null UNIQUE,
    primary key (codcliente)
	
);


--DROP TABLE factura
CREATE TABLE factura
(
    codfactura serial not null,
	fecha  date not null default now(),
	primary key (codfactura)
	
)
ALTER TABLE factura ADD COLUMN codcliente int ;
ALTER TABLE factura alter COLUMN codcliente set not null ;
ALTER TABLE factura ADD constraint cod_cliente foreign key (codcliente) references cliente(codcliente);
ALTER TABLE factura rename constraint cod_cliente to fk_cliente;
ALTER TABLE factura RENAME TO new_table_name;

--DROP TABLE factura_detalle
CREATE TABLE factura_detalle
(
    codfacturadet serial not null primary key,
	codfactura int not null,
	codproducto int not null, 
	cantidad int not null,
	precio numeric(14,2) not null,
	constraint cursoid foreign key (codproducto) references producto(codproducto)

);

SELECT * FROM marca
SELECT * from producto 
INSERT INTO public.marca(descripcion) VALUES ('ALPINA'), ('ESKIMO');
INSERT INTO public.producto(codmarca, descripcion)	VALUES (1,'AGUA BOTELLA 710ML ');
INSERT INTO public.producto(codmarca, descripcion)	VALUES (1,'AGUA BOTELLA 1L');
INSERT INTO public.producto(codmarca, descripcion)	VALUES (2,'LECHE DESCREMADA 0% GRASA');
INSERT INTO public.producto(codmarca, descripcion)	VALUES (2,'CREMA ACIDA BOLSA 454 GR');

