-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 15 Dec 2016 la 13:53
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `taxi_1`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `genus`
--

CREATE TABLE IF NOT EXISTS `genus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_family_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `species_count` int(11) NOT NULL,
  `fun_fact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `first_discovered_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_38C5106ED15310D4` (`sub_family_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Salvarea datelor din tabel `genus`
--

INSERT INTO `genus` (`id`, `sub_family_id`, `name`, `species_count`, `fun_fact`, `is_published`, `first_discovered_at`) VALUES
(1, 3, 'Paralithodes', 807, 'Recusandae asperiores accusamus nihil repellat vero omnis voluptates.', 1, '0000-00-00'),
(2, 1, 'Asterias', 61699, 'Suscipit qui recusandae totam nulla quam ipsam.', 1, '0000-00-00'),
(3, 3, 'Paralithodes', 20524, 'Debitis voluptas aut laudantium sit repudiandae esse.', 1, '0000-00-00'),
(4, 3, 'Cucumaria', 56620, 'Itaque quibusdam tempora velit porro ut velit soluta.', 1, '0000-00-00'),
(5, 4, 'Trichechus', 51863, 'Et saepe eum sint dolorem delectus enim ipsum.', 1, '0000-00-00'),
(6, 1, 'Balistoides', 67086, 'Velit qui suscipit a deserunt laudantium quibusdam enim.', 1, '0000-00-00'),
(7, 4, 'Eumetopias', 14297, 'Non ipsum velit reiciendis aperiam et.', 1, '0000-00-00'),
(8, 5, 'Cucumaria', 34258, 'Cumque est ducimus temporibus modi saepe architecto unde.', 1, '0000-00-00'),
(9, 1, 'Amphiprion', 89869, 'Aut porro sed magni cupiditate.', 1, '0000-00-00'),
(10, 1, 'Chelonia', 32635, 'Non voluptates ut optio quos qui illo error nihil.', 1, '0000-00-00'),
(11, 3, 'Josiah Sears', 79, 'Nihil quia et qui delectus dolor qui quibusdam sunt', 1, '2016-12-20'),
(12, 3, 'Naomi Tyson', 93, 'Deserunt sapiente incidunt officiis eaque', 1, '2017-11-19'),
(13, 4, 'Shoshana Torres', 9, 'Sunt ut eos voluptatibus esse excepteur expedita totam ullamco voluptas temporibus minima voluptas architecto ex', 0, '2017-09-28'),
(14, 4, 'Talon Key', 12, 'Quis sit recusandae In ea nisi magni provident velit et dignissimos nulla sint nihil ea sed dolor', 1, '2012-03-06'),
(15, 5, 'Lawrence Fletcher', 93, 'Consequatur non sequi aliquid cillum magni debitis autem officiis iste quisquam sed commodi', 1, '2014-09-30'),
(16, 3, 'Cameron Gray', 38, 'Provident duis aut voluptate irure amet', 0, '2016-11-16');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `genus_note`
--

CREATE TABLE IF NOT EXISTS `genus_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genus_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_avatar_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6478FCEC85C4074C` (`genus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=101 ;

--
-- Salvarea datelor din tabel `genus_note`
--

INSERT INTO `genus_note` (`id`, `genus_id`, `username`, `user_avatar_filename`, `note`, `created_at`) VALUES
(1, 5, 'pwill', 'ryan.jpeg', 'Saepe provident esse hic eligendi. Culpa ut ab voluptas sed a. Et sint autem inventore aut officia aut.', '2016-05-06 23:12:52'),
(2, 6, 'dkilback', 'leanna.jpeg', 'Est ut eum nisi molestiae quidem ut. Et quidem est accusamus aut nemo fuga. Placeat rerum ut et enim ex eveniet.', '2016-09-03 06:26:03'),
(3, 6, 'wintheiser.madison', 'leanna.jpeg', 'Fugit repellendus illo veritatis. Ex esse veritatis voluptate vel possimus. Aut incidunt sunt cumque asperiores incidunt iure sequi.', '2016-08-20 04:49:00'),
(4, 3, 'sigrid.greenfelder', 'ryan.jpeg', 'Voluptas fuga totam reiciendis. Architecto fugiat nemo omnis consequatur recusandae qui cupiditate. Quod veritatis vel optio provident.', '2016-10-05 23:03:05'),
(5, 1, 'lakin.quinton', 'ryan.jpeg', 'Voluptatum quia ipsum voluptatibus est accusantium eveniet aut. Possimus aut dolores quis totam incidunt.', '2016-07-09 18:23:08'),
(6, 10, 'reinger.orval', 'leanna.jpeg', 'Similique ut culpa natus consequatur reiciendis sit. Nihil ut porro amet laborum iure molestiae et. Quaerat molestiae iste in dolores.', '2016-08-12 10:51:49'),
(7, 5, 'cartwright.andres', 'ryan.jpeg', 'Tempora et quo aperiam natus. Doloribus magni quasi impedit aperiam ea. Ad sed architecto quod nulla maxime voluptas. Inventore esse harum accusantium rerum nulla voluptatem voluptas.', '2016-08-24 09:07:20'),
(8, 2, 'hintz.ressie', 'leanna.jpeg', 'Sit nisi recusandae eaque molestias sit id labore. Ut voluptatem laudantium perferendis eveniet quam vero. Corrupti omnis temporibus maxime sint suscipit laudantium.', '2016-08-31 19:25:22'),
(9, 1, 'qrunolfsdottir', 'leanna.jpeg', 'Non explicabo et neque itaque ex quaerat ut aut. Consequatur non rerum in cupiditate voluptas molestiae fuga. Cum non qui quaerat cupiditate incidunt id sunt.', '2016-05-18 18:39:06'),
(10, 9, 'hector.russel', 'leanna.jpeg', 'Ab in hic molestiae odio sed vitae maiores. Beatae reprehenderit exercitationem corrupti dolorem reprehenderit. Ducimus omnis molestiae consequatur sint consequatur est qui doloremque.', '2016-04-24 21:14:21'),
(11, 5, 'angeline13', 'leanna.jpeg', 'Voluptatibus perspiciatis quae sapiente quia suscipit doloribus cupiditate dolorem. Libero quas magni rerum consequatur laudantium nisi quo. Rerum esse eveniet debitis omnis voluptatem voluptatem et eaque. Et praesentium est velit molestiae porro.', '2016-05-11 15:53:27'),
(12, 10, 'rmiller', 'ryan.jpeg', 'Eius similique dolore consequatur et ipsam. Saepe dolor in perspiciatis sit consectetur temporibus voluptate.', '2016-08-08 12:13:45'),
(13, 7, 'pwolff', 'ryan.jpeg', 'Dicta molestiae asperiores consequuntur sit repellendus. Aliquam doloremque et reprehenderit nesciunt eum non. Esse et ut quis corporis voluptate ullam. Non ratione eaque possimus quia optio explicabo et.', '2016-10-18 06:11:17'),
(14, 2, 'jayne55', 'ryan.jpeg', 'Velit voluptatibus in laudantium voluptatem. Vel dignissimos et dolorem doloremque quam quia voluptatem. Ad in maiores nisi eius quibusdam sapiente quia.', '2016-10-06 14:08:49'),
(15, 2, 'hayes.destiney', 'ryan.jpeg', 'At ut non eos sed amet. Vitae enim sapiente occaecati natus assumenda reiciendis. Et laudantium vel nisi ea itaque est. Nihil beatae omnis voluptatibus quae sit veniam.', '2016-09-14 01:52:17'),
(16, 3, 'rwalker', 'leanna.jpeg', 'Neque deleniti totam aut nisi. Omnis voluptatem velit nesciunt eligendi eos sint. Voluptates quo incidunt omnis aut enim nihil.', '2016-10-17 20:39:19'),
(17, 4, 'jamar69', 'ryan.jpeg', 'Autem nihil esse repudiandae pariatur. Assumenda error consequatur fugit ad iste.', '2016-08-30 17:41:38'),
(18, 9, 'rubye68', 'leanna.jpeg', 'Doloremque fuga labore qui et. Hic minus et omnis porro voluptatibus enim. Reprehenderit magni fugiat consequatur officiis velit.', '2016-04-18 16:38:18'),
(19, 3, 'angus65', 'leanna.jpeg', 'Nulla totam eos omnis inventore perferendis voluptatem nisi. Consequatur ullam voluptas et tempora. Corporis excepturi sint dolores quaerat odit quia nisi accusantium.', '2016-07-30 08:53:26'),
(20, 1, 'hboyer', 'ryan.jpeg', 'Sapiente ut qui quidem explicabo optio amet velit aut. Iure sed alias asperiores perspiciatis deserunt omnis inventore mollitia. Id in id porro molestiae in maxime.', '2016-10-03 09:50:26'),
(21, 3, 'muhammad13', 'leanna.jpeg', 'Odio modi consequatur dicta ipsa temporibus sit facere. Doloremque odio ad asperiores quaerat eius accusamus. Dolorem earum ut consequatur facilis molestias quo.', '2016-07-28 04:52:24'),
(22, 1, 'wintheiser.clementine', 'leanna.jpeg', 'Quia et et dolorum quos aliquam. Accusantium quidem ut eius a corrupti totam placeat delectus. Earum officiis sed autem ut voluptatem. Quod alias iste similique aut tempore pariatur et.', '2016-08-19 04:11:53'),
(23, 6, 'leuschke.allen', 'ryan.jpeg', 'Beatae neque eum est molestiae. Laboriosam dolor odit omnis.', '2016-06-26 16:00:31'),
(24, 10, 'jennings08', 'leanna.jpeg', 'Nesciunt fugit ea accusantium temporibus qui ad est et. Cum eius voluptas numquam quam occaecati culpa. In laudantium omnis et. Laborum cupiditate corporis aliquid aut cumque consequuntur non qui.', '2016-08-22 10:23:38'),
(25, 6, 'freida.rempel', 'ryan.jpeg', 'Et necessitatibus tenetur doloremque iusto quibusdam fuga. Voluptas iure rerum voluptas. Eius commodi odio ut aliquid et sit enim.', '2016-07-20 16:32:35'),
(26, 8, 'terrell72', 'leanna.jpeg', 'Officiis eos suscipit facilis vel. Modi quia recusandae qui eligendi quo voluptas totam. Ab tenetur voluptatem repudiandae reiciendis cum accusamus ut et. Iste accusantium quaerat nostrum voluptas est tenetur.', '2016-07-25 09:35:47'),
(27, 9, 'gconn', 'ryan.jpeg', 'Nihil aliquid eos fugit. Quaerat quibusdam alias omnis accusamus aut dolores. Itaque doloribus qui dicta eligendi quae recusandae. Quo beatae deleniti quia molestiae alias quo quis.', '2016-04-29 09:17:18'),
(28, 9, 'kayley.turner', 'leanna.jpeg', 'Placeat reprehenderit nesciunt architecto quas. Similique consequatur nisi fuga dolores aut. Illo illum sint voluptas a aperiam. Aut qui neque minus eos fugit nostrum non.', '2016-07-19 01:01:21'),
(29, 6, 'bruen.kari', 'leanna.jpeg', 'Nam nesciunt non dolore quis et eius et. Omnis eaque pariatur non ea vel omnis. Explicabo inventore quam suscipit qui accusamus eveniet dolorem voluptatem.', '2016-08-15 00:36:15'),
(30, 1, 'iwiza', 'leanna.jpeg', 'Voluptatem eveniet consequatur sit impedit sint nam perferendis sit. Magnam ut nemo possimus qui totam iste. Harum animi et ad rerum perferendis fugiat. Facere quisquam et quod velit velit ut rem repellendus.', '2016-06-06 14:17:02'),
(31, 7, 'shawn.stracke', 'ryan.jpeg', 'Est in reprehenderit reiciendis accusamus. Quia et mollitia deleniti qui nostrum doloremque. Aut molestiae sapiente est consequatur. Tempore similique ut debitis consequatur.', '2016-09-03 06:18:20'),
(32, 1, 'bernier.marilie', 'ryan.jpeg', 'Perspiciatis quia quasi sit dolore ad. Est impedit itaque cumque officiis ut quis. Consequatur asperiores voluptatem magnam nostrum ea corrupti voluptatem. Cupiditate rerum ratione rerum repellendus ducimus.', '2016-09-19 21:18:28'),
(33, 4, 'baumbach.zechariah', 'leanna.jpeg', 'Doloremque esse dolor qui illo placeat harum voluptatem. Enim tempora voluptas ut dolorem voluptates deserunt provident. Ipsam fugiat est ipsam quia reprehenderit sint. Sed facere qui sit delectus ad iusto. Iusto autem laboriosam nulla earum eius repellat.', '2016-08-02 16:49:15'),
(34, 4, 'ahmed42', 'leanna.jpeg', 'Nobis hic rerum delectus dolorum voluptas cupiditate aut consequatur. Ullam qui ea voluptatem aut cum vitae nostrum. Maiores non omnis aut quos ut ad est quidem. Rerum voluptates laboriosam ea porro blanditiis.', '2016-05-13 11:55:04'),
(35, 6, 'nwolf', 'leanna.jpeg', 'Et et fuga recusandae voluptatem veniam enim quae voluptas. Dolore explicabo nisi a aut architecto et aut. Nam cum tempore doloremque. Aut qui perferendis praesentium cupiditate iste.', '2016-10-18 08:37:36'),
(36, 5, 'iterry', 'leanna.jpeg', 'Nihil voluptatem magnam odio impedit. Omnis consequatur ut repellendus officiis nihil reprehenderit non ut.', '2016-07-13 23:14:41'),
(37, 2, 'emilio.lesch', 'leanna.jpeg', 'Quod cupiditate culpa nisi eos cupiditate quibusdam eveniet. Provident quas omnis voluptatem quia soluta recusandae id. Aut voluptates est deleniti et accusantium nesciunt voluptas.', '2016-09-23 23:58:22'),
(38, 3, 'heather32', 'leanna.jpeg', 'Eos fugiat voluptas voluptatem consequuntur nostrum culpa. Quod voluptatem quae dignissimos sunt atque aut. Possimus accusamus sint hic ut atque expedita.', '2016-05-15 09:02:49'),
(39, 7, 'zturcotte', 'ryan.jpeg', 'Animi culpa velit dignissimos molestias. A cumque ut et rerum dolore consectetur et beatae. Nulla quisquam labore saepe perspiciatis doloremque. Unde optio accusamus magnam non ratione enim velit.', '2016-06-12 06:58:08'),
(40, 3, 'pwindler', 'leanna.jpeg', 'Qui in et quasi incidunt. Ex accusamus aut itaque nesciunt sit quidem fugit sapiente. Eveniet dolore inventore consectetur sed repellat. Vitae iure voluptatibus dolorem totam laboriosam.', '2016-05-21 18:11:06'),
(41, 1, 'von.sherwood', 'ryan.jpeg', 'Ducimus odio fuga vitae expedita. Vero animi fugiat corporis. Et officia et necessitatibus quasi.', '2016-07-09 21:10:06'),
(42, 6, 'tyson.feeney', 'ryan.jpeg', 'Sunt aliquam mollitia id repudiandae. Doloremque placeat ut esse. Aut ratione cumque commodi. Cum ratione animi maxime enim est.', '2016-07-04 15:22:59'),
(43, 3, 'zwilkinson', 'ryan.jpeg', 'Optio odio aspernatur qui dolor blanditiis suscipit. Veniam neque omnis dolor qui.', '2016-07-05 11:43:48'),
(44, 9, 'reichert.addison', 'leanna.jpeg', 'Tenetur vel quasi corporis rerum quo ut accusantium. Quibusdam quia aut culpa dolores consectetur quod doloremque. Aut cupiditate aperiam occaecati adipisci veritatis vel voluptas. Cumque sed modi odit.', '2016-07-21 05:05:13'),
(45, 6, 'pbayer', 'ryan.jpeg', 'Odio et id consequatur accusantium quia porro. Voluptates dignissimos est officiis est repudiandae est atque. Inventore sed ipsum omnis maiores esse.', '2016-08-21 20:26:06'),
(46, 2, 'bahringer.eleazar', 'leanna.jpeg', 'Voluptatem harum sed quia et. Neque voluptas est totam provident sunt. Est tempora qui minus officia.', '2016-06-09 19:20:23'),
(47, 5, 'bwaters', 'leanna.jpeg', 'Laborum dolor quasi totam qui ipsam iusto enim. Molestias amet aut qui. Et fuga velit iure consequuntur qui provident et. Veniam et adipisci libero qui qui maiores est.', '2016-07-09 13:33:16'),
(48, 5, 'mariela.funk', 'ryan.jpeg', 'Et sit enim omnis. Inventore consequatur mollitia ducimus veritatis doloribus. Labore quos saepe quia quia.', '2016-07-28 03:28:54'),
(49, 6, 'spencer13', 'leanna.jpeg', 'Sunt est possimus voluptas blanditiis et. Aut culpa reiciendis dolorum eaque accusantium exercitationem animi.', '2016-09-15 13:45:49'),
(50, 10, 'ondricka.philip', 'leanna.jpeg', 'Dolorem impedit et cumque. Qui ut non perspiciatis voluptatem voluptatem eligendi provident sed. Magni qui sint quos aut quibusdam labore. Quod est qui dolor reprehenderit.', '2016-04-19 05:35:59'),
(51, 8, 'angelina13', 'ryan.jpeg', 'Voluptas rerum quia et harum dolor quaerat. Et repellat rerum voluptas dolore explicabo vero. Fugit officiis explicabo ipsa libero sit ducimus minima. Suscipit id tempore voluptatibus recusandae et deleniti tenetur. Illo sunt possimus esse et porro consequatur totam et.', '2016-06-01 21:54:09'),
(52, 5, 'wolff.mekhi', 'leanna.jpeg', 'Repudiandae temporibus blanditiis sit maiores quo. Qui pariatur cumque hic sunt harum alias omnis. Asperiores aliquid ducimus fuga temporibus consequuntur omnis sit.', '2016-09-29 00:39:10'),
(53, 1, 'dickens.tremaine', 'ryan.jpeg', 'Repellat asperiores vitae neque optio quod et consectetur. Expedita ratione vitae qui sed ut repudiandae. Sit asperiores eum et nisi cumque et quod.', '2016-10-09 13:55:15'),
(54, 4, 'tcruickshank', 'leanna.jpeg', 'Rerum officia et neque pariatur vel. Et laborum veniam dolores dolorum ad. Et fugit eius facilis dolor fugiat dicta.', '2016-09-29 23:14:12'),
(55, 2, 'stephen88', 'leanna.jpeg', 'Omnis distinctio eum sit hic voluptatum quis. Et aliquam qui vel debitis qui ipsum perferendis. Dolorum excepturi deleniti voluptatem iure et atque aut.', '2016-05-11 17:26:52'),
(56, 2, 'paris.towne', 'ryan.jpeg', 'Non quos quia repellat expedita laudantium ducimus qui odit. Sed illo minima sit. Necessitatibus accusamus sed iure voluptatum excepturi sit.', '2016-07-17 08:20:56'),
(57, 4, 'kerluke.august', 'leanna.jpeg', 'Eveniet est voluptatem culpa dolores. Sunt occaecati est nihil vel aut. Libero quis sit qui officia nihil.', '2016-08-13 07:38:41'),
(58, 2, 'ernser.bianka', 'leanna.jpeg', 'A minus quos laudantium porro quibusdam. Suscipit quo consequatur ipsa repellendus. Quam culpa fugit molestiae consectetur aut esse libero.', '2016-09-30 01:30:02'),
(59, 9, 'keeling.ardella', 'ryan.jpeg', 'Eum nobis et et et fuga fugit. Cum esse laborum sequi. Debitis tempora aperiam nam.', '2016-06-13 15:14:36'),
(60, 1, 'omann', 'ryan.jpeg', 'Facilis sit ea quia velit. Laudantium ea et sit enim. Sunt odio aperiam tenetur rerum aut tempore.', '2016-05-19 06:40:40'),
(61, 3, 'alaina63', 'ryan.jpeg', 'Consequatur deleniti id sed veniam aut velit perferendis. Nemo nesciunt ullam fugiat maiores omnis quo. Quod voluptas quibusdam exercitationem ab. Culpa rem sunt perferendis repellendus sapiente accusamus.', '2016-09-08 11:57:34'),
(62, 3, 'kiehn.maggie', 'ryan.jpeg', 'Cumque optio qui ab quaerat consequuntur. Eaque maiores optio voluptatibus et non ab.', '2016-09-28 02:36:36'),
(63, 8, 'maggie.mcclure', 'leanna.jpeg', 'Veniam eaque et recusandae iste qui tenetur aut. Molestias sed dicta molestiae illo possimus qui. Velit dolorem facere officiis nostrum dolore nulla. Ea quo fugiat unde alias sunt rerum fuga.', '2016-05-01 01:56:54'),
(64, 7, 'isabelle.roberts', 'leanna.jpeg', 'Id reprehenderit voluptas maiores consequatur. Impedit ducimus aut voluptatum quia voluptatem est. Ea reprehenderit inventore quibusdam in eum et fuga.', '2016-06-05 14:54:49'),
(65, 7, 'ignacio18', 'ryan.jpeg', 'Magnam aut sed architecto officiis. Omnis velit ratione quia minus sint. Voluptatem sequi debitis sed ratione dolorem. Inventore repellendus voluptatum sit unde.', '2016-10-03 21:12:11'),
(66, 7, 'else.rippin', 'leanna.jpeg', 'Sequi architecto quia veniam accusantium maiores commodi qui id. Earum voluptate explicabo excepturi molestias occaecati quo culpa. Et consequatur exercitationem in corporis qui dolor.', '2016-05-21 21:32:06'),
(67, 6, 'brooklyn41', 'leanna.jpeg', 'Quae consequatur nihil est sit beatae quo. Aut laborum perspiciatis quos.', '2016-04-28 11:38:17'),
(68, 4, 'jarod.leffler', 'ryan.jpeg', 'Beatae repellendus doloremque omnis ut aut et eius et. Rerum ab et culpa voluptatem. Qui animi pariatur rerum. Corrupti id alias et qui.', '2016-09-02 07:30:34'),
(69, 3, 'koepp.linnea', 'ryan.jpeg', 'Iusto quae consequatur excepturi quia excepturi. Culpa dolorum similique a nihil. Veniam qui qui aspernatur.', '2016-07-26 08:23:02'),
(70, 7, 'erdman.mireya', 'leanna.jpeg', 'Eligendi minus aut ea. At blanditiis architecto magni deserunt ad cupiditate soluta. Impedit vel accusamus rerum.', '2016-06-27 01:11:02'),
(71, 6, 'alfred08', 'ryan.jpeg', 'Dolores ut natus et ratione voluptate. Architecto iure placeat fugiat itaque et sit est. Omnis recusandae dicta vel qui unde et. Omnis assumenda dolor enim exercitationem. Culpa voluptatibus harum id cupiditate asperiores assumenda.', '2016-10-05 02:19:14'),
(72, 8, 'stewart57', 'leanna.jpeg', 'Magni qui qui officia. Sint quia quibusdam est ratione. Et consequatur suscipit saepe quia. Nesciunt nobis aperiam facere non iure nihil quia.', '2016-08-21 07:04:10'),
(73, 5, 'vmraz', 'ryan.jpeg', 'Nihil possimus aut sit voluptas consequatur rerum sunt porro. Est excepturi alias ex consequatur qui eaque ut necessitatibus.', '2016-09-28 06:08:59'),
(74, 10, 'anastasia43', 'leanna.jpeg', 'Ut ut officia reiciendis. Voluptatem nulla molestias et minus hic. Aperiam voluptas corporis fugiat distinctio occaecati omnis illum. Odit ducimus culpa quae dolores.', '2016-07-10 16:44:45'),
(75, 6, 'gerhard.bode', 'ryan.jpeg', 'Quam aperiam blanditiis omnis corrupti hic aut qui. Minima unde enim molestiae autem id. Quo aliquid nam ex asperiores neque ea. Ut ut facilis qui sed sint. Voluptatem nostrum illum praesentium exercitationem.', '2016-05-28 02:24:21'),
(76, 2, 'darmstrong', 'ryan.jpeg', 'Nesciunt exercitationem animi libero sit. Id aliquam reprehenderit a tempora ipsam error vel.', '2016-07-12 06:53:42'),
(77, 7, 'lwill', 'ryan.jpeg', 'Dolore unde nihil ducimus rerum est similique et. Distinctio minima fugit corrupti. Accusantium excepturi soluta temporibus. Ad eum cupiditate in quaerat et enim temporibus.', '2016-09-18 13:42:19'),
(78, 2, 'eprice', 'ryan.jpeg', 'Eum natus officia laudantium recusandae aliquam deleniti rerum qui. Enim et explicabo possimus. Voluptatibus ipsum officia fugit iste. Et beatae totam repellendus.', '2016-07-24 13:25:18'),
(79, 7, 'schaden.velda', 'leanna.jpeg', 'Qui accusamus et odio explicabo quam accusamus. Sint quia fuga autem impedit perspiciatis. Illo odit id quasi illo omnis quidem. Reprehenderit commodi aut voluptas corrupti placeat odio at. Voluptatem et et ea ad.', '2016-08-12 08:59:32'),
(80, 1, 'graham.trinity', 'ryan.jpeg', 'Consequatur nulla explicabo commodi praesentium voluptatem. Non optio consequatur occaecati delectus ut amet ipsam magni. Nobis dolorem iusto odio alias. Voluptatum non ea architecto nisi nulla.', '2016-05-23 11:13:32'),
(81, 8, 'willy.brakus', 'leanna.jpeg', 'Omnis blanditiis consectetur itaque consequuntur cupiditate praesentium itaque. Reiciendis quo sapiente est adipisci quaerat voluptas. Quia molestiae magnam ea.', '2016-05-25 04:28:00'),
(82, 10, 'kaylin.halvorson', 'ryan.jpeg', 'Molestiae ipsam consequatur quaerat minima id. Veritatis aspernatur neque et quia saepe. Inventore laborum aut commodi et voluptates inventore dolor assumenda. Minus vitae odit magnam omnis.', '2016-04-23 05:23:14'),
(83, 10, 'blockman', 'ryan.jpeg', 'Ad omnis explicabo expedita sed et quis aut facilis. Eum et id perferendis asperiores et reprehenderit rem dolorum. Sed nisi aut accusamus aut.', '2016-05-15 12:30:20'),
(84, 2, 'therman', 'ryan.jpeg', 'Dolorem dolor perspiciatis sit nostrum eum omnis. Doloremque beatae iure necessitatibus qui. Quasi rerum veritatis veritatis nam et quam. Voluptatem qui ut itaque iusto consequuntur.', '2016-10-11 22:46:01'),
(85, 5, 'jlebsack', 'ryan.jpeg', 'Facere sunt dolor omnis. Et fugiat animi veniam ad animi. Impedit voluptatum qui iure laboriosam laborum.', '2016-10-16 15:40:47'),
(86, 4, 'hartmann.raphaelle', 'leanna.jpeg', 'Alias itaque esse sint nisi sed. Veritatis laudantium aliquid incidunt placeat et ut dolores omnis. Accusamus iusto et quis voluptate recusandae vel. Aliquam dolor quasi eum et nihil.', '2016-05-31 16:08:34'),
(87, 3, 'cade.schamberger', 'leanna.jpeg', 'Officia sapiente nesciunt atque. Eius totam esse velit voluptas temporibus. Magnam repudiandae voluptas ut maxime qui fugiat.', '2016-08-04 03:58:24'),
(88, 3, 'mjohnston', 'leanna.jpeg', 'Non aut aut totam molestiae. Fugiat doloremque ab unde a cumque culpa voluptatum. Facere totam similique voluptatum mollitia ab quo. Rerum accusantium laborum veniam iure doloremque possimus.', '2016-08-24 22:27:24'),
(89, 2, 'zack51', 'leanna.jpeg', 'Molestiae aliquam aut voluptate velit et et reprehenderit officia. In et aut hic tempore maxime nemo rerum. Dolores molestias earum quos blanditiis eos ipsam. Non ut ex in nihil quidem est.', '2016-09-17 02:04:25'),
(90, 3, 'denesik.audreanne', 'leanna.jpeg', 'Magni ea nemo sed voluptatibus in laborum. Ratione natus perferendis fuga animi nulla possimus et. Ratione est eveniet perspiciatis et et sed. Maiores et dignissimos similique mollitia.', '2016-10-05 08:06:11'),
(91, 10, 'michale.hilpert', 'leanna.jpeg', 'Esse ullam cupiditate ut. Deserunt doloremque magnam et impedit quo. Vel deserunt eius architecto commodi eum at. Facilis inventore vero animi unde doloribus. Qui dolor vel consectetur debitis a animi.', '2016-08-19 07:24:26'),
(92, 1, 'qgreenholt', 'leanna.jpeg', 'Ut cumque laborum quod ut ducimus suscipit. Nostrum veritatis saepe ex voluptas. Neque sit numquam vel est.', '2016-05-05 05:09:05'),
(93, 10, 'nledner', 'ryan.jpeg', 'Voluptatem vel rem quaerat sunt magni aut. Vel deleniti molestias velit. Enim rerum sequi vel et nemo. Et eos vero hic quia ut adipisci.', '2016-08-13 23:10:43'),
(94, 5, 'noe83', 'leanna.jpeg', 'Suscipit voluptatem laboriosam deserunt nobis doloribus enim. Dolores qui asperiores voluptates. Delectus sapiente quo est rerum nihil sint. Ipsa id ullam ullam accusantium eveniet debitis voluptatem. Sed totam aut impedit facere rerum provident aut aut.', '2016-08-04 12:47:56'),
(95, 1, 'rigoberto.dibbert', 'ryan.jpeg', 'Eius et reprehenderit aliquam excepturi id et. Voluptate molestiae ut qui. Ex vel quod dolorem perspiciatis eos quis asperiores. Qui eaque natus qui voluptas.', '2016-05-03 23:45:32'),
(96, 8, 'edward.white', 'leanna.jpeg', 'Quas illum cum aut. Dolore doloremque unde fuga nostrum omnis dolorem.', '2016-05-04 01:09:56'),
(97, 3, 'claude92', 'leanna.jpeg', 'Cupiditate qui dolore nobis in autem. Adipisci deserunt perspiciatis ut vel. Voluptatem consequuntur voluptatem molestias possimus magnam earum non. Voluptas et et omnis est.', '2016-08-06 07:10:19'),
(98, 8, 'glenna33', 'leanna.jpeg', 'Architecto corrupti itaque ipsa tenetur. Autem consequatur consequatur perspiciatis animi.', '2016-04-27 12:37:54'),
(99, 6, 'lpfeffer', 'leanna.jpeg', 'Maxime explicabo assumenda sit repellat. Nam in pariatur vero fuga consequatur praesentium consequatur nihil. Possimus id voluptas similique.', '2016-08-24 11:53:35'),
(100, 9, 'bpagac', 'leanna.jpeg', 'Ut omnis nisi dolorem ut repellat delectus magnam. Molestiae et a accusantium tempora consequuntur est ut commodi. Doloribus fugiat repellat harum assumenda. Illo voluptatem nobis fugit inventore sed at.', '2016-09-22 09:19:45');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `migration_versions`
--

CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Salvarea datelor din tabel `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20161018115953'),
('20161021175859');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `sub_family`
--

CREATE TABLE IF NOT EXISTS `sub_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Salvarea datelor din tabel `sub_family`
--

INSERT INTO `sub_family` (`id`, `name`) VALUES
(1, 'family_1'),
(2, 'family_2'),
(3, 'family_3'),
(4, 'family_4'),
(5, 'family_5');

--
-- Restrictii pentru tabele sterse
--

--
-- Restrictii pentru tabele `genus`
--
ALTER TABLE `genus`
  ADD CONSTRAINT `FK_38C5106ED15310D4` FOREIGN KEY (`sub_family_id`) REFERENCES `sub_family` (`id`);

--
-- Restrictii pentru tabele `genus_note`
--
ALTER TABLE `genus_note`
  ADD CONSTRAINT `FK_6478FCEC85C4074C` FOREIGN KEY (`genus_id`) REFERENCES `genus` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
