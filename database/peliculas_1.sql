-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2023 a las 20:46:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peliculas_1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `ACT_ID` int(11) NOT NULL COMMENT 'Id',
  `SEX_ID` int(11) DEFAULT NULL COMMENT 'Sexo',
  `ACT_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Apellidos y nombre de los actores';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor_pelicula`
--

CREATE TABLE `actor_pelicula` (
  `APL_ID` int(11) NOT NULL COMMENT 'Id',
  `ACT_ID` int(11) DEFAULT NULL COMMENT 'Actor',
  `PEL_ID` int(11) DEFAULT NULL COMMENT 'Película',
  `APL_PAPEL` varchar(60) NOT NULL COMMENT 'Papel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Registro de Papel en la Pelicula\r\nActor Principal';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `ALQ_ID` int(11) NOT NULL COMMENT 'Id',
  `SOC_ID` int(11) DEFAULT NULL COMMENT 'Socio',
  `PEL_ID` int(11) DEFAULT NULL COMMENT 'Película',
  `ALQ_FECHA_DESDE` date NOT NULL COMMENT 'Fecha Inicial',
  `ALQ_FECHA_HASTA` date NOT NULL COMMENT 'Fecha Final',
  `ALQ_VALOR` decimal(10,2) NOT NULL COMMENT 'Valor',
  `ALQ_FECHA_ENTREGA` date DEFAULT NULL COMMENT 'Fecha Entrega'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Datos de Alquiler de la Pelicula al Socio';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `DIR_ID` int(11) NOT NULL COMMENT 'Id',
  `DIR_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Nombre del director de la pelicula';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formato`
--

CREATE TABLE `formato` (
  `FOR_ID` int(11) NOT NULL COMMENT 'Id',
  `FOR_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='CD\r\nDVD\r\nVHS';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `GEN_ID` int(11) NOT NULL COMMENT 'Id',
  `GEN_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Romantca\r\nComico\r\nCiencia Ficcion\r\nDeportes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `PEL_ID` int(11) NOT NULL COMMENT 'Id',
  `GEN_ID` int(11) DEFAULT NULL COMMENT 'Genero',
  `DIR_ID` int(11) DEFAULT NULL COMMENT 'Director',
  `FOR_ID` int(11) DEFAULT NULL COMMENT 'Formato',
  `PEL_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre',
  `PEL_COSTO` decimal(10,2) NOT NULL COMMENT 'Costo',
  `PEL_FECHA_ESTRENO` date DEFAULT NULL COMMENT 'Fecha Estreno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Datos de Identocación de la Película';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `SEX_ID` int(11) NOT NULL COMMENT 'Id',
  `SEX_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Maculino\r\nFemenino';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `SOC_ID` int(11) NOT NULL COMMENT 'Id',
  `SOC_CEDULA` char(10) NOT NULL COMMENT 'Cédula',
  `SOC_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre',
  `SOC_DIRECCION` varchar(60) NOT NULL COMMENT 'Dirección',
  `SOC_TELEFONO` char(10) NOT NULL COMMENT 'Teléfono',
  `SOC_CORREO` varchar(60) NOT NULL COMMENT 'Correo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ACT_ID`),
  ADD KEY `Fn_SEXO_ACTOR` (`SEX_ID`);

--
-- Indices de la tabla `actor_pelicula`
--
ALTER TABLE `actor_pelicula`
  ADD PRIMARY KEY (`APL_ID`),
  ADD KEY `Fn_ACTOR_ACTORPELICULA` (`ACT_ID`),
  ADD KEY `Fn_PELICULA_ACTORPELICULA` (`PEL_ID`);

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`ALQ_ID`),
  ADD KEY `Fn_PELICULA_ALQUILER` (`PEL_ID`),
  ADD KEY `Fn_SOCIO_ALQUILER` (`SOC_ID`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`DIR_ID`);

--
-- Indices de la tabla `formato`
--
ALTER TABLE `formato`
  ADD PRIMARY KEY (`FOR_ID`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`GEN_ID`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`PEL_ID`),
  ADD KEY `Fn_DIRECTOR_PELICULA` (`DIR_ID`),
  ADD KEY `Fn_FORMATO_PELICULA` (`FOR_ID`),
  ADD KEY `Fn_GENERO_PELICULA` (`GEN_ID`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`SEX_ID`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`SOC_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor`
--
ALTER TABLE `actor`
  MODIFY `ACT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT de la tabla `actor_pelicula`
--
ALTER TABLE `actor_pelicula`
  MODIFY `APL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `ALQ_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT de la tabla `director`
--
ALTER TABLE `director`
  MODIFY `DIR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT de la tabla `formato`
--
ALTER TABLE `formato`
  MODIFY `FOR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `GEN_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `PEL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `SEX_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `SOC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `Fn_SEXO_ACTOR` FOREIGN KEY (`SEX_ID`) REFERENCES `sexo` (`SEX_ID`);

--
-- Filtros para la tabla `actor_pelicula`
--
ALTER TABLE `actor_pelicula`
  ADD CONSTRAINT `Fn_ACTOR_ACTORPELICULA` FOREIGN KEY (`ACT_ID`) REFERENCES `actor` (`ACT_ID`),
  ADD CONSTRAINT `Fn_PELICULA_ACTORPELICULA` FOREIGN KEY (`PEL_ID`) REFERENCES `pelicula` (`PEL_ID`);

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `Fn_PELICULA_ALQUILER` FOREIGN KEY (`PEL_ID`) REFERENCES `pelicula` (`PEL_ID`),
  ADD CONSTRAINT `Fn_SOCIO_ALQUILER` FOREIGN KEY (`SOC_ID`) REFERENCES `socio` (`SOC_ID`);

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `Fn_DIRECTOR_PELICULA` FOREIGN KEY (`DIR_ID`) REFERENCES `director` (`DIR_ID`),
  ADD CONSTRAINT `Fn_FORMATO_PELICULA` FOREIGN KEY (`FOR_ID`) REFERENCES `formato` (`FOR_ID`),
  ADD CONSTRAINT `Fn_GENERO_PELICULA` FOREIGN KEY (`GEN_ID`) REFERENCES `genero` (`GEN_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
