INSERT INTO EstadoPedido (id,nombre) VALUES (1,'cancelada');
INSERT INTO EstadoPedido (id,nombre) VALUES (2,'entregada');
INSERT INTO EstadoPedido (id,nombre) VALUES (3,'iniciada');
INSERT INTO EstadoPedido (id,nombre) VALUES (4,'preparando');
INSERT INTO EstadoPedido (id,nombre) VALUES (5,'retirada');
INSERT INTO EstadoPedido (id,nombre) VALUES (6,'terminada');

INSERT INTO CategoriaInsumo(nombre) VALUES ('Elaborado');
INSERT INTO CategoriaInsumo(nombre) VALUES ('Almacen');
INSERT INTO CategoriaInsumo(nombre) VALUES ('Carniceria');
INSERT INTO CategoriaInsumo(nombre) VALUES ('Verduleria');


insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Tomate','Kilogramos','2016-01-1',1,4);
insert into InsumoBruto(id,precioUnidad) values(1,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Acelga','Kilogramos','2016-01-1',2,4);
insert into InsumoBruto(id,precioUnidad) values(2,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Cebolla','Kilogramos','2016-01-1',3,4);
insert into InsumoBruto(id,precioUnidad) values(3,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Banana','Kilogramos','2016-01-1',4,4);
insert into InsumoBruto(id,precioUnidad) values(4,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Berenjena','Kilogramos','2016-01-1',5,4);
insert into InsumoBruto(id,precioUnidad) values(5,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Lechuga','Kilogramos','2016-01-1',6,4);
insert into InsumoBruto(id,precioUnidad) values(6,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Huevo','Kilogramos','2016-01-1',7,4);
insert into InsumoBruto(id,precioUnidad) values(7,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Manzana','Kilogramos','2016-01-1',8,4);
insert into InsumoBruto(id,precioUnidad) values(8,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Sandia','Kilogramos','2016-01-1',9,4);
insert into InsumoBruto(id,precioUnidad) values(9,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Melon','Kilogramos','2016-01-1',10,4);
insert into InsumoBruto(id,precioUnidad) values(10,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Champiñon','Kilogramos','2016-01-1',11,4);
insert into InsumoBruto(id,precioUnidad) values(11,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Coco','Kilogramos','2016-01-1',12,4);
insert into InsumoBruto(id,precioUnidad) values(12,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Naranja','Kilogramos','2016-01-1',13,4);
insert into InsumoBruto(id,precioUnidad) values(13,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Mandarina','Kilogramos','2016-01-1',14,4);
insert into InsumoBruto(id,precioUnidad) values(14,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Espinaca','Kilogramos','2016-01-1',15,4);
insert into InsumoBruto(id,precioUnidad) values(15,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Remolacha','Kilogramos','2016-01-1',16,4);
insert into InsumoBruto(id,precioUnidad) values(16,38);

insert into Stock(cantidadActual,cantidadMinima) values(10,50);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Zanahoria','Kilogramos','2016-01-1',17,4);
insert into InsumoBruto(id,precioUnidad) values(17,38);

insert into Stock(cantidadActual,cantidadMinima) values(2,10);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Papa','Kilogramos','2016-01-1',18,4);
insert into InsumoBruto(id,precioUnidad) values(18,5);

insert into Stock(cantidadActual,cantidadMinima) values(30,150);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Coca Cola','Unidad','2016-01-1',19,2);
insert into InsumoBruto(id,precioUnidad) values(19,15);

insert into Stock(cantidadActual,cantidadMinima) values(30,150);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Pan Rallado','Kilogramos','2016-01-1',20,2);
insert into InsumoBruto(id,precioUnidad) values(20,15);

insert into Stock(cantidadActual,cantidadMinima) values(30,150);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Bife','Kilogramos','2016-01-1',21,4);
insert into InsumoBruto(id,precioUnidad) values(21,15);



insert into Stock(cantidadActual,cantidadMinima) values(30,150);
insert into Insumo(nombre,unidadMedida,fechaAlta,id_stock,id_categoria) values('Milanesa','Unidad','2016-01-02',22,1);
insert into InsumoElaborado(id) values(22);
insert into DetalleInsumoElaborado(cantidad,id_insumoBruto,id_insumoElaborado) values(1,4,22);
insert into DetalleInsumoElaborado(cantidad,id_insumoBruto,id_insumoElaborado) values(0.05,20,22);
insert into DetalleInsumoElaborado(cantidad,id_insumoBruto,id_insumoElaborado) values(0.1,21,22);

insert into Usuario(nombre,apellido,nick,clave,fechaBaja,telefono,direccion,documento,fechaalta,preguntaSecreta,respuestaSecreta) values('Juan','Lopez','admin','21232f297a57a5a743894a0e4a801fc3',null,3548451345,'calle sin numero',324231423,'2016-01-01','¿cual era la marca de tu primer auto?','fiat');
insert into Rol_Usuario(id,roles) values(1,'Usuario');
insert into Rol_Usuario(id,roles) values(1,'Mozo');
insert into Rol_Usuario(id,roles) values(1,'Cocina');
insert into Rol_Usuario(id,roles) values(1,'Caja');
insert into Rol_Usuario(id,roles) values(1,'Mesa');
insert into Rol_Usuario(id,roles) values(1,'Stock');
insert into Usuario(nombre,apellido,nick,clave,fechaBaja,telefono,direccion,documento,fechaalta) values('Mozero','De La Olla','mozo','126f8d4532191178216b1be0d199af87',null,3124325,'calle sin numero',85673245,'2016-01-02');
insert into Rol_Usuario(id,roles) values(2,'Cocina');
insert into Rol_Usuario(id,roles) values(2,'Stock');
insert into Usuario(nombre,apellido,nick,clave,fechaBaja,telefono,direccion,documento,fechaalta) values('Barrero','De La Barra','barra','97c1fad8d8d23747d6184693dffab860',null,1235435612,'calle sin numero',5642523,'2016-01-03');
insert into Rol_Usuario(id,roles) values(3,'Mozo');