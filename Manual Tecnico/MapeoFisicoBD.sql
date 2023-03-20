DROP DATABASE IF EXISTS tienda_productos;

CREATE DATABASE tienda_productos;
USE tienda_productos;

CREATE TABLE carga_archivos(
numero INT NOT NULL,
cargado BOOLEAN,
PRIMARY KEY (numero)		
);
CREATE TABLE usuarios(
codigo_usuario INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30) NOT NULL,
nombre_usuario VARCHAR(50) NOT NULL,
correo VARCHAR(30),
contrasenia VARCHAR(100) NOT NULL,
area INT NOT NULL,
activo BOOLEAN NOT NULL,
PRIMARY KEY(codigo_usuario)
);

CREATE TABLE tienda(
codigo_tienda INT AUTO_INCREMENT NOT NULL,
direccion VARCHAR(30) NOT NULL,
tipo VARCHAR(15) NOT NULL,
PRIMARY KEY (codigo_tienda)
);

CREATE TABLE usuario_tienda(
codigo_usuario INT NOT NULL,
codigo_tienda INT NOT NULL,
PRIMARY KEY (codigo_usuario),
CONSTRAINT usuario_codigo_fk
FOREIGN KEY (codigo_usuario)
REFERENCES usuarios(codigo_usuario)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT tienda_codigo_fk
FOREIGN KEY (codigo_tienda)
REFERENCES tienda(codigo_tienda)
ON DELETE CASCADE 
ON UPDATE CASCADE
);

CREATE TABLE tiendas_usuario_bodega(
codigo_usuario INT NOT NULL,
codigo_tienda INT NOT NULL,
PRIMARY KEY(codigo_tienda),
CONSTRAINT usuario_codigo_bodega_fk
FOREIGN KEY (codigo_usuario)
REFERENCES usuarios(codigo_usuario)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT tienda_codigo_bodega_fk
FOREIGN KEY (codigo_tienda)
REFERENCES tienda(codigo_tienda)
ON DELETE CASCADE 
ON UPDATE CASCADE
);

CREATE TABLE producto_bodega(
codigo_producto INT NOT NULL AUTO_INCREMENT,
nombre_producto VARCHAR(30) NOT NULL,
costo DOUBLE NOT NULL,
existencias INT NOT NULL,
precio DOUBLE NOT NULL,
PRIMARY KEY(codigo_producto)
);

CREATE TABLE producto_daniado(
codigo_producto INT NOT NULL,
existencias INT NOT NULL,
PRIMARY KEY (codigo_producto),
CONSTRAINT producto_daniado_bodega_fk
FOREIGN KEY (codigo_producto)
REFERENCES producto_bodega(codigo_producto)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE productos_tienda(
codigo_tienda INT NOT NULL,
codigo_producto INT NOT NULL,
existencias INT NOT NULL,
PRIMARY KEY (codigo_tienda,codigo_producto),
CONSTRAINT tienda_codigo_productos_tienda_fk
FOREIGN KEY(codigo_tienda)
REFERENCES tienda(codigo_tienda)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT producto_codigo_fk
FOREIGN KEY(codigo_producto)
REFERENCES producto_bodega(codigo_producto)
ON DELETE CASCADE 
ON UPDATE CASCADE
);

CREATE TABLE pedidos(
id_pedido INT AUTO_INCREMENT NOT NULL,
codigo_usuario INT NOT NULL,
codigo_tienda INT NOT NULL,
fecha DATE NOT NULL,
estado VARCHAR(20) NOT NULL,
costo_total_pedido DOUBLE NOT NULL,
mensaje VARCHAR(50),
PRIMARY KEY (id_pedido),
CONSTRAINT tienda_codigo_pedidos_fk
FOREIGN KEY(codigo_tienda)
REFERENCES tienda(codigo_tienda)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT usuario_codigo_pedidos_fk
FOREIGN KEY(codigo_usuario)
REFERENCES usuarios(codigo_usuario)
ON DELETE CASCADE 
ON UPDATE CASCADE
);

CREATE TABLE listado_productos_pedidos(
id_pedido INT NOT NULL,
id_producto INT NOT NULL,
costo_unitario DOUBLE NOT NULL,
cantidad INT NOT NULL,
costo_subtotal DOUBLE,
PRIMARY KEY(id_pedido,id_producto),
CONSTRAINT pedido_id_fk
FOREIGN KEY(id_pedido)
REFERENCES pedidos(id_pedido)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT producto_id_listado_productos_fk
FOREIGN KEY(id_producto)
REFERENCES productos_tienda(codigo_producto)
ON DELETE CASCADE 
ON UPDATE CASCADE
);
CREATE TABLE envios(
id_envio INT AUTO_INCREMENT NOT NULL,
codigo_usuario INT NOT NULL,
codigo_tienda INT NOT NULL,
fecha_salida DATE,
fecha_recibida DATE,
costo_total_envio DOUBLE NOT NULL,
estado VARCHAR(20) NOT NULL,
id_pedido INT NOT NULL,
PRIMARY KEY(id_envio),
CONSTRAINT codigo_usuario_id_envio_fk
FOREIGN KEY (codigo_usuario)
REFERENCES usuarios(codigo_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT codigo_tienda_envios_fk
FOREIGN KEY(codigo_tienda)
REFERENCES tienda(codigo_tienda)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT pedidoId_fk
FOREIGN KEY(id_pedido)
REFERENCES pedidos(id_pedido)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE listado_productos_envio(
id_envio INT NOT NULL,
id_producto INT NOT NULL,
costo_unitario DOUBLE NOT NULL,
cantidad INT NOT NULL,
costo_subtotal DOUBLE NOT NULL,
PRIMARY KEY(id_envio,id_producto),
CONSTRAINT envio_productos_listado_fk
FOREIGN KEY (id_envio)
REFERENCES envios(id_envio)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT producto_listado_de_envio_fk
FOREIGN KEY (id_producto)
REFERENCES producto_bodega(codigo_producto)
ON DELETE CASCADE 
ON UPDATE CASCADE 
);
CREATE TABLE incidencias(
id_incidencia INT AUTO_INCREMENT NOT NULL,
id_usuario INT NOT NULL,
id_tienda INT NOT NULL,
fecha DATE NOT NULL,
estado VARCHAR(20) NOT NULL,
solucion VARCHAR(500),
id_envio INT NOT NULL,
PRIMARY KEY (id_incidencia),
CONSTRAINT id_usuario_incidencia_fk
FOREIGN KEY (id_usuario)
REFERENCES usuario_tienda(codigo_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT id_tienda_incidencia_fk
FOREIGN KEY (id_tienda)
REFERENCES usuario_tienda(codigo_tienda)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT id_envio_incidencia_fk
FOREIGN KEY (id_envio)
REFERENCES envios(id_envio)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE incidencia_productos(
id_incidencia INT NOT NULL,
id_producto INT NOT NULL,
cantidad_afectada INT NOT NULL,
motivo_incidencia VARCHAR(30) NOT NULL,
PRIMARY KEY(id_incidencia,id_producto),
CONSTRAINT id_producto_listado_incidencia_fk
FOREIGN KEY (id_producto)
REFERENCES productos_tienda(codigo_producto)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE devoluciones(
id_devolucion INT AUTO_INCREMENT NOT NULL,
codigo_usuario INT NOT NULL,
codigo_tienda INT NOT NULL,
fecha_devolucion DATE NOT NULL,
estado VARCHAR(20) NOT NULL,
total DOUBLE,
id_envio INT NOT NULL,
PRIMARY KEY (id_devolucion),
CONSTRAINT codigo_usuario_devolucion_fk
FOREIGN KEY (codigo_usuario)
REFERENCES usuario_tienda(codigo_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT codigo_tienda_devolucion_fk
FOREIGN KEY (codigo_tienda) 
REFERENCES usuario_tienda(codigo_tienda)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT id_envio_devolucion_fk
FOREIGN KEY (id_envio)
REFERENCES envios(id_envio)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE productos_devolucion(
id_devolucion INT NOT NULL,
codigo_producto INT NOT NULL,
costo_unitario DOUBLE NOT NULL,
cantidad_afectada INT NOT NULL,
costo_subtotal DOUBLE,
motivo_devolucion VARCHAR(30) NOT NULL,
PRIMARY KEY (id_devolucion,codigo_producto),
CONSTRAINT codigo_producto_devolucion_fk
FOREIGN KEY (codigo_producto)
REFERENCES productos_tienda(codigo_producto)
ON DELETE CASCADE
ON UPDATE CASCADE
);

/*usuario por defecto del sistema contraseña: 1000, admin*/ 
insert into usuarios values(1000, 'admin1', 'admin', 'correodefault','21232f297a57a5a743894a0e4a801fc3',1,1);
insert into carga_archivos values(1,0);
/*SELECT * FROM  carga_archivos WHERE numero =1;*/

/*update carga_archivos set cargado =1 where numero =1;*/
/*select * from usuarios where codigo_usuario=1001 and contrasenia='81dc9bdb52d04dc20036dbd8313ed055' and area=3;*/
/*update usuarios set nombre='Eiler', nombre_usuario='admin', correo='correo.com', area=1, activo=1 where codigo_usuario=1;*/
/*insert into envios (codigo_usuario, codigo_tienda,fecha_salida,fecha_recibida,costo_total_envio,estado) values(8,1,'2023-02-02','2023-02-28',2556.23,'RECIBIDO');*/
