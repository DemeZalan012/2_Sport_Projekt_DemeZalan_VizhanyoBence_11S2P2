-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Máj 08. 18:40
-- Kiszolgáló verziója: 8.0.41
-- PHP verzió: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `foci2`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapatok`
--

CREATE TABLE `csapatok` (
  `csapat_id` int NOT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `edzo_neve` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kisero_neve` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `csapatkapitany_id` int DEFAULT NULL,
  `merkozes_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `csapatok`
--

INSERT INTO `csapatok` (`csapat_id`, `nev`, `edzo_neve`, `kisero_neve`, `csapatkapitany_id`, `merkozes_id`) VALUES
(1, 'Ferencvárosi TC', 'Nagy Gábor', 'Kovács Péter', 2, 1),
(2, 'Újpest FC', 'Szabó István', 'Tóth Béla', 2, 1),
(3, 'Debreceni VSC', 'Horváth Zoltán', 'Varga László', 2, 1),
(4, 'Videoton FC', 'Kiss Sándor', 'Németh Gábor', 2, 1),
(5, 'Honvéd Budapest', 'Fodor Attila', 'Molnár Tamás', 2, 1),
(6, 'Diósgyőri VTK', 'Balogh Imre', 'Simon Ferenc', 2, 1),
(7, 'Paks SE', 'Farkas József', 'Pálinkás Gábor', 2, 1),
(8, 'Mezőkövesd-Zsóry SE', 'Lakatos Márton', 'Bálint Zoltán', 2, 1),
(9, 'Puskás Akadémia FC', 'Török Csaba', 'Fehér István', 2, 1),
(10, 'Kisvárda FC', 'Nagy László', 'Kovács Zoltán', 2, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cserek`
--

CREATE TABLE `cserek` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `perc` int DEFAULT NULL,
  `be_jatekos_id` int DEFAULT NULL,
  `le_jatekos_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eredmenyek`
--

CREATE TABLE `eredmenyek` (
  `merkozes_id` int NOT NULL,
  `felido_csapat1` int DEFAULT NULL,
  `felido_csapat2` int DEFAULT NULL,
  `vegeredmeny_csapat1` int DEFAULT NULL,
  `vegeredmeny_csapat2` int DEFAULT NULL,
  `buntetok_csapat1` int DEFAULT NULL,
  `buntetok_csapat2` int DEFAULT NULL,
  `tovabbjuto_csapat_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `eredmenyek`
--

INSERT INTO `eredmenyek` (`merkozes_id`, `felido_csapat1`, `felido_csapat2`, `vegeredmeny_csapat1`, `vegeredmeny_csapat2`, `buntetok_csapat1`, `buntetok_csapat2`, `tovabbjuto_csapat_id`) VALUES
(1, 2, 1, 4, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `golok`
--

CREATE TABLE `golok` (
  `gol_id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `jatekos_id` int DEFAULT NULL,
  `perc` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `golok`
--

INSERT INTO `golok` (`gol_id`, `merkozes_id`, `jatekos_id`, `perc`) VALUES
(1, 1, 2, 10),
(2, 1, 3, 25),
(3, 1, 4, 45),
(4, 1, 5, 60),
(5, 1, 6, 75),
(6, 1, 7, 80),
(7, 1, 8, 85),
(8, 1, 9, 90),
(9, 1, 12, 15),
(10, 1, 13, 30);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekosok`
--

CREATE TABLE `jatekosok` (
  `jatekos_id` int NOT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mezszam` int DEFAULT NULL,
  `kezdo` tinyint(1) DEFAULT '0',
  `kapus` tinyint(1) DEFAULT '0',
  `csapat_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jatekosok`
--

INSERT INTO `jatekosok` (`jatekos_id`, `nev`, `mezszam`, `kezdo`, `kapus`, `csapat_id`) VALUES
(1, 'Kovács Márton', 1, 1, 1, 1),
(2, 'Nagy Dániel', 2, 1, 0, 1),
(3, 'Szabó Bence', 3, 1, 0, 1),
(4, 'Horváth Ádám', 4, 1, 0, 1),
(5, 'Varga Tamás', 5, 1, 0, 1),
(6, 'Tóth Péter', 6, 0, 0, 1),
(7, 'Kiss Zoltán', 7, 0, 0, 1),
(8, 'Molnár István', 8, 0, 0, 1),
(9, 'Fodor Balázs', 9, 0, 0, 1),
(10, 'Simon Gábor', 10, 0, 0, 1),
(11, 'Török Attila', 1, 1, 1, 2),
(12, 'Fehér László', 2, 1, 0, 2),
(13, 'Bálint Márton', 3, 1, 0, 2),
(14, 'Pálinkás Gábor', 4, 1, 0, 2),
(15, 'Farkas József', 5, 1, 0, 2),
(16, 'Lakatos István', 6, 0, 0, 2),
(17, 'Nagy Csaba', 7, 0, 0, 2),
(18, 'Kovács Zoltán', 8, 0, 0, 2),
(19, 'Szabó István', 9, 0, 0, 2),
(20, 'Horváth Péter', 10, 0, 0, 2),
(21, 'Varga László', 1, 1, 1, 3),
(22, 'Tóth Zoltán', 2, 1, 0, 3),
(23, 'Kiss István', 3, 1, 0, 3),
(24, 'Molnár Ádám', 4, 1, 0, 3),
(25, 'Fodor Tamás', 5, 1, 0, 3),
(26, 'Simon Balázs', 6, 0, 0, 3),
(27, 'Nagy Márton', 7, 0, 0, 3),
(28, 'Kovács Dániel', 8, 0, 0, 3),
(29, 'Szabó Bence', 9, 0, 0, 3),
(30, 'Horváth Gábor', 10, 0, 0, 3),
(31, 'Bálint László', 1, 1, 1, 4),
(32, 'Pálinkás István', 2, 1, 0, 4),
(33, 'Farkas Márton', 3, 1, 0, 4),
(34, 'Lakatos Zoltán', 4, 1, 0, 4),
(35, 'Nagy Tamás', 5, 1, 0, 4),
(36, 'Kovács Ádám', 6, 0, 0, 4),
(37, 'Szabó Péter', 7, 0, 0, 4),
(38, 'Horváth Balázs', 8, 0, 0, 4),
(39, 'Tóth Gábor', 9, 0, 0, 4),
(40, 'Kiss István', 10, 0, 0, 4),
(41, 'Fehér Márton', 1, 1, 1, 5),
(42, 'Török László', 2, 1, 0, 5),
(43, 'Nagy István', 3, 1, 0, 5),
(44, 'Kovács Gábor', 4, 1, 0, 5),
(45, 'Szabó Zoltán', 5, 1, 0, 5),
(46, 'Horváth Dániel', 6, 0, 0, 5),
(47, 'Varga Tamás', 7, 0, 0, 5),
(48, 'Tóth Balázs', 8, 0, 0, 5),
(49, 'Kiss Péter', 9, 0, 0, 5),
(50, 'Molnár Ádám', 10, 0, 0, 5),
(51, 'Lakatos Márton', 1, 1, 1, 6),
(52, 'Farkas László', 2, 1, 0, 6),
(53, 'Pálinkás Zoltán', 3, 1, 0, 6),
(54, 'Bálint Tamás', 4, 1, 0, 6),
(55, 'Nagy Ádám', 5, 1, 0, 6),
(56, 'Kovács Péter', 6, 0, 0, 6),
(57, 'Szabó Balázs', 7, 0, 0, 6),
(58, 'Horváth Gábor', 8, 0, 0, 6),
(59, 'Tóth István', 9, 0, 0, 6),
(60, 'Kiss Dániel', 10, 0, 0, 6),
(61, 'Nagy Márton', 1, 1, 1, 7),
(62, 'Kovács László', 2, 1, 0, 7),
(63, 'Szabó Zoltán', 3, 1, 0, 7),
(64, 'Horváth István', 4, 1, 0, 7),
(65, 'Varga Tamás', 5, 1, 0, 7),
(66, 'Tóth Balázs', 6, 0, 0, 7),
(67, 'Kiss Péter', 7, 0, 0, 7),
(68, 'Molnár Ádám', 8, 0, 0, 7),
(69, 'Fodor Gábor', 9, 0, 0, 7),
(70, 'Simon Zoltán', 10, 0, 0, 7),
(71, 'Török Márton', 1, 1, 1, 8),
(72, 'Fehér László', 2, 1, 0, 8),
(73, 'Bálint István', 3, 1, 0, 8),
(74, 'Pálinkás Zoltán', 4, 1, 0, 8),
(75, 'Farkas Tamás', 5, 1, 0, 8),
(76, 'Lakatos Ádám', 6, 0, 0, 8),
(77, 'Nagy Balázs', 7, 0, 0, 8),
(78, 'Kovács Gábor', 8, 0, 0, 8),
(79, 'Szabó Péter', 9, 0, 0, 8),
(80, 'Horváth Dániel', 10, 0, 0, 8),
(81, 'Varga Márton', 1, 1, 1, 9),
(82, 'Tóth László', 2, 1, 0, 9),
(83, 'Kiss István', 3, 1, 0, 9),
(84, 'Molnár Zoltán', 4, 1, 0, 9),
(85, 'Fodor Ádám', 5, 1, 0, 9),
(86, 'Simon Tamás', 6, 0, 0, 9),
(87, 'Nagy Balázs', 7, 0, 0, 9),
(88, 'Kovács Péter', 8, 0, 0, 9),
(89, 'Szabó Gábor', 9, 0, 0, 9),
(90, 'Horváth István', 10, 0, 0, 9),
(91, 'Bálint Márton', 1, 1, 1, 10),
(92, 'Pálinkás László', 2, 1, 0, 10),
(93, 'Farkas Zoltán', 3, 1, 0, 10),
(94, 'Lakatos Tamás', 4, 1, 0, 10),
(95, 'Nagy Ádám', 5, 1, 0, 10),
(96, 'Kovács István', 6, 0, 0, 10),
(97, 'Szabó Balázs', 7, 0, 0, 10),
(98, 'Horváth Péter', 8, 0, 0, 10),
(99, 'Tóth Gábor', 9, 0, 0, 10),
(100, 'Kiss Dániel', 10, 0, 0, 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekvezetok`
--

CREATE TABLE `jatekvezetok` (
  `jatekvezeto_id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `szerepkor` enum('vezetőbíró','asszisztens','jegyzőkönyvvezető') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megjegyzesek`
--

CREATE TABLE `megjegyzesek` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `tipus` enum('sérülés','leállás','óvás','játékvezetői megjegyzés','időjárás','különös esemény') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `leiras` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `merkozesek`
--

CREATE TABLE `merkozesek` (
  `merkozes_id` int NOT NULL,
  `datum` datetime DEFAULT NULL,
  `palya_neve` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `varos` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `megye` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verseny_megnevezes` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `korcsoport` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nem` enum('fiú','lány') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sorszam` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `merkozesek`
--

INSERT INTO `merkozesek` (`merkozes_id`, `datum`, `palya_neve`, `varos`, `megye`, `verseny_megnevezes`, `korcsoport`, `nem`, `sorszam`) VALUES
(1, '2023-10-01 14:00:00', 'Hidegkuti Nándor Stadion', 'Budapest', 'Budapest', 'Bajnokság', 'U19', 'fiú', 'M001');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `piros_lapok`
--

CREATE TABLE `piros_lapok` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `jatekos_id` int DEFAULT NULL,
  `perc` int DEFAULT NULL,
  `megjegyzes` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `piros_lapok`
--

INSERT INTO `piros_lapok` (`id`, `merkozes_id`, `jatekos_id`, `perc`, `megjegyzes`) VALUES
(1, 1, 7, 45, 'Durva szabálytalanság'),
(2, 1, 17, 60, 'Durva szabálytalanság');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sarga_lapok`
--

CREATE TABLE `sarga_lapok` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `jatekos_id` int DEFAULT NULL,
  `perc` int DEFAULT NULL,
  `megjegyzes` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `sarga_lapok`
--

INSERT INTO `sarga_lapok` (`id`, `merkozes_id`, `jatekos_id`, `perc`, `megjegyzes`) VALUES
(1, 1, 2, 20, 'Szabálytalanság'),
(2, 1, 5, 35, 'Szabálytalanság'),
(3, 1, 8, 50, 'Szabálytalanság'),
(4, 1, 10, 65, 'Szabálytalanság'),
(5, 1, 12, 25, 'Szabálytalanság'),
(6, 1, 15, 40, 'Szabálytalanság'),
(7, 1, 18, 55, 'Szabálytalanság'),
(8, 1, 20, 70, 'Szabálytalanság'),
(9, 1, 22, 80, 'Szabálytalanság'),
(10, 1, 25, 90, 'Szabálytalanság');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `statisztika`
--

CREATE TABLE `statisztika` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `csapat_id` int DEFAULT NULL,
  `tipus` enum('kapura_loves','szoglet','les','szabalytalansag') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `darab` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `statisztika`
--

INSERT INTO `statisztika` (`id`, `merkozes_id`, `csapat_id`, `tipus`, `darab`) VALUES
(1, 1, 1, 'kapura_loves', 10),
(2, 1, 1, 'szoglet', 5),
(3, 1, 1, 'les', 2),
(4, 1, 1, 'szabalytalansag', 3),
(5, 1, 2, 'kapura_loves', 8),
(6, 1, 2, 'szoglet', 4),
(7, 1, 2, 'les', 1),
(8, 1, 2, 'szabalytalansag', 4);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `csapatok`
--
ALTER TABLE `csapatok`
  ADD PRIMARY KEY (`csapat_id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `fk_csapatkapitany` (`csapatkapitany_id`);

--
-- A tábla indexei `cserek`
--
ALTER TABLE `cserek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `be_jatekos_id` (`be_jatekos_id`),
  ADD KEY `le_jatekos_id` (`le_jatekos_id`);

--
-- A tábla indexei `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD PRIMARY KEY (`merkozes_id`),
  ADD KEY `tovabbjuto_csapat_id` (`tovabbjuto_csapat_id`);

--
-- A tábla indexei `golok`
--
ALTER TABLE `golok`
  ADD PRIMARY KEY (`gol_id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `jatekos_id` (`jatekos_id`);

--
-- A tábla indexei `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD PRIMARY KEY (`jatekos_id`),
  ADD KEY `csapat_id` (`csapat_id`);

--
-- A tábla indexei `jatekvezetok`
--
ALTER TABLE `jatekvezetok`
  ADD PRIMARY KEY (`jatekvezeto_id`),
  ADD KEY `merkozes_id` (`merkozes_id`);

--
-- A tábla indexei `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`);

--
-- A tábla indexei `merkozesek`
--
ALTER TABLE `merkozesek`
  ADD PRIMARY KEY (`merkozes_id`);

--
-- A tábla indexei `piros_lapok`
--
ALTER TABLE `piros_lapok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `jatekos_id` (`jatekos_id`);

--
-- A tábla indexei `sarga_lapok`
--
ALTER TABLE `sarga_lapok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `jatekos_id` (`jatekos_id`);

--
-- A tábla indexei `statisztika`
--
ALTER TABLE `statisztika`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `csapat_id` (`csapat_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `csapatok`
--
ALTER TABLE `csapatok`
  MODIFY `csapat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `cserek`
--
ALTER TABLE `cserek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `golok`
--
ALTER TABLE `golok`
  MODIFY `gol_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  MODIFY `jatekos_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT a táblához `jatekvezetok`
--
ALTER TABLE `jatekvezetok`
  MODIFY `jatekvezeto_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `merkozesek`
--
ALTER TABLE `merkozesek`
  MODIFY `merkozes_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `piros_lapok`
--
ALTER TABLE `piros_lapok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `sarga_lapok`
--
ALTER TABLE `sarga_lapok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `statisztika`
--
ALTER TABLE `statisztika`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `csapatok`
--
ALTER TABLE `csapatok`
  ADD CONSTRAINT `csapatok_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `fk_csapatkapitany` FOREIGN KEY (`csapatkapitany_id`) REFERENCES `jatekosok` (`jatekos_id`);

--
-- Megkötések a táblához `cserek`
--
ALTER TABLE `cserek`
  ADD CONSTRAINT `cserek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `cserek_ibfk_2` FOREIGN KEY (`be_jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`),
  ADD CONSTRAINT `cserek_ibfk_3` FOREIGN KEY (`le_jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`);

--
-- Megkötések a táblához `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD CONSTRAINT `eredmenyek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `eredmenyek_ibfk_2` FOREIGN KEY (`tovabbjuto_csapat_id`) REFERENCES `csapatok` (`csapat_id`);

--
-- Megkötések a táblához `golok`
--
ALTER TABLE `golok`
  ADD CONSTRAINT `golok_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `golok_ibfk_2` FOREIGN KEY (`jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`);

--
-- Megkötések a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD CONSTRAINT `jatekosok_ibfk_1` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`csapat_id`);

--
-- Megkötések a táblához `jatekvezetok`
--
ALTER TABLE `jatekvezetok`
  ADD CONSTRAINT `jatekvezetok_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`);

--
-- Megkötések a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  ADD CONSTRAINT `megjegyzesek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`);

--
-- Megkötések a táblához `piros_lapok`
--
ALTER TABLE `piros_lapok`
  ADD CONSTRAINT `piros_lapok_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `piros_lapok_ibfk_2` FOREIGN KEY (`jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`);

--
-- Megkötések a táblához `sarga_lapok`
--
ALTER TABLE `sarga_lapok`
  ADD CONSTRAINT `sarga_lapok_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `sarga_lapok_ibfk_2` FOREIGN KEY (`jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`);

--
-- Megkötések a táblához `statisztika`
--
ALTER TABLE `statisztika`
  ADD CONSTRAINT `statisztika_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `statisztika_ibfk_2` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`csapat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
