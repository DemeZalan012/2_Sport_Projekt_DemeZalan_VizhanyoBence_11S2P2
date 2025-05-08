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
-- Adatbázis: `íjjászat2`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapat_tagok`
--

CREATE TABLE `csapat_tagok` (
  `csapat_id` int NOT NULL,
  `versenyzo_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `csapat_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `eredmenyek`
--
ALTER TABLE `eredmenyek`
  MODIFY `eredmeny_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  MODIFY `megjegyzes_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `versenybirok`
--
ALTER TABLE `versenybirok`
  MODIFY `biro_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `versenyek`
--
ALTER TABLE `versenyek`
  MODIFY `verseny_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `versenyzok`
--
ALTER TABLE `versenyzok`
  MODIFY `versenyzo_id` int NOT NULL AUTO_INCREMENT;

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
