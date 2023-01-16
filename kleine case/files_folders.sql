-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 16 jan 2023 om 07:34
-- Serverversie: 8.0.22
-- PHP-versie: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `files_folders`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `files`
--

CREATE TABLE `files` (
  `id` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  `r_view` smallint NOT NULL,
  `r_delete` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Gegevens worden geëxporteerd voor tabel `files`
--

INSERT INTO `files` (`id`, `parent`, `name`, `r_view`, `r_delete`) VALUES
(73, 25, 'index.php', 128, 128),
(74, 26, 'cart.php', 128, 128),
(75, 26, 'database.php', 128, 128),
(76, 26, 'form.php', 128, 128),
(77, 26, 'html.php', 128, 128),
(78, 26, 'main.php', 128, 128),
(79, 26, 'shop.php', 128, 128),
(80, 26, 'tools.php', 128, 128),
(81, 26, 'user.php', 128, 128),
(82, 28, 'webshop.css', 128, 128),
(83, 29, 'webshop.sql', 128, 128),
(84, 30, 'header.jpg', 128, 128),
(85, 30, 'home.jpg', 128, 128),
(86, 30, 'me.jpg', 128, 128),
(87, 31, 'alptraum.jpg', 128, 128),
(88, 31, 'faroer.jpg', 128, 128),
(89, 31, 'ijsland.jpg', 128, 128),
(90, 31, 'lapland.jpg', 128, 128),
(91, 31, 'nordkapp.jpg', 128, 128),
(92, 31, 'norway.jpg', 128, 128),
(93, 31, 'orkneys.jpg', 128, 128),
(94, 31, 'shetlands.jpg', 128, 128),
(95, 32, 'dev.inc', 128, 255),
(96, 32, 'prod.inc', 128, 255),
(97, 33, 'index.php', 128, 128),
(98, 35, 'PageController.php', 128, 128),
(99, 36, 'BaseDAO.php', 128, 128),
(100, 36, 'CartDAO.php', 128, 128),
(101, 36, 'Crud.php', 128, 128),
(102, 36, 'ShopDAO.php', 128, 128),
(103, 36, 'SiteDAO.php', 128, 128),
(104, 36, 'UserDAO.php', 128, 128),
(105, 37, 'iController.php', 128, 128),
(106, 37, 'iCrud.php', 128, 128),
(107, 37, 'iHtmlView.php', 128, 128),
(108, 37, 'iSingleton.php', 128, 128),
(109, 38, 'AdminModel.php', 128, 128),
(110, 38, 'BaseModel.php', 128, 128),
(111, 38, 'CartModel.php', 128, 128),
(112, 38, 'ModelManager.php', 128, 128),
(113, 38, 'UserModel.php', 128, 128),
(114, 38, 'WebshopModel.php', 128, 128),
(115, 39, 'FormValidator.php', 128, 128),
(116, 39, 'Tools.php', 128, 128),
(117, 40, 'HtmlDbForm.php', 128, 128),
(118, 40, 'HtmlDoc.php', 128, 128),
(119, 40, 'HtmlForm.php', 128, 128),
(120, 40, 'WebShopDetailDoc.php', 128, 128),
(121, 40, 'WebshopCartDoc.php', 128, 128),
(122, 40, 'WebshopDbFormDoc.php', 128, 128),
(123, 40, 'WebshopDoc.php', 128, 128),
(124, 40, 'WebshopFormDoc.php', 128, 128),
(125, 40, 'WebshopItem.php', 128, 128),
(126, 40, 'WebshopItemsDoc.php', 128, 128),
(127, 42, 'webshop.css', 128, 128),
(128, 43, 'zwerfkei.sql', 128, 128),
(129, 44, 'header.jpg', 128, 128),
(130, 44, 'home.jpg', 128, 128),
(131, 44, 'me.jpg', 128, 128),
(132, 45, '7f000001-096e-436d.jpg', 128, 128),
(133, 45, '7f000001-0a50-c980.jpg', 128, 128),
(134, 45, '7f000001-0ab9-a953.jpg', 128, 128),
(135, 45, '7f000001-0bff-a545.jpg', 128, 128),
(136, 45, '7f000001-0c4e-5cab.jpg', 128, 128),
(137, 45, '7f000001-0cc1-8e05.jpg', 128, 128),
(138, 45, '7f000001-0d11-94e9.jpg', 128, 128),
(139, 45, '7f000001-0eb9-18ce.jpg', 128, 128),
(140, 45, '7f000001-0f16-f3cb.jpg', 128, 128),
(141, 45, '7f000001-25ed-f900.jpg', 128, 128),
(142, 45, '7f000001-2737-1a24.jpg', 128, 128),
(143, 45, 'alptraum.jpg', 128, 128),
(144, 45, 'faroer.jpg', 128, 128),
(145, 45, 'ijsland.jpg', 128, 128),
(146, 45, 'lapland.jpg', 128, 128),
(147, 45, 'nordkapp.jpg', 128, 128),
(148, 45, 'norway.jpg', 128, 128),
(149, 45, 'shetlands.jpg', 128, 128),
(150, 46, 'dev.inc', 128, 128),
(151, 46, 'prod.inc', 128, 128),
(152, 47, 'composer.bat', 128, 128),
(153, 47, 'composer.json', 128, 128),
(154, 47, 'composer.lock', 128, 128),
(155, 47, 'index.php', 128, 128),
(156, 47, 'scanner.php', 128, 128),
(157, 47, 'web_bootstrap.php', 128, 128),
(158, 49, 'JsonShowFolder.php', 128, 128),
(159, 50, 'FolderDAO.php', 128, 128),
(160, 51, 'FolderElement.php', 128, 128),
(161, 51, 'MainContentElement.php', 128, 128),
(162, 52, 'SiteHandlerFactory.php', 128, 128),
(163, 53, 'SiteAjaxHandler.php', 128, 128),
(164, 53, 'SiteFileHandler.php', 128, 128),
(165, 53, 'SitePageHandler.php', 128, 128),
(166, 54, 'AjaxModel.php', 128, 128),
(167, 54, 'PageModel.php', 128, 128),
(168, 55, 'DbFolderScanner.php', 128, 128),
(169, 55, 'FolderRights.php', 128, 128),
(170, 58, 'acc.inc', 128, 128),
(171, 58, 'dev.inc', 128, 128),
(172, 58, 'prod.inc', 128, 128),
(173, 59, 'log_Friday.txt', 128, 128),
(174, 59, 'log_Monday.txt', 128, 128),
(175, 59, 'log_Saturday.txt', 128, 128),
(176, 59, 'log_Sunday.txt', 128, 128),
(177, 59, 'log_Thursday.txt', 128, 128),
(178, 59, 'log_Tuesday.txt', 128, 128),
(179, 59, 'log_Wednesday.txt', 128, 128),
(180, 62, 'site.css', 128, 128),
(181, 62, 'site_1672141422.css', 128, 128),
(182, 62, 'site_1672145620.css', 128, 128),
(183, 63, 'fullpath.sql', 128, 128),
(184, 65, 'site.js', 128, 128),
(185, 65, 'site_1672145527.js', 128, 128),
(186, 65, 'site_1672151249.js', 128, 128),
(187, 65, 'site_1672151278.js', 128, 128),
(188, 67, 'autoload.php', 128, 128),
(189, 68, 'ClassLoader.php', 128, 128),
(190, 68, 'InstalledVersions.php', 128, 128),
(191, 68, 'autoload_classmap.php', 128, 128),
(192, 68, 'autoload_namespaces.php', 128, 128),
(193, 68, 'autoload_psr4.php', 128, 128),
(194, 68, 'autoload_real.php', 128, 128),
(195, 68, 'autoload_static.php', 128, 128),
(196, 68, 'installed.json', 128, 128),
(197, 68, 'installed.php', 128, 128),
(198, 68, 'platform_check.php', 128, 128),
(199, 69, 'composer.bat', 128, 128),
(200, 69, 'composer.json', 128, 128),
(201, 69, 'composer.lock', 128, 128),
(202, 69, 'index.php', 128, 128),
(203, 69, 'web_bootstrap.php', 128, 128),
(204, 71, 'JsonDbFormPageElements.php', 128, 128),
(205, 71, 'JsonFormPageElements.php', 128, 128),
(206, 71, 'JsonLogout.php', 128, 128),
(207, 71, 'JsonPageElements.php', 128, 128),
(208, 71, 'JsonPostContact.php', 128, 128),
(209, 71, 'JsonPostLogin.php', 128, 128),
(210, 71, 'JsonPostRegister.php', 128, 128),
(211, 71, 'JsonUpdateCart.php', 128, 128),
(212, 71, 'JsonViewCart.php', 128, 128),
(213, 71, 'JsonViewDetail.php', 128, 128),
(214, 71, 'JsonViewShop.php', 128, 128),
(215, 71, 'XmlAllItems.php', 128, 128),
(216, 71, 'XmlFile.php', 128, 128),
(217, 71, 'XmlSingleItem.php', 128, 128),
(218, 71, 'XmlSingleItem_1.php', 128, 128),
(219, 72, 'CartDAO.php', 128, 128),
(220, 72, 'ShopDAO.php', 128, 128),
(221, 72, 'SiteDAO.php', 128, 128),
(222, 72, 'UserDAO.php', 128, 128),
(223, 73, 'CartElement.php', 128, 128),
(224, 73, 'CssElement.php', 128, 128),
(225, 73, 'FooterElement.php', 128, 128),
(226, 73, 'HeaderElement.php', 128, 128),
(227, 73, 'JsElement.php', 128, 128),
(228, 73, 'MainContentElement.php', 128, 128),
(229, 73, 'MainMenuElement.php', 128, 128),
(230, 73, 'ShopItemElement.php', 128, 128),
(231, 73, 'TextBlockElement.php', 128, 128),
(232, 73, 'WebshopElement.php', 128, 128),
(233, 74, 'SiteHandlerFactory.php', 128, 128),
(234, 75, 'SiteAjaxHandler.php', 128, 128),
(235, 75, 'SiteApiHandler.php', 128, 128),
(236, 75, 'SitePageHandler.php', 128, 128),
(237, 76, 'AdminModel.php', 128, 128),
(238, 76, 'AjaxModel.php', 128, 128),
(239, 76, 'ApiModel.php', 128, 128),
(240, 76, 'CartModel.php', 128, 128),
(241, 76, 'ModelManager.php', 128, 128),
(242, 76, 'PageModel.php', 128, 128),
(243, 76, 'UserModel.php', 128, 128),
(244, 76, 'WebshopModel.php', 128, 128),
(245, 79, 'acc.inc', 128, 128),
(246, 79, 'dev.inc', 128, 128),
(247, 79, 'prod.inc', 128, 128),
(248, 80, 'log_Friday.txt', 128, 128),
(249, 80, 'log_Monday.txt', 128, 128),
(250, 80, 'log_Saturday.txt', 128, 128),
(251, 80, 'log_Sunday.txt', 128, 128),
(252, 80, 'log_Thursday.txt', 128, 128),
(253, 80, 'log_Tuesday.txt', 128, 128),
(254, 80, 'log_Wednesday.txt', 128, 128),
(255, 81, 'api_test.html', 128, 128),
(256, 81, 'api_test.js', 128, 128),
(257, 81, 'item.xsd', 128, 128),
(258, 81, 'items.xsd', 128, 128),
(259, 81, 'shopitems.xml', 128, 128),
(260, 81, 'shopitems.xsl', 128, 128),
(261, 81, 'shopitems_1.xsl', 128, 128),
(262, 83, 'webshop.css', 128, 128),
(263, 83, 'webshop_1669384987.css', 128, 128),
(264, 84, 'zwerfkei.sql', 128, 128),
(265, 85, 'header.jpg', 128, 128),
(266, 85, 'home.jpg', 128, 128),
(267, 85, 'me.jpg', 128, 128),
(268, 86, 'gw_bootstrap.js', 128, 128),
(269, 86, 'gw_bootstrap_1669197248.js', 128, 128),
(270, 86, 'gw_bootstrap_1671971259.js', 128, 128),
(271, 87, '7f000001-096e-436d.jpg', 128, 128),
(272, 87, '7f000001-0a50-c980.jpg', 128, 128),
(273, 87, '7f000001-0ab9-a953.jpg', 128, 128),
(274, 87, '7f000001-0bff-a545.jpg', 128, 128),
(275, 87, '7f000001-0c4e-5cab.jpg', 128, 128),
(276, 87, '7f000001-0cc1-8e05.jpg', 128, 128),
(277, 87, '7f000001-0d11-94e9.jpg', 128, 128),
(278, 87, '7f000001-0eb9-18ce.jpg', 128, 128),
(279, 87, '7f000001-0f16-f3cb.jpg', 128, 128),
(280, 87, '7f000001-25ed-f900.jpg', 128, 128),
(281, 87, '7f000001-2737-1a24.jpg', 128, 128),
(282, 87, 'alptraum.jpg', 128, 128),
(283, 87, 'faroer.jpg', 128, 128),
(284, 87, 'ijsland.jpg', 128, 128),
(285, 87, 'lapland.jpg', 128, 128),
(286, 87, 'nordkapp.jpg', 128, 128),
(287, 87, 'norway.jpg', 128, 128),
(288, 87, 'shetlands.jpg', 128, 128),
(289, 88, 'item.xsd', 128, 128),
(290, 88, 'items.xsd', 128, 128),
(291, 88, 'shopitems.xsl', 128, 128),
(292, 88, 'test_item.xml', 128, 128),
(293, 88, 'test_items.xml', 128, 128),
(294, 89, 'autoload.php', 128, 128),
(295, 90, 'ClassLoader.php', 128, 128),
(296, 90, 'InstalledVersions.php', 128, 128),
(297, 90, 'autoload_classmap.php', 128, 128),
(298, 90, 'autoload_namespaces.php', 128, 128),
(299, 90, 'autoload_psr4.php', 128, 128),
(300, 90, 'autoload_real.php', 128, 128),
(301, 90, 'autoload_static.php', 128, 128),
(302, 90, 'installed.json', 128, 128),
(303, 90, 'installed.php', 128, 128),
(304, 90, 'platform_check.php', 128, 128);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `folders`
--

CREATE TABLE `folders` (
  `id` int NOT NULL,
  `parent` int DEFAULT '0',
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  `r_view` smallint NOT NULL DEFAULT '0',
  `r_add_folders` smallint NOT NULL DEFAULT '0',
  `r_add_files` smallint NOT NULL DEFAULT '0',
  `r_del_folders` smallint NOT NULL DEFAULT '0',
  `r_del_files` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Gegevens worden geëxporteerd voor tabel `folders`
--

INSERT INTO `folders` (`id`, `parent`, `name`, `r_view`, `r_add_folders`, `r_add_files`, `r_del_folders`, `r_del_files`) VALUES
(25, 0, 'W:\\wwwroot\\__educom\\_php_basis', 128, 128, 128, 128, 128),
(26, 25, '_src', 128, 128, 128, 128, 128),
(27, 25, 'assets', 128, 128, 128, 128, 128),
(28, 27, 'css', 128, 128, 128, 128, 128),
(29, 27, 'db', 128, 128, 128, 128, 128),
(30, 27, 'img', 128, 128, 128, 128, 128),
(31, 27, 'shop', 128, 128, 128, 128, 128),
(32, 25, 'config', 255, 128, 128, 192, 192),
(33, 0, 'W:\\wwwroot\\__educom\\_php_oop', 128, 128, 128, 128, 128),
(34, 33, '_src', 128, 128, 128, 128, 128),
(35, 34, 'controllers', 128, 128, 128, 128, 128),
(36, 34, 'dal', 128, 128, 128, 128, 128),
(37, 34, 'interfaces', 128, 128, 128, 128, 128),
(38, 34, 'models', 128, 128, 128, 128, 128),
(39, 34, 'tools', 128, 128, 128, 128, 128),
(40, 34, 'views', 128, 128, 128, 128, 128),
(41, 33, 'assets', 128, 128, 128, 128, 128),
(42, 41, 'css', 128, 128, 128, 128, 128),
(43, 41, 'db', 128, 128, 128, 128, 128),
(44, 41, 'img', 128, 128, 128, 128, 128),
(45, 41, 'shop', 128, 128, 128, 128, 128),
(46, 33, 'config', 128, 128, 128, 128, 128),
(47, 0, 'W:\\wwwroot\\__educom\\_recursion', 128, 128, 128, 128, 128),
(48, 47, '_src', 128, 128, 128, 128, 128),
(49, 48, 'ajax', 128, 128, 128, 128, 128),
(50, 48, 'dal', 128, 128, 128, 128, 128),
(51, 48, 'elements', 128, 128, 128, 128, 128),
(52, 48, 'factories', 128, 128, 128, 128, 128),
(53, 48, 'handlers', 128, 128, 128, 128, 128),
(54, 48, 'models', 128, 128, 128, 128, 128),
(55, 48, 'utils', 128, 128, 128, 128, 128),
(56, 47, '_sys', 128, 128, 128, 128, 128),
(57, 56, 'cache', 128, 128, 128, 128, 128),
(58, 56, 'config', 128, 128, 128, 128, 128),
(59, 56, 'logs', 128, 128, 128, 128, 128),
(60, 47, '_test', 128, 128, 128, 128, 128),
(61, 47, 'assets', 128, 128, 128, 128, 128),
(62, 61, 'css', 128, 128, 128, 128, 128),
(63, 61, 'db', 128, 128, 128, 128, 128),
(64, 61, 'img', 128, 128, 128, 128, 128),
(65, 61, 'js', 128, 128, 128, 128, 128),
(66, 61, 'uploads', 128, 128, 128, 128, 128),
(67, 47, 'vendor', 128, 128, 128, 128, 128),
(68, 67, 'composer', 128, 128, 128, 128, 128),
(69, 0, 'W:\\wwwroot\\__educom\\_php_adv', 128, 128, 128, 128, 128),
(70, 69, '_src', 128, 128, 128, 128, 128),
(71, 70, 'ajax', 128, 128, 128, 128, 128),
(72, 70, 'dal', 128, 128, 128, 128, 128),
(73, 70, 'elements', 128, 128, 128, 128, 128),
(74, 70, 'factories', 128, 128, 128, 128, 128),
(75, 70, 'handlers', 128, 128, 128, 128, 128),
(76, 70, 'models', 128, 128, 128, 128, 128),
(77, 69, '_sys', 128, 128, 128, 128, 128),
(78, 77, 'cache', 128, 128, 128, 128, 128),
(79, 77, 'config', 128, 128, 128, 128, 128),
(80, 77, 'logs', 128, 128, 128, 128, 128),
(81, 69, '_test', 128, 128, 128, 128, 128),
(82, 69, 'assets', 128, 128, 128, 128, 128),
(83, 82, 'css', 128, 128, 128, 128, 128),
(84, 82, 'db', 128, 128, 128, 128, 128),
(85, 82, 'img', 128, 128, 128, 128, 128),
(86, 82, 'js', 128, 128, 128, 128, 128),
(87, 82, 'shop', 128, 128, 128, 128, 128),
(88, 82, 'xml', 128, 128, 128, 128, 128),
(89, 69, 'vendor', 128, 128, 128, 128, 128),
(90, 89, 'composer', 128, 128, 128, 128, 128);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_folder` (`parent`) USING BTREE;

--
-- Indexen voor tabel `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_folder` (`parent`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `files`
--
ALTER TABLE `files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT voor een tabel `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `res_folder` FOREIGN KEY (`parent`) REFERENCES `folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
