-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 27 2020 г., 13:35
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `guestbook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `ID` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`ID`, `login`, `password`, `Name`) VALUES
(1, 'alex', '123', 'Alex'),
(2, 'coolvanya', '1234qwe', 'vany228');

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `ID` int(11) NOT NULL,
  `message` varchar(300) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Data` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `message`
--

INSERT INTO `message` (`ID`, `message`, `Name`, `Data`) VALUES
(19, 'Dearest rent preference lasted unpleasant demesne thrown vanity described week marked surprise likewise appearance hold handsome without. ', 'vany228', '27.04.2020 11:24:06'),
(20, 'Enabled mind anxious any looking depend spot frequently being chamber however grave attention ignorant. Justice carried linen arrived garden civilly fruit possession nay seven themselves. Waiting every sweetness gate distance asked country her change wisdom promise peculiar. Expense viewing easily m', 'User', '27.04.2020 11:24:18'),
(21, 'Men favourite deal first advantage barton contained expect delay landlord replied. Motionless add imprudence death his enough. Received smallness of. Formerly tended bachelor strangers principle deficient landlord ever out wanted means future wish. Hills especially estimable happen recurred shutters', 'Alex', '27.04.2020 11:24:56');

-- --------------------------------------------------------

--
-- Структура таблицы `templogin`
--

CREATE TABLE `templogin` (
  `ID` int(11) NOT NULL,
  `login` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `templogin`
--

INSERT INTO `templogin` (`ID`, `login`) VALUES
(1, 'alex');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `templogin`
--
ALTER TABLE `templogin`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `message`
--
ALTER TABLE `message`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
