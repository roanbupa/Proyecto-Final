use master;
go

if exists (select * from Sysdatabases where name='ProyectoFinal')
begin
	drop database ProyectoFinal
end

create database ProyectoFinal
go
use ProyectoFinal
go

create table Empresa (
	Rut int primary key,
	Nombre varchar (50) not null,
	Telefono varchar (20) not null,
	Mail varchar (50) not null
)

create table Paquete (
	Numero int,
	Rut int,
	Peso int not null check (Peso > 0),
	Tipo varchar (20) not null check (Tipo in ('Fragil', 'Bulto', 'Comun')),
	Descripcion varchar (max) not null
	primary key (Numero, Rut)
	foreign key (Rut) references Empresa (Rut)
)

create table Empleado (
	Usuario varchar (20) primary key,
	Contrasena varchar (20) not null,
	Nombre varchar (50) not null
)

create table SolicitudEntrega (
	NumeroSistema int primary key identity (1,1),
	Nombre varchar (50) not null,
	Direccion varchar (50) not null,
	FechaEntrega smalldatetime not null check (FechaEntrega > GETDATE()),
	Estado varchar (50) not null check (Estado in ('Entregado', 'En Camino', 'Deposito')),
	Usuario varchar (20) not null,
	Numero int not null,
	Rut int not null
	foreign key (Usuario) references Empleado (Usuario),
	foreign key (Numero,Rut) references Paquete (Numero,Rut)
)

insert into Empresa (Rut, Nombre, Telefono, Mail)
values	(1, 'Laqrrique Rulemanes', 099569987, 'lrulemanes@gmail.com'),
		(2, 'Inca', 099897564, 'inca@gmail.com'),
		(3, 'Acer', 098193184, 'acer@gmail.com'),
		(4, 'Disco', 09111222, 'disco@gmail.com'),
		(5, 'Tienda', 098999666, 'tienda@gmail.com'),
		(6, 'Sony', 097453621, 'sony@gmail.com'),
		(7, 'Hp', 091475869, 'hp@gmail.com'),
		(8, 'Samsung', 093659874, 'samsung@gmail.com'),
		(9, 'Tramontina', 094523698, 'tramontina@gmail.com'),
		(10, 'Plastolit', 092193425, 'plastolit@gmail.com'),
		(11, 'Neusol', 092333214, 'neusol@gmail.com'),
		(12, 'Mapfre', 097663322, 'mafre@gmail.com')

insert into Paquete (Numero, Rut, Peso, Tipo, Descripcion)
values	(2, 1, 45, 'Fragil', 'Paquete con cosas de vidrio'),
		(1, 1, 45, 'Fragil', 'Paquete con cosas de vidrio'),
		(1, 2, 150, 'Bulto', 'Paquete de entrega rapida'),
		(1, 3, 78, 'Comun', 'Paquete sin apuro'),
		(2, 3, 78, 'Comun', 'Paquete sin apuro'),
		(2, 2, 65, 'Comun', 'Paquete de entrega rapida'),
		(3, 1, 50, 'Fragil', 'Paquete de entrega rapida'),
		(3, 2, 120, 'Bulto', 'Paquete sin apuro'),
		(4, 1, 115, 'Bulto', 'Paquete de entrega rapida'),
		(4, 2, 62, 'Comun', 'Paquete sin apuro'),
		(3, 3, 40, 'Fragil', 'Paquete de entrega rapida'),
		(4, 3, 100, 'Bulto', 'Paquete sin apuro')

insert into Empleado (Usuario, Contrasena, Nombre)
values	('per123', '123', 'Pedro'),
		('mar123', '123', 'Marta'),
		('mab123', '123', 'Mabel'),
		('juli123', '123', 'Julieta'),
		('and123', '123', 'Andres'),
		('mon123', '123', 'Monica')

insert into SolicitudEntrega (Nombre, Direccion, FechaEntrega, Estado, Usuario, Numero, Rut)
values	
		('Pepe', 'Av Sarmiento 458', '02/12/2021', 'En camino', 'mab123', 1, 2),
		('Pedro', '18 de Julio 233', '06/12/2021', 'Entregado', 'per123', 2, 1),
		('Pablo', 'Chana 4658', '07/12/2021', 'Deposito', 'mar123', 1, 1),
		('Javier', 'Silvestre Blanco 2591', '02/09/2021', 'Deposito', 'mar123', 3, 1),
		('Ana', 'Brito del Pino', '09/06/2021', 'En camino', 'mab123', 2, 2),
		('Paula', 'Rivera 1055', '15/07/2021', 'En camino', 'mab123', 3, 2),
		('Josefina', 'Blandengues 2121', '04/05/2021', 'Entregado', 'per123', 1, 3),
		('Jorge', 'Monte Caseros 865', '03/08/2021', 'Entregado', 'mar123', 2, 3),
		('Pablo', 'Yaguaron 4758', '01/05/2021', 'Deposito', 'per123', 3, 3)
go
		
create proc sp_EliminarEmpresa @rut int	
as
begin try
if(not exists (select * from Empresa where @rut = Rut))
	begin
		return -1
	end
if(exists (select * from SolicitudEntrega where @rut = Rut))
	begin	
		return -2
	end
begin tran
	 delete Paquete where @rut = Rut
	 delete Empresa where @rut = Rut
commit tran
		return 1
end try
begin catch
		rollback tran
		return @@ERROR
end catch
go

create proc Sp_BuscarEmpresa @RUT int
as
select * from Empresa where Rut = @RUT
go

create proc sp_BuscarUsuario @usu varchar(20)
as
select * from Empleado where Usuario = @usu
go

create proc sp_BuscarPaquetePorPks @Rut int, @Numero int
as
	select * from Paquete where Rut = @Rut and Numero = @Numero
go

create proc sp_Logueo @Usuario varchar(20), @Contrasena varchar(20)
as
begin
	select * from Empleado
	where @Usuario = Usuario and @Contrasena = Contrasena
end
go

create proc sp_AgregarPaquete @Rut int ,@numero int ,@Peso int,
								@Tipo varchar(20),@Descripcion varchar(max)
as
begin try
	if (not exists(select * from Empresa where @Rut = Rut))
	begin
		return -1
	end
	if(exists(select * from Paquete where @numero = Numero and @Rut = Rut))
	begin
		return -2
	end
	else
	begin	
		insert into Paquete (Numero,Rut,Peso,Tipo,Descripcion)
		values (@numero,@Rut,@Peso,@Tipo,@Descripcion)
		return 1
	end
end try
begin catch
	return @@ERROR
end catch
go

create proc sp_EliminarPaquete @Rut int, @Numero int	
as
begin try
	if(not exists(select * from Paquete where @Rut = Rut and @Numero = Numero))
	begin
		return -1
	end
	begin tran
		delete SolicitudEntrega where @Rut = Rut and @Numero = Numero
		delete Paquete where @Rut = Rut and @Numero = Numero
	commit tran
		return 1
end try
begin catch
	rollback tran
	return @@error
end catch
go

create proc sp_EliminarEmpleado @usu varchar(20)
as
begin try
	if(exists(select * from SolicitudEntrega where Usuario = @usu))
	begin
		return -1
	end	
	if(not exists(select * from Empleado where Usuario = @usu))
	begin	
		return -2
	end
	else
	begin
		delete Empleado where Usuario = @usu
		return 1
	end
end try
begin catch
	return @@error
end catch
go

create proc sp_ModificarPaquete @Rut int, @Numero int, @Peso int, @Tipo varchar(20),@Descripcion varchar(max)
as
if (not exists (select * from Empresa where @Rut = Rut))
begin
	return -1
end
if (not exists(select * from Paquete where @Rut = Rut and @Numero = Numero))
begin
	return -2
end
begin try
	update Paquete
	set Peso = @Peso , Tipo = @Tipo , Descripcion = @Descripcion
	where @Rut = Rut and @Numero = Numero
	return 1
end try
begin catch
	return @@error
end catch
go

create proc sp_ModificarEmpleado @usu varchar(20), @contrasena varchar(20), @nombre varchar(50)
as
if (not exists(select * from Empleado where @usu = Usuario))
begin
	return -1
end
begin try
	update Empleado
	set Contrasena = @contrasena, Nombre = @nombre
	where Usuario = @usu
	return 1
end try
begin catch
	return @@error
end catch
go

create proc sp_AgregarEmpleado @usu varchar(20), @contrasena varchar(20), @nombre varchar(50)
as
begin try
if (exists(select * from Empleado where Usuario = @usu))
begin
	return -1
end
insert into Empleado (Usuario, Contrasena, Nombre)
values (@usu, @contrasena, @nombre)
return 1
end try
begin catch
return @@error
end catch
go

create proc Sp_ModificarEmpresa @Rut int, @Nombre varchar(50), @Telefono varchar(20), @Mail varchar(50)
as
if (not exists(select * from Empresa where @Rut = Rut))
begin
	return -1
end
begin try
	update Empresa
	set Nombre = @Nombre, Telefono = @Telefono, Mail = @Mail
	where Rut = @Rut
	return 1
end try
begin catch
	return @@error
end catch
go

create proc Sp_AltaEmpresa @Rut int, @Nombre varchar(50), @Telefono varchar(20), @Mail varchar (50)
as
begin try
	if (exists(select * from Empresa where Rut = @Rut))
	begin
		return -1
	end
	else if (exists(select * from Empresa where Nombre = @Nombre))
	begin
		return -2
	end
	else
	begin
		insert into Empresa (Rut, Nombre, Telefono, Mail)
		values (@Rut, @Nombre, @Telefono, @Mail)
		return 1
	end
end try
begin catch 
	return @@error
end catch
go

create proc sp_ListarSolicitudes
as
begin
	select * From SolicitudEntrega
	where Estado  ='Deposito' or Estado ='En camino'
end
go

create proc sp_ListarPaqueteSinSolicitud
as
select * from Paquete left join SolicitudEntrega
on Paquete.Numero = SolicitudEntrega.Numero and Paquete.Rut = SolicitudEntrega.Rut
where SolicitudEntrega.NumeroSistema is null
go

create proc sp_AgregarSolicitudDeEntrega @nombre varchar(50), @Direccion varchar(50),@fechaEntrega smalldatetime,
											 @Estado varchar(50),@usuario varchar(20),@Numero int, @Rut int
as
begin try
	if(exists(select * from SolicitudEntrega where Numero = @Numero and Rut = @Rut))
	begin
		return -1
	end
	if(exists(select * from Paquete where Numero = @Numero and Rut = @Rut)) 
	begin
		if(exists(select * from Empleado where Usuario = @usuario))
		begin
			insert into SolicitudEntrega (Nombre,Direccion,FechaEntrega,Estado,Usuario,Numero,Rut)
			values (@nombre, @Direccion , @fechaEntrega,@Estado , @usuario,@Numero,@Rut)
			return 1
		end
		else 
		begin
			return -3
		end
	end
	else
	begin
		return -2
	end
end try
begin catch
	return @@error
end catch
go

create proc sp_CambiarEstadoDeSolicitud @NumerodeSistema int
as
if (not exists(select * from SolicitudEntrega where @NumerodeSistema = NumeroSistema))
begin
	return - 1
end
begin try
	declare @variable varchar(50)
	set @variable = (select Estado from SolicitudEntrega where @NumerodeSistema = NumeroSistema)
	if(@variable = 'Deposito')
	begin
		update SolicitudEntrega 
		set Estado = 'En Camino'
		where @NumerodeSistema = NumeroSistema
		return 1
	end
	else if(@variable = 'En Camino') 
	begin
		update SolicitudEntrega
		set Estado = 'Entregado'
		where @NumerodeSistema = NumeroSistema
		return 1
	end
	else 
	begin
		return -2
	end
end try
begin catch
	return @@error
end catch
go

create proc sp_ListarEmpresas
as
SELECT * from Empresa
go

create proc sp_PaquetesPorEmpresa @rut int
as
	select * from Paquete where @rut = rut
go

create proc sp_BuscarSolicitudDeEntrega @rut int , @numero int
as
	select * from SolicitudEntrega where @rut = rut and @numero = Numero
go

create proc sp_BuscarSolicitudPorFecha @Fecha smalldatetime
 as
	select * from SolicitudEntrega where FechaEntrega = @Fecha
	and Estado = 'Deposito'
go