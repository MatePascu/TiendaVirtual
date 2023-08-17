-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 30-03-2021 a las 08:20:37
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tiendavirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(1, 'Chaquetas', 'Lo mejor en moda', 'img_1706b9300f46dc7a373cdc6ae8928895.jpg', '2020-10-23 03:14:08', 'chaquetas', 1),
(2, 'Blusas', 'Las chicas perfectas', 'img_4e01ad64d99f3fba516bc77d198ce17f.jpg', '2020-10-23 03:17:26', 'blusas', 1),
(3, 'Jeans', 'Lo mejor en Jeans', 'img_6cfc2c38c15593e36a5e41795ea1de32.jpg', '2020-10-23 03:17:42', 'jeans', 1),
(4, 'Caballero', 'Productos para caballeros', 'img_a939c8d8ca5784159a43d0d82b80582d.jpg', '2020-10-28 03:45:12', 'caballero', 1),
(5, 'Damas', 'Productos para damas', 'img_5dafcd6ec18901c147c7cfde850a1ab1.jpg', '2020-10-30 03:05:09', 'damas', 1),
(6, 'Accesorios', 'Accesorios varios', 'img_84f83e4988f31e6fd25e9d2df04d3f7f.jpg', '2020-11-14 00:21:15', 'accesorios', 1),
(7, 'Categoria ejemplo', 'Descripción categoría ejemplo', 'portada_categoria.png', '2020-12-05 22:38:27', 'categoria-ejemplo', 1),
(8, 'Caterogía 20', 'Descripción', 'portada_categoria.png', '2020-12-05 23:00:16', 'caterogia-20', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid` (`pedidoid`),
  KEY `productoid` (`productoid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedidoid`, `productoid`, `precio`, `cantidad`) VALUES
(1, 2, 11, '100.00', 2),
(2, 2, 12, '110.00', 1),
(3, 3, 13, '100.00', 1),
(4, 3, 12, '110.00', 1),
(5, 3, 11, '100.00', 2),
(6, 4, 12, '110.00', 1),
(7, 4, 11, '100.00', 2),
(8, 5, 12, '110.00', 1),
(9, 5, 13, '100.00', 1),
(10, 6, 12, '110.00', 2),
(11, 6, 8, '50.00', 1),
(12, 7, 11, '100.00', 1),
(13, 8, 12, '110.00', 1),
(14, 8, 11, '100.00', 1),
(15, 9, 12, '110.00', 1),
(16, 9, 11, '100.00', 1),
(17, 9, 13, '100.00', 1),
(18, 10, 12, '89000.00', 1),
(19, 10, 13, '105000.00', 1),
(20, 10, 11, '69000.00', 1),
(21, 10, 10, '75000.00', 1),
(22, 11, 6, '50.00', 1),
(23, 11, 7, '100.00', 1),
(24, 12, 6, '50.00', 1),
(25, 12, 7, '100.00', 1),
(26, 12, 3, '200.00', 1),
(27, 13, 4, '50.00', 1),
(28, 13, 3, '200.00', 1),
(29, 13, 2, '110.00', 1),
(30, 14, 9, '120.00', 2),
(31, 14, 7, '100.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

DROP TABLE IF EXISTS `detalle_temp`;
CREATE TABLE IF NOT EXISTS `detalle_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `personaid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `transaccionid` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  KEY `personaid` (`personaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

DROP TABLE IF EXISTS `imagen`;
CREATE TABLE IF NOT EXISTS `imagen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `productoid`, `img`) VALUES
(3, 3, 'pro_e702903506bd14ecc0e5645cc8a308d2.jpg'),
(4, 3, 'pro_c3abd10d62fa7b01e8dfd61e18118913.jpg'),
(5, 4, 'pro_3e64800e9336055a0a58b69fdad32048.jpg'),
(6, 5, 'pro_bd7592482a91f4531d8a10ab3d815945.jpg'),
(7, 5, 'pro_d8444581afca144189dcfa8303dd58ee.jpg'),
(8, 7, 'pro_1abf3c3c00b89188b25e324dc39d6f62.jpg'),
(10, 8, 'pro_e0c8f0211ec0cf449278010dcbd64da6.jpg'),
(11, 8, 'pro_b4c0c0e77f29cbc207bd1f8bbeb30e02.jpg'),
(12, 7, 'pro_50458020b4d9ac78098be1649bcad5a8.jpg'),
(13, 9, 'pro_14b6a7a08d0aa5a2b779db08bc35c439.jpg'),
(19, 2, 'pro_25bff00db4ed6a2e028cb28195cfa649.jpg'),
(20, 2, 'pro_75f4d282b2735d59287c551e6c2a094e.jpg'),
(21, 6, 'pro_bba122841772a79d9089efe260b0d585.jpg'),
(22, 6, 'pro_bf14fed939b2da088255727ede14a1f8.jpg'),
(24, 10, 'pro_6c0537968a89765773d91230daef622a.jpg'),
(25, 10, 'pro_e3345c10650826ea67447733e65e63a8.jpg'),
(27, 11, 'pro_2742b9f94da4267903f22e05a1ed08d4.jpg'),
(28, 11, 'pro_b9b6a5888dd066a017b0e20ca68eee5d.jpg'),
(29, 11, 'pro_ecad1c55690162bc9e1ed58c767f3987.jpg'),
(30, 12, 'pro_d1d4ad5e1603d3c15a440e5dd4c5cb0c.jpg'),
(31, 12, 'pro_c6f6b5eea4c76ed9bc3a58472c6468b7.jpg'),
(32, 12, 'pro_c5b9a923e22639730766f5b9a88773fd.jpg'),
(33, 12, 'pro_616b30feafb00faca08cb1019150610f.jpg'),
(35, 13, 'pro_c820f0c056787c3d172711fb10d1f14a.jpg'),
(36, 13, 'pro_e3a6cb1dd8d87357c40b8e9d33e65821.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

DROP TABLE IF EXISTS `modulo`;
CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Pedidos', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `referenciacobro` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datospaypal` text COLLATE utf8mb4_swedish_ci,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `costo_envio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `direccion_envio` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `personaid` (`personaid`),
  KEY `tipopagoid` (`tipopagoid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`) VALUES
(2, NULL, '7BU95567U55365645', '{\"create_time\":\"2021-01-17T09:01:36Z\",\"update_time\":\"2021-01-17T09:02:02Z\",\"id\":\"3VK75882F34554627\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $310 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"310.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"7BU95567U55365645\",\"final_capture\":true,\"create_time\":\"2021-01-17T09:02:02Z\",\"update_time\":\"2021-01-17T09:02:02Z\",\"amount\":{\"value\":\"310.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/7BU95567U55365645\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/7BU95567U55365645/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3VK75882F34554627\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3VK75882F34554627\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-01-17 03:02:04', '0.00', '310.00', 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(3, NULL, '37081667RU111502T', '{\"create_time\":\"2021-01-17T09:33:36Z\",\"update_time\":\"2021-01-17T09:33:59Z\",\"id\":\"3HB192330A9317440\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $410 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"410.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"37081667RU111502T\",\"final_capture\":true,\"create_time\":\"2021-01-17T09:33:59Z\",\"update_time\":\"2021-01-17T09:33:59Z\",\"amount\":{\"value\":\"410.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/37081667RU111502T\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/37081667RU111502T/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3HB192330A9317440\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3HB192330A9317440\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-01-17 03:34:01', '0.00', '410.00', 1, 'Antigua Guatemala, Guatemala', 'Completo'),
(4, '11122233', NULL, NULL, 10, '2021-01-20 00:21:26', '0.00', '310.00', 2, 'Antigua Guatemala, Guatemala', 'Completo'),
(5, '121212121', NULL, NULL, 9, '2021-01-23 00:42:25', '10.00', '220.00', 3, 'Avenida Las Américas, Guatemala', 'Entregado'),
(6, NULL, '2WT620579H276492F', '{\"create_time\":\"2021-01-25T07:58:52Z\",\"update_time\":\"2021-01-25T07:59:54Z\",\"id\":\"3HA78832GE573821B\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $290 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"290.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"2WT620579H276492F\",\"final_capture\":true,\"create_time\":\"2021-01-25T07:59:54Z\",\"update_time\":\"2021-01-25T07:59:54Z\",\"amount\":{\"value\":\"290.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/2WT620579H276492F\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/2WT620579H276492F/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3HA78832GE573821B\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3HA78832GE573821B\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 10, '2021-01-25 01:59:55', '20.00', '290.00', 1, 'Antigua Guatemala, Guatemala', 'Completo'),
(7, NULL, '2XV84723902906409', '{\"create_time\":\"2021-01-25T08:02:20Z\",\"update_time\":\"2021-01-25T08:02:38Z\",\"id\":\"31P81624HK9799416\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $120 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"120.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"2XV84723902906409\",\"final_capture\":true,\"create_time\":\"2021-01-25T08:02:38Z\",\"update_time\":\"2021-01-25T08:02:38Z\",\"amount\":{\"value\":\"120.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/2XV84723902906409\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/2XV84723902906409/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/31P81624HK9799416\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/31P81624HK9799416\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-01-25 02:02:39', '20.00', '120.00', 1, 'Guatemala, Guatemala', 'Completo'),
(8, NULL, '9JJ17208367302546', '{\"create_time\":\"2021-01-25T08:20:41Z\",\"update_time\":\"2021-01-25T08:21:45Z\",\"id\":\"9LN50929CS669412W\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $230 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"230.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"9JJ17208367302546\",\"final_capture\":true,\"create_time\":\"2021-01-25T08:21:45Z\",\"update_time\":\"2021-01-25T08:21:45Z\",\"amount\":{\"value\":\"230.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/9JJ17208367302546\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/9JJ17208367302546/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9LN50929CS669412W\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9LN50929CS669412W\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-01-25 02:21:46', '20.00', '230.00', 1, 'Antigua Guatemala, Guatemala', 'Completo'),
(9, NULL, '3A418824P3757402W', '{\"create_time\":\"2021-01-26T08:38:30Z\",\"update_time\":\"2021-01-26T08:39:55Z\",\"id\":\"1FR7854608373410U\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $330 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"330.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"3A418824P3757402W\",\"final_capture\":true,\"create_time\":\"2021-01-26T08:39:55Z\",\"update_time\":\"2021-01-26T08:39:55Z\",\"amount\":{\"value\":\"330.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/3A418824P3757402W\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/3A418824P3757402W/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/1FR7854608373410U\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/1FR7854608373410U\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 10, '2021-01-26 02:39:57', '20.00', '330.00', 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(10, '465465454455', NULL, NULL, 9, '2021-01-29 22:35:52', '20.00', '338020.00', 3, 'Antigua Guatemala, Guatemala', 'Pendiente'),
(11, NULL, '5B6699765E4675415', '{\"create_time\":\"2021-02-02T06:36:24Z\",\"update_time\":\"2021-02-02T06:37:29Z\",\"id\":\"0EE39518MJ871604Y\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $200 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"200.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"5B6699765E4675415\",\"final_capture\":true,\"create_time\":\"2021-02-02T06:37:29Z\",\"update_time\":\"2021-02-02T06:37:29Z\",\"amount\":{\"value\":\"200.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/5B6699765E4675415\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/5B6699765E4675415/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/0EE39518MJ871604Y\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/0EE39518MJ871604Y\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-02-02 00:37:31', '50.00', '200.00', 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(12, NULL, '59T82017PV181852C', '{\"create_time\":\"2021-02-02T06:54:31Z\",\"update_time\":\"2021-02-02T06:55:20Z\",\"id\":\"09945675P26393337\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $400 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"400.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"59T82017PV181852C\",\"final_capture\":true,\"create_time\":\"2021-02-02T06:55:20Z\",\"update_time\":\"2021-02-02T06:55:20Z\",\"amount\":{\"value\":\"400.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/59T82017PV181852C\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/59T82017PV181852C/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/09945675P26393337\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/09945675P26393337\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-02-02 00:55:22', '50.00', '400.00', 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(13, NULL, '89T8947688556831X', '{\"create_time\":\"2021-02-11T06:17:03Z\",\"update_time\":\"2021-02-11T06:22:46Z\",\"id\":\"37K32135161933947\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $410 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"410.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"89T8947688556831X\",\"final_capture\":true,\"create_time\":\"2021-02-11T06:22:46Z\",\"update_time\":\"2021-02-11T06:22:46Z\",\"amount\":{\"value\":\"410.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/89T8947688556831X\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/89T8947688556831X/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/37K32135161933947\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/37K32135161933947\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-02-11 00:22:49', '50.00', '410.00', 1, 'Avenida Las Américas, Guatemala', 'Reembolsado'),
(14, NULL, '91E06461TP650463J', '{\"create_time\":\"2021-02-11T06:32:13Z\",\"update_time\":\"2021-02-11T06:32:57Z\",\"id\":\"9D4191826X5234304\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $390 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"390.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"91E06461TP650463J\",\"final_capture\":true,\"create_time\":\"2021-02-11T06:32:57Z\",\"update_time\":\"2021-02-11T06:32:57Z\",\"amount\":{\"value\":\"390.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/91E06461TP650463J\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/91E06461TP650463J/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9D4191826X5234304\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9D4191826X5234304\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-02-11 00:33:00', '50.00', '390.00', 1, 'Avenida Las Américas, Guatemala', 'Completo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT '0',
  `w` int(11) NOT NULL DEFAULT '0',
  `u` int(11) NOT NULL DEFAULT '0',
  `d` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpermiso`),
  KEY `rolid` (`rolid`),
  KEY `moduloid` (`moduloid`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(350, 2, 1, 1, 0, 0, 0),
(351, 2, 2, 0, 0, 0, 0),
(352, 2, 3, 0, 0, 0, 0),
(353, 2, 4, 0, 0, 0, 0),
(354, 2, 5, 0, 0, 0, 0),
(355, 2, 6, 0, 0, 0, 0),
(596, 3, 1, 1, 0, 0, 0),
(597, 3, 2, 0, 0, 0, 0),
(598, 3, 3, 0, 0, 0, 0),
(599, 3, 4, 0, 0, 0, 0),
(600, 3, 5, 0, 0, 0, 0),
(601, 3, 6, 0, 0, 0, 0),
(638, 7, 1, 0, 0, 0, 0),
(639, 7, 2, 0, 0, 0, 0),
(640, 7, 3, 0, 0, 0, 0),
(641, 7, 4, 0, 0, 0, 0),
(642, 7, 5, 1, 0, 0, 0),
(643, 7, 6, 0, 0, 0, 0),
(662, 1, 1, 1, 0, 0, 0),
(663, 1, 2, 1, 1, 1, 1),
(664, 1, 3, 1, 1, 1, 1),
(665, 1, 4, 1, 1, 1, 1),
(666, 1, 5, 1, 1, 1, 1),
(667, 1, 6, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` bigint(20) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(30) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpersona`),
  KEY `rolid` (`rolid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`) VALUES
(1, '2409198920', 'Abel', 'OSH', 1234567, 'info@abelosh.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '24252622', 'Abel OSH', 'Antigua Guatemala', '', 1, '2020-08-13 00:51:44', 1),
(2, '131313131313', 'Carlos', 'Hernández', 121212121, 'carlos@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '2c52a34f7988a0afc63e-dfe4badca8d2cb2b93e6-94824d050567a0ccd851-56165c5603c4ca020', 2, '2020-08-13 00:54:08', 1),
(3, '879846545454', 'Pablo', 'Arana', 784858856, 'pablo@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 3, '2020-08-14 01:42:34', 1),
(4, '65465465', 'Jorge David', 'Arana', 987846545, 'jorge@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 1, '2020-08-22 00:27:17', 1),
(5, '4654654', 'Carme Elena', 'Arana', 12121221, 'carmen@infom.com', 'be63ad947e82808780278e044bcd0267a6ac6b3cd1abdb107cc10b445a182eb0', '', '', '', '', 2, '2020-08-22 00:35:04', 1),
(6, '8465484', 'Alex Fernando', 'Méndez', 222222222, 'alex@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 3, '2020-08-22 00:48:50', 1),
(7, '54684987', 'Francisco', 'Herrera', 6654456545, 'francisco@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 2, '2020-08-22 01:55:57', 1),
(8, '54646849844', 'Axel Gudiel', 'Vela', 654687454, 'axel@info.com', '993fdea29acd1f7c6a6423c038601b175bb282382fc85b306a85f134fff4a63e', '', '', '', '', 3, '2020-09-07 01:30:52', 1),
(9, '46548454', 'Alan', 'Arenales', 45687954, 'alan@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Alan', 'Ciudad', '', 7, '2020-10-11 01:30:23', 1),
(10, '89898989', 'Rafa', 'Arana', 25478548, 'toolsfordeveloper@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Rafa Arana', 'Ciudad de Guatemala', '', 7, '2020-10-11 01:43:30', 1),
(11, '54789656458', 'Joel Eduardo', 'Cabrera', 54124528, 'joel@joel.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'CF', 'Joel Eduardo', 'Antigua Guatemala', '', 7, '2020-10-11 01:44:30', 1),
(12, '56874654', 'Pablo', 'Herrera', 65468464, 'pabloh@info.com', '7213f0b87347be4a36e70f9a9eeca3dfc48da72c6ef346871e36e6d53c5572c1', 'CF', 'Pablo', 'Antigua Guatemala', '', 7, '2020-10-11 01:59:45', 1),
(13, '46584645', 'Elena', 'Rosales', 46876454, 'elena123@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 7, '2020-12-03 04:23:40', 1),
(14, '654654654547', 'Alexa', 'Cardona', 487546878, 'alexa@info.com', '74d7f333ede0080c542c95522969be8dbc5a127d4cd3b1f765944e318f087bec', '', '', '', '', 2, '2020-12-04 01:49:58', 1),
(15, '6546546545', 'Alan', 'Estrada', 464564564, 'aaaa@info.com', '739ed90c2e5568537d3b3e37550d467e8469a9c2efee57b8ea0faf50bc54f8a2', '', '', '', '', 2, '2020-12-04 02:45:37', 1),
(16, '65465465478', 'Jorge', 'Mendoza', 6545644, 'jmendoza@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Jorge Mendoza', 'Ciudad', '', 2, '2020-12-05 01:58:08', 1),
(17, '65465455', 'Jorge', 'Mendoza', 6545644, 'jjjj@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Jorge Mendoza', 'Ciudad', '', 2, '2020-12-05 01:59:25', 1),
(18, '46584654711', 'Arnold', 'Gutierrez', 78465454, 'arnold@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Arnold', 'Ciudad', '', 7, '2020-12-05 02:02:31', 1),
(19, '64894654', 'Julieta', 'Estrada', 4654564, 'julieta@info.com', 'b6602f58690ca41488e97cd28153671356747c951c55541b6c8d8b8493eb7143', 'CF', 'Julieta', 'Ciudad', '', 7, '2020-12-05 02:22:30', 1),
(20, '', 'Jon', 'Beta', 456546545, 'jon@info.com', '423d557f5d78958e981a85aed290d2d4d5453f9b2857e6b9d34bac1a19e3d740', '', '', '', '', 7, '2020-12-28 03:36:39', 1),
(21, '', 'Ale', 'Pérez', 4654798878, 'ale@info.com', '973b0c9703e6ee636d7f6afbbb0fd2a4934fea984e7565a77dbbd53b53129e9c', '', '', '', '', 7, '2020-12-28 03:42:23', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idproducto`),
  KEY `categoriaid` (`categoriaid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(1, 4, '45684545', 'Producto 1', '<p>Descripci&oacute;n producto 1</p>', '200.00', 10, '', '2020-11-15 00:57:57', 'producto-1', 1),
(2, 3, '465456465', 'Producto 1', '<p>Descripci&oacute;n producto</p> <ul> <li>Uno</li> <li>Dos</li> </ul>', '110.00', 10, '', '2020-11-15 03:13:35', 'producto-1', 1),
(3, 1, '4654654', 'Producto Uno', '<p>Descripci&oacute;n producto uno</p> <table style=\"border-collapse: collapse; width: 100%;\" border=\"1\"> <tbody> <tr> <td style=\"width: 48.0244%;\">N&uacute;mero</td> <td style=\"width: 48.022%;\">Descripc&iacute;&oacute;n</td> </tr> <tr> <td style=\"width: 48.0244%;\">Uno</td> <td style=\"width: 48.022%;\">Peque&ntilde;o</td> </tr> <tr> <td style=\"width: 48.0244%;\">Dos</td> <td style=\"width: 48.022%;\">Mediano</td> </tr> <tr> <td style=\"width: 48.0244%;\">Tres</td> <td style=\"width: 48.022%;\">Grande</td> </tr> </tbody> </table>', '200.00', 50, '', '2020-11-15 03:19:15', 'producto-uno', 1),
(4, 2, '45654654', 'Producto 4', '<p>Descripci&oacute; producto</p>', '50.00', 0, '', '2020-11-23 02:59:44', 'producto-4', 1),
(5, 5, '6546546545', 'Producto 5', '<p>Aqu&iacute; va la descripci&oacute;n del producto</p> <ul> <li>Grande</li> <li>Peque&ntilde;o</li> <li>Mediano</li> </ul>', '1000.00', 10, '', '2020-11-23 03:22:35', 'producto-5', 1),
(6, 4, '646546547877', 'Producto 6', '<p>Descripci&oacute;n producto seis</p> <ul> <li>Uno</li> <li>Dos</li> <li>Tres</li> </ul> <p>&nbsp;</p>', '50.00', 10, '', '2020-11-23 03:38:55', 'producto-6', 1),
(7, 5, '65465454', 'Producto 7', '<p>Datos del producto</p>', '100.00', 10, '', '2020-11-23 03:39:59', 'producto-7', 1),
(8, 5, '6546545', 'Producto 8', '<p>Descripc&iacute;on</p>', '50.00', 10, '', '2020-11-23 03:43:29', 'producto-8', 1),
(9, 2, '546455456', 'Producto Nuevo', '<p>Datos del producto</p>', '120.00', 50, '', '2020-12-01 12:52:33', 'producto-nuevo', 1),
(10, 1, '654546544', 'Producto Nuevo', '<p>Descripc&oacute;n</p>', '75000.00', 0, '', '2020-12-02 03:52:09', 'producto-nuevo', 1),
(11, 1, '4657897897', 'Producto Prueba AX-12', '<p>Descripcipci&oacute;n producto prueba</p> <ul> <li>Uno</li> <li>Dos</li> <li>Tres</li> </ul> <p>&nbsp;</p>', '69000.00', 50, '', '2020-12-06 02:30:02', 'producto-prueba-ax-12', 1),
(12, 1, '4894647878', 'Chaqueta Azúl', '<p>Descripci&oacute;n producto ejemplo</p> <ul> <li>Uno</li> <li>Dos</li> <li>Tres</li> </ul>', '89000.00', 10, '', '2020-12-11 02:23:22', 'chaqueta-azul', 1),
(13, 1, '4654654564', 'Producto nuevo Ruta AX-1', '<p>Descripci&oacute;n producto Nuevo</p>', '105000.00', 5, '', '2020-12-18 00:44:28', 'producto-nuevo-ruta-ax-1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

DROP TABLE IF EXISTS `reembolso`;
CREATE TABLE IF NOT EXISTS `reembolso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pedidoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datosreembolso` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(150) COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid` (`pedidoid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `reembolso`
--

INSERT INTO `reembolso` (`id`, `pedidoid`, `idtransaccion`, `datosreembolso`, `observacion`, `status`) VALUES
(1, 13, '3YL95553L27747319', '{\"id\":\"3YL95553L27747319\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/3YL95553L27747319\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/89T8947688556831X\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'Descripcion reembolso', 'COMPLETED');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(2, 'Supervisores', 'Supervisor de tienda', 1),
(3, 'Vendedores', 'Acceso a módulo ventas', 1),
(4, 'Servicio al cliente', 'Servicio al cliente sistema', 1),
(5, 'Bodega', 'Bodega', 1),
(6, 'Resporteria', 'Resporteria Sistema', 2),
(7, 'Cliente', 'Clientes tienda', 1),
(8, 'Ejemplo rol', 'Ejemplo rol sitema', 1),
(9, 'Coordinador', 'Coordinador', 1),
(10, 'Consulta Ventas', 'Consulta Ventas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

DROP TABLE IF EXISTS `tipopago`;
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
(1, 'PayPal', 1),
(2, 'Efectivo', 1),
(3, 'Tarjeta', 1),
(4, 'Cheque', 1),
(5, 'Despósito Bancario', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD CONSTRAINT `reembolso_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
