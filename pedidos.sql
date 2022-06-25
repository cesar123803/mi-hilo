-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 25-06-2022 a las 22:16:58
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

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

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `codigoAdministrador` int(4) NOT NULL AUTO_INCREMENT,
  `contraseñaAdministrador` varchar(45) NOT NULL,
  PRIMARY KEY (`codigoAdministrador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `documentocliente` varchar(20) NOT NULL,
  `codigoDocumento` int(5) NOT NULL AUTO_INCREMENT,
  `nombrecliente` varchar(45) NOT NULL,
  `apellidocliente` varchar(45) NOT NULL,
  `telefonocliente` varchar(10) NOT NULL,
  `contraseñacliente` int(5) NOT NULL,
  `ciudadcliente` varchar(45) NOT NULL,
  `correocliente` varchar(45) NOT NULL,
  PRIMARY KEY (`documentocliente`),
  KEY `codigoDocumento_idx` (`codigoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposito`
--

DROP TABLE IF EXISTS `deposito`;
CREATE TABLE IF NOT EXISTS `deposito` (
  `codigoDeposito` int(11) NOT NULL,
  `numeroFactura` varchar(10) NOT NULL,
  `codigoProveedores` int(4) NOT NULL,
  `fechaDeposito` date NOT NULL,
  `horaDeposito` time NOT NULL,
  `valorDeposito` float(10,2) NOT NULL,
  `ivaDeposito` float(10,2) NOT NULL,
  `totalDeposito` float(10,2) NOT NULL,
  PRIMARY KEY (`codigoDeposito`),
  KEY `numeroFactura_idx` (`numeroFactura`),
  KEY `codigoProveedores2_idx` (`codigoProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

DROP TABLE IF EXISTS `detallepedido`;
CREATE TABLE IF NOT EXISTS `detallepedido` (
  `codigoPedido` int(5) NOT NULL,
  `codigoProducto` int(4) NOT NULL,
  `cantidadDetallepedido` int(4) NOT NULL,
  `detallepedido` varchar(45) NOT NULL,
  `valorunitarioDetallepedido` float(10,2) NOT NULL,
  `totalDetallepedido` float(10,2) NOT NULL,
  `ivaDetallepedido` float(10,2) NOT NULL,
  `pagaDetallepedido` float(10,2) NOT NULL,
  KEY `codigoProducto_idx` (`codigoProducto`),
  KEY `codigoPedido_idx` (`codigoPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

DROP TABLE IF EXISTS `documentos`;
CREATE TABLE IF NOT EXISTS `documentos` (
  `codigoDocumento` int(5) NOT NULL,
  `numeroDocumento` varchar(20) NOT NULL,
  PRIMARY KEY (`codigoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`codigoDocumento`, `numeroDocumento`) VALUES
(444, '9095'),
(565, '7777');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `numeroFactura` varchar(10) NOT NULL,
  `codigoPedido` int(4) NOT NULL AUTO_INCREMENT,
  `fechaFactura` date NOT NULL,
  `ivaFactura` float(10,2) NOT NULL,
  `valorUnitarioFactura` int(12) DEFAULT NULL,
  `totalFactura` float(10,2) NOT NULL,
  `horaFactura` time NOT NULL,
  PRIMARY KEY (`numeroFactura`),
  KEY `codigoPedido2_idx` (`codigoPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `codigoPedido` int(5) NOT NULL,
  `fechaPedido` date NOT NULL,
  `horaPedido` time NOT NULL,
  `documentoCliente` varchar(20) NOT NULL,
  PRIMARY KEY (`codigoPedido`),
  KEY `documentoCliente_idx` (`documentoCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `codigoproducto` int(4) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `entradaProducto` int(4) NOT NULL,
  `salidaProducto` int(4) NOT NULL,
  `existenciasProducto` int(6) NOT NULL,
  `valorProducto` float(10,2) NOT NULL,
  `codigoProveedores` int(4) NOT NULL,
  PRIMARY KEY (`codigoproducto`),
  KEY `codigoProveedores_idx` (`codigoProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `codigoProveedores` int(4) NOT NULL,
  `nombreProveedores` varchar(45) NOT NULL,
  `apellidoProveedores` varchar(45) NOT NULL,
  `direccionProveedores` varchar(45) NOT NULL,
  `telefonoProveedores` varchar(45) NOT NULL,
  `ciudadProveedores` varchar(20) NOT NULL,
  `correoProveedores` varchar(45) NOT NULL,
  `contraseñaProveedores` int(20) NOT NULL,
  PRIMARY KEY (`codigoProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`codigoProveedores`, `nombreProveedores`, `apellidoProveedores`, `direccionProveedores`, `telefonoProveedores`, `ciudadProveedores`, `correoProveedores`, `contraseñaProveedores`) VALUES
(2, 'tatiana maria', '###ghhh', '78999', 'benitez castro', 'villa de leiva', 'tata344@gmail.com', 78798),
(3, 'ovy', 'dnoiwm', '37901', 'tompson', 'chicago', 'ovoro@gmail.com', 9890);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `codigoUsuario` int(4) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `apellidoUsuario` varchar(45) NOT NULL,
  `telefonoUsuario` int(20) NOT NULL,
  `ciudadUsuario` varchar(20) NOT NULL,
  `correoUsuario` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `contraseñaUsuario` varchar(45) NOT NULL,
  `informacionUsuario` varchar(45) NOT NULL,
  `codigoAdministrador` int(4) NOT NULL,
  `codigoDocumento` int(12) NOT NULL,
  PRIMARY KEY (`codigoUsuario`),
  KEY `codigoAdministrador_idx` (`codigoAdministrador`),
  KEY `codigoDocumento2_idx` (`codigoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD CONSTRAINT `documentoCliente` FOREIGN KEY (`documentoCliente`) REFERENCES `clientes` (`documentocliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
