INSERT INTO EstadoPedido (id,nombre) VALUES (1,'cancelada');
INSERT INTO EstadoPedido (id,nombre) VALUES (2,'entregada');
INSERT INTO EstadoPedido (id,nombre) VALUES (3,'iniciada');
INSERT INTO EstadoPedido (id,nombre) VALUES (4,'preparando');
INSERT INTO EstadoPedido (id,nombre) VALUES (5,'retirada');
INSERT INTO EstadoPedido (id,nombre) VALUES (6,'terminada');

INSERT INTO CategoriaInsumo(nombre) VALUES ('Almacen');
INSERT INTO CategoriaInsumo(nombre) VALUES ('Carniceria');
INSERT INTO CategoriaInsumo(nombre) VALUES ('Verduleria');


insert into stock(cantidadActual,cantidadMinima) values(10,5);
insert into insumo(nombre,precioUnidad,unidadMedida,fechaAlta,id_stock,id_categoria) values('Tomate',38,'Kilogramos','2016-01-1',1,3);
insert into stock(cantidadActual,cantidadMinima) values(2,1);
insert into insumo(nombre,precioUnidad,unidadMedida,fechaAlta,id_stock,id_categoria) values('Papa',5,'Kilogramos','2016-01-1',2,3);
insert into stock(cantidadActual,cantidadMinima) values(30,15);
insert into insumo(nombre,precioUnidad,unidadMedida,fechaAlta,id_stock,id_categoria) values('Coca Cola',15,'Unidad','2016-01-1',3,1);


insert into usuario(nombre,apellido,nick,clave,fechaBaja,telefono,direccion,documento,fechaalta,preguntaSecreta,respuestaSecreta) values('Juan','Lopez','admin','21232f297a57a5a743894a0e4a801fc3',null,3548451345,'calle sin numero',324231423,'2016-01-01','¿Cuál era la marca de tu primer auto?','fiat');
insert into rol_usuario(id,roles) values(1,'Usuario');
insert into rol_usuario(id,roles) values(1,'Mozo');
insert into rol_usuario(id,roles) values(1,'Cocina');
insert into rol_usuario(id,roles) values(1,'Caja');
insert into rol_usuario(id,roles) values(1,'Mesa');
insert into rol_usuario(id,roles) values(1,'Stock');
insert into usuario(nombre,apellido,nick,clave,fechaBaja,telefono,direccion,documento,fechaalta) values('Mozero','De La Olla','mozo','126f8d4532191178216b1be0d199af87',null,3124325,'calle sin numero',85673245,'2016-01-02');
insert into rol_usuario(id,roles) values(2,'Cocina');
insert into rol_usuario(id,roles) values(2,'Stock');
insert into usuario(nombre,apellido,nick,clave,fechaBaja,telefono,direccion,documento,fechaalta) values('Barrero','De La Barra','barra','97c1fad8d8d23747d6184693dffab860',null,1235435612,'calle sin numero',5642523,'2016-01-03');
insert into rol_usuario(id,roles) values(3,'Mozo');