USE IN5BM_KinalMall;

-- -----------------------------------------------------
-- PROCEDURE Administracion
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarAdministracion;
DELIMITER $$
CREATE PROCEDURE sp_ListarAdministracion()
BEGIN
	SELECT 
		Administracion.id, 
        Administracion.direccion, 
        Administracion.telefono 
	FROM Administracion;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_BuscarAdministracion;
DELIMITER $$
CREATE PROCEDURE sp_BuscarAdministracion(IN _id INT)
BEGIN
	SELECT 
		Administracion.id, 
        Administracion.direccion, 
        Administracion.telefono 
	FROM Administracion
    WHERE id = _id;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_AgregarAdministracion; 
DELIMITER $$
CREATE PROCEDURE sp_AgregarAdministracion (
	IN _direccion VARCHAR(100), 
	IN _telefono VARCHAR(8)
)
BEGIN
	INSERT INTO Administracion (direccion, telefono) 
    VALUES (_direccion, _telefono);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_EditarAdministracion;
DELIMITER $$
CREATE PROCEDURE sp_EditarAdministracion (
	IN _id INT,
	IN _direccion VARCHAR(100),
    IN _telefono VARCHAR(8)
)
BEGIN
	UPDATE Administracion 
    SET 
		direccion = _direccion, 
		telefono = _telefono 
    WHERE id = _id;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_EliminarAdministracion;
DELIMITER $$
CREATE PROCEDURE sp_EliminarAdministracion (IN _id INT)
BEGIN
	DELETE FROM Administracion WHERE id = _id;
END $$
DELIMITER ;




-- -----------------------------------------------------
-- PROCEDURE Locales
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarLocales;
DELIMITER $$
CREATE PROCEDURE sp_ListarLocales()
BEGIN
	SELECT
		Locales.id,
		Locales.saldoFavor,
		Locales.saldoContra,
		Locales.mesesPendientes,
		Locales.disponibilidad,
		Locales.valorLocal,
		Locales.valorAdministracion
	FROM Locales;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_BuscarLocales;
DELIMITER $$
CREATE PROCEDURE sp_BuscarLocales(IN _id INT)
BEGIN
	SELECT
		Locales.id,
		Locales.saldoFavor,
		Locales.saldoContra,
		Locales.mesesPendientes,
		Locales.disponibilidad,
		Locales.valorLocal,
		Locales.valorAdministracion
	FROM Locales
	WHERE id = _id;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_AgregarLocales;
DELIMITER $$
CREATE PROCEDURE sp_AgregarLocales(
	IN _saldoFavor DECIMAL(11,2),
	IN _saldoContra DECIMAL(11,2),
	IN _mesesPendientes INT,
	IN _disponibilidad BOOLEAN,
	IN _valorLocal DECIMAL(11,2),
	IN _valorAdministracion DECIMAL(11,2))
BEGIN
	INSERT INTO Locales(saldoFavor, saldoContra, mesesPendientes, disponibilidad, valorLocal, valorAdministracion )
	VALUES (_saldoFavor, _saldoContra, _mesesPendientes, _disponibilidad, _valorLocal, _valorAdministracion);
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_EditarLocales;
DELIMITER $$
CREATE PROCEDURE sp_EditarLocales(
	IN _id INT,
	IN _saldoFavor DECIMAL(11,2),
	IN _saldoContra DECIMAL(11,2),
	IN _mesesPendientes INT,
	IN _disponibilidad BOOLEAN,
	IN _valorLocal DECIMAL(11,2),
	IN _valorAdministracion DECIMAL(11,2))
BEGIN
	UPDATE Locales
	SET
		saldoFavor = _saldoFavor,
		saldoContra = _saldoContra,
		mesesPendientes = _mesesPendientes,
		disponibilidad = _disponibilidad,
		valorLocal = _valorLocal,
		valorAdministracion = _valorAdministracion
	WHERE id = _id;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_EliminarLocales;
DELIMITER $$
CREATE PROCEDURE sp_EliminarLocales(IN _id INT)
BEGIN
	DELETE FROM Locales WHERE id = _id;
END$$
DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE TipoCliente
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarTipoCliente;
DELIMITER $$
CREATE PROCEDURE sp_ListarTipoCliente()
BEGIN
	SELECT
		TipoCliente.id,
		TipoCliente.descripcion
	FROM TipoCliente;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_BuscarTipoCliente;
DELIMITER $$
CREATE PROCEDURE sp_BuscarTipoCliente(IN _id INT)
BEGIN
	SELECT
		TipoCliente.id,
		TipoCliente.descripcion
	FROM TipoCliente
	WHERE id = _id;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_AgregarTipoCliente;
DELIMITER $$
CREATE PROCEDURE sp_AgregarTipoCliente(
	IN _descripcion VARCHAR(45)
)
BEGIN
	INSERT INTO TipoCLiente(descripcion)
	VALUES (_descripcion);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EditarTipoCliente;
DELIMITER $$
CREATE PROCEDURE sp_EditarTipoCliente(
	IN _id INT,
	IN _descripcion VARCHAR(45)
)
BEGIN
	UPDATE TipoCliente
	SET
		descripcion = _descripcion
	WHERE id = _id;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_EliminarTipoCliente;
DELIMITER $$
CREATE PROCEDURE sp_EliminarTipoCliente(IN _id INT)
BEGIN
	DELETE FROM TipoCliente WHERE id = _id;
END$$
DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE Cliente
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarClientes;
DELIMITER $$
CREATE PROCEDURE sp_ListarClientes()
BEGIN
	SELECT 
		Clientes.id,
        Clientes.nombres,
        Clientes.apellidos,
        Clientes.telefono,
        Clientes.direccion,
        Clientes.email,
        Clientes.codigoTipoCliente
	FROM Clientes;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_BuscarClientes;
DELIMITER $$
CREATE PROCEDURE sp_BuscarClientes(IN _id INT)
BEGIN
	SELECT 
		Clientes.id,
        Clientes.nombres,
        Clientes.apellidos,
        Clientes.telefono,
        Clientes.direccion,
        Clientes.email,
        Clientes.codigoTipoCliente
	FROM Clientes
	WHERE id = _id;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_AgregarClientes;
DELIMITER $$
CREATE PROCEDURE sp_AgregarClientes(
    IN _nombres VARCHAR(45),
    IN _apellidos VARCHAR(45),
    IN _telefono VARCHAR(8),
    IN _direccion VARCHAR(100),
    IN _email VARCHAR(45),
    IN _codigoTipoCliente INT
)
BEGIN
	INSERT INTO Clientes(nombres, apellidos, telefono, direccion, email, codigoTipoCliente)
	VALUES (_nombres, _apellidos, _telefono, _direccion, _email, _codigoTipoCliente);
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_EditarClientes;
DELIMITER $$
CREATE PROCEDURE sp_EditarClientes(
	IN _id INT,
    IN _nombres VARCHAR(45),
    IN _apellidos VARCHAR(45),
    IN _telefono VARCHAR(8),
    IN _direccion VARCHAR(100),
    IN _email VARCHAR(45),
    IN _codigoTipoCliente INT
)
BEGIN
	UPDATE Clientes
	SET
		nombres = _nombres, 
        apellidos = _apellidos, 
        telefono = _telefono, 
        direccion = _direccion, 
        email = _email, 
        codigoTipoCliente = _codigoTipoCliente
	WHERE id = _id;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_EliminarClientes;
DELIMITER $$
CREATE PROCEDURE sp_EliminarClientes(IN _id INT)
BEGIN
	DELETE FROM Clientes WHERE id = _id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Departamentos
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarDepartamentos;
DELIMITER $$
CREATE PROCEDURE sp_ListarDepartamentos()
BEGIN
	SELECT 
		Departamentos.id,
        Departamentos.nombre
	FROM Departamentos;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_BuscarDepartamentos;
DELIMITER $$
CREATE PROCEDURE sp_BuscarDepartamentos(IN _id INT)
BEGIN
	SELECT 
		Departamentos.id,
        Departamentos.nombre
	FROM Departamentos
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_AgregarDepartamentos;
DELIMITER $$
CREATE PROCEDURE sp_AgregarDepartamentos(
    IN _nombre VARCHAR(45)
)
BEGIN
	INSERT INTO Departamentos(nombre)
	VALUES (_nombre);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EditarDepartamentos;
DELIMITER $$
CREATE PROCEDURE sp_EditarDepartamentos(
	IN _id INT,
    IN _nombre VARCHAR(45)
)
BEGIN
	UPDATE Departamentos
	SET
		nombre = _nombre 
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EliminarDepartamentos;
DELIMITER $$
CREATE PROCEDURE sp_EliminarDepartamentos(IN _id INT)
BEGIN
	DELETE FROM Departamentos WHERE id = _id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Cuentas por Cobrar
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarCuentasPorCobrar;
DELIMITER $$
CREATE PROCEDURE sp_ListarCuentasPorCobrar()
BEGIN
	SELECT 
		CuentasPorCobrar.id,
        CuentasPorCobrar.numeroFactura,
        CuentasPorCobrar.anio,
        CuentasPorCobrar.mes,
        CuentasPorCobrar.valorNetoPago,
        CuentasPorCobrar.estadoPago,
        CuentasPorCobrar.codigoAdministracion,
        CuentasPorCobrar.codigoCliente,
        CuentasPorCobrar.codigoLocal
	FROM CuentasPorCobrar;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_BuscarCuentasPorCobrar;
DELIMITER $$
CREATE PROCEDURE sp_BuscarCuentasPorCobrar(IN _id INT)
BEGIN
	SELECT 
		CuentasPorCobrar.id,
        CuentasPorCobrar.numeroFactura,
        CuentasPorCobrar.anio,
        CuentasPorCobrar.mes,
        CuentasPorCobrar.valorNetoPago,
        CuentasPorCobrar.estadoPago,
        CuentasPorCobrar.codigoAdministracion,
        CuentasPorCobrar.codigoCliente,
        CuentasPorCobrar.codigoLocal
	FROM CuentasPorCobrar
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_AgregarCuentasPorCobrar;
DELIMITER $$
CREATE PROCEDURE sp_AgregarCuentasPorCobrar(
    IN _numeroFactura VARCHAR(45),
    IN _anio YEAR,
    IN _mes INT,
    IN _valorNetoPago DECIMAL(11,2),
    IN _estadoPago VARCHAR(45),
    IN _codigoAdministracion INT,
    IN _codigoCliente INT,
    IN _codigoLocal INT
)
BEGIN
	INSERT INTO CuentasPorCobrar(numeroFactura, anio, mes, valorNetoPago, estadoPago, codigoAdministracion, codigoCliente, codigoLocal)
	VALUES (_numeroFactura, _anio, _mes, _valorNetoPago, _estadoPago, _codigoAdministracion, _codigoCliente, _codigoLocal);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EditarCuentasPorCobrar;
DELIMITER $$
CREATE PROCEDURE sp_EditarCuentasPorCobrar(
	IN _id INT,
    IN _numeroFactura VARCHAR(45),
    IN _anio YEAR,
    IN _mes INT,
    IN _valorNetoPago DECIMAL(11,2),
    IN _estadoPago VARCHAR(45),
    IN _codigoAdministracion INT,
    IN _codigoCliente INT,
    IN _codigoLocal INT
)
BEGIN
	UPDATE CuentasPorCobrar
	SET
		numeroFactura=_numeroFactura,
        anio=_anio,
        mes=_mes,
        valorNetoPago=_valorNetoPago,
        estadoPago=_estadoPago,
        codigoAdministracion=_codigoAdministracion,
        codigoCliente=_codigoCliente,
        codigoLocal=_codigoLocal 
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EliminarCuentasPorCobrar;
DELIMITER $$
CREATE PROCEDURE sp_EliminarCuentasPorCobrar(IN _id INT)
BEGIN
	DELETE FROM CuentasPorCobrar WHERE id = _id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Proveedores
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarProveedores;
DELIMITER $$
CREATE PROCEDURE sp_ListarProveedores()
BEGIN
	SELECT 
		Proveedores.id,
        Proveedores.nit,
        Proveedores.servicioPrestado,
        Proveedores.telefono,
        Proveedores.direccion,
        Proveedores.saldoFavor,
        Proveedores.saldoContra
	FROM Proveedores;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_BuscarProveedores;
DELIMITER $$
CREATE PROCEDURE sp_BuscarProveedores(IN _id INT)
BEGIN
	SELECT 
		Proveedores.id,
        Proveedores.nit,
        Proveedores.servicioPrestado,
        Proveedores.telefono,
        Proveedores.direccion,
        Proveedores.saldoFavor,
        Proveedores.saldoContra
	FROM Proveedores
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_AgregarProveedores;
DELIMITER $$
CREATE PROCEDURE sp_AgregarProveedores(
    IN _nit VARCHAR(45),
    IN _servicioPrestado VARCHAR(45),
    IN _telefono VARCHAR(8),
    IN _direccion VARCHAR(100),
    IN _saldoFavor DECIMAL(11,2),
    IN _saldoContra DECIMAL(11,2)
)
BEGIN
	INSERT INTO Proveedores(
        nit,
        servicioPrestado,
        telefono,
        direccion,
		saldoFavor,
        saldoContra)
	VALUES (
    _nit,
    _servicioPrestado,
	_telefono,
	_direccion,
    _saldoFavor,
	_saldoContra);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EditarProveedores;
DELIMITER $$
CREATE PROCEDURE sp_EditarProveedores(
	IN _id INT,
    IN _nit VARCHAR(45),
    IN _servicioPrestado VARCHAR(45),
    IN _telefono VARCHAR(8),
    IN _direccion VARCHAR(100),
    IN _saldoFavor DECIMAL(11,2),
    IN _saldoContra DECIMAL(11,2)
)
BEGIN
	UPDATE Proveedores
	SET
		nit = _nit,
        servicioPrestado=_servicioPrestado,
        telefono=_telefono,
        direccion=_direccion,
        saldoFavor=_saldoFavor,
        saldoContra=_saldoContra
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EliminarProveedores;
DELIMITER $$
CREATE PROCEDURE sp_EliminarProveedores(IN _id INT)
BEGIN
	DELETE FROM Proveedores WHERE id = _id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Horarios
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarHorarios;
DELIMITER $$
CREATE PROCEDURE sp_ListarHorarios()
BEGIN
	SELECT 
		Horarios.id,
        Horarios.horarioEntrada,
        Horarios.horarioSalida,
        Horarios.lunes,
        Horarios.martes,
        Horarios.miercoles,
        Horarios.jueves,
        Horarios.viernes
	FROM Horarios;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_BuscarHorarios;
DELIMITER $$
CREATE PROCEDURE sp_BuscarHorarios(IN _id INT)
BEGIN
	SELECT 
		Horarios.id,
        Horarios.horarioEntrada,
        Horarios.horarioSalida,
        Horarios.lunes,
        Horarios.martes,
        Horarios.miercoles,
        Horarios.jueves,
        Horarios.viernes
	FROM Horarios
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_AgregarHorarios;
DELIMITER $$
CREATE PROCEDURE sp_AgregarHorarios(
    IN _horarioEntrada TIME,
    IN _horarioSalida TIME,
    IN _lunes BOOLEAN,
    IN _martes BOOLEAN,
    IN _miercoles BOOLEAN,
    IN _jueves BOOLEAN,
    IN _viernes BOOLEAN
)
BEGIN
	INSERT INTO Horarios(
        horarioEntrada,
        horarioSalida,
        lunes,
        martes,
		miercoles,
        jueves,
        viernes)
	VALUES (
    _horarioEntrada,
    _horarioSalida,
	_lunes,
	_martes,
    _miercoles,
	_jueves,
    _viernes);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EditarHorarios;
DELIMITER $$
CREATE PROCEDURE sp_EditarHorarios(
	IN _id INT,
    IN _horarioEntrada TIME,
    IN _horarioSalida TIME,
    IN _lunes BOOLEAN,
    IN _martes BOOLEAN,
    IN _miercoles BOOLEAN,
    IN _jueves BOOLEAN,
    IN _viernes BOOLEAN
)
BEGIN
	UPDATE Horarios
	SET
		horarioEntrada = _horarioEntrada,
        horarioSalida=_horarioSalida,
        lunes=_lunes,
        martes=_martes,
        miercoles=_miercoles,
        jueves=_jueves,
        viernes=_viernes
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EliminarHorarios;
DELIMITER $$
CREATE PROCEDURE sp_EliminarHorarios(IN _id INT)
BEGIN
	DELETE FROM Horarios WHERE id = _id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE CuentasPorPagar
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarCuentasPorPagar;
DELIMITER $$
CREATE PROCEDURE sp_ListarCuentasPorPagar()
BEGIN
	SELECT 
		CuentasPorPagar.id,
        CuentasPorPagar.numeroFactura,
        CuentasPorPagar.fechaLimitePago,
        CuentasPorPagar.estadoPago,
        CuentasPorPagar.valorNetoPago,
        CuentasPorPagar.codigoAdministracion,
        CuentasPorPagar.codigoProveedor
	FROM CuentasPorPagar;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_BuscarCuentasPorPagar;
DELIMITER $$
CREATE PROCEDURE sp_BuscarCuentasPorPagar(IN _id INT)
BEGIN
	SELECT 
		CuentasPorPagar.id,
        CuentasPorPagar.numeroFactura,
        CuentasPorPagar.fechaLimitePago,
        CuentasPorPagar.estadoPago,
        CuentasPorPagar.valorNetoPago,
        CuentasPorPagar.codigoAdministracion,
        CuentasPorPagar.codigoProveedor
	FROM CuentasPorPagar
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_AgregarCuentasPorPagar;
DELIMITER $$
CREATE PROCEDURE sp_AgregarCuentasPorPagar(
    IN _numeroFactura VARCHAR(45),
    IN _fechaLimitePago DATE,
    IN _estadoPago VARCHAR(45),
    IN _valorNetoPago DECIMAL(11,2),
    IN _codigoAdministracion INT,
    IN _codigoProveedor INT
)
BEGIN
	INSERT INTO CuentasPorPagar(
        numeroFactura,
        fechaLimitePago,
        estadoPago,
        valorNetoPago,
		codigoAdministracion,
        codigoProveedor)
	VALUES (
    _numeroFactura,
    _fechaLimitePago,
	_estadoPago,
	_valorNetoPago,
    _codigoAdministracion,
	_codigoProveedor);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EditarCuentasPorPagar;
DELIMITER $$
CREATE PROCEDURE sp_EditarCuentasPorPagar(
	IN _id INT,
    IN _numeroFactura VARCHAR(45),
    IN _fechaLimitePago DATE,
    IN _estadoPago VARCHAR(45),
    IN _valorNetoPago DECIMAL(11,2),
    IN _codigoAdministracion INT,
    IN _codigoProveedor INT
)
BEGIN
	UPDATE CuentasPorPagar
	SET
		numeroFactura = _numeroFactura,
        fechaLimitePago=_fechaLimitePago,
        estadoPago=_estadoPago,
        valorNetoPago=_valorNetoPago,
        codigoAdministracion=_codigoAdministracion,
        codigoProveedor=_codigoProveedor
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EliminarCuentasPorPagar;
DELIMITER $$
CREATE PROCEDURE sp_EliminarCuentasPorPagar(IN _id INT)
BEGIN
	DELETE FROM CuentasPorPagar WHERE id = _id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Cargos
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarCargos;
DELIMITER $$
CREATE PROCEDURE sp_ListarCargos()
BEGIN
	SELECT 
		Cargos.id,
        Cargos.nombre
	FROM Cargos;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_BuscarCargos;
DELIMITER $$
CREATE PROCEDURE sp_BuscarCargos(IN _id INT)
BEGIN
	SELECT 
		Cargos.id,
        Cargos.nombre
	FROM Cargos
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_AgregarCargos;
DELIMITER $$
CREATE PROCEDURE sp_AgregarCargos(
    IN _nombre VARCHAR(45)
)
BEGIN
	INSERT INTO Cargos(nombre)
	VALUES (_nombre);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EditarCargos;
DELIMITER $$
CREATE PROCEDURE sp_EditarCargos(
	IN _id INT,
    IN _nombre VARCHAR(45)
)
BEGIN
	UPDATE Cargos
	SET
		nombre = _nombre 
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EliminarCargos;
DELIMITER $$
CREATE PROCEDURE sp_EliminarCargos(IN _id INT)
BEGIN
	DELETE FROM Cargos WHERE id = _id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Empleados
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ListarEmpleados;
DELIMITER $$
CREATE PROCEDURE sp_ListarEmpleados()
BEGIN
	SELECT 
		Empleados.id,
		Empleados.nombres ,
		Empleados.apellidos ,
		Empleados.email ,
		Empleados.telefono ,
		Empleados.fechaContratacion ,
		Empleados.sueldo ,
		Empleados.codigoDepartamento ,
		Empleados.codigoCargo ,
		Empleados.codigoHorario ,
		Empleados.codigoAdministracion 
	FROM Empleados;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_BuscarEmpleados;
DELIMITER $$
CREATE PROCEDURE sp_BuscarEmpleados(IN _id INT)
BEGIN
	SELECT 
		Empleados.id,
		Empleados.nombres ,
		Empleados.apellidos ,
		Empleados.email ,
		Empleados.telefono ,
		Empleados.fechaContratacion ,
		Empleados.sueldo ,
		Empleados.codigoDepartamento ,
		Empleados.codigoCargo ,
		Empleados.codigoHorario ,
		Empleados.codigoAdministracion 
	FROM Empleados
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_AgregarEmpleados;
DELIMITER $$
CREATE PROCEDURE sp_AgregarEmpleados(
		IN _nombres  VARCHAR(45),
		IN _apellidos VARCHAR(45),
		IN _email VARCHAR(45),
		IN _telefono VARCHAR(8),
		IN _fechaContratacion DATE,
		IN _sueldo DECIMAL(11,2),
		IN _codigoDepartamento INT,
		IN _codigoCargo INT,
		IN _codigoHorario INT,
		IN _codigoAdministracion INT
)
BEGIN
	INSERT INTO Empleados(
    nombres, 
    apellidos,
    email,
    telefono,
    fechaContratacion,
    sueldo,
    codigoDepartamento,
    codigoCargo,
    codigoHorario,
    codigoAdministracion)
	VALUES (
    _nombres,
    _apellidos,
    _email,
    _telefono,
    _fechaContratacion,
    _sueldo,
    _codigoDepartamento,
    _codigoCargo,
    _codigoHorario,
    _codigoAdministracion);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EditarEmpleados;
DELIMITER $$
CREATE PROCEDURE sp_EditarEmpleados(
	IN _id INT,
    IN _nombres  VARCHAR(45),
	IN _apellidos VARCHAR(45),
	IN _email VARCHAR(45),
	IN _telefono VARCHAR(8),
	IN _fechaContratacion DATE,
	IN _sueldo DECIMAL(11,2),
	IN _codigoDepartamento INT,
	IN _codigoCargo INT,
	IN _codigoHorario INT,
	IN _codigoAdministracion INT
)
BEGIN
	UPDATE Empleados
	SET
		nombres = _nombres,
        apellidos=_apellidos,
        email=_email,
        telefono=_telefono,
        fechaContratacion=_fechaContratacion,
        sueldo=_sueldo,
        codigoDepartamento=_codigoDepartamento,
        codigoCargo=_codigoCargo,
        codigoHorario=_codigoHorario,
        codigoAdministracion=_codigoAdministracion
	WHERE id = _id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_EliminarEmpleados;
DELIMITER $$
CREATE PROCEDURE sp_EliminarEmpleados(IN _id INT)
BEGIN
	DELETE FROM Empleados WHERE id = _id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Usuarios
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_BuscarUsuario;
DELIMITER $$
CREATE PROCEDURE sp_BuscarUsuario(IN _user VARCHAR(50))
BEGIN
	SELECT 
		Usuario.user,
		Usuario.pass,
        Usuario.nombre,
        Usuario.rol,
        Rol.descripcion
	FROM Usuario INNER JOIN Rol ON
    Usuario.rol=Rol.id
	WHERE user=_user;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Reporte Horarios
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ReporteHorarios;
DELIMITER $$
CREATE PROCEDURE sp_ReporteHorarios()
BEGIN
	SELECT  
		Horarios.id,
        Horarios.horarioEntrada,
        Horarios.horarioSalida,
        case when Horarios.lunes= 'FALSE' then 'No' ELSE 'Si' end as lunes,
        case when Horarios.martes= 'FALSE' then 'No' ELSE 'Si' end as martes,
        case when Horarios.miercoles= 'FALSE' then 'No' ELSE 'Si' end as miercoles,
        case when Horarios.jueves= 'FALSE' then 'No' ELSE 'Si' end as jueves,
        case when Horarios.viernes= 'FALSE' then 'No' ELSE 'Si' end as viernes
from
        Horarios;
END $$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Reporte Clientes
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ReporteClientes;
DELIMITER $$
CREATE PROCEDURE sp_ReporteClientes()
BEGIN
	SELECT  
		Clientes.id,
        Clientes.nombres,
        Clientes.apellidos,
        Clientes.telefono,
        Clientes.direccion,
        Clientes.email,
        TipoCliente.descripcion
	FROM
        Clientes INNER JOIN TipoCliente WHERE 
        Clientes.codigoTipoCliente=TipoCliente.id;
END $$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Reporte Cuentas Por Cobrar
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ReporteCuentasPorCobrar;
DELIMITER $$
CREATE PROCEDURE sp_ReporteCuentasPorCobrar()
BEGIN
	SELECT  
		CuentasPorCobrar.id,
        CuentasPorCobrar.numeroFactura,
        CONCAT(CuentasPorCobrar.mes,"/",CuentasPorCobrar.anio) as Fecha,
        CuentasPorCobrar.valorNetoPago,
        CuentasPorCobrar.estadoPago,
        Administracion.direccion,
        Clientes.nombres,
        Clientes.apellidos,
        Clientes.telefono,
        Locales.valorLocal,
        Locales.valorAdministracion,
        Locales.mesesPendientes
	FROM
        CuentasPorCobrar INNER JOIN Administracion ON
        CuentasPorCobrar.codigoAdministracion=Administracion.id
        INNER JOIN Clientes ON
        CuentasPorCobrar.codigoCliente=Clientes.id
        INNER JOIN Locales ON  
        CuentasPorCobrar.codigoLocal=Locales.id;
END $$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Reporte Empleados
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ReporteEmpleados;
DELIMITER $$
CREATE PROCEDURE sp_ReporteEmpleados()
BEGIN
	SELECT  
		Empleados.id,
		Empleados.nombres ,
		Empleados.apellidos ,
		Empleados.email ,
		Empleados.telefono ,
		Empleados.fechaContratacion ,
		Empleados.sueldo ,
		Departamentos.nombre as nombreDepartamento,
		Cargos.nombre as nombreCargo,
		Horarios.horarioEntrada,
        Horarios.horarioSalida,
		Administracion.direccion 
	FROM
        Empleados INNER JOIN Departamentos ON
        Empleados.codigoDepartamento=Departamentos.id
        INNER JOIN Cargos ON
        Empleados.codigoCargo=Cargos.id
        INNER JOIN Horarios ON  
        Empleados.codigoHorario=Horarios.id
        INNER JOIN Administracion ON
        Empleados.codigoAdministracion=Administracion.id;
END $$
DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE Reporte Administracion por id
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ReporteAdministracionEmpleadosPorId;
DELIMITER $$
CREATE PROCEDURE sp_ReporteAdministracionEmpleadosPorId(IN _id INT)
BEGIN
	SELECT  
		Empleados.id as idEmpleado,
		Empleados.nombres ,
		Empleados.apellidos ,
		Empleados.email ,
		Empleados.telefono as telefonoEmpleado ,
		Empleados.fechaContratacion ,
		Empleados.sueldo ,
		Departamentos.nombre as nombreDepartamento,
		Cargos.nombre as nombreCargo,
		Horarios.horarioEntrada,
        Horarios.horarioSalida,
		Administracion.id as idAdministracion ,
        Administracion.telefono as telefonoAdministracion,
        Administracion.direccion
        FROM
        Empleados INNER JOIN Departamentos ON
        Empleados.codigoDepartamento=Departamentos.id
        INNER JOIN Cargos ON
        Empleados.codigoCargo=Cargos.id
        INNER JOIN Horarios ON  
        Empleados.codigoHorario=Horarios.id
        INNER JOIN Administracion ON
        Empleados.codigoAdministracion=Administracion.id
        WHERE Administracion.id=_id;
END $$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE Reporte Administracion por id
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ReporteCuentasPorPagar;
DELIMITER $$
CREATE PROCEDURE sp_ReporteCuentasPorPagar()
BEGIN
	SELECT  
		CuentasPorPagar.id,
        CuentasPorPagar.numeroFactura,
        CuentasPorPagar.fechaLimitePago,
        CuentasPorPagar.estadoPago,
        CuentasPorPagar.valorNetoPago,
        Administracion.direccion as direccionAdministracion,
        Proveedores.nit,
        Proveedores.servicioPrestado,
        Proveedores.saldoFavor,
        Proveedores.saldoContra
        FROM
        CuentasPorPagar INNER JOIN Administracion
        ON CuentasPorPagar.codigoAdministracion=Administracion.id
        INNER JOIN Proveedores
        ON CuentasPorPagar.codigoProveedor=Proveedores.id;
END $$
DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE Trigger meses pendientes
-- -----------------------------------------------------
DELIMITER $$
-- DROP TRIGGER tr_CuentasPorCobrar_After_Update;
CREATE TRIGGER tr_CuentasPorCobrar_After_Update
AFTER UPDATE ON CuentasPorCobrar
FOR EACH ROW
 BEGIN
	DECLARE _mesesPendientes INT;
   SET _mesesPendientes=(SELECT COUNT(*) FROM CuentasPorCobrar WHERE codigoLocal=NEW.codigoLocal AND estadoPago='PENDIENTE');
	UPDATE Locales SET mesesPendientes= _mesesPendientes
    WHERE Locales.id=NEW.id;
 END $$
 DELIMITER ;

-- -----------------------------------------------------
-- Datos de prueba
-- -----------------------------------------------------

CALL sp_AgregarAdministracion("Diagonal 6 12-42, Zona 10, Ciudad de Guatemala", "45623589");
CALL sp_AgregarAdministracion("12 Calle 1-25, Zona 10, Ciudad de Guatemala", "79654875");
CALL sp_AgregarAdministracion("9na calle 15-77, Zona 7, Ciudad de Guatemala", "79654875");
CALL sp_AgregarAdministracion("3ra Avenida 8-05, Bosques de San Nicolás, Zona 8, Guatemala", "79654875");

CALL sp_AgregarLocales(5000.00, 7000.00, 1, false, 20000.00, 1000.00);
CALL sp_AgregarLocales(10000.00, 10000.00, 0, false, 5000.00, 1000.00);
CALL sp_AgregarLocales(0.00, 30000.00, 6, false, 5000.00, 1000.00);
CALL sp_AgregarLocales(450.00, 30000.00, 1, true, 4000.00, 2000.00);
CALL sp_AgregarLocales(8000.00, 70000.00, 0, true, 6000.00, 4000.00);
CALL sp_AgregarLocales(400.00, 40000.00, 2, true, 7000.00, 6000.00);
CALL sp_AgregarLocales(500.00, 80000.00, 6, false, 8000.00, 2000.00);
CALL sp_AgregarLocales(600.00, 90000.00, 4, true, 9000.00, 8000.00);
CALL sp_AgregarLocales(700.00, 10000.00, 9, false, 2000.00, 1000.00);
CALL sp_AgregarLocales(800.00, 30000.00, 3, true, 9000.00, 3000.00);

CALL sp_AgregarDepartamentos("Directivo");
CALL sp_AgregarDepartamentos("Ejecutivo");
CALL sp_AgregarDepartamentos("Cuentas");
CALL sp_AgregarDepartamentos("Creativo");

CALL sp_AgregarCargos("Director");
CALL sp_AgregarCargos("Contador");
CALL sp_AgregarCargos("Secretario");
CALL sp_AgregarCargos("Conserje");

CALL sp_AgregarTipoCliente("Bronce");
CALL sp_AgregarTipoCliente("Plata");
CALL sp_AgregarTipoCliente("Oro");
CALL sp_AgregarTipoCliente("Diamante");

CALL sp_AgregarProveedores("14568598", "Agua Potable", "85989889", "zona 4", 9000.00, 5000.00);
CALL sp_AgregarProveedores("51458546", "Venta de Gas", "45432425", "zona 5", 8000.00, 8000.00);
CALL sp_AgregarProveedores("89845456", "Energia electrica", "85978545", "zona 10", 7000.00, 3000.00);
CALL sp_AgregarProveedores("89965454", "Seguridad", "97524565", "zona 12", 4000.00, 6000.00);

CALL sp_AgregarClientes("Jorge", "Pérez", "45236598", "Zona 11", "jperez@gmail.com", 1);
CALL sp_AgregarClientes("Luis", "Canto", "65987465", "Zona 7", "lcanto@gmail.com", 2);
CALL sp_AgregarClientes("Mariela", "Hernández", "75648934", "Zona 14", "mhernandez@gmail.com", 4);
CALL sp_AgregarClientes("Carlos", "Fernández", "78943294", "Zona 1", "carlfern@gmail.com", 3);

CALL sp_AgregarCuentasPorCobrar("1",2020,06,25.00,"PAGADO", 1,1,1);
CALL sp_AgregarCuentasPorCobrar("45",2021,01,56.00,"PAGADO",2,2,2);
CALL sp_AgregarCuentasPorCobrar("5",2021,04,90.00,"PENDIENTE",1,3,1);
CALL sp_AgregarCuentasPorCobrar("20",2021,09,26.00,"PENDIENTE",2,1,2);

CALL sp_AgregarHorarios(070000,120000,1,1,0,0,0);
CALL sp_AgregarHorarios(120100,180000,1,1,1,0,0);
CALL sp_AgregarHorarios(180100,220000,1,1,1,0,0);
CALL sp_AgregarHorarios(070000,180000,1,1,1,1,1);

CALL sp_AgregarEmpleados("Carla", "Gonzalez", "carlagon@gmail.com", "85956345", 20200714, 9500.00, 1, 1, 4, 1);
CALL sp_AgregarEmpleados("Esteban", "Ramos", "estera@gmail.com", "85964587", 20210517, 3000.00, 2, 2, 1, 2);
CALL sp_AgregarEmpleados("Maria", "Garcia", "mariga@gmail.com", "89474524", 20210210, 3500.00, 3, 3, 2, 3);
CALL sp_AgregarEmpleados("Andres", "Solares", "solaresand@gmail.com", "52859845", 20201120, 2800.00, 4, 4, 3, 4);

CALL sp_AgregarCuentasPorPagar("B-4",20210801, "PAGADO", 4000.00, 1,1);
CALL sp_AgregarCuentasPorPagar("SRC-1",20210810, "PAGADO", 8000.00, 2,2);
CALL sp_AgregarCuentasPorPagar("A-1",20210805, "PAGADO", 3000.00, 3,3);
CALL sp_AgregarCuentasPorPagar("T-2",20210731, "PENDIENTE", 6000.00, 4,4);

INSERT INTO Rol(descripcion) values ("Administrador");
INSERT INTO Rol(descripcion) values ("Estandar");

INSERT INTO Usuario(user, pass, nombre, rol) values ("Admin", "YWRtaW4=", "Diego", 1);
INSERT INTO Usuario(user, pass, nombre, rol) values ("User", "dXNlcg==","Usuario desconocido",  2);
INSERT INTO Usuario(user, pass, nombre, rol) values ("root", "YWRtaW4=", "administrador", 1);
INSERT INTO Usuario(user, pass, nombre, rol) values ("kinal", "MTIzNDU=","kinal",  2);




