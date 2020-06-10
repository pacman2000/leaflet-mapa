-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2020 a las 09:46:13
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(65) NOT NULL,
  `lat` decimal(8,4) NOT NULL,
  `lng` decimal(8,4) NOT NULL,
  `kind_food` set('Mexican','Indian','Vegetarian','Mediterranean','Fastfood','Italian','Tapas','Japanese','Asian','Cafe','Pizzeria') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`) VALUES
(1, 'Porta Nuova', 'Enric Granados 97 local 3 - 08330 Premià de Mar', '41.4955', '2.3611', 'Italian,Pizzeria'),
(2, 'PizzOria', 'Gran Via 68 - 08330 Premià de Mar', '41.4900', '2.3518', 'Pizzeria'),
(3, 'La Piparra', 'Joan Prim 90-92 - 08330 Premià de Mar', '41.4988', '2.3569', 'Mediterranean,Tapas'),
(4, 'Offu Sushi Bar', 'Cami Ral s/n. Marina Port Premià loca 26 - 08330 Premià de Mar', '41.4897', '2.3665', 'Japanese,Asian'),
(5, 'Casa Galicia', 'Ramon Llull 26 - 08330 Premià de Mar', '41.4936', '2.3609', 'Mediterranean,Tapas'),
(6, 'Bar del mig', 'De la Plaça 12 - 08330 Premià de Mar', '41.4899', '2.3571', 'Mediterranean,Tapas'),
(7, 'Poc a foc', 'Camp de mar 8 - 08330 Premià de Mar', '41.4948', '2.3737', 'Vegetarian,Mediterranean'),
(8, 'El Rebost', 'Ctra.Vilassar 143 - 08330 Premià de Mar', '41.4983', '2.3594', 'Vegetarian,Mediterranean'),
(9, 'Cromatic', 'Francesc Moragas 30 - 08330 Premià de Mar', '41.4904', '2.3579', 'Mediterranean'),
(10, 'Sushi Ra', 'Ctra.Premià 62 - 08330 Premià de Mar', '41.4909', '2.3523', 'Japanese,Asian'),
(11, 'El 169', 'Gran Via 169 - 08330 Premà de Mar', '41.4926', '2.3573', 'Mediterranean,Tapas'),
(12, 'Far d\'en Roc', 'Gran Via 215A - 08330 Premià de Mar', '41.4940', '2.3607', 'Mediterranean'),
(13, 'Viva México', 'Enric Granados 21 - 08330 Premià de Mar', '41.4930', '2.3556', 'Mexican');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`,`address`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
