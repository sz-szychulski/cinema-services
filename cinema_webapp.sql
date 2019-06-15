-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Cze 2019, 21:27
-- Wersja serwera: 10.1.39-MariaDB
-- Wersja PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cinema_webapp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(17);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `movies`
--

CREATE TABLE `movies` (
  `movie_id` bigint(20) NOT NULL,
  `director` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `poster` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `movies`
--

INSERT INTO `movies` (`movie_id`, `director`, `poster`, `time`, `title`, `type`) VALUES
(5, 'Jonathan Levine', 'https://i.imgur.com/mJKAmiW.png', 125, 'Niedobrani', 'Komedia, Romantyczny'),
(1, 'Michael Dougherty', 'https://i.imgur.com/S8PvFim.png', 132, 'Godzilla II: Król potworów', 'Akcja, Sci-Fi'),
(2, 'Chad Stahelski', 'https://i.imgur.com/5ESkSmo.png', 131, 'John Wick 3', 'Akcja'),
(3, 'F. Gary Gray', 'https://i.imgur.com/BNT0KgR.png', 114, 'Men In Black International', 'Akcja, Komedia, Sci-Fi'),
(4, 'Dexter Fletcher', 'https://i.imgur.com/laWBNpw.jpg', 125, 'Rocketman', 'Dramat');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `seat_id` bigint(20) DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'USER\r\n');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` bigint(20) NOT NULL,
  `movie_id` bigint(20) DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hall` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `movie_id`, `time`, `hall`) VALUES
(1, 1, '14:45', 1),
(2, 1, '17.30', 3),
(3, 2, '12:00', 2),
(4, 2, '17:15', 2),
(5, 2, '22:15', 1),
(6, 3, '11.25', 3),
(7, 3, '18.25', 4),
(8, 4, '7:45', 2),
(9, 4, '10:20', 4),
(10, 4, '13:45', 5),
(11, 4, '18:50', 6),
(12, 5, '16:45', 5),
(13, 5, '21:45', 2),
(14, 2, '20:00', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seat`
--

CREATE TABLE `seat` (
  `seat_id` bigint(20) NOT NULL,
  `hall` int(11) DEFAULT NULL,
  `reserved` bit(1) DEFAULT NULL,
  `seat` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `seat`
--

INSERT INTO `seat` (`seat_id`, `hall`, `reserved`, `seat`) VALUES
(1, 1, b'0', '1A'),
(2, 1, b'0', '2A'),
(3, 1, b'0', '3A'),
(4, 2, b'0', '1A'),
(5, 2, b'0', '2A'),
(6, 2, b'0', '3A'),
(7, 3, b'0', '1A'),
(8, 3, b'0', '2A'),
(9, 3, b'0', '3A'),
(10, 4, b'0', '1A'),
(11, 4, b'0', '2A'),
(12, 4, b'0', '3A'),
(13, 5, b'0', '1A'),
(14, 5, b'0', '2A'),
(15, 5, b'0', '3A'),
(16, 6, b'0', '1A'),
(17, 6, b'0', '2A'),
(18, 6, b'0', '3A');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`userid`, `password`, `username`) VALUES
(2, '$2a$10$aGk8jeSnVR8Y09.p8xWt5eyC9jgAnVvSYOVl56JaAqVBXKdoE7qs2', 'sebastian.szychulski'),
(3, '$2a$10$AaMIGB079CsV.iVMofphye9NZ.71d5zo/KY.5r9ipaqL9Gqs8.9aC', 'sszychulski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_roles`
--

CREATE TABLE `user_roles` (
  `users_userid` int(11) NOT NULL,
  `roles_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `user_roles`
--

INSERT INTO `user_roles` (`users_userid`, `roles_id`) VALUES
(2, 1),
(3, 1),
(3, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indeksy dla tabeli `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indeksy dla tabeli `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indeksy dla tabeli `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- Indeksy dla tabeli `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`users_userid`,`roles_id`),
  ADD KEY `FKj9553ass9uctjrmh0gkqsmv0d` (`roles_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
