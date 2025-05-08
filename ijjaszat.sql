-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Máj 08. 19:03
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
-- Adatbázis: `íjjászat`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapatok`
--

CREATE TABLE `csapatok` (
  `csapat_id` int NOT NULL,
  `csapat_nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verseny_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `csapatok`
--

INSERT INTO `csapatok` (`csapat_id`, `csapat_nev`, `verseny_id`) VALUES
(1, 'Budapesti Íjászok', 1),
(2, 'Debreceni Lövészek', 2),
(3, 'Szegedi Nyilak', 3),
(4, 'Pesti Íjászok', 1),
(5, 'Duna Csapat', 2),
(6, 'Tisza Nyilazók', 3),
(7, 'Budai Íjászok', 1),
(8, 'Hortobágyi Lövészek', 2),
(9, 'Délvidéki Nyilak', 3),
(10, 'Fővárosi Íjászok', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapat_tagok`
--

CREATE TABLE `csapat_tagok` (
  `csapat_id` int NOT NULL,
  `versenyzo_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `csapat_tagok`
--

INSERT INTO `csapat_tagok` (`csapat_id`, `versenyzo_id`) VALUES
(1, 1),
(4, 1),
(7, 1),
(10, 1),
(2, 2),
(5, 2),
(8, 2),
(3, 3),
(6, 3),
(9, 3),
(1, 4),
(4, 4),
(7, 4),
(10, 4),
(2, 5),
(5, 5),
(8, 5),
(3, 6),
(6, 6),
(9, 6),
(1, 7),
(4, 7),
(7, 7),
(10, 7),
(2, 8),
(5, 8),
(8, 8),
(3, 9),
(6, 9),
(9, 9),
(1, 10),
(4, 10),
(7, 10),
(10, 10),
(2, 11),
(5, 11),
(8, 11),
(3, 12),
(6, 12),
(9, 12),
(1, 13),
(4, 13),
(7, 13),
(10, 13),
(2, 14),
(5, 14),
(8, 14),
(3, 15),
(6, 15),
(9, 15),
(1, 16),
(4, 16),
(7, 16),
(10, 16),
(2, 17),
(5, 17),
(8, 17),
(3, 18),
(6, 18),
(9, 18),
(1, 19),
(4, 19),
(7, 19),
(10, 19),
(2, 20),
(5, 20),
(8, 20),
(3, 21),
(6, 21),
(9, 21),
(1, 22),
(4, 22),
(7, 22),
(10, 22),
(2, 23),
(5, 23),
(8, 23),
(3, 24),
(6, 24),
(9, 24),
(1, 25),
(4, 25),
(7, 25),
(10, 25),
(2, 26),
(5, 26),
(8, 26),
(3, 27),
(6, 27),
(9, 27),
(1, 28),
(4, 28),
(7, 28),
(10, 28),
(2, 29),
(5, 29),
(8, 29),
(3, 30),
(6, 30),
(9, 30);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eredmenyek`
--

CREATE TABLE `eredmenyek` (
  `eredmeny_id` int NOT NULL,
  `versenyzo_id` int DEFAULT NULL,
  `tav_egyseg` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cel_tipus` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sorozatok_szama` int DEFAULT NULL,
  `lovesek_sorozatonkent` int DEFAULT NULL,
  `osszpontszam` int DEFAULT NULL,
  `x_szam` int DEFAULT NULL,
  `tizes_szam` int DEFAULT NULL,
  `tiszta_talalat` int DEFAULT NULL,
  `hibak_szama` int DEFAULT NULL,
  `verseny_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `eredmenyek`
--

INSERT INTO `eredmenyek` (`eredmeny_id`, `versenyzo_id`, `tav_egyseg`, `cel_tipus`, `sorozatok_szama`, `lovesek_sorozatonkent`, `osszpontszam`, `x_szam`, `tizes_szam`, `tiszta_talalat`, `hibak_szama`, `verseny_id`) VALUES
(1, 1, '70m', 'FITA', 6, 6, 280, 10, 20, 50, 2, 1),
(2, 2, '70m', 'FITA', 6, 6, 275, 8, 18, 48, 3, 2),
(3, 3, '70m', 'FITA', 6, 6, 290, 12, 22, 52, 1, 3),
(4, 4, '70m', 'FITA', 6, 6, 270, 9, 19, 49, 4, 1),
(5, 5, '70m', 'FITA', 6, 6, 285, 11, 21, 51, 2, 2),
(6, 6, '70m', 'FITA', 6, 6, 295, 13, 23, 53, 0, 3),
(7, 7, '70m', 'FITA', 6, 6, 265, 7, 17, 47, 5, 1),
(8, 8, '70m', 'FITA', 6, 6, 280, 10, 20, 50, 2, 2),
(9, 9, '70m', 'FITA', 6, 6, 290, 12, 22, 52, 1, 3),
(10, 10, '70m', 'FITA', 6, 6, 275, 8, 18, 48, 3, 1),
(11, 11, '70m', 'FITA', 6, 6, 285, 11, 21, 51, 2, 2),
(12, 12, '70m', 'FITA', 6, 6, 295, 13, 23, 53, 0, 3),
(13, 13, '70m', 'FITA', 6, 6, 265, 7, 17, 47, 5, 1),
(14, 14, '70m', 'FITA', 6, 6, 280, 10, 20, 50, 2, 2),
(15, 15, '70m', 'FITA', 6, 6, 290, 12, 22, 52, 1, 3),
(16, 16, '70m', 'FITA', 6, 6, 275, 8, 18, 48, 3, 1),
(17, 17, '70m', 'FITA', 6, 6, 285, 11, 21, 51, 2, 2),
(18, 18, '70m', 'FITA', 6, 6, 295, 13, 23, 53, 0, 3),
(19, 19, '70m', 'FITA', 6, 6, 265, 7, 17, 47, 5, 1),
(20, 20, '70m', 'FITA', 6, 6, 280, 10, 20, 50, 2, 2),
(21, 21, '70m', 'FITA', 6, 6, 290, 12, 22, 52, 1, 3),
(22, 22, '70m', 'FITA', 6, 6, 275, 8, 18, 48, 3, 1),
(23, 23, '70m', 'FITA', 6, 6, 285, 11, 21, 51, 2, 2),
(24, 24, '70m', 'FITA', 6, 6, 295, 13, 23, 53, 0, 3),
(25, 25, '70m', 'FITA', 6, 6, 265, 7, 17, 47, 5, 1),
(26, 26, '70m', 'FITA', 6, 6, 280, 10, 20, 50, 2, 2),
(27, 27, '70m', 'FITA', 6, 6, 290, 12, 22, 52, 1, 3),
(28, 28, '70m', 'FITA', 6, 6, 275, 8, 18, 48, 3, 1),
(29, 29, '70m', 'FITA', 6, 6, 285, 11, 21, 51, 2, 2),
(30, 30, '70m', 'FITA', 6, 6, 295, 13, 23, 53, 0, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megjegyzesek`
--

CREATE TABLE `megjegyzesek` (
  `megjegyzes_id` int NOT NULL,
  `verseny_id` int DEFAULT NULL,
  `tipus` enum('technikai probléma','szabálytalanság','óvás','játékvezetői megjegyzés','időjárás') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `leiras` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `megjegyzesek`
--

INSERT INTO `megjegyzesek` (`megjegyzes_id`, `verseny_id`, `tipus`, `leiras`) VALUES
(1, 1, 'technikai probléma', 'Íj feszültség beállítási hiba'),
(2, 1, 'szabálytalanság', 'Késés a verseny kezdetén'),
(3, 2, 'óvás', 'Pontszámítási vita'),
(4, 2, 'játékvezetői megjegyzés', 'Figyelmeztetés a csapat kapitányának'),
(5, 3, 'időjárás', 'Erős szél a verseny alatt');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vegeredmeny`
--

CREATE TABLE `vegeredmeny` (
  `eredmeny_id` int NOT NULL,
  `helyezes` int DEFAULT NULL,
  `szetloves_pont` int DEFAULT NULL,
  `dijazas` enum('arany','ezüst','bronz','különdíj','nincs') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `csapat_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `vegeredmeny`
--

INSERT INTO `vegeredmeny` (`eredmeny_id`, `helyezes`, `szetloves_pont`, `dijazas`, `csapat_id`) VALUES
(1, 3, 280, 'bronz', 1),
(2, 5, 275, 'nincs', 2),
(3, 1, 290, 'arany', 3),
(4, 4, 270, 'nincs', 4),
(5, 2, 285, 'ezüst', 5),
(6, 1, 295, 'arany', 6),
(7, 6, 265, 'nincs', 7),
(8, 5, 280, 'nincs', 8),
(9, 1, 290, 'arany', 9),
(10, 4, 275, 'nincs', 10),
(11, 2, 285, 'ezüst', 1),
(12, 1, 295, 'arany', 2),
(13, 6, 265, 'nincs', 3),
(14, 5, 280, 'nincs', 4),
(15, 1, 290, 'arany', 5),
(16, 4, 275, 'nincs', 6),
(17, 2, 285, 'ezüst', 7),
(18, 1, 295, 'arany', 8),
(19, 6, 265, 'nincs', 9),
(20, 5, 280, 'nincs', 10),
(21, 1, 290, 'arany', 1),
(22, 4, 275, 'nincs', 2),
(23, 2, 285, 'ezüst', 3),
(24, 1, 295, 'arany', 4),
(25, 6, 265, 'nincs', 5),
(26, 5, 280, 'nincs', 6),
(27, 1, 290, 'arany', 7),
(28, 4, 275, 'nincs', 8),
(29, 2, 285, 'ezüst', 9),
(30, 1, 295, 'arany', 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `versenybirok`
--

CREATE TABLE `versenybirok` (
  `biro_id` int NOT NULL,
  `szerepkor` enum('vezetőbíró','pontozóbíró','technikai ellenőr','jegyzőkönyvvezető') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verseny_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `versenybirok`
--

INSERT INTO `versenybirok` (`biro_id`, `szerepkor`, `nev`, `verseny_id`) VALUES
(1, 'vezetőbíró', 'Kis Gábor', 1),
(2, 'pontozóbíró', 'Nagy Eszter', 1),
(3, 'technikai ellenőr', 'Szabó Dániel', 1),
(4, 'jegyzőkönyvvezető', 'Tóth Fruzsina', 1),
(5, 'vezetőbíró', 'Horváth Márton', 2),
(6, 'pontozóbíró', 'Varga Luca', 2),
(7, 'technikai ellenőr', 'Fehér Balázs', 2),
(8, 'jegyzőkönyvvezető', 'Kiss Petra', 2),
(9, 'vezetőbíró', 'Molnár Gábor', 3),
(10, 'pontozóbíró', 'Lakatos Eszter', 3),
(11, 'technikai ellenőr', 'Bálint Dániel', 3),
(12, 'jegyzőkönyvvezető', 'Orosz Zita', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `versenyek`
--

CREATE TABLE `versenyek` (
  `verseny_id` int NOT NULL,
  `nev` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `helyszin` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `korcsoport` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kategoria` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `versenyszam_tipusa` enum('egyéni','csapat','mix csapat') COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `versenyek`
--

INSERT INTO `versenyek` (`verseny_id`, `nev`, `datum`, `helyszin`, `korcsoport`, `kategoria`, `versenyszam_tipusa`) VALUES
(1, 'Nyári Íjász Verseny', '2023-07-15', 'Budapest', 'U18', 'Recreational', 'egyéni'),
(2, 'Tavaszi Csapatbajnokság', '2023-05-22', 'Debrecen', 'U21', 'Competitive', 'csapat'),
(3, 'Őszi Mix Csapatverseny', '2023-10-10', 'Szeged', 'Senior', 'Professional', 'mix csapat');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `versenyzok`
--

CREATE TABLE `versenyzok` (
  `versenyzo_id` int NOT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iskola` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rajtszam` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ij_tipus` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `korosztaly` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nem` enum('fiú','lány') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `edzo_neve` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verseny_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `versenyzok`
--

INSERT INTO `versenyzok` (`versenyzo_id`, `nev`, `iskola`, `rajtszam`, `ij_tipus`, `korosztaly`, `nem`, `edzo_neve`, `verseny_id`) VALUES
(1, 'Kovács Márton', 'Budapesti Íjász Iskola', 'RT101', 'Recurve', 'U18', 'fiú', 'Tóth Béla', 1),
(2, 'Nagy Anna', 'Debreceni Sportiskola', 'RT102', 'Compound', 'U21', 'lány', 'Szabó István', 2),
(3, 'Szabó Péter', 'Szegedi Íjász Akadémia', 'RT103', 'Recurve', 'Senior', 'fiú', 'Horváth Zsófia', 3),
(4, 'Tóth Eszter', 'Budapesti Íjász Iskola', 'RT104', 'Compound', 'U18', 'lány', 'Kovács László', 1),
(5, 'Horváth Dániel', 'Debreceni Sportiskola', 'RT105', 'Recurve', 'U21', 'fiú', 'Nagy Péter', 2),
(6, 'Varga Luca', 'Szegedi Íjász Akadémia', 'RT106', 'Compound', 'Senior', 'lány', 'Fehér Márton', 3),
(7, 'Fehér Balázs', 'Budapesti Íjász Iskola', 'RT107', 'Recurve', 'U18', 'fiú', 'Tóth Anna', 1),
(8, 'Kiss Fruzsina', 'Debreceni Sportiskola', 'RT108', 'Compound', 'U21', 'lány', 'Szabó Péter', 2),
(9, 'Molnár Gábor', 'Szegedi Íjász Akadémia', 'RT109', 'Recurve', 'Senior', 'fiú', 'Horváth Anna', 3),
(10, 'Lakatos Petra', 'Budapesti Íjász Iskola', 'RT110', 'Compound', 'U18', 'lány', 'Kovács Péter', 1),
(11, 'Bálint Márk', 'Debreceni Sportiskola', 'RT111', 'Recurve', 'U21', 'fiú', 'Nagy Anna', 2),
(12, 'Orosz Zita', 'Szegedi Íjász Akadémia', 'RT112', 'Compound', 'Senior', 'lány', 'Fehér Anna', 3),
(13, 'Juhász Dávid', 'Budapesti Íjász Iskola', 'RT113', 'Recurve', 'U18', 'fiú', 'Tóth Péter', 1),
(14, 'Kis Viktória', 'Debreceni Sportiskola', 'RT114', 'Compound', 'U21', 'lány', 'Szabó Anna', 2),
(15, 'Németh Tamás', 'Szegedi Íjász Akadémia', 'RT115', 'Recurve', 'Senior', 'fiú', 'Horváth Péter', 3),
(16, 'Farkas Réka', 'Budapesti Íjász Iskola', 'RT116', 'Compound', 'U18', 'lány', 'Kovács Anna', 1),
(17, 'Papp Bence', 'Debreceni Sportiskola', 'RT117', 'Recurve', 'U21', 'fiú', 'Nagy Péter', 2),
(18, 'Török Dorottya', 'Szegedi Íjász Akadémia', 'RT118', 'Compound', 'Senior', 'lány', 'Fehér Péter', 3),
(19, 'Simon Ádám', 'Budapesti Íjász Iskola', 'RT119', 'Recurve', 'U18', 'fiú', 'Tóth Anna', 1),
(20, 'Rácz Laura', 'Debreceni Sportiskola', 'RT120', 'Compound', 'U21', 'lány', 'Szabó Péter', 2),
(21, 'Fodor Márton', 'Szegedi Íjász Akadémia', 'RT121', 'Recurve', 'Senior', 'fiú', 'Horváth Anna', 3),
(22, 'Varga Eszter', 'Budapesti Íjász Iskola', 'RT122', 'Compound', 'U18', 'lány', 'Kovács Péter', 1),
(23, 'Kiss Balázs', 'Debreceni Sportiskola', 'RT123', 'Recurve', 'U21', 'fiú', 'Nagy Anna', 2),
(24, 'Mészáros Fanni', 'Szegedi Íjász Akadémia', 'RT124', 'Compound', 'Senior', 'lány', 'Fehér Anna', 3),
(25, 'Lukács Dániel', 'Budapesti Íjász Iskola', 'RT125', 'Recurve', 'U18', 'fiú', 'Tóth Péter', 1),
(26, 'Bognár Petra', 'Debreceni Sportiskola', 'RT126', 'Compound', 'U21', 'lány', 'Szabó Anna', 2),
(27, 'Vincze Tamás', 'Szegedi Íjász Akadémia', 'RT127', 'Recurve', 'Senior', 'fiú', 'Horváth Péter', 3),
(28, 'Gál Réka', 'Budapesti Íjász Iskola', 'RT128', 'Compound', 'U18', 'lány', 'Kovács Anna', 1),
(29, 'Hegedűs Bence', 'Debreceni Sportiskola', 'RT129', 'Recurve', 'U21', 'fiú', 'Nagy Péter', 2),
(30, 'Kovács Dorottya', 'Szegedi Íjász Akadémia', 'RT130', 'Compound', 'Senior', 'lány', 'Fehér Péter', 3);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `csapatok`
--
ALTER TABLE `csapatok`
  ADD PRIMARY KEY (`csapat_id`),
  ADD KEY `verseny_id` (`verseny_id`);

--
-- A tábla indexei `csapat_tagok`
--
ALTER TABLE `csapat_tagok`
  ADD PRIMARY KEY (`csapat_id`,`versenyzo_id`),
  ADD KEY `versenyzo_id` (`versenyzo_id`);

--
-- A tábla indexei `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD PRIMARY KEY (`eredmeny_id`),
  ADD KEY `versenyzo_id` (`versenyzo_id`),
  ADD KEY `verseny_id` (`verseny_id`);

--
-- A tábla indexei `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  ADD PRIMARY KEY (`megjegyzes_id`),
  ADD KEY `verseny_id` (`verseny_id`);

--
-- A tábla indexei `vegeredmeny`
--
ALTER TABLE `vegeredmeny`
  ADD PRIMARY KEY (`eredmeny_id`),
  ADD KEY `csapat_id` (`csapat_id`);

--
-- A tábla indexei `versenybirok`
--
ALTER TABLE `versenybirok`
  ADD PRIMARY KEY (`biro_id`),
  ADD KEY `verseny_id` (`verseny_id`);

--
-- A tábla indexei `versenyek`
--
ALTER TABLE `versenyek`
  ADD PRIMARY KEY (`verseny_id`);

--
-- A tábla indexei `versenyzok`
--
ALTER TABLE `versenyzok`
  ADD PRIMARY KEY (`versenyzo_id`),
  ADD KEY `verseny_id` (`verseny_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `csapatok`
--
ALTER TABLE `csapatok`
  MODIFY `csapat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `eredmenyek`
--
ALTER TABLE `eredmenyek`
  MODIFY `eredmeny_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  MODIFY `megjegyzes_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `versenybirok`
--
ALTER TABLE `versenybirok`
  MODIFY `biro_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `versenyek`
--
ALTER TABLE `versenyek`
  MODIFY `verseny_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `versenyzok`
--
ALTER TABLE `versenyzok`
  MODIFY `versenyzo_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `csapatok`
--
ALTER TABLE `csapatok`
  ADD CONSTRAINT `csapatok_ibfk_1` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`);

--
-- Megkötések a táblához `csapat_tagok`
--
ALTER TABLE `csapat_tagok`
  ADD CONSTRAINT `csapat_tagok_ibfk_1` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`csapat_id`),
  ADD CONSTRAINT `csapat_tagok_ibfk_2` FOREIGN KEY (`versenyzo_id`) REFERENCES `versenyzok` (`versenyzo_id`);

--
-- Megkötések a táblához `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD CONSTRAINT `eredmenyek_ibfk_1` FOREIGN KEY (`versenyzo_id`) REFERENCES `versenyzok` (`versenyzo_id`),
  ADD CONSTRAINT `eredmenyek_ibfk_2` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`);

--
-- Megkötések a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  ADD CONSTRAINT `megjegyzesek_ibfk_1` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`);

--
-- Megkötések a táblához `vegeredmeny`
--
ALTER TABLE `vegeredmeny`
  ADD CONSTRAINT `vegeredmeny_ibfk_1` FOREIGN KEY (`eredmeny_id`) REFERENCES `eredmenyek` (`eredmeny_id`),
  ADD CONSTRAINT `vegeredmeny_ibfk_2` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`csapat_id`);

--
-- Megkötések a táblához `versenybirok`
--
ALTER TABLE `versenybirok`
  ADD CONSTRAINT `versenybirok_ibfk_1` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`);

--
-- Megkötések a táblához `versenyzok`
--
ALTER TABLE `versenyzok`
  ADD CONSTRAINT `versenyzok_ibfk_1` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
