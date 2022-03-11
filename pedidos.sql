-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-03-2022 a las 05:19:33
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pedidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `codigoAdministrador` int(4) NOT NULL,
  `contraseñaAdministrador` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `documentoCliente` varchar(20) NOT NULL,
  `codigoDocumento` int(5) NOT NULL,
  `nombreCliente` varchar(45) NOT NULL,
  `apellidoCliente` varchar(45) NOT NULL,
  `telefonoCliente` varchar(10) NOT NULL,
  `contraseñacliente` int(5) NOT NULL,
  `ciudadcliente` varchar(45) NOT NULL,
  `correocliente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposito`
--

CREATE TABLE `deposito` (
  `codigoDeposito` int(11) NOT NULL,
  `numeroFactura` varchar(10) NOT NULL,
  `codigoProveedores` int(4) NOT NULL,
  `fechaDeposito` date NOT NULL,
  `horaDeposito` time NOT NULL,
  `valorDeposito` float(10,2) NOT NULL,
  `ivaDeposito` float(10,2) NOT NULL,
  `totalDeposito` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `codigoPedido` int(5) NOT NULL,
  `codigoProducto` int(4) NOT NULL,
  `cantidadDetallepedido` int(4) NOT NULL,
  `detallepedido` varchar(45) NOT NULL,
  `valorunitarioDetallepedido` float(10,2) NOT NULL,
  `totalDetallepedido` float(10,2) NOT NULL,
  `ivaDetallepedido` float(10,2) NOT NULL,
  `pagaDetallepedido` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `codigoDocumento` int(5) NOT NULL,
  `numeroDocumento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `numeroFactura` varchar(10) NOT NULL,
  `codigoPedido` int(4) NOT NULL,
  `fechaFactura` date NOT NULL,
  `ivaFactura` float(10,2) NOT NULL,
  `totalFactura` float(10,2) NOT NULL,
  `horaFactura` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `codigoPedido` int(5) NOT NULL,
  `fechaPedido` date NOT NULL,
  `horaPedido` time NOT NULL,
  `documentoCliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigoproducto` int(4) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `entradaProducto` int(4) NOT NULL,
  `salidaProducto` int(4) NOT NULL,
  `existenciasProducto` int(6) NOT NULL,
  `valorProducto` float(10,2) NOT NULL,
  `codigoProveedores` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `codigoProveedores` int(4) NOT NULL,
  `nombreProveedores` varchar(45) NOT NULL,
  `direccionProveedores` varchar(45) NOT NULL,
  `telefonoProveedores` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigoUsuario` int(4) NOT NULL,
  `contraseñaUsuario` varchar(45) NOT NULL,
  `informacionUsuario` varchar(45) NOT NULL,
  `codigoAdministrador` int(4) NOT NULL,
  `codigoDocumento` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`codigoAdministrador`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`documentoCliente`),
  ADD KEY `codigoDocumento_idx` (`codigoDocumento`);

--
-- Indices de la tabla `deposito`
--
ALTER TABLE `deposito`
  ADD PRIMARY KEY (`codigoDeposito`),
  ADD KEY `numeroFactura_idx` (`numeroFactura`),
  ADD KEY `codigoProveedores2_idx` (`codigoProveedores`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD KEY `codigoProducto_idx` (`codigoProducto`),
  ADD KEY `codigoPedido_idx` (`codigoPedido`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`codigoDocumento`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`numeroFactura`),
  ADD KEY `codigoPedido2_idx` (`codigoPedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`codigoPedido`),
  ADD KEY `documentoCliente_idx` (`documentoCliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigoproducto`),
  ADD KEY `codigoProveedores_idx` (`codigoProveedores`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`codigoProveedores`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigoUsuario`),
  ADD KEY `codigoAdministrador_idx` (`codigoAdministrador`),
  ADD KEY `codigoDocumento2_idx` (`codigoDocumento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `codigoAdministrador` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codigoDocumento` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `codigoPedido` int(4) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `codigoDocumento` FOREIGN KEY (`codigoDocumento`) REFERENCES `documentos` (`codigoDocumento`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `deposito`
--
ALTER TABLE `deposito`
  ADD CONSTRAINT `codigoProveedores2` FOREIGN KEY (`codigoProveedores`) REFERENCES `proveedores` (`codigoProveedores`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `numeroFactura` FOREIGN KEY (`numeroFactura`) REFERENCES `factura` (`numeroFactura`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `codigoPedido` FOREIGN KEY (`codigoPedido`) REFERENCES `pedidos` (`codigoPedido`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `codigoProducto` FOREIGN KEY (`codigoProducto`) REFERENCES `productos` (`codigoproducto`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `codigoPedido2` FOREIGN KEY (`codigoPedido`) REFERENCES `pedidos` (`codigoPedido`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `documentoCliente` FOREIGN KEY (`documentoCliente`) REFERENCES `clientes` (`documentoCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `codigoProveedores` FOREIGN KEY (`codigoProveedores`) REFERENCES `proveedores` (`codigoProveedores`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `codigoAdministrador` FOREIGN KEY (`codigoAdministrador`) REFERENCES `administrador` (`codigoAdministrador`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `codigoDocumento2` FOREIGN KEY (`codigoDocumento`) REFERENCES `documentos` (`codigoDocumento`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
