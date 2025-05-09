-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Máj 08. 18:39
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
-- Adatbázis: `kézilabda`
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
(1, 'Budapesti Tigrisek', 1),
(2, 'Debreceni Sasok', 2),
(3, 'Szegedi Halászok', 3),
(4, 'Pécsi Bányászok', 1),
(5, 'Győri Vitézek', 2),
(6, 'Miskolci Acélosok', 3),
(7, 'Szolnoki Napfény', 1),
(8, 'Kecskeméti Vadak', 2),
(9, 'Nyíregyházi Hősök', 3),
(10, 'Egeresi Lovagok', 1),
(11, 'Budapesti Tigrisek', 1),
(12, 'Debreceni Sasok', 2),
(13, 'Szegedi Halászok', 3),
(14, 'Pécsi Bányászok', 1),
(15, 'Győri Vitézek', 2),
(16, 'Miskolci Acélosok', 3),
(17, 'Szolnoki Napfény', 1),
(18, 'Kecskeméti Vadak', 2),
(19, 'Nyíregyházi Hősök', 3),
(20, 'Egeresi Lovagok', 1);

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
(2, 2),
(3, 3),
(1, 4),
(2, 5),
(3, 6),
(1, 7),
(2, 8),
(3, 9),
(1, 10);

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
(1, 1, 'méter', 'pont', 5, 10, 45, 5, 4, 20, 2, 1),
(2, 2, 'méter', 'pont', 5, 10, 47, 6, 5, 22, 1, 2),
(3, 3, 'méter', 'pont', 5, 10, 42, 4, 3, 18, 3, 3),
(4, 4, 'méter', 'pont', 5, 10, 44, 5, 4, 21, 2, 1),
(5, 5, 'méter', 'pont', 5, 10, 46, 6, 5, 23, 1, 2),
(6, 6, 'méter', 'pont', 5, 10, 43, 4, 3, 19, 3, 3),
(7, 7, 'méter', 'pont', 5, 10, 45, 5, 4, 20, 2, 1),
(8, 8, 'méter', 'pont', 5, 10, 47, 6, 5, 22, 1, 2),
(9, 9, 'méter', 'pont', 5, 10, 42, 4, 3, 18, 3, 3),
(10, 10, 'méter', 'pont', 5, 10, 44, 5, 4, 21, 2, 1),
(11, 1, 'méter', 'pont', 5, 10, 45, 5, 4, 20, 2, 1),
(12, 2, 'méter', 'pont', 5, 10, 47, 6, 5, 22, 1, 2),
(13, 3, 'méter', 'pont', 5, 10, 42, 4, 3, 18, 3, 3),
(14, 4, 'méter', 'pont', 5, 10, 44, 5, 4, 21, 2, 1),
(15, 5, 'méter', 'pont', 5, 10, 46, 6, 5, 23, 1, 2),
(16, 6, 'méter', 'pont', 5, 10, 43, 4, 3, 19, 3, 3),
(17, 7, 'méter', 'pont', 5, 10, 45, 5, 4, 20, 2, 1),
(18, 8, 'méter', 'pont', 5, 10, 47, 6, 5, 22, 1, 2),
(19, 9, 'méter', 'pont', 5, 10, 42, 4, 3, 18, 3, 3),
(20, 10, 'méter', 'pont', 5, 10, 44, 5, 4, 21, 2, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jvezetok`
--

CREATE TABLE `jvezetok` (
  `szerepkor` enum('főjátékvezető','segédjátékvezető','technikai delegált','jegyző') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verseny_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jvezetok`
--

INSERT INTO `jvezetok` (`szerepkor`, `nev`, `verseny_id`) VALUES
('főjátékvezető', 'János Pál', 1),
('segédjátékvezető', 'Katalin Szabó', 2),
('technikai delegált', 'Béla Tóth', 3),
('jegyző', 'Eszter Nagy', 1),
('főjátékvezető', 'Dániel Varga', 2),
('segédjátékvezető', 'Laura Fekete', 3),
('technikai delegált', 'Tamás Tóth', 1),
('jegyző', 'Petra Kiss', 2),
('főjátékvezető', 'Balázs Fehér', 3),
('segédjátékvezető', 'Csilla Molnár', 1),
('főjátékvezető', 'János Pál', 1),
('segédjátékvezető', 'Katalin Szabó', 2),
('technikai delegált', 'Béla Tóth', 3),
('jegyző', 'Eszter Nagy', 1),
('főjátékvezető', 'Dániel Varga', 2),
('segédjátékvezető', 'Laura Fekete', 3),
('technikai delegált', 'Tamás Tóth', 1),
('jegyző', 'Petra Kiss', 2),
('főjátékvezető', 'Balázs Fehér', 3),
('segédjátékvezető', 'Csilla Molnár', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megjegyzesek`
--

CREATE TABLE `megjegyzesek` (
  `megjegyzes_id` int NOT NULL,
  `verseny_id` int DEFAULT NULL,
  `tipus` enum('technikai probléma','szabálytalanság','tilalom','játékvezetői megjegyzés','időjárás') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `leiras` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vegeredmenyek`
--

CREATE TABLE `vegeredmenyek` (
  `eredmeny_id` int NOT NULL,
  `helyezes` int DEFAULT NULL,
  `dijazas` enum('arany','ezüst','bronz','különdíj','nincs') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `csapat_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `vegeredmenyek`
--

INSERT INTO `vegeredmenyek` (`eredmeny_id`, `helyezes`, `dijazas`, `csapat_id`) VALUES
(1, 1, 'arany', 1),
(2, 2, 'ezüst', 2),
(3, 3, 'bronz', 3),
(4, 4, 'nincs', 4),
(5, 5, 'nincs', 5),
(6, 6, 'nincs', 6),
(7, 7, 'nincs', 7),
(8, 8, 'nincs', 8),
(9, 9, 'nincs', 9),
(10, 10, 'nincs', 10);

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
  `verseny_tipus` enum('egyéni','csapat','vegyes csapat') COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `versenyek`
--

INSERT INTO `versenyek` (`verseny_id`, `nev`, `datum`, `helyszin`, `korcsoport`, `kategoria`, `verseny_tipus`) VALUES
(1, 'Nyári Kezdet', '2023-07-15', 'Budapest', 'U18', 'Férfi', 'csapat'),
(2, 'Tavaszi Kupa', '2023-05-22', 'Debrecen', 'U21', 'Női', 'csapat'),
(3, 'Őszi Bajnokság', '2023-10-05', 'Szeged', 'Felnőtt', 'Vegyes', 'vegyes csapat'),
(4, 'Nyári Kezdet', '2023-07-15', 'Budapest', 'U18', 'Férfi', 'csapat'),
(5, 'Tavaszi Kupa', '2023-05-22', 'Debrecen', 'U21', 'Női', 'csapat'),
(6, 'Őszi Bajnokság', '2023-10-05', 'Szeged', 'Felnőtt', 'Vegyes', 'vegyes csapat');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `versenyzok`
--

CREATE TABLE `versenyzok` (
  `versenyzo_id` int NOT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iskola` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mezszam` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `igazolvany_tipus` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `korosztaly` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nem` enum('férfi','nő') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `edzo_neve` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verseny_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `versenyzok`
--

INSERT INTO `versenyzok` (`versenyzo_id`, `nev`, `iskola`, `mezszam`, `igazolvany_tipus`, `korosztaly`, `nem`, `edzo_neve`, `verseny_id`) VALUES
(1, 'Kovács Márton', 'Budapesti Általános', '10', 'Diák', 'U18', 'férfi', 'Tóth Béla', 1),
(2, 'Nagy Anna', 'Debreceni Gimnázium', '7', 'Diák', 'U21', 'nő', 'Kis Katalin', 2),
(3, 'Szabó István', 'Szegedi Sportiskola', '15', 'Diák', 'Felnőtt', 'férfi', 'Fehér János', 3),
(4, 'Horváth Eszter', 'Pécsi Általános', '3', 'Diák', 'U18', 'nő', 'Nagy Péter', 1),
(5, 'Varga Dániel', 'Győri Gimnázium', '22', 'Diák', 'U21', 'férfi', 'Kovács László', 2),
(6, 'Fekete Laura', 'Miskolci Sportiskola', '8', 'Diák', 'Felnőtt', 'nő', 'Szabó Gábor', 3),
(7, 'Tóth Tamás', 'Szolnoki Általános', '14', 'Diák', 'U18', 'férfi', 'Nagy Márta', 1),
(8, 'Kiss Petra', 'Kecskeméti Gimnázium', '5', 'Diák', 'U21', 'nő', 'Varga Eszter', 2),
(9, 'Fehér Balázs', 'Nyíregyházi Sportiskola', '19', 'Diák', 'Felnőtt', 'férfi', 'Horváth Attila', 3),
(10, 'Molnár Csilla', 'Egeresi Általános', '11', 'Diák', 'U18', 'nő', 'Kis István', 1),
(11, 'Kovács Márton', 'Budapesti Általános', '10', 'Diák', 'U18', 'férfi', 'Tóth Béla', 1),
(12, 'Nagy Anna', 'Debreceni Gimnázium', '7', 'Diák', 'U21', 'nő', 'Kis Katalin', 2),
(13, 'Szabó István', 'Szegedi Sportiskola', '15', 'Diák', 'Felnőtt', 'férfi', 'Fehér János', 3),
(14, 'Horváth Eszter', 'Pécsi Általános', '3', 'Diák', 'U18', 'nő', 'Nagy Péter', 1),
(15, 'Varga Dániel', 'Győri Gimnázium', '22', 'Diák', 'U21', 'férfi', 'Kovács László', 2),
(16, 'Fekete Laura', 'Miskolci Sportiskola', '8', 'Diák', 'Felnőtt', 'nő', 'Szabó Gábor', 3),
(17, 'Tóth Tamás', 'Szolnoki Általános', '14', 'Diák', 'U18', 'férfi', 'Nagy Márta', 1),
(18, 'Kiss Petra', 'Kecskeméti Gimnázium', '5', 'Diák', 'U21', 'nő', 'Varga Eszter', 2),
(19, 'Fehér Balázs', 'Nyíregyházi Sportiskola', '19', 'Diák', 'Felnőtt', 'férfi', 'Horváth Attila', 3),
(20, 'Molnár Csilla', 'Egeresi Általános', '11', 'Diák', 'U18', 'nő', 'Kis István', 1);

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
-- A tábla indexei `jvezetok`
--
ALTER TABLE `jvezetok`
  ADD KEY `verseny_id` (`verseny_id`);

--
-- A tábla indexei `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  ADD PRIMARY KEY (`megjegyzes_id`),
  ADD KEY `verseny_id` (`verseny_id`);

--
-- A tábla indexei `vegeredmenyek`
--
ALTER TABLE `vegeredmenyek`
  ADD PRIMARY KEY (`eredmeny_id`),
  ADD KEY `csapat_id` (`csapat_id`);

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
  MODIFY `csapat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `eredmenyek`
--
ALTER TABLE `eredmenyek`
  MODIFY `eredmeny_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  MODIFY `megjegyzes_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `versenyek`
--
ALTER TABLE `versenyek`
  MODIFY `verseny_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `versenyzok`
--
ALTER TABLE `versenyzok`
  MODIFY `versenyzo_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- Megkötések a táblához `jvezetok`
--
ALTER TABLE `jvezetok`
  ADD CONSTRAINT `jvezetok_ibfk_1` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`);

--
-- Megkötések a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  ADD CONSTRAINT `megjegyzesek_ibfk_1` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`);

--
-- Megkötések a táblához `vegeredmenyek`
--
ALTER TABLE `vegeredmenyek`
  ADD CONSTRAINT `vegeredmenyek_ibfk_1` FOREIGN KEY (`eredmeny_id`) REFERENCES `eredmenyek` (`eredmeny_id`),
  ADD CONSTRAINT `vegeredmenyek_ibfk_2` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`csapat_id`);

--
-- Megkötések a táblához `versenyzok`
--
ALTER TABLE `versenyzok`
  ADD CONSTRAINT `versenyzok_ibfk_1` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`);
COMMIT;

--akinek el küldtem az használhatja-DemeZalan

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
