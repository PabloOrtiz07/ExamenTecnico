USE [GD2023Dicsys]
GO
---------------------------------------
IF OBJECT_ID('Producto','U')IS NOT NULL
DROP TABLE Producto
IF OBJECT_ID('Orden_De_Compra','U')IS NOT NULL
DROP TABLE Orden_De_Compra
IF OBJECT_ID('Proveedores','U')IS NOT NULL
DROP TABLE Proveedores
IF OBJECT_ID('Item_de_la_orden_de_compra','U')IS NOT NULL
DROP TABLE Item_de_la_orden_de_compra
IF OBJECT_ID('ProductoMasVendidoNoviembre','U')IS NOT NULL
DROP TABLE ProductoMasVendidoNoviembre
IF OBJECT_ID('ProductoModificado','U')IS NOT NULL
DROP TABLE ProductoModificado
---------------------------------------------------------

/*CARGA DE TABLAS PARA PODER EMPEZAR A CARGAR LOS DATOS Y REALIZAR PRUEBAS*/
create table Proveedores (
	cod_proveedor int identity (1,1)  not null,
	nombre nvarchar(50),
	direccion nvarchar(50),
	ciudad nvarchar(50),
	telefono nvarchar (20)
	PRIMARY KEY (cod_proveedor) 
)
create table Orden_De_Compra(
	cod_orden int  identity (1,1)   not null,
	fecha_emision_orden date,
	fecha_entrega date,
	cod_proveedor int,
	PRIMARY KEY (cod_orden),
	CONSTRAINT FK_ProveedoresOrdenDeCompra FOREIGN KEY (cod_proveedor) REFERENCES Proveedores (cod_proveedor)
)

create table Producto(
	cod_producto int  identity (1,1)  not null,
	desc_producto nvarchar(50),
	precio_costo decimal (12,2),
	precio_venta decimal (12,2),
	precio_mercado decimal (12,2),
	PRIMARY KEY (cod_producto),
)

create table Item_de_la_orden_de_compra(
	cod_orden int,
	cantidad int,
	cod_producto int,
	precio_real decimal (12,2),
	CONSTRAINT FK_ItemProducto FOREIGN  KEY (cod_producto) REFERENCES Producto (cod_producto),
	CONSTRAINT FK_ItemOrden FOREIGN  KEY (cod_orden) REFERENCES Orden_De_Compra (cod_orden)
)


create table ProductoMasVendidoNoviembre(
	prod_masvendido int  identity (1,1)  not null,
	cod_producto int ,
	desc_producto nvarchar(50),
	PRIMARY KEY (cod_producto),
)

create table ProductoModificado(
	cod_producto int not null,
	desc_producto nvarchar(50),
	precio_costo decimal (12,2),
	precio_venta decimal (12,2),
	precio_mercado decimal (12,2),
	PRIMARY KEY (cod_producto),
)

create table ProductoUltimoUso(
	cod_producto int not null,
	desc_producto nvarchar(50),
	fecha_ultima date,
	PRIMARY KEY (cod_producto),
)

/*SE CARGAN PRUEBAS PARA REALIZAR EL EXAMEN TECNICO*/
insert into Producto ( desc_producto, precio_costo, precio_venta, precio_mercado) VALUES ( 'Galletitas OREO', 12.0, 15.0, 16.0)
insert into Producto ( desc_producto, precio_costo, precio_venta, precio_mercado) VALUES ( 'Gaseosa COCA', 2.0, 4.4, 5.5)
insert into Producto ( desc_producto, precio_costo, precio_venta, precio_mercado) VALUES ( 'Galletitas OBLEA', 13.0, 16.0, 17.0)
insert into Producto ( desc_producto, precio_costo, precio_venta, precio_mercado) VALUES ( 'Galletitas Sonrisa', 5.0, 7.0, 8.0)
insert into Producto ( desc_producto, precio_costo, precio_venta, precio_mercado) VALUES ( 'Gaseosa Sprite', 3.0, 7.0, 8.0)
insert into Producto ( desc_producto, precio_costo, precio_venta, precio_mercado) VALUES ( 'Galletitas OREO', 12.0, 16.0, 16.0)
insert into Producto ( desc_producto, precio_costo, precio_venta, precio_mercado) VALUES ( 'Galletitas OREO', 12.0, 17.0, 16.0)
insert into Proveedores( nombre, direccion, ciudad) VALUES ( 'Pablo','montes de oca 100','buenos aires')
insert into Proveedores( nombre, direccion, ciudad) VALUES ( 'Kevin','zarate 200','cordoba')
insert into Proveedores( nombre, direccion, ciudad) VALUES ( 'Marta','uspallata 900','corriente')
insert into Proveedores( nombre, direccion, ciudad) VALUES ( 'Matias','ituzaingo 32','buenos aires')
insert into Proveedores( nombre, direccion, ciudad) VALUES ( 'Miguel','zarate 200','jujuy')
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '23-02-2022','25-02-2022',1)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '20-01-2020','25-01-2020',2)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-01-2020','10-01-2020',2)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-01-2020','10-01-2019',3)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-01-2019','10-01-2019',3)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-01-2018','10-01-2018',3)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-01-2018','10-01-2018',3)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-01-2019','10-01-2018',4)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-01-2020','10-01-2018',4)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-01-2021','10-01-2018',4)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-04-2021','10-04-2021',4)

insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '23-09-2004','25-02-2004',1)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '20-09-2002','25-01-2002',2)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-09-2003','10-01-2003',2)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-07-2004','10-01-2004',3)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-07-2002','10-01-2002',3)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-09-2003','10-01-2003',3)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-09-2004','10-01-2004',3)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-08-2002','10-01-2002',4)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-08-2003','10-01-2003',4)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-09-2002','10-01-2002',4)
insert into Orden_De_Compra( fecha_emision_orden, fecha_entrega, cod_proveedor) VALUES ( '1-09-2004','10-01-2004',4)

insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (1,1,1,15.5)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (2,1,2,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (3,1,3,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (2,1,4,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (11,1,1,15.5)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (12,1,1,15.5)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (13,1,2,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (14,1,3,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (15,1,4,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (16,1,1,15.5)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (17,1,2,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (18,1,3,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (19,1,4,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (20,1,4,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (21,1,4,5.9)
insert into Item_de_la_orden_de_compra (cod_orden,cantidad,cod_producto,precio_real) VALUES (22,1,4,5.9)

----------------------------------------------------------------------------------------------------------
/*1) Seleccionar los proveedores que han emitido �rdenes de compra que solo poseen un �tem
de producto tipo galletita (Galletitas Oreo, galletita opera, galletitas OBLEA, Galletita
Sonrisa, etc.) o bien que hayan emitido �rdenes de compras en el a�o 2019 y 2020
inclusive. No se admitir�n �rdenes de compras que no cumplan con la condici�n primera o
que hayan emitido ordenes solo en el 2019 o solo en el 2020.*/

select
	p.cod_proveedor,
	p.nombre
from Proveedores p join Orden_De_Compra o on p.cod_proveedor=o.cod_proveedor
left join Item_de_la_orden_de_compra i on o.cod_orden=i.cod_orden
left join Producto prod on prod.cod_producto=i.cod_producto
where (p.cod_proveedor in (select o4.cod_proveedor from Orden_De_Compra o4 join Item_de_la_orden_de_compra i2 on i2.cod_orden=o4.cod_orden join Producto prod2 on i2.cod_producto=prod2.cod_producto where prod2.desc_producto LIKE '%galletita%'and o4.cod_proveedor=p.cod_proveedor group by o4.cod_proveedor having count(prod2.desc_producto )=1)) 
or (exists (select * from Orden_De_Compra o2 where o2.cod_proveedor=p.cod_proveedor and year(o2.fecha_emision_orden)=2019) and exists(select * from Orden_De_Compra o3 where o3.cod_proveedor=p.cod_proveedor and year(o3.fecha_emision_orden)=2020))
group by p.nombre, p.cod_proveedor

/*
2) Eliminar los registros de los proveedores que hayan tenido menos de 3 �rdenes de
compras en el a�o 2021.
*/
/*ACLARACION: Es importante respetar en este ejercicio la integridad de las relaciones FK, por que aunque este sentencia resuelva lo pedido, quebranta con la integridad de la base
por lo que arme el procedure de abajo para que primero elimine las ordenes para despues eliminar al proveedor */
--DELETE FROM PROVEEDORES WHERE cod_proveedor in (select P2.cod_proveedor from Proveedores p2 join Orden_De_Compra o2 on p2.cod_proveedor=o2.cod_proveedor where YEAR(o2.fecha_emision_orden)=2021  group by p2.cod_proveedor having(count(distinct o2.cod_orden))<3


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'ejercicio_2')
drop procedure ejercicio_2
CREATE PROCEDURE ejercicio_2 
as
begin
	declare @proveedor int
	DECLARE cursorDicsys CURSOR FOR
	select
		cod_proveedor
	from Proveedores 

	OPEN cursorDicsys
	FETCH cursorDicsys INTO @proveedor

	WHILE @@fetch_status = 0
		BEGIN
			
			if exists (select * from Proveedores p2 join Orden_De_Compra o2 on p2.cod_proveedor=o2.cod_proveedor where YEAR(o2.fecha_emision_orden)=2021 and p2.cod_proveedor=@proveedor group by p2.cod_proveedor having(count(distinct o2.cod_orden))<3)
			begin
				 
				delete from Orden_De_Compra where  cod_orden in (select o3.cod_orden from Orden_De_Compra o3 where o3.cod_proveedor=@proveedor)
				delete from Proveedores  where cod_proveedor = @proveedor 
			end
				
			FETCH cursorDicsys INTO @proveedor
		END

	CLOSE cursorDicsys
	DEALLOCATE cursorDicsys
end
exec dbo.ejercicio_2


/*3) Modificar el precio de venta de los productos a raz�n de 3 veces el precio de compra, solo
para aquellos productos que estuvieron en alguna orden de compra cuya diferencia de
d�as entre la "fecha entrega" y la "fecha de emision"; no supere los 3 d�as.
*/
	
UPDATE Producto
set precio_venta = precio_venta*3 where cod_producto in
 (select i.cod_producto  
 from Item_de_la_orden_de_compra i join Orden_De_Compra o on i.cod_orden=o.cod_orden 
 WHERE DATEDIFF(day, o.fecha_emision_orden, o.fecha_entrega)  <4) 

/*
4) Insertar en una tabla (supuestamente ya creada), los registros provenientes de una
consulta SQL que devuelva los 10 productos que hayan sido vendidos en el mes de
noviembre de los a�os 2002, 2003 y 2004. La selecci�n de estos productos debe estar
ordenados seg�n la ganancia real acumulada. En otras palabras, generar un ranking de los
10 productos que tuvieron mayor ganancia en noviembre de los a�os 2002, 2003 y 2004,
dej�ndolos almacenados en una tabla.
*/

insert into ProductoMasVendidoNoviembre (cod_producto,desc_producto)
select top 10
	p.cod_producto,
	p.desc_producto
from Producto p 
join Item_de_la_orden_de_compra i on i.cod_producto=p.cod_producto
join Orden_De_Compra o on o.cod_orden=i.cod_orden
where MONTH(o.fecha_emision_orden)=11 and (year(o.fecha_emision_orden)>=2002 and YEAR(o.fecha_emision_orden)<=2004)
group by p.cod_producto,p.desc_producto
order by sum(i.precio_real) desc


/*
5) Actualizar el precio de venta al doble de los productos incluidos en �rdenes de compra
realizadas en abril.
*/
UPDATE Producto
set precio_venta = precio_venta*2 where cod_producto in
 (select i.cod_producto  
 from Item_de_la_orden_de_compra i join Orden_De_Compra o on i.cod_orden=o.cod_orden 
 where MONTH(o.fecha_emision_orden)=4)
 
 /*
6) Mostrar las descripciones que est�n repetidas, y el precio de venta promedio de los
mismos. Como resultado final se pide el producto y el precio de venta promedio
�nicamente. Esta es una relaci�n de la tabla productos �nicamente.
 */ 

 select
  p.desc_producto,
  avg(p.precio_venta)
 from Producto p
 group by p.desc_producto
 having count (*) > 1

 /*7) Borrar registro e historial de compra de los proveedores 514 y 831.*/

/*Aclaracion: en este ejercicio opte por dejar ambos, ya que los dos solucionan el requisito pero el segundo me parece mas legible con el procedure*/
-----------------------------------solo sentencias sql-------------------------------------------------
delete from Item_de_la_orden_de_compra where cod_orden in (
															select i.cod_orden 
															from Item_de_la_orden_de_compra i 
															join Orden_De_Compra o on i.cod_orden=o.cod_orden where o.cod_proveedor=514)
delete from Orden_De_Compra where cod_orden in (
													select o.cod_orden 
													from  Orden_De_Compra o where o.cod_proveedor=514)
													
delete from Item_de_la_orden_de_compra where cod_orden in (
															select i.cod_orden 
															from Item_de_la_orden_de_compra i 
															join Orden_De_Compra o on i.cod_orden=o.cod_orden where o.cod_proveedor=831)
delete from Orden_De_Compra where cod_orden in (
													select o.cod_orden 
													from  Orden_De_Compra o where o.cod_proveedor=514)
---------------------------------------------------------------------------------------------------------
-----------------------------------Con procedure---------------------------------------------------------													
create procedure eliminar_datos as
begin
	if exists(select * from  Orden_De_Compra o where o.cod_proveedor=514)
	begin
		 delete from Item_de_la_orden_de_compra where cod_orden in (
															select i.cod_orden 
															from Item_de_la_orden_de_compra i 
															join Orden_De_Compra o on i.cod_orden=o.cod_orden where o.cod_proveedor=514)
		delete from Orden_De_Compra where cod_orden in (
													select o.cod_orden 
													from  Orden_De_Compra o where o.cod_proveedor=514)
	end
	if exists(select * from  Orden_De_Compra o where o.cod_proveedor=831)
	begin
		 delete from Item_de_la_orden_de_compra where cod_orden in (
															select i.cod_orden 
															from Item_de_la_orden_de_compra i 
															join Orden_De_Compra o on i.cod_orden=o.cod_orden where o.cod_proveedor=831)
		delete from Orden_De_Compra where cod_orden in (
													select o.cod_orden 
													from  Orden_De_Compra o where o.cod_proveedor=831)
	end
end 
----------------------------------------------------------------------------------------------------
/*8)Crear una tabla con la estructura de cs_productos, nombrarla como desee, e inserte los
mismos registros que tiene la tabla cs_productos. Luego actualizar el precio de costo en la
nueva tabla con un aumento del 15% en productos con descripci�n de galletitas, un 5%
para productos con descripci�n de chupetines y un 36% en barra de chocolates.*/

select * from ProductoModificado

insert into ProductoModificado (cod_producto,desc_producto,precio_costo,precio_venta,precio_mercado) select cod_producto,desc_producto,precio_costo,precio_venta,precio_mercado  from Producto

update ProductoModificado
set precio_costo = case 
						when desc_producto like '%galletita%' then precio_costo * 1.15
						when desc_producto like '%chupetin%' then precio_costo * 1.05
						when desc_producto like '%chocolate%' then precio_costo * 1.36
					else precio_costo
					end

/*
9) Crear una estructura procedural que recorra la tabla de productos y que por cada uno de
los productos recorridos verifique la existencia del mismo en alguna orden de compra cuya
fecha de emisi�n haya sido anterior al 01/01/2011. En caso de no existir el producto en
alguna orden seg�n la l�gica antes mencionada, insertar los datos del producto en una
tabla incluyendo los datos de c�digo de producto, nombre y �ltima fecha de orden de
compra en la cual, incluido el producto, y a su vez disminuir el precio del producto al 90%
del valor actual. Construir el bloque de c�digo mediante sentencias PL/SQL de CURSORES,
ASIGNACIONES, SELECT, IF, UPDATE, ETC.
*/
/*Aclaracion: No se entiende la parte esta "insertar los datos del producto en una
tabla incluyendo los datos de c�digo de producto, nombre y �ltima fecha de orden de
compra en la cual, incluido el producto, y a su vez disminuir el precio del producto al 90%
del valor actual"
Por lo que  lo resolvi de la siguiente manera*/

create procedure ejercicio_9 as
begin
	DECLARE @producto int
	DECLARE cursorDicsys CURSOR FOR
	select
		p.cod_producto
	from Producto p

	OPEN cursorDicsys
	FETCH cursorDicsys INTO @producto

	WHILE @@fetch_status = 0
		BEGIN
			if not exists (select * from Orden_De_Compra o join Item_de_la_orden_de_compra i on i.cod_orden=o.cod_orden where i.cod_producto=@producto and fecha_emision_orden<'2011-01-01')
			begin
				insert into ProductoUltimoUso(cod_producto,desc_producto,fecha_ultima)
				select
					p2.cod_producto,
					p2.desc_producto,
					(select top 1 o2.fecha_emision_orden from Orden_De_Compra o2 join Item_de_la_orden_de_compra i2 on i2.cod_orden=o2.cod_orden where i2.cod_producto=@producto order by o2.fecha_emision_orden desc)
				from Producto p2
				where p2.cod_producto=@producto
				UPDATE Producto
				set precio_venta = (precio_venta-(precio_venta*0.9)) where cod_producto=@producto
			end
			FETCH cursorDicsys INTO @producto
		END

	CLOSE cursorDicsys
	DEALLOCATE cursorDicsys
end

exec ejercicio_9
/*
10) 
a) �Qu� diferencias hay entre clasificaci�n y regresi�n? nombrar casos de uso para cada
uno.

La clasificaci�n y la regresi�n son dos t�cnicas de aprendizaje autom�tico que son comunes y normalmente se utilizan en varios campos. Cada una tiene un objetivo diferente y ambas procesan los datos de manera diferente.
Como primer caso tenemos a la regresi�n que se utiliza para predecir valores que son continuos o num�ricos, como puede ser la cantidad de ventas de un producto. Por lo que se busca establecer o asemejar una relaci�n a trav�s de la matem�tica (puede ser alguna ecuaci�n matem�tica conocida por ejemplo) entre las variable de entrada y de las de salida para lograr una mejor predicci�n de los datos.
Por el otro lado tenemos a la clasificaci�n, esto busca predecir valores discretos o categ�ricos como puede ser la clasificaci�n de correos electr�nicos en spam o no spam. 
Por lo que busca entonces es clasificar los datos de entrada en diferentes categor�as o clases, en funci�n de alguna/s similitudes o caracter�sticas que tengan en com�n. 
Casos de uso para regresi�n:
-Estimar la demanda de un producto en funci�n del precio
-Pronosticar la temperatura en funci�n de los datos clim�ticos de la historia
-Determinar que recta se asemeja m�s, a un conjunto de puntos como puede ser la regresi�n lineal.
  
Casos de uso para clasificaci�n:
�	Clasificar correos electr�nicos como spam o no spam
�	Clasificar im�genes en diferentes categor�as
�	Diagnosticar enfermedades medicas en funci�n de los s�ntomas del paciente


b) Una empresa de retal tiene problemas con productos que se vencen.
Para eso est� interesada en saber cu�ntas ventas va a tener de determinados
productos los pr�ximos 6 meses.
�Qu� tipo de modelos se podr�an usar? �C�mo medir�as los resultados? que datos
ser�n necesarios tener.

Como nombramos anteriormente en este caso para predecir a futuro datos, mediante la relaci�n de datos de entrada y de salida, se puede usar utilizar modelos de regresi�n para poder lograr predecir las ventas de ciertos productos en los pr�ximos 6 meses. El objetivo de esto es predecir una variable continua en funci�n de una variable o varias variables como puede ser el precio, temporada, etc.
Para realizar este modelo de regresi�n es importante los datos hist�ricos de ventas. como tambi�n es necesario identificar que variables son relevantes para la predicci�n de ventas y poder recolectar los datos de esas variables en el periodo de tiempo que se vaya a trabajar. Adem�s se debe tener en cuenta los factores externos que puedan afectar a los productos o a ciertos productos, como d�as festivos, eventos especiales, etc.
Y como �ltimo, para medir los resultados del modelo se podr�a utilizar una variedad de m�tricas, como el error cuadr�tico o el coeficiente de determinaci�n. Esto ayudara a evaluar que tambi�n se ajusta el modelo de datos y cuanto error se puede esperar de la predicci�n de futuras ventas.
En conclusi�n para dar un cierre, para predecir las ventas de ciertos productos que se vencen en los pr�ximos 6 meses, se podr�a utilizar modelos de regresi�n y para su uso, es necesario recolectar datos hist�ricos y variables externas e internas que afecten a nuestras ventas para poder ajustar el modelo de la mejor manera para poder evaluar y encontrar las m�tricas que nos den un resultado mejor. 


c) �Para qu� se divide el data set en train y test? �C�mo funciona cross-validation?

Dividir el dataset en train y test nos para evaluar el rendimiento del modelo. El conjunto train se utiliza para ajustar el modelo, mientras que el conjunto de prueba se utiliza para evaluar el rendimiento del modelo en datos no vistos previamente.
Generalmente esta t�cnica se utiliza para ajustar los datos y como siguiente evaluar la capacidad del modelo para generalizar a nuevos datos. Esta divisi�n de datos es importante para evitar el sobreajuste del modelo que ocurre cuando el modelo se ajusta demasiado a los datos y no se puede generalizar a los nuevos.
Y el cross-validation se utiliza para evaluar el rendimiento del modelo de manera m�s robusta que la simple divisi�n en train y test. Al utilizar todos los datos en varias ocasiones, se puede obtener una mejor estimaci�n del rendimiento del modelo. Adem�s, la t�cnica nos sirve tambi�n para evitar el sesgo de la evaluaci�n del modelo que puede surgir al utilizar una sola divisi�n de train y test.
d) �Qu� es un outlier, como se pueden detectar, porque es importante detectarlos?
Un outlier es un valor que se encuentra de manera significativamente alejado de los dem�s valores en un conjunto de datos. Los outlier pueden ser tanto valores muy altos como muy bajos en relaci�n a los dem�s valores, y esto puede ser causados por errores como en la medici�n o los datos ingresados, como tambi�n puede ser verdaderas excepciones de los datos
Para detectar los outliers, se pueden utilizar algunas t�cnicas de estad�sticas 
como los boxplots, m�todos basados en la desviaci�n est�ndar, an�lisis de valores extremos, etc.
Hay que tener en cuenta que es importante detectar outliers porque puede tener un impacto significativo en el an�lisis de los datos y en la toma de futuras decisiones que claramente est�n basadas en los an�lisis previos. Y adem�s si los outliers son causados por errores en la medici�n o en la entrada de datos pueden llevar a conclusiones err�neas si no se los detecta y corrige a tiempo. Por lo tanto, es importante identificarlos y trabajarlos de la manera m�s adecuadas posible para tener resultados m�s precisos y confiables.
*/