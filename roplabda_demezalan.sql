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
-- Adatbázis: `röpi2`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapatok`
--

CREATE TABLE `csapatok` (
  `csapat_id` int NOT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iskola` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `edzo_neve` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kisero_neve` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `merkozes_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `csapatok`
--

INSERT INTO `csapatok` (`csapat_id`, `nev`, `iskola`, `edzo_neve`, `kisero_neve`, `merkozes_id`) VALUES
(1, 'Budapesti Tigrisek', 'Budapesti Sportiskola', 'Kovács István', 'Nagy Péter', 1),
(2, 'Debreceni Sasok', 'Debreceni Gimnázium', 'Szabó László', 'Kiss Mária', 2),
(3, 'Szegedi Halak', 'Szegedi Sportakadémia', 'Horváth Zoltán', 'Tóth Anna', 3),
(4, 'Pécsi Oroszlánok', 'Pécsi Egyetem', 'Varga Gábor', 'Kovács Éva', 4),
(5, 'Miskolci Medvék', 'Miskolci Sportiskola', 'Nagy Béla', 'Szabó Judit', 5),
(6, 'Győri Sarkányok', 'Győri Gimnázium', 'Fodor Attila', 'Németh Zsófia', 6),
(7, 'Nyíregyházi Farkasok', 'Nyíregyházi Sportakadémia', 'Tóth Imre', 'Kiss Katalin', 7),
(8, 'Kecskeméti Tigrisek', 'Kecskeméti Egyetem', 'Molnár Péter', 'Varga Andrea', 8),
(9, 'Székesfehérvári Sasok', 'Székesfehérvári Sportiskola', 'Kiss László', 'Horváth Mária', 9),
(10, 'Szombathelyi Halak', 'Szombathelyi Gimnázium', 'Varga Zoltán', 'Tóth Éva', 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cserek`
--

CREATE TABLE `cserek` (
  `csere_id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `szett_szam` int DEFAULT NULL,
  `idopont` time DEFAULT NULL,
  `le_jatekos_id` int DEFAULT NULL,
  `be_jatekos_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `cserek`
--

INSERT INTO `cserek` (`csere_id`, `merkozes_id`, `szett_szam`, `idopont`, `le_jatekos_id`, `be_jatekos_id`) VALUES
(1, 1, 1, '00:10:00', 1, 7),
(2, 1, 1, '00:15:00', 2, 8),
(3, 2, 1, '00:12:00', 11, 17),
(4, 2, 1, '00:18:00', 12, 18),
(5, 3, 1, '00:14:00', 21, 27),
(6, 3, 1, '00:20:00', 22, 28),
(7, 4, 1, '00:16:00', 31, 37),
(8, 4, 1, '00:22:00', 32, 38),
(9, 5, 1, '00:18:00', 41, 47),
(10, 5, 1, '00:24:00', 42, 48),
(11, 6, 1, '00:20:00', 51, 57),
(12, 6, 1, '00:26:00', 52, 58),
(13, 7, 1, '00:22:00', 61, 67),
(14, 7, 1, '00:28:00', 62, 68),
(15, 8, 1, '00:24:00', 71, 77),
(16, 8, 1, '00:30:00', 72, 78),
(17, 9, 1, '00:26:00', 81, 87),
(18, 9, 1, '00:32:00', 82, 88),
(19, 10, 1, '00:28:00', 91, 97),
(20, 10, 1, '00:34:00', 92, 98);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `figyelmeztetesek`
--

CREATE TABLE `figyelmeztetesek` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `jatekos_id` int DEFAULT NULL,
  `szett_szam` int DEFAULT NULL,
  `tipus` enum('technikai hiba','figyelmeztetés','sárga','piros','kizárás') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `leiras` text COLLATE utf8mb4_general_ci,
  `idopont` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `figyelmeztetesek`
--

INSERT INTO `figyelmeztetesek` (`id`, `merkozes_id`, `jatekos_id`, `szett_szam`, `tipus`, `leiras`, `idopont`) VALUES
(1, 1, 1, 1, 'figyelmeztetés', 'Szabálytalanság', '00:10:00'),
(2, 1, 2, 1, 'sárga', 'Szabálytalanság', '00:15:00'),
(3, 2, 11, 1, 'figyelmeztetés', 'Szabálytalanság', '00:12:00'),
(4, 2, 12, 1, 'sárga', 'Szabálytalanság', '00:18:00'),
(5, 3, 21, 1, 'figyelmeztetés', 'Szabálytalanság', '00:14:00'),
(6, 3, 22, 1, 'sárga', 'Szabálytalanság', '00:20:00'),
(7, 4, 31, 1, 'figyelmeztetés', 'Szabálytalanság', '00:16:00'),
(8, 4, 32, 1, 'sárga', 'Szabálytalanság', '00:22:00'),
(9, 5, 41, 1, 'figyelmeztetés', 'Szabálytalanság', '00:18:00'),
(10, 5, 42, 1, 'sárga', 'Szabálytalanság', '00:24:00'),
(11, 6, 51, 1, 'figyelmeztetés', 'Szabálytalanság', '00:20:00'),
(12, 6, 52, 1, 'sárga', 'Szabálytalanság', '00:26:00'),
(13, 7, 61, 1, 'figyelmeztetés', 'Szabálytalanság', '00:22:00'),
(14, 7, 62, 1, 'sárga', 'Szabálytalanság', '00:28:00'),
(15, 8, 71, 1, 'figyelmeztetés', 'Szabálytalanság', '00:24:00'),
(16, 8, 72, 1, 'sárga', 'Szabálytalanság', '00:30:00'),
(17, 9, 81, 1, 'figyelmeztetés', 'Szabálytalanság', '00:26:00'),
(18, 9, 82, 1, 'sárga', 'Szabálytalanság', '00:32:00'),
(19, 10, 91, 1, 'figyelmeztetés', 'Szabálytalanság', '00:28:00'),
(20, 10, 92, 1, 'sárga', 'Szabálytalanság', '00:34:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `idokeresek`
--

CREATE TABLE `idokeresek` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `csapat_id` int DEFAULT NULL,
  `szett_szam` int DEFAULT NULL,
  `idopont` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `idokeresek`
--

INSERT INTO `idokeresek` (`id`, `merkozes_id`, `csapat_id`, `szett_szam`, `idopont`) VALUES
(1, 1, 1, 1, '00:10:00'),
(2, 1, 2, 1, '00:15:00'),
(3, 2, 1, 1, '00:12:00'),
(4, 2, 2, 1, '00:18:00'),
(5, 3, 1, 1, '00:14:00'),
(6, 3, 2, 1, '00:20:00'),
(7, 4, 1, 1, '00:16:00'),
(8, 4, 2, 1, '00:22:00'),
(9, 5, 1, 1, '00:18:00'),
(10, 5, 2, 1, '00:24:00'),
(11, 6, 1, 1, '00:20:00'),
(12, 6, 2, 1, '00:26:00'),
(13, 7, 1, 1, '00:22:00'),
(14, 7, 2, 1, '00:28:00'),
(15, 8, 1, 1, '00:24:00'),
(16, 8, 2, 1, '00:30:00'),
(17, 9, 1, 1, '00:26:00'),
(18, 9, 2, 1, '00:32:00'),
(19, 10, 1, 1, '00:28:00'),
(20, 10, 2, 1, '00:34:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekosok`
--

CREATE TABLE `jatekosok` (
  `jatekos_id` int NOT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mezszam` int DEFAULT NULL,
  `csapat_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jatekosok`
--

INSERT INTO `jatekosok` (`jatekos_id`, `nev`, `mezszam`, `csapat_id`) VALUES
(1, 'Kovács Márk', 1, 1),
(2, 'Nagy Péter', 2, 1),
(3, 'Szabó László', 3, 1),
(4, 'Horváth Zoltán', 4, 1),
(5, 'Varga Gábor', 5, 1),
(6, 'Kiss Mária', 6, 1),
(7, 'Tóth Anna', 7, 1),
(8, 'Kovács Éva', 8, 1),
(9, 'Szabó Judit', 9, 1),
(10, 'Németh Zsófia', 10, 1),
(11, 'Fodor Attila', 1, 2),
(12, 'Nagy Béla', 2, 2),
(13, 'Tóth Imre', 3, 2),
(14, 'Kiss Katalin', 4, 2),
(15, 'Molnár Péter', 5, 2),
(16, 'Varga Andrea', 6, 2),
(17, 'Kiss László', 7, 2),
(18, 'Horváth Mária', 8, 2),
(19, 'Tóth Éva', 9, 2),
(20, 'Varga Zoltán', 10, 2),
(21, 'Kovács István', 1, 3),
(22, 'Nagy Péter', 2, 3),
(23, 'Szabó László', 3, 3),
(24, 'Horváth Zoltán', 4, 3),
(25, 'Varga Gábor', 5, 3),
(26, 'Kiss Mária', 6, 3),
(27, 'Tóth Anna', 7, 3),
(28, 'Kovács Éva', 8, 3),
(29, 'Szabó Judit', 9, 3),
(30, 'Németh Zsófia', 10, 3),
(31, 'Fodor Attila', 1, 4),
(32, 'Nagy Béla', 2, 4),
(33, 'Tóth Imre', 3, 4),
(34, 'Kiss Katalin', 4, 4),
(35, 'Molnár Péter', 5, 4),
(36, 'Varga Andrea', 6, 4),
(37, 'Kiss László', 7, 4),
(38, 'Horváth Mária', 8, 4),
(39, 'Tóth Éva', 9, 4),
(40, 'Varga Zoltán', 10, 4),
(41, 'Kovács István', 1, 5),
(42, 'Nagy Péter', 2, 5),
(43, 'Szabó László', 3, 5),
(44, 'Horváth Zoltán', 4, 5),
(45, 'Varga Gábor', 5, 5),
(46, 'Kiss Mária', 6, 5),
(47, 'Tóth Anna', 7, 5),
(48, 'Kovács Éva', 8, 5),
(49, 'Szabó Judit', 9, 5),
(50, 'Németh Zsófia', 10, 5),
(51, 'Fodor Attila', 1, 6),
(52, 'Nagy Béla', 2, 6),
(53, 'Tóth Imre', 3, 6),
(54, 'Kiss Katalin', 4, 6),
(55, 'Molnár Péter', 5, 6),
(56, 'Varga Andrea', 6, 6),
(57, 'Kiss László', 7, 6),
(58, 'Horváth Mária', 8, 6),
(59, 'Tóth Éva', 9, 6),
(60, 'Varga Zoltán', 10, 6),
(61, 'Kovács István', 1, 7),
(62, 'Nagy Péter', 2, 7),
(63, 'Szabó László', 3, 7),
(64, 'Horváth Zoltán', 4, 7),
(65, 'Varga Gábor', 5, 7),
(66, 'Kiss Mária', 6, 7),
(67, 'Tóth Anna', 7, 7),
(68, 'Kovács Éva', 8, 7),
(69, 'Szabó Judit', 9, 7),
(70, 'Németh Zsófia', 10, 7),
(71, 'Fodor Attila', 1, 8),
(72, 'Nagy Béla', 2, 8),
(73, 'Tóth Imre', 3, 8),
(74, 'Kiss Katalin', 4, 8),
(75, 'Molnár Péter', 5, 8),
(76, 'Varga Andrea', 6, 8),
(77, 'Kiss László', 7, 8),
(78, 'Horváth Mária', 8, 8),
(79, 'Tóth Éva', 9, 8),
(80, 'Varga Zoltán', 10, 8),
(81, 'Kovács István', 1, 9),
(82, 'Nagy Péter', 2, 9),
(83, 'Szabó László', 3, 9),
(84, 'Horváth Zoltán', 4, 9),
(85, 'Varga Gábor', 5, 9),
(86, 'Kiss Mária', 6, 9),
(87, 'Tóth Anna', 7, 9),
(88, 'Kovács Éva', 8, 9),
(89, 'Szabó Judit', 9, 9),
(90, 'Németh Zsófia', 10, 9),
(91, 'Fodor Attila', 1, 10),
(92, 'Nagy Béla', 2, 10),
(93, 'Tóth Imre', 3, 10),
(94, 'Kiss Katalin', 4, 10),
(95, 'Molnár Péter', 5, 10),
(96, 'Varga Andrea', 6, 10),
(97, 'Kiss László', 7, 10),
(98, 'Horváth Mária', 8, 10),
(99, 'Tóth Éva', 9, 10),
(100, 'Varga Zoltán', 10, 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekvezetok`
--

CREATE TABLE `jatekvezetok` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `szerepkor` enum('vezetőbíró','2. játékvezető','jegyzőkönyvvezető','pontozó','vonalbíró') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nev` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jatekvezetok`
--

INSERT INTO `jatekvezetok` (`id`, `merkozes_id`, `szerepkor`, `nev`) VALUES
(1, 1, 'vezetőbíró', 'János Kováts'),
(2, 1, '2. játékvezető', 'Péter Németh'),
(3, 1, 'jegyzőkönyvvezető', 'László Szabó'),
(4, 2, 'vezetőbíró', 'Gábor Horváth'),
(5, 2, '2. játékvezető', 'Zoltán Varga'),
(6, 2, 'jegyzőkönyvvezető', 'Mária Kiss'),
(7, 3, 'vezetőbíró', 'Attila Fodor'),
(8, 3, '2. játékvezető', 'Béla Nagy'),
(9, 3, 'jegyzőkönyvvezető', 'Imre Tóth'),
(10, 4, 'vezetőbíró', 'Katalin Kiss'),
(11, 4, '2. játékvezető', 'Péter Molnár'),
(12, 4, 'jegyzőkönyvvezető', 'Andrea Varga'),
(13, 5, 'vezetőbíró', 'László Kiss'),
(14, 5, '2. játékvezető', 'Mária Horváth'),
(15, 5, 'jegyzőkönyvvezető', 'Éva Tóth'),
(16, 6, 'vezetőbíró', 'Zoltán Varga'),
(17, 6, '2. játékvezető', 'Gábor Szabó'),
(18, 6, 'jegyzőkönyvvezető', 'Judit Németh'),
(19, 7, 'vezetőbíró', 'Béla Nagy'),
(20, 7, '2. játékvezető', 'Attila Fodor'),
(21, 7, 'jegyzőkönyvvezető', 'Zsófia Kiss'),
(22, 8, 'vezetőbíró', 'Imre Tóth'),
(23, 8, '2. játékvezető', 'Katalin Kiss'),
(24, 8, 'jegyzőkönyvvezető', 'Péter Molnár'),
(25, 9, 'vezetőbíró', 'Andrea Varga'),
(26, 9, '2. játékvezető', 'László Kiss'),
(27, 9, 'jegyzőkönyvvezető', 'Mária Horváth'),
(28, 10, 'vezetőbíró', 'Éva Tóth'),
(29, 10, '2. játékvezető', 'Zoltán Varga'),
(30, 10, 'jegyzőkönyvvezető', 'Gábor Szabó');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kezdojatek`
--

CREATE TABLE `kezdojatek` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `szett_szam` int DEFAULT NULL,
  `jatekos_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kezdojatek`
--

INSERT INTO `kezdojatek` (`id`, `merkozes_id`, `szett_szam`, `jatekos_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 1, 1, 4),
(5, 1, 1, 5),
(6, 1, 1, 6),
(7, 2, 1, 11),
(8, 2, 1, 12),
(9, 2, 1, 13),
(10, 2, 1, 14),
(11, 2, 1, 15),
(12, 2, 1, 16),
(13, 3, 1, 21),
(14, 3, 1, 22),
(15, 3, 1, 23),
(16, 3, 1, 24),
(17, 3, 1, 25),
(18, 3, 1, 26),
(19, 4, 1, 31),
(20, 4, 1, 32),
(21, 4, 1, 33),
(22, 4, 1, 34),
(23, 4, 1, 35),
(24, 4, 1, 36),
(25, 5, 1, 41),
(26, 5, 1, 42),
(27, 5, 1, 43),
(28, 5, 1, 44),
(29, 5, 1, 45),
(30, 5, 1, 46),
(31, 6, 1, 51),
(32, 6, 1, 52),
(33, 6, 1, 53),
(34, 6, 1, 54),
(35, 6, 1, 55),
(36, 6, 1, 56),
(37, 7, 1, 61),
(38, 7, 1, 62),
(39, 7, 1, 63),
(40, 7, 1, 64),
(41, 7, 1, 65),
(42, 7, 1, 66),
(43, 8, 1, 71),
(44, 8, 1, 72),
(45, 8, 1, 73),
(46, 8, 1, 74),
(47, 8, 1, 75),
(48, 8, 1, 76),
(49, 9, 1, 81),
(50, 9, 1, 82),
(51, 9, 1, 83),
(52, 9, 1, 84),
(53, 9, 1, 85),
(54, 9, 1, 86),
(55, 10, 1, 91),
(56, 10, 1, 92),
(57, 10, 1, 93),
(58, 10, 1, 94),
(59, 10, 1, 95),
(60, 10, 1, 96);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megjegyzesek`
--

CREATE TABLE `megjegyzesek` (
  `id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `tipus` enum('sérülés','óvás','szabályvita','játékvezetői megjegyzés','rendkívüli körülmény') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `leiras` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `megjegyzesek`
--

INSERT INTO `megjegyzesek` (`id`, `merkozes_id`, `tipus`, `leiras`) VALUES
(1, 1, 'sérülés', 'Játékos sérülés a mérkőzés alatt'),
(2, 2, 'óvás', 'Óvás a játékvezető döntése ellen'),
(3, 3, 'szabályvita', 'Szabályvita a mérkőzés alatt'),
(4, 4, 'játékvezetői megjegyzés', 'Játékvezetői megjegyzés a mérkőzésről'),
(5, 5, 'rendkívüli körülmény', 'Rendkívüli körülmény a mérkőzés alatt'),
(6, 6, 'sérülés', 'Játékos sérülés a mérkőzés alatt'),
(7, 7, 'óvás', 'Óvás a játékvezető döntése ellen'),
(8, 8, 'szabályvita', 'Szabályvita a mérkőzés alatt'),
(9, 9, 'játékvezetői megjegyzés', 'Játékvezetői megjegyzés a mérkőzésről'),
(10, 10, 'rendkívüli körülmény', 'Rendkívüli körülmény a mérkőzés alatt');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `merkozesek`
--

CREATE TABLE `merkozesek` (
  `merkozes_id` int NOT NULL,
  `datum` datetime DEFAULT NULL,
  `helyszin_csarnok` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `helyszin_varos` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `helyszin_megye` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verseny_nev` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `korcsoport` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nem` enum('fiú','lány') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sorszam` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `merkozesek`
--

INSERT INTO `merkozesek` (`merkozes_id`, `datum`, `helyszin_csarnok`, `helyszin_varos`, `helyszin_megye`, `verseny_nev`, `korcsoport`, `nem`, `sorszam`) VALUES
(1, '2023-10-01 14:00:00', 'Sportcsarnok', 'Budapest', 'Pest', 'Országos Bajnokság', 'U18', 'fiú', 'M001'),
(2, '2023-10-02 15:00:00', 'Kisstadion', 'Debrecen', 'Hajdú-Bihar', 'Regionális Bajnokság', 'U16', 'lány', 'M002'),
(3, '2023-10-03 16:00:00', 'Városi Sportközpont', 'Szeged', 'Csongrád', 'Nemzeti Kupa', 'U20', 'fiú', 'M003'),
(4, '2023-10-04 17:00:00', 'Egyetemi Csarnok', 'Pécs', 'Baranya', 'Országos Bajnokság', 'U18', 'lány', 'M004'),
(5, '2023-10-05 18:00:00', 'Központi Sportlétesítmény', 'Miskolc', 'Borsod-Abaúj-Zemplén', 'Regionális Bajnokság', 'U16', 'fiú', 'M005'),
(6, '2023-10-06 19:00:00', 'Sportaréna', 'Győr', 'Győr-Moson-Sopron', 'Nemzeti Kupa', 'U20', 'lány', 'M006'),
(7, '2023-10-07 20:00:00', 'Városi Sportcsarnok', 'Nyíregyháza', 'Szabolcs-Szatmár-Bereg', 'Országos Bajnokság', 'U18', 'fiú', 'M007'),
(8, '2023-10-08 21:00:00', 'Sportközpont', 'Kecskemét', 'Bács-Kiskun', 'Regionális Bajnokság', 'U16', 'lány', 'M008'),
(9, '2023-10-09 22:00:00', 'Csarnok', 'Székesfehérvár', 'Fejér', 'Nemzeti Kupa', 'U20', 'fiú', 'M009'),
(10, '2023-10-10 23:00:00', 'Sportlétesítmény', 'Szombathely', 'Vas', 'Országos Bajnokság', 'U18', 'lány', 'M010');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szettek`
--

CREATE TABLE `szettek` (
  `szett_id` int NOT NULL,
  `merkozes_id` int DEFAULT NULL,
  `szett_szam` int DEFAULT NULL,
  `csapat1_pont` int DEFAULT NULL,
  `csapat2_pont` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `szettek`
--

INSERT INTO `szettek` (`szett_id`, `merkozes_id`, `szett_szam`, `csapat1_pont`, `csapat2_pont`) VALUES
(1, 1, 1, 25, 20),
(2, 1, 2, 23, 25),
(3, 1, 3, 25, 22),
(4, 2, 1, 20, 25),
(5, 2, 2, 25, 21),
(6, 2, 3, 22, 25),
(7, 3, 1, 25, 18),
(8, 3, 2, 25, 20),
(9, 4, 1, 22, 25),
(10, 4, 2, 25, 23),
(11, 4, 3, 25, 21),
(12, 5, 1, 25, 20),
(13, 5, 2, 25, 19),
(14, 6, 1, 20, 25),
(15, 6, 2, 25, 22),
(16, 6, 3, 25, 20),
(17, 7, 1, 25, 20),
(18, 7, 2, 25, 22),
(19, 8, 1, 20, 25),
(20, 8, 2, 25, 20),
(21, 8, 3, 25, 22),
(22, 9, 1, 25, 20),
(23, 9, 2, 25, 22),
(24, 10, 1, 20, 25),
(25, 10, 2, 25, 20),
(26, 10, 3, 25, 22);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vegeredmeny`
--

CREATE TABLE `vegeredmeny` (
  `merkozes_id` int NOT NULL,
  `csapat1_id` int DEFAULT NULL,
  `csapat2_id` int DEFAULT NULL,
  `csapat1_szettek` int DEFAULT NULL,
  `csapat2_szettek` int DEFAULT NULL,
  `gyoztes_csapat_id` int DEFAULT NULL,
  `teljes_idotartam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `vegeredmeny`
--

INSERT INTO `vegeredmeny` (`merkozes_id`, `csapat1_id`, `csapat2_id`, `csapat1_szettek`, `csapat2_szettek`, `gyoztes_csapat_id`, `teljes_idotartam`) VALUES
(1, 1, 2, 2, 1, 1, '01:30:00'),
(2, 3, 4, 1, 2, 4, '01:45:00'),
(3, 5, 6, 2, 0, 5, '01:20:00'),
(4, 7, 8, 2, 1, 7, '01:50:00'),
(5, 9, 10, 2, 0, 9, '01:25:00'),
(6, 1, 3, 1, 2, 3, '01:40:00'),
(7, 2, 4, 2, 0, 2, '01:35:00'),
(8, 5, 7, 1, 2, 7, '01:55:00'),
(9, 6, 8, 2, 0, 6, '01:30:00'),
(10, 9, 1, 2, 1, 9, '01:45:00');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `csapatok`
--
ALTER TABLE `csapatok`
  ADD PRIMARY KEY (`csapat_id`),
  ADD KEY `merkozes_id` (`merkozes_id`);

--
-- A tábla indexei `cserek`
--
ALTER TABLE `cserek`
  ADD PRIMARY KEY (`csere_id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `le_jatekos_id` (`le_jatekos_id`),
  ADD KEY `be_jatekos_id` (`be_jatekos_id`);

--
-- A tábla indexei `figyelmeztetesek`
--
ALTER TABLE `figyelmeztetesek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `jatekos_id` (`jatekos_id`);

--
-- A tábla indexei `idokeresek`
--
ALTER TABLE `idokeresek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `csapat_id` (`csapat_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`);

--
-- A tábla indexei `kezdojatek`
--
ALTER TABLE `kezdojatek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozes_id` (`merkozes_id`),
  ADD KEY `jatekos_id` (`jatekos_id`);

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
-- A tábla indexei `szettek`
--
ALTER TABLE `szettek`
  ADD PRIMARY KEY (`szett_id`),
  ADD KEY `merkozes_id` (`merkozes_id`);

--
-- A tábla indexei `vegeredmeny`
--
ALTER TABLE `vegeredmeny`
  ADD PRIMARY KEY (`merkozes_id`),
  ADD KEY `csapat1_id` (`csapat1_id`),
  ADD KEY `csapat2_id` (`csapat2_id`),
  ADD KEY `gyoztes_csapat_id` (`gyoztes_csapat_id`);

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
  MODIFY `csere_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `figyelmeztetesek`
--
ALTER TABLE `figyelmeztetesek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `idokeresek`
--
ALTER TABLE `idokeresek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  MODIFY `jatekos_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT a táblához `jatekvezetok`
--
ALTER TABLE `jatekvezetok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `kezdojatek`
--
ALTER TABLE `kezdojatek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `merkozesek`
--
ALTER TABLE `merkozesek`
  MODIFY `merkozes_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `szettek`
--
ALTER TABLE `szettek`
  MODIFY `szett_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `csapatok`
--
ALTER TABLE `csapatok`
  ADD CONSTRAINT `csapatok_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`);

--
-- Megkötések a táblához `cserek`
--
ALTER TABLE `cserek`
  ADD CONSTRAINT `cserek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `cserek_ibfk_2` FOREIGN KEY (`le_jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`),
  ADD CONSTRAINT `cserek_ibfk_3` FOREIGN KEY (`be_jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`);

--
-- Megkötések a táblához `figyelmeztetesek`
--
ALTER TABLE `figyelmeztetesek`
  ADD CONSTRAINT `figyelmeztetesek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `figyelmeztetesek_ibfk_2` FOREIGN KEY (`jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`);

--
-- Megkötések a táblához `idokeresek`
--
ALTER TABLE `idokeresek`
  ADD CONSTRAINT `idokeresek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `idokeresek_ibfk_2` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`csapat_id`);

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
-- Megkötések a táblához `kezdojatek`
--
ALTER TABLE `kezdojatek`
  ADD CONSTRAINT `kezdojatek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `kezdojatek_ibfk_2` FOREIGN KEY (`jatekos_id`) REFERENCES `jatekosok` (`jatekos_id`);

--
-- Megkötések a táblához `megjegyzesek`
--
ALTER TABLE `megjegyzesek`
  ADD CONSTRAINT `megjegyzesek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`);

--
-- Megkötések a táblához `szettek`
--
ALTER TABLE `szettek`
  ADD CONSTRAINT `szettek_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`);

--
-- Megkötések a táblához `vegeredmeny`
--
ALTER TABLE `vegeredmeny`
  ADD CONSTRAINT `vegeredmeny_ibfk_1` FOREIGN KEY (`merkozes_id`) REFERENCES `merkozesek` (`merkozes_id`),
  ADD CONSTRAINT `vegeredmeny_ibfk_2` FOREIGN KEY (`csapat1_id`) REFERENCES `csapatok` (`csapat_id`),
  ADD CONSTRAINT `vegeredmeny_ibfk_3` FOREIGN KEY (`csapat2_id`) REFERENCES `csapatok` (`csapat_id`),
  ADD CONSTRAINT `vegeredmeny_ibfk_4` FOREIGN KEY (`gyoztes_csapat_id`) REFERENCES `csapatok` (`csapat_id`);
COMMIT;

//akinek el küldtem az használhatja- Deme Zalán

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
