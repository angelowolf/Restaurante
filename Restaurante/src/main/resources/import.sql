INSERT INTO EstadoPedido (id,nombre) VALUES (1,'cancelada');
INSERT INTO EstadoPedido (id,nombre) VALUES (2,'entregada');
INSERT INTO EstadoPedido (id,nombre) VALUES (3,'iniciada');
INSERT INTO EstadoPedido (id,nombre) VALUES (4,'preparando');
INSERT INTO EstadoPedido (id,nombre) VALUES (5,'retirada');
INSERT INTO EstadoPedido (id,nombre) VALUES (6,'terminada');

insert into usuario(nombre,apellido,nick,clave,activo) values('Juan','Lopez','admin','21232f297a57a5a743894a0e4a801fc3',1);
insert into rol_usuario(id,roles) values(1,'Administrador');
insert into usuario(nombre,apellido,nick,clave,activo) values('Mozero','De La Olla','mozo','126f8d4532191178216b1be0d199af87',1);
insert into rol_usuario(id,roles) values(2,'Mozo');
insert into rol_usuario(id,roles) values(2,'Administrador');
insert into usuario(nombre,apellido,nick,clave,activo) values('Barrero','De La Barra','barra','97c1fad8d8d23747d6184693dffab860',1);
insert into rol_usuario(id,roles) values(3,'Barra');