
IF OBJECT_ID('Proveedores','U')IS NOT NULL
DROP TABLE Proveedores
IF OBJECT_ID('Orden_De_Compra','U')IS NOT NULL
DROP TABLE Orden_De_Compra
IF OBJECT_ID('Productos','U')IS NOT NULL
DROP TABLE Productos
IF OBJECT_ID('Item_de_la_orden_de_compra','U')IS NOT NULL
DROP TABLE Item_de_la_orden_de_compra

IF EXISTS (SELECT * FROM sys.objects WHERE name = 'tablaDicsys')
DROP PROCEDURE tablaDicsys



create procedure tablaDicsys as
begin
	create table Proveedores (
		cod_proveedor int identity (1,1) not null,
		nombre nvarchar(50),
		direccion nvarchar(50),
		ciudad nvarchar(50),
		telefono nvarchar (20)
		PRIMARY KEY (cod_proveedor) 
	)
	create table Orden_De_Compra(
		cod_orden int identity (1,1) not null,
		fecha_emision_orden date,
		fecha_entrega date,
		cod_proveedor int,
		PRIMARY KEY (cod_orden),
		CONSTRAINT FK_ProveedoresOrdenDeCompra FOREIGN KEY (cod_proveedor) REFERENCES Proveedores (cod_proveedor)
	)

	create table Productos(
		cod_producto int identity (1,1) not null,
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
		CONSTRAINT FK_ItemProducto FOREIGN  KEY (cod_producto) REFERENCES Productos (cod_producto),
		CONSTRAINT FK_ItemOrden FOREIGN  KEY (cod_orden) REFERENCES Orden_De_Compra (cod_orden)
	)
 
end

