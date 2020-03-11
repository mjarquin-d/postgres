--DROP TABLE instructores
CREATE TABLE instructores
(
    id serial not null primary key,
    nombres varchar(50) not null,
    cedula varchar(14) unique, 
	constraint ck_nombre_no_jose CHECK(nombres<>'JOSE')
);
--DROP TABLE cursos
CREATE TABLE cursos
(
    id serial not null primary key,
    nombres varchar(50) not null,
    instructor_id int not null, 
	foreign key (instructor_id) references instructores(id),
	constraint ck_curso UNIQUE (instructor_id, nombres)
);

--DROP TABLE lab
CREATE TABLE lab
(
    id serial not null,
	curso_id int not null, 
    nombres varchar(50) not null,
    primary key (id),
	foreign key (curso_id) references cursos(id)
)

--DROP TABLE lab2
CREATE TABLE lab2
(
    id serial not null,
	nombres varchar(50) not null,
    primary key (id)
	
)

--DROP TABLE lab2_detalle
CREATE TABLE lab2_detalle
(
    id serial not null,
	lab_id int not null UNIQUE,
	curso_id int not null, 
    primary key (id),
	constraint cursoid foreign key (curso_id) references cursos(id),
	constraint laboraid foreign key (lab_id) references lab2(id)
	--constraint ck_lab UNIQUE (lab_id)
)

select * from lab2
select * from lab2_detalle
INSERT INTO public.lab2(nombres) VALUES ('labatarorio1');
INSERT INTO public.lab2(nombres) VALUES ('labatarorio2');
INSERT INTO public.lab2_detalle(lab_id, curso_id) VALUES (1, 1);
select * from instructores
INSERT INTO public.instructores(nombres, cedula) VALUES ('Martha Jarquin Davila', '0040102810000u');
INSERT INTO public.instructores(nombres, cedula) VALUES ('Carmen Isabel Tijerino Gutierrez', '0040102810000M');
INSERT INTO public.instructores(nombres, cedula) VALUES ('Edgar Hernandez', '0010102810000M');
INSERT INTO public.instructores(nombres, cedula) VALUES ('Favor Hernandez', '0010102810001M');
INSERT INTO public.instructores(nombres, cedula, correo) VALUES ('Pedro', '0040102810010u','SIN DEFINIR');
update instructores set cedula='0040103910000U' WHERE id=1
select * from cursos 
select *from cursos where nombres ilike '%ph%'
delete from cursos where nombres ilike '%ph%'
INSERT INTO public.cursos(nombres, instructor_id)
VALUES ('PHP', 2),('excel', 2);
INSERT INTO public.cursos(nombres, instructor_id) VALUES ('COMPUTACION', 2);
INSERT INTO public.cursos(nombres, instructor_id) VALUES ('INGLES', 5);
INSERT INTO public.cursos(nombres, instructor_id) VALUES ('PostgreSQL', 5);
INSERT INTO public.cursos(nombres, instructor_id) VALUES ('PHP', 8);
INSERT INTO public.cursos(nombres, instructor_id) VALUES ('Python', 4);

ALTER TABLE instructores ADD COLUMN fecha_crea date default now();
ALTER TABLE instructores ADD COLUMN estado boolean default true;
ALTER TABLE instructores DROP COLUMN fecha_crea;
ALTER TABLE instructores RENAME COLUMN estado TO b_estado;
ALTER TABLE instructores ALTER COLUMN nombres SET DEFAULT '';
ALTER TABLE instructores ALTER COLUMN nombres DROP DEFAULT;
ALTER TABLE instructores ADD COLUMN telefono varchar(8);
ALTER TABLE instructores ADD COLUMN direccion text;
ALTER TABLE instructores ADD COLUMN correo varchar(50);
ALTER TABLE instructores ALTER COLUMN correo TYPE varchar(200)

UPDATE instructores SET correo ='SIN DEFINIR'
ALTER TABLE instructores ALTER COLUMN correo SET NOT NULL;
	