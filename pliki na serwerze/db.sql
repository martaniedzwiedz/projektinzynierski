-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 11 Sty 2018, 22:30
-- Wersja serwera: 5.7.20-0ubuntu0.16.04.1
-- Wersja PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podajniki`
--

CREATE TABLE `podajniki` (
  `podajnik_id` int(11) NOT NULL,
  `podajnik` varchar(100) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `stan` float DEFAULT NULL,
  `sniadanie_godzina` time DEFAULT NULL,
  `sniadanie_dawka` float DEFAULT NULL,
  `obiad_godzina` time DEFAULT NULL,
  `obiad_dawka` float DEFAULT NULL,
  `kolacja_godzina` time DEFAULT NULL,
  `kolacja_dawka` float DEFAULT NULL,
  `user_id_fk` int(11) DEFAULT NULL,
  `podajniki_const` varchar(100) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `podajniki`
--

INSERT INTO `podajniki` (`podajnik_id`, `podajnik`, `stan`, `sniadanie_godzina`, `sniadanie_dawka`, `obiad_godzina`, `obiad_dawka`, `kolacja_godzina`, `kolacja_dawka`, `user_id_fk`, `podajniki_const`) VALUES
(1, 'kon', 90, '12:00:00', 1, '06:15:00', 0.25, '18:54:00', 0.75, 0, 'kon'),
(2, 'svavad', 30, '12:30:00', 0.5, '15:00:00', 0.25, '20:30:00', 0.75, 7, NULL),
(3, 'Marta', 50, '06:00:00', 1, '06:00:00', 1, '06:00:00', 1, 7, 'Marta'),
(4, 'dramat', 45, '06:00:00', 0.25, '13:00:00', 0.25, '18:00:00', 0.75, 7, NULL),
(5, 'tragedia', 68, '06:23:00', 0.25, '14:22:00', 1, '20:22:00', 0.75, 7, NULL),
(6, 'misiek', 44, '15:00:00', 0.75, '04:00:00', 1, '11:00:00', 1, 0, 'NZtdLSx'),
(8, 'kaatastrofa', 40, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'kaatastrofa'),
(9, 'katastrofa', 25, '07:10:00', 1, '14:00:00', 0.25, '20:00:00', 0.75, 6, 'katastrofa'),
(10, 'kaatastrofa23', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'kaatastrofa23'),
(11, 'kaatastrofa3', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'kaatastrofa3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `password` varchar(300) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `email` varchar(300) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `name`) VALUES
(1, 'martastajnia', '51e5aa4d1f64578737cfb38345ce4bbfa805829a64f8ef62136b5b8b0a7c2572', 'stajnia@gmail.com', 'marta'),
(2, 'zlotastajnia', '62080f96a2bfc48794326c5b9750942d15886e6a9746fc215cd0d04127196db2', 'marta@marta.net', 'matra'),
(6, 'marta', '62080f96a2bfc48794326c5b9750942d15886e6a9746fc215cd0d04127196db2', 'marta@marta.pl', 'marta'),
(7, 'martusia', '638c21d850eb1a633529946b43279e4b808befc1bb723f6a772163f1db5974a5', 'martusia@gmail.com', 'martusia'),
(8, 'asdcasdcasdcasd', '417b736fc07644700f463ec3da1a6e9012ee4b6543cc53c130f1b56de50a04e7', 'cmarta@marta.com', 'casdcasdcasd'),
(9, 'stajnia', '5f1059ff008c294b854f44e80bf29af7794725e7f798f92a30e82d80c4f0cf62', 'zlota@stajnia.com', 'stajnia'),
(10, 'stajnia11', '62080f96a2bfc48794326c5b9750942d15886e6a9746fc215cd0d04127196db2', 'stajnia@sialala.pl', 'martusia');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `podajniki`
--
ALTER TABLE `podajniki`
  ADD PRIMARY KEY (`podajnik_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `podajniki`
--
ALTER TABLE `podajniki`
  MODIFY `podajnik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
