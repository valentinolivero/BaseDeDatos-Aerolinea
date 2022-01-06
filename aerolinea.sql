create schema if not exists aerolineaB;
use aerolineaB;

create table provincia(
id int primary key,
nombre varchar (45) not null

);

create table localidad(
id int primary key,
nombre varchar (45) not null

);
create table calle(
id int primary key,
nombre varchar(45) not null

);
create table persona(

nombre varchar(45) not null,
apellido varchar(45) not null,
dni int primary key,
id_calle int not null,
numero_calle int not null,
id_localidad int not null,
id_provincia int not null,

foreign key (id_calle) references calle(id),
foreign key (id_localidad) references localidad(id),
foreign key (id_provincia) references provincia(id)
);

create table piloto(
dni_piloto int not null, 
cuil bigint primary key,
fecha_de_ingreso date not null,
foreign key (dni_piloto) references persona(dni)-- Foreign key quiere decir llave primaria que relaciona piloto con persona
);
create table pasajero(
dni_pasajero int not null,
codigo int primary key,
viajero_frecuente bit(1),
foreign key (dni_pasajero) references persona(dni)
);

create table marca(
codigo int primary key,
nombre varchar(45) not null,
pais varchar(45) not null


);
create table avion(
codigo_marca int not null,
modelo varchar(45) not null,
matricula varchar(45) primary key,
fecha_entrada_servicio date not null,
foreign key (codigo_marca) references marca(codigo)
);

create table if not exists aeropuerto_origen(
iata_origen varchar(45) primary key,
nombre varchar(45) not null
);
create table if not exists aeropuerto_destino(
iata_destino varchar(45) primary key,
nombre varchar(45) not null
);

create table vuelo(
codigo varchar(45) primary key,
matricula_avion varchar(45)not null,
iata_origen varchar(45) not null,
iata_llegada varchar(45) not null,
fecha_partida date not null,
hora_partida time not null,
fecha_llegada date not null,
hora_llegada time not null,
cuil_piloto bigint not null,
foreign key (matricula_avion) references avion(matricula),
foreign key (iata_origen) references aeropuerto_origen(iata_origen),
foreign key (iata_llegada) references aeropuerto_destino(iata_destino),
foreign key (cuil_piloto) references piloto(cuil)
);
create table pasajero_toma_vuelo(
codigo int primary key,
codigo_pasajero int not null,
codigo_vuelo varchar(45) not null,
foreign key (codigo_pasajero) references pasajero(codigo),
foreign key (codigo_vuelo) references vuelo(codigo)
);

-- inserto provincias
insert into provincia values ('1', "Buenos Aires");
insert into provincia values ('2', "CABA");
-- inserto localidades 
insert into localidad values ('1', "Lanus");
insert into localidad values ('2', "CABA");
insert into localidad values ('3', "Avellandeda");
insert into localidad values ('4', "Lomas de zamora");
-- inserto calles
insert into calle values ('1', "Ituzaingo");
insert into calle values ('2', "Roca");
insert into calle values ('3', "Campichuelo");
insert into calle values ('4', "Meeks");
insert into calle values ('5', "Mamberti");
insert into calle values ('6', "Amenabar");
insert into calle values ('7', "Capello");
insert into calle values ('8', "San Martin");
insert into calle values ('9', "Azara");
insert into calle values ('10', "Sarmiento");
insert into calle values ('11', "Rivadavia");
insert into calle values ('12', "Martinto");
insert into calle values ('13', "Bolaños");
insert into calle values ('14', "Loria");

-- Inserto personas pasajeras
insert into persona values ("Barragan","Alejo",'11111111','1','123','1','1');
insert into persona values ("Casas","Andrés Alfredo",'22222222','2','4561','2','2');
insert into persona values ("Chaves","Barbara",'33333333','3','6532','3','1');
insert into persona values ("Chimbo","Brisa",'44444444','4','562','4','1');
insert into persona values ("Chudoba","Camila",'55555555','5','2356','1','1');
insert into persona values ("Cires","Carlos",'66666666','6','2345','2','2');
insert into persona values ("Cusato","Carlos Sebastian",'77777777','7','1589','4','1');
insert into persona values ("Dominguez","Christian",'88888888','8','356','2','2');
insert into persona values ("Escullini","Cristian",'99999999','9','1296','4','1');
insert into persona values ("Feijoo","Cristian",'10111213','10','3652','3','1');
-- inserto personas pilotas
insert into persona values ("Juarez","Federico Bernardo",'12345678','8','2235','2','2');
insert into persona values ("Lacoste","Franco",'34567890','9','1254','4','1');
insert into persona values ("Lairme","Mariana",'45678901','10','500','1','1');
insert into persona values ("Lopez","German Ignacio",'56789123','11','2351','2','2');
insert into persona values ("Martinez","Giuliano",'67891234','12','663','1','1');
insert into persona values ("Medina","Adriana",'78912345','13','1256','1','1');
insert into persona values ("Melgarejo","Jair Alberto",'90123456','14','333','4','1');

-- inserto pilotos dni_piloto int not null, 
-- cuil int primary key,
-- fecha_de_ingreso date not null,dni	cuil	fecha ingreso


insert into piloto values (12345678, 20123456788, '94-1-10');
insert into piloto values (34567890, 20345678901, '03-1-7');
insert into piloto values (45678901, 27456789011, '01-1-4');
insert into piloto values (56789123, 20567891233, '13-1-5');
insert into piloto values (67891234, 20678912344, '10-1-7');
insert into piloto values (78912345, 27789123455,'15-1-8');
insert into piloto values (90123456,20901234566 , '11-1-3');
 -- inserto pasajeros
-- dni_pasajero int not null,
-- codigo int primary key,
-- viajero_frecuente bit(1),
                                                     
insert into pasajero values (11111111, 1,1);
insert into pasajero values (22222222, 2,1);
insert into pasajero values (33333333, 3,0);
insert into pasajero values (44444444, 4,1);
insert into pasajero values (55555555, 5,0);
insert into pasajero values (66666666, 6,1);
insert into pasajero values (77777777, 7,0);
insert into pasajero values (88888888, 8,1);
insert into pasajero values (99999999, 9,1);
insert into pasajero values (10111213, 10,1);
-- Inserto marca
-- create table marca(
-- codigo int primary key,
-- nombre varchar(45) not null,
-- pais varchar(45) not null codigo	nombre	pais


insert into marca values(1,"Cessna", "Estados Unidos");
insert into marca values(2,"Beechcraft", "Estados Unidos");
insert into marca values(3,"Fokker", "Alemania");


-- inserto aviones
insert into avion values ( 1, "Citation", "LV-ABC", '10-12-12');
insert into avion values ( 2, "Baron", "LV-CDE", '11-1-10');
insert into avion values ( 3, "F-27", "LV-FGH", '8-4-5');
insert into avion values ( 1, "Citation", "LV-IJK", '14-7-6');
insert into avion values ( 2, "King Air", "LV-LMN", '12-8-7');


-- inserto aeropuertos
insert into aeropuerto_origen values('1',"Buenos Aires");
insert into aeropuerto_destino values('1',"Buenos Aires");
insert into aeropuerto_origen values('2',"Bariloche");
insert into aeropuerto_destino values('2',"Bariloche");
insert into aeropuerto_origen values('3',"Mar del plata");
insert into aeropuerto_destino values('3',"Mar del plata");


-- inserto vuelos

insert into vuelo values ("TT1234","LV-ABC",1,2,'2018-5-1', '8:00','2018-5-1','21:45',20123456788);
insert into vuelo values ("TT3456","LV-CDE",1,3,'2018-5-2','10:00','2018-5-2','12:00',27789123455);
insert into vuelo values ("TT1235","LV-ABC",2,1,'2018-5-2' ,'7:00','2018-5-2','10:50',20123456788);
insert into vuelo values ("TT1256","LV-FGH",1,3,'2018-5-2' ,'8:00','2018-5-2','10:05',27456789011);
insert into vuelo values ("TT5632","LV-IJK",3,1,'2018-5-3','7:00','2018-5-3','9:15',20567891233);
insert into vuelo values ("TT3333","LV-LMN",1,2,'2018-5-3','7:00','2018-5-3','10:50',20123456788);
insert into vuelo values ("TT1257","LV-FGH",1,3,'2018-5-4','8:00','2018-5-4','10:05',27456789011);
insert into vuelo values ("TT3457","LV-CDE",3,1,'2018-5-4','10:00','2018-5-4','12:00',27789123455);
insert into vuelo values ("TT5633","LV-IJK",1,3,'2018-5-5','7:00', '2018-5-5','9:15',20567891233);	

-- inserto pasajeros para cada vuelo


-- create table pasajero_toma_vuelo(
-- codigo int primary key,  LA CREO YO
-- codigo_pasajero int not null, LA BUSCO EN PASAJERO
-- codigo_vuelo varchar(45) not null, LA BUSCO EN VUELO


insert into pasajero_toma_vuelo values(1,4,'TT1234');
insert into pasajero_toma_vuelo values(2,5,'TT1234');
insert into pasajero_toma_vuelo values(3,6,'TT1234');


insert into pasajero_toma_vuelo values(4,7,'TT3456');
insert into pasajero_toma_vuelo values(5,8,'TT3456');
insert into pasajero_toma_vuelo values(6,9,'TT3456');

insert into pasajero_toma_vuelo values(7,4,'TT1235');	
insert into pasajero_toma_vuelo values(8,5,'TT1235');


insert into pasajero_toma_vuelo values(9,1,'TT1256');	
insert into pasajero_toma_vuelo values(10,2,'TT1256');	
insert into pasajero_toma_vuelo values(11,3,'TT1256');	


insert into pasajero_toma_vuelo values(12,8,'TT5632');	
insert into pasajero_toma_vuelo values(13,9,'TT5632');	
insert into pasajero_toma_vuelo values(14,10,'TT5632');	


insert into pasajero_toma_vuelo values(15,8,'TT3333');	
insert into pasajero_toma_vuelo values(16,9,'TT3333');	
insert into pasajero_toma_vuelo values(17,10,'TT3333');
	

insert into pasajero_toma_vuelo values(18,2,'TT1257');

insert into pasajero_toma_vuelo values(19,7,'TT3457');
insert into pasajero_toma_vuelo values(20,8,'TT3457');
insert into pasajero_toma_vuelo values(21,9,'TT3457');


insert into pasajero_toma_vuelo values(22,7,'TT5633');
insert into pasajero_toma_vuelo values(23,8,'TT5633');
insert into pasajero_toma_vuelo values(24,9,'TT5633');

	
select *from pasajero_toma_vuelo;
select*from vuelo; 

-- a. Listado de pasajeros de la empresa (apellido, nombre, dni).
select p.apellido, p.nombre, p.dni from pasajero pa
inner join persona p on p.dni=pa.dni_pasajero;

-- b. Listado de pasajeros de la empresa (apellido, nombre, dni, domicilio) .*
select p.apellido, p.nombre, p.dni, p.numero_calle, c.nombre, l.nombre, pro.nombre from pasajero pa
inner join persona p on p.dni=pa.dni_pasajero
inner join calle c on c.id= p.id_calle
inner join localidad l on l.id=p.id_localidad
inner join provincia pro on pro.id=p.id_provincia;

-- c. Listado de pasajeros de la empresa (apellido, nombre, dni, domicilio)
-- mostrando sólo a los que participan del programa de viajeros frecuentes,
-- ordenados por apellido y nombre.
select p.apellido, p.nombre, p.dni, p.numero_calle, c.nombre, l.nombre, pro.nombre from pasajero pa
inner join persona p on p.dni=pa.dni_pasajero
inner join calle c on c.id= p.id_calle
inner join localidad l on l.id=p.id_localidad
inner join provincia pro on pro.id=p.id_provincia
where pa.viajero_frecuente='1'
order by p.apellido ASC;

-- d. Listado de los aviones de la compañía, (marca, modelo, matrícula, fecha de
-- entrada en servicio, país de origen).
select m.nombre, av.modelo, av.matricula, av.fecha_entrada_servicio, m.pais from avion av
inner join marca m on m.codigo= av.codigo_marca;




-- e. Listado de los aviones de la compañía, (marca, modelo, matrícula, fecha de
-- entrada en servicio, país de origen) cuyo país de origen sea “Alemania
select m.nombre, av.modelo, av.matricula, av.fecha_entrada_servicio, m.pais from avion av
inner join marca m on m.codigo= av.codigo_marca
where m.pais="Alemania";
-- f. Listado de vuelos realizados mostrando código, marca, modelo y matrícula
-- del avión, Código IATA del Aeropuerto origen, Código IATA del Aeropuerto
-- destino, fecha hora partida, fecha hora llegada y CUIL piloto.
select v.codigo, m.nombre, av.modelo, av.matricula,  v.iata_origen, v.iata_llegada, v.fecha_partida, v.hora_llegada, v.cuil_piloto from vuelo  v
inner join avion av on av.matricula=v.matricula_avion
inner join marca m on m.codigo= av.codigo_marca;


-- g. Listado de vuelos realizados mostrando código, marca, modelo y matrícula
-- del avión, Código IATA del Aeropuerto origen, Código IATA del Aeropuerto
-- destino, fecha hora partida, fecha hora llegada y CUIL piloto que hayan
-- partido del aeropuerto “BUE” ordenados por fecha hora de partida.
select v.codigo, m.nombre, av.modelo, av.matricula,  v.iata_origen, v.iata_llegada, v.fecha_partida, v.hora_llegada, v.cuil_piloto from vuelo  v
inner join avion av on av.matricula=v.matricula_avion
inner join marca m on m.codigo= av.codigo_marca
inner join aeropuerto_origen ao on ao.iata_origen=v.iata_origen
where ao.nombre= "Buenos Aires";


-- h. Listado de vuelos realizados mostrando codigo, Código IATA del Aeropuerto
-- origen, Código IATA del Aeropuerto destino, fecha hora partida y fecha hora
-- llegada que hayan partido del aeropuerto “BUE” y hayan arribado al
-- aeropuerto “MDQ”.
select v.codigo, m.nombre, av.modelo, av.matricula,  v.iata_origen, v.iata_llegada, v.fecha_partida, v.hora_llegada, v.cuil_piloto from vuelo  v
inner join avion av on av.matricula=v.matricula_avion
inner join marca m on m.codigo= av.codigo_marca
inner join aeropuerto_origen ao on ao.iata_origen=v.iata_origen
inner join aeropuerto_destino ad on ad.iata_destino=v.iata_llegada
where ao.nombre= "Buenos Aires" and  ad.nombre="Mar del plata";
-- i. Listado de todos los vuelos realizados y sus pasajeros, (código, apellido,
-- nombre, dni)
select v.codigo, p.apellido, p.nombre, p.dni from vuelo v
inner join pasajero_toma_vuelo ptv on ptv.codigo_vuelo=v.codigo
inner join pasajero pa on pa.codigo=ptv.codigo_pasajero
inner join persona p on p.dni=pa.dni_pasajero
order by v.codigo;
-- j. Cantidad de vuelos realizados que hayan partido del aeropuerto “BUE” y
-- hayan arribado al aeropuerto “BRC”
select count(v.codigo)as totalVuelosRealizados from vuelo v
where v.iata_origen=1 and v.iata_llegada=3;
-- k. Cantidad de vuelos realizados que hayan partido del aeropuerto “MDQ”
select count(v.codigo)as totalVuelosRealizados from vuelo v
where v.iata_origen=3;
-- l. Cantidad de vuelos realizados, por aeropuerto de origen (Código IATA,
-- cantidad)
select v.iata_origen, count(v.codigo) from vuelo v
group by v.iata_origen;
-- m. Cantidad de pasajeros transportados, por localidad del pasajero (localidad,
-- cantidad)
select l.nombre, count(pa.dni_pasajero) from pasajero pa
inner join persona p on p.dni=pa.dni_pasajero
inner join localidad l on l.id=p.id_localidad
group by l.nombre; 

select l.nombre, count(ptv.codigo) from pasajero pa
inner join persona p on p.dni=pa.dni_pasajero
inner join localidad l on l.id=p.id_localidad
inner join pasajero_toma_vuelo ptv on ptv.codigo_pasajero=pa.codigo
group by l.nombre; 


-- n. Cantidad de pasajeros transportados, por dìa (fecha, cantidad)
select v.fecha_partida, count(ptv.codigo) from vuelo v
inner join pasajero_toma_vuelo ptv on ptv.codigo_vuelo=v.codigo
group by v.fecha_partida;
-- o. Cantidad de vuelos por pasajero (apellido, nombre, dni, cantidad)
select p.nombre, p.apellido, p.dni, count(v.codigo) from vuelo v
inner join pasajero_toma_vuelo ptv on ptv.codigo_vuelo=v.codigo
inner join pasajero pa on pa.codigo=ptv.codigo_pasajero
inner join persona p on p.dni=pa.dni_pasajero
group by p.dni;