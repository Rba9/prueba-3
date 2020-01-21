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
prueba=# CREATE TABLE clientes(id INT,id factura INT,nombre VARCHAR(100),apellido VARCHAR(120),rut VARCHAR(12),direccion VARCHAR(200));
ERROR:  syntax error at or near "INT"
LINE 1: CREATE TABLE clientes(id INT,id factura INT,nombre VARCHAR(1...
                                                ^
prueba=# CREATE TABLE(
prueba(# id INT,id_factura INT,nombre VARCHAR(100), apellido VARCHAR(120),rut VARCHAR(12),direccion VARCHAR(200)
prueba(# 
prueba(# );
ERROR:  syntax error at or near "("
LINE 1: CREATE TABLE(
                    ^
prueba=# CREATE TABLE clientes(
id INT,id_factura INT,nombre VARCHAR(100), apellido VARCHAR(120),rut VARCHAR(12),direccion VARCHAR(200)
);
CREATE TABLE
prueba=# ALTER TABLE clientes ALTER COLUMN clientes SET DATA TYPE FOREIGN KEY (id) REFERENCES facturas(id););
ERROR:  syntax error at or near "FOREIGN"
LINE 1: ...ABLE clientes ALTER COLUMN clientes SET DATA TYPE FOREIGN KE...
                                                             ^
ERROR:  syntax error at or near ")"
LINE 1: );
        ^
prueba=# ALTER TABLE clientes ALTER COLUMN clientes SET DATA TYPE FOREIGN KEY (id) REFERENCES facturas(id));
ERROR:  syntax error at or near "FOREIGN"
LINE 1: ...ABLE clientes ALTER COLUMN clientes SET DATA TYPE FOREIGN KE...
                                                             ^
prueba=# ALTER TABLE clientes ADD FOREIGN KEY (id_factura) REFERENCES facturas(id));
ERROR:  syntax error at or near ")"
LINE 1: ...entes ADD FOREIGN KEY (id_factura) REFERENCES facturas(id));
                                                                     ^
prueba=# ALTER TABLE clientes ADD FOREIGN KEY (id_factura) REFERENCES facturas(id);
ALTER TABLE
prueba=# CREATE TABLE ordem_de_compra(
prueba(# productos VARCHAR(120),precio_unitario INT,cuantidad INT,valor_total_producto INT
prueba(# );
CREATE TABLE
prueba=# ALTER TABLE ordem_de_compra ADD FOREIGN KEY (id_factura) REFERENCES facturas(id);
ERROR:  column "id_factura" referenced in foreign key constraint does not exist
prueba=# ALTER TABLE ordem_de_compra ADD COLUMN(id_factura) SET DATA TYPE INT;
ERROR:  syntax error at or near "("
LINE 1: ALTER TABLE ordem_de_compra ADD COLUMN(id_factura) SET DATA ...
                                              ^
prueba=# ALTER TABLE ordem_de_compra ADD COLUMN id_factura SET DATA TYPE INT;
ERROR:  syntax error at or near "DATA"
LINE 1: ...R TABLE ordem_de_compra ADD COLUMN id_factura SET DATA TYPE ...
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

prueba=# DROP TABLE facturas;
ERROR:  cannot drop table facturas because other objects depend on it
DETAIL:  constraint clientes_id_factura_fkey on table clientes depends on table facturas
constraint ordem_de_compra_id_factura_fkey on table ordem_de_compra depends on table facturas
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
prueba=# ALTER TABLE facturas DROP TABLE facturas;
ERROR:  syntax error at or near "TABLE"
LINE 1: ALTER TABLE facturas DROP TABLE facturas;
                                  ^
prueba=# INSERT INTO facturas
prueba-# ALTER TABLE facturas FOREIGN KEY(factura DATE) REFERENCES facturas;
ERROR:  syntax error at or near "ALTER"
LINE 2: ALTER TABLE facturas FOREIGN KEY(factura DATE) REFERENCES fa...
        ^
prueba=# INSERT INTO facturas
ALTER TABLE facturas ALTER (factura DATE) REFERENCES facturas;
ERROR:  syntax error at or near "ALTER"
LINE 2: ALTER TABLE facturas ALTER (factura DATE) REFERENCES factura...
        ^
prueba=# INSERT INTO facturas
ALTER TABLE facturas ADD (factura DATE) REFERENCES facturas;
ERROR:  syntax error at or near "ALTER"
LINE 2: ALTER TABLE facturas ADD (factura DATE) REFERENCES facturas;
        ^
prueba=#                     
ALTER TABLE facturas ALTER (factura DATE) REFERENCES facturas;
ERROR:  syntax error at or near "("
LINE 1: ALTER TABLE facturas ALTER (factura DATE) REFERENCES factura...
                                   ^
prueba=# 
ALTER TABLE facturas ALTER factura DATE REFERENCES facturas;
ERROR:  syntax error at or near "DATE"
LINE 1: ALTER TABLE facturas ALTER factura DATE REFERENCES facturas;
                                           ^
prueba=# 
ALTER TABLE facturas DROP COLUMN facturas;
ERROR:  column "facturas" of relation "facturas" does not exist
prueba=# ALTER TABLE facturas ALTER COLUMN facturas SET DATA TYPA DATE;
ERROR:  syntax error at or near "TYPA"
LINE 1: ...TER TABLE facturas ALTER COLUMN facturas SET DATA TYPA DATE;
                                                             ^
prueba=# ALTER TABLE facturas ALTER COLUMN facturas SET DATA TYPE DATE;
ERROR:  column "facturas" of relation "facturas" does not exist
prueba=# ALTER TABLE facturas ALTER COLUMN factura SET DATA TYPE DATE;
ALTER TABLE
prueba=# INSERT INT facturas
prueba-# (id,factura,subtotal,precio_total)
prueba-# VALUES ('Camila','22/01/2020',60,71);
ERROR:  syntax error at or near "INT"
LINE 1: INSERT INT facturas
               ^
prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES ('Camila','22/01/2020',60,71);
ERROR:  invalid input syntax for integer: "Camila"
LINE 3: VALUES ('Camila','22/01/2020',60,71);
                ^
prueba=# INSERT INTO facturas
(id,factura,subtotal,precio_total)
VALUES (1,'Camila','22/01/2020',60,71);
ERROR:  INSERT has more expressions than target columns
LINE 3: VALUES (1,'Camila','22/01/2020',60,71);
                                           ^
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
prueba=# INSERT INTO cliente
prueba-# (id,id_factura,nombre,apellido,rut,direccion)
prueba-# VALUES (1,1101,'Camila','Vargas','240001000200','Providencia,33');
ERROR:  relation "cliente" does not exist
LINE 1: INSERT INTO cliente
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
prueba=# INSERT INTO ordem_de_compra
