-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-01-2022 a las 10:01:49
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
-- Base de datos: `project`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `descripcion_categoria` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `date_added`) VALUES
(1, 'Computadoras', 'las computadoras de la institución educativa', '2022-01-27 05:19:26'),
(2, 'Impresoras', 'las impresoras de la institución educativa', '2022-01-27 05:20:24'),
(3, 'Proyectores', 'los proyectores de la institución educativa', '2022-01-27 05:20:43'),
(4, 'Cámaras de seguridad', 'las cámaras de seguridad de la institución educativa', '2022-01-27 05:21:21'),
(5, 'Ups', 'Ups de la institución educativa', '2022-01-27 05:27:45'),
(6, 'Routers', 'Routers de la institución educativa', '2022-01-27 05:32:09'),
(7, 'Switch Internet', 'Switch Internet de la institución educativa', '2022-01-27 05:35:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `nota` varchar(255) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id_historial`, `id_producto`, `user_id`, `fecha`, `nota`, `referencia`, `cantidad`) VALUES
(1, 1, 1, '2022-01-27 05:46:54', 'Obed agregó 30 producto(s) al inventario', 'COMP-01', 30),
(2, 2, 1, '2022-01-27 05:51:38', 'Obed agregó 4 producto(s) al inventario', 'CAM-HVDS2CD2', 4),
(3, 3, 1, '2022-01-27 05:53:42', 'Obed agregó 1 producto(s) al inventario', 'IMP-L6270', 1),
(4, 4, 1, '2022-01-27 05:55:22', 'Obed agregó 1 producto(s) al inventario', 'PROY-X49', 1),
(5, 5, 1, '2022-01-27 05:56:26', 'Obed agregó 1 producto(s) al inventario', 'ROUT-TLWR840N ', 1),
(6, 6, 1, '2022-01-27 05:57:31', 'Obed agregó 1 producto(s) al inventario', 'SWI-SG1024D', 1),
(7, 7, 1, '2022-01-27 05:58:41', 'Obed agregó 5 producto(s) al inventario', 'UPS-375W', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `fecha_mantenimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`id_mantenimiento`, `codigo`, `descripcion`, `id_categoria`, `fecha_mantenimiento`) VALUES
(9, 'aqsqw', 'zzz2', 7, '2022-01-07'),
(10, 'asas1212as', 'asaa', 1, '2022-01-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `date_added`, `precio_producto`, `stock`, `id_categoria`) VALUES
(1, 'COMP-HP705', 'Computadora HP 705 G1 AMD A4', '2022-01-27 05:46:54', 1500, 30, 1),
(2, 'CAM-HVDS2CD2', 'Camara IP Hikvision DS2CD2412F', '2022-01-27 05:51:38', 300, 4, 4),
(3, 'IMP-L6270', 'Impresora Ecotank L6270', '2022-01-27 05:53:42', 1800, 1, 2),
(4, 'PROY-X49', 'Epson PowerLite X49 3600-Lumen XGA 3LCD Projector', '2022-01-27 05:55:22', 2800, 1, 3),
(5, 'ROUT-TLWR840N', 'Router TP Link - Router Inalámbrico N TLWR840N 300Mbps Tp-Link', '2022-01-27 05:56:26', 130, 1, 6),
(6, 'SWI-SG1024D', 'SWITCH TP-LINK TL-SG1024D, 24 PUERTOS RJ-45 LAN GBE, NO ADMINISTRABLE', '2022-01-27 05:57:31', 600, 1, 7),
(7, 'UPS-375W', 'UPS Forza 750VA NT-752U 375W 6 Tomas 220V', '2022-01-27 05:58:41', 300, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`) VALUES
(1, 'Martha', 'Alvarado Juarez', 'admin', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'admin@admin.com', '2016-12-19 15:06:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`),
  ADD KEY `id_categoria_index` (`id_categoria`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
