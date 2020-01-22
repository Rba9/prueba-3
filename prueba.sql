 psql
psql (10.10 (Ubuntu 10.10-0ubuntu0.18.04.1))
Type "help" for help.

ususario=# \c prueba
You are now connected to database "prueba" as user "ususario".
prueba=# CREATE TABLE facturas(
prueba(# id INT, factura DATE,subtotal INT,precio_total INT,
prueba(# PRIMARY KEY(id)
prueba(# );
CREATE TABLE

                    ^
prueba=# CREATE TABLE clientes(
id INT,id_factura INT,nombre VARCHAR(100), apellido VARCHAR(120),rut VARCHAR(12),direccion VARCHAR(200)
);
CREATE TABLE
                                                                   ^
prueba=# ALTER TABLE clientes ADD FOREIGN KEY (id_factura) REFERENCES facturas(id);
ALTER TABLE

prueba=# CREATE TABLE ordem_de_compra(
prueba(# productos VARCHAR(120),precio_unitario INT,cuantidad INT,valor_total_producto INT
prueba(# );
CREATE TABLE
                                                             ^
prueba=# ALTER TABLE ordem_de_compra ADD COLUMN id_factura INT;
ALTER TABLE

prueba=# ALTER TABLE ordem_de_compra ADD FOREIGN KEY (id_factura) REFERENCES facturas(id);
ALTER TABLE

prueba=# CREATE TABLE productos(
prueba(# id INT,nombre VARCHAR(100),descripcion VARCHAR(120),valor_unitario INT
prueba(# ,PRIMARY KEY(id)
prueba(# );
CREATE TABLE

prueba=# ALTER TABLE ordem_de_compra ADD COLUMN id_productos INT;
ALTER TABLE

prueba=# CREATE TABLE categoria(
prueba(# id INT,id_productos INT,nombre VARCHAR(120),descripcion VARCHAR(120)
prueba(# );
CREATE TABLE

prueba=# ALTER TABLE categoria ADD FOREIGN KEY (id_productos) REFERENCES productos(id);
ALTER TABLE

prueba=# SELECT * FROM facturas;
 id | factura | subtotal | precio_total 
----+---------+----------+--------------
(0 rows)

prueba=# ALTER TABLE facturas DROP COLUMN subtotal;
ALTER TABLE

prueba=# ALTER TABLE facturas ADD COLUMN subtotal INT;
ALTER TABLE
prueba=# SELECT * FROM facturas;
 id | factura | precio_total | subtotal 
----+---------+--------------+----------
(0 rows)

prueba=# ALTER TABLE facturas ALTER COLUMN factura SET DATA TYPE DATE;
ALTER TABLE

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1101,'22/01/2020',60,71);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1102,'22/01/2020',36,42);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1103,'22/01/2020',87,103);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1104,'22/01/2020',450,892);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1105,'22/01/2020',17000,2023);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1106,'22/01/2020',15,17);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1107,'22/01/2020',1350000,1606500);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1108,'22/01/2020',1399000,1664000);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1109,'22/01/2020',49,58);
INSERT 0 1

prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1110,'22/01/2020',10,11);
INSERT 0 1

                    ^
prueba=# INSERT INTO clientes
(id,id_factura,nombre,apellido,rut,direccion)
VALUES (1,1101,'Camila','Vargas','240001000200','Providencia,33');
INSERT 0 1

prueba=# INSERT INTO clientes
(id,id_factura,nombre,apellido,rut,direccion)
VALUES (2,1102,'Bianca','Souza','230002000301','Rancua,201');
INSERT 0 1

prueba=# INSERT INTO clientes
(id,id_factura,nombre,apellido,rut,direccion)
VALUES (3,1103,'Jose','Oliveira','220003000402','Paris_y_Londres,230');
INSERT 0 1

prueba=# INSERT INTO clientes
(id,id_factura,nombre,apellido,rut,direccion)
VALUES (4,1104,'Pedro','Alvez','210004000503','Balmaceda,301');
INSERT 0 1

prueba=# INSERT INTO clientes
(id,id_factura,nombre,apellido,rut,direccion)
VALUES (5,1105,'Adriano','Perez','200005000604','Los_Heroes,405');
INSERT 0 1
 


ususario=# \c  prueba;
You are now connected to database "prueba" as user "ususario".

prueba=# INSERT INTO ordem_de_compra
prueba-# (productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
prueba-# VALUES ('Jeans',2999,4,119,1101,2001);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Refrigerador',350,1,350,1102,2002);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Tv',400,2,800,1103,2003);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Video_Game',950,1,950,1104,2004);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Camisas',12500,6,7500,1105,2005);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Cesta_Basica',49000,2,98000,1106,2006);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Detergente',3400,2,6800,1107,2007);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Shampoo',5700,3,17000,1108,2008);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Crema',4600,2,9200,1109,2009);
INSERT 0 1

prueba=# INSERT INTO ordem_de_compra
(productos,precio_unitario,cuantidad,valor_total_producto,id_factura,id_productos)
VALUES ('Carne',15000,3,45000,1110,2010);
INSERT 0 1

prueba=# INSERT INTO productos
prueba-# (id,nombre,descripcion,valor_unitario)
prueba-# VALUES (2001,'Pantalon','Skiny',2999);
INSERT 0 1

prueba=# INSERT INTO productos
(id,nombre,descripcion,valor_unitario)
VALUES (2002,'Refrigerador','Frosfri',350000);
INSERT 0 1

prueba=# INSERT INTO productos
(id,nombre,descripcion,valor_unitario)
VALUES (2003,'Video_Game','Playstation',950000);
INSERT 0 1

prueba=# INSERT INTO productos
(id,nombre,descripcion,valor_unitario)
VALUES (2004,'Tv','Led',400000);
INSERT 0 1

prueba=# INSERT INTO productos
(id,nombre,descripcion,valor_unitario)
VALUES (2005,'Cesta_Basica','Variedades_pereciveis',49000);
INSERT 0 1

prueba=# INSERT INTO productos
(id,nombre,descripcion,valor_unitario)
VALUES (2006,'Camisas','The_Short',12500);
INSERT 0 1

prueba=# INSERT INTO productos
(id,nombre,descripcion,valor_unitario)
VALUES (2007,'Carne','Bovina',1500);
INSERT 0 1

prueba=# INSERT INTO productos
(id,nombre,descripcion,valor_unitario)
VALUES (2008,'Shampoo','Higiene_capilar',5700);
INSERT 0 1

prueba=# INSERT INTO categoria 
(id,id_productos,nombre,descripcion)
VALUES (3001,2001,'Roupas','Skiny');
INSERT 0 1

prueba=# INSERT INTO categoria
(id,id_productos,nombre,descripcion)
VALUES (3002,2002,'Eletro','Frosfri');
INSERT 0 1

prueba=# INSERT INTO categoria
(id,id_productos,nombre,descripcion)
VALUES (3003,2003,'Alimento','Frosfri');
INSERT 0 1


    --lista de facturas de compras em ordem desc--                                   ^
prueba=# SELECT * FROM facturas ORDER BY precio_total DESC;
  id  |  factura   | precio_total | subtotal 
------+------------+--------------+----------
 1108 | 2020-01-22 |      1664000 |  1399000
 1107 | 2020-01-22 |      1606500 |  1350000
 1105 | 2020-01-22 |         2023 |    17000
 1104 | 2020-01-22 |          892 |      450
 1103 | 2020-01-22 |          103 |       87
 1101 | 2020-01-22 |           71 |       60
 1109 | 2020-01-22 |           58 |       49
 1102 | 2020-01-22 |           42 |       36
 1106 | 2020-01-22 |           17 |       15
 1110 | 2020-01-22 |           11 |       10
(10 rows)

--Dentre os clientes Adriano fez a compra  mas cara  confuerme a lista de factura id 1105 2.023.000--
prueba=# SELECT * FROM clientes ORDER BY id_factura DESC;
 id | id_factura | nombre  | apellido |     rut      |      direccion      
----+------------+---------+----------+--------------+---------------------
  5 |       1105 | Adriano | Perez    | 200005000604 | Los_Heroes,405
  4 |       1104 | Pedro   | Alvez    | 210004000503 | Balmaceda,301
  3 |       1103 | Jose    | Oliveira | 220003000402 | Paris_y_Londres,230
  2 |       1102 | Bianca  | Souza    | 230002000301 | Rancua,201
  1 |       1101 | Camila  | Vargas   | 240001000200 | Providencia,33
(5 rows)

--Lista de productos, id 2006 corresponde ao producto 06 Camisas
prueba=# SELECT * FROM productos;
  id  |    nombre    |      descripcion      | valor_unitario 
------+--------------+-----------------------+----------------
 2001 | Pantalon     | Skiny                 |           2999
 2002 | Refrigerador | Frosfri               |         350000
 2003 | Video_Game   | Playstation           |         950000
 2004 | Tv           | Led                   |         400000
 2005 | Cesta_Basica | Variedades_pereciveis |          49000
 2006 | Camisas      | The_Short             |          12500
 2007 | Carne        | Bovina                |           1500
 2008 | Shampoo      | Higiene_capilar       |           5700
(8 rows)
