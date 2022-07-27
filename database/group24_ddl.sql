-- phpMyAdmin SQL Dump
-- version 5.2.0-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2022 at 01:11 PM
-- Server version: 10.6.8-MariaDB-log
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_chanjon`
--

-- --------------------------------------------------------

--
-- Table structure for table `Concessions`
--

CREATE TABLE `Concessions` (
  `concessions_id` int(11) NOT NULL,
  `sale_datetime` datetime NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Concessions`
--

INSERT INTO `Concessions` (`concessions_id`, `sale_datetime`, `price`, `employee_id`) VALUES
(1, '2022-07-08 13:50:00', '13.00', 3),
(2, '2022-07-08 13:50:00', '12.00', 3),
(3, '2022-07-08 18:52:00', '11.00', 1),
(4, '2022-07-08 18:55:00', '8.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Concessions_has_Items`
--

CREATE TABLE `Concessions_has_Items` (
  `concession_details_id` int(11) NOT NULL,
  `concessions_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Concessions_has_Items`
--

INSERT INTO `Concessions_has_Items` (`concession_details_id`, `concessions_id`, `item_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 1),
(4, 2, 1),
(5, 3, 1),
(6, 3, 2),
(7, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` varchar(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL DEFAULT 'Portland',
  `state` varchar(45) NOT NULL DEFAULT 'Oregon',
  `postal_code` int(11) NOT NULL DEFAULT 97205
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`) VALUES
(1, 'Susanne', 'Taylor', 'sutaylor@yahoo.com', '5036885007', '2527 Illinois Avenue', 'Portland', 'Oregon', 97205),
(2, 'Ruth', 'Brotherton', 'babyruth71@hotmail.com', '50368885084', '2403 Mattson Street', 'Portland', 'Oregon', 97205),
(3, 'Michael', 'Roberts', 'michael.rob@yahoo.com', '5033449660', '473 Seneca Drive', 'Portland', 'Oregon', 97205);

-- --------------------------------------------------------

--
-- Table structure for table `Genres`
--

CREATE TABLE `Genres` (
  `genre_id` int(11) NOT NULL,
  `genre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` (`genre_id`, `genre`) VALUES
(1, 'Action'),
(2, 'Drama'),
(3, 'Comedy'),
(4, 'Horror'),
(5, 'Family'),
(6, 'Sci-Fi'),
(7, 'Thriller'),
(8, 'Western');

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `item_id` int(11) NOT NULL,
  `item_cost` decimal(4,2) NOT NULL,
  `item_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`item_id`, `item_cost`, `item_name`) VALUES
(1, '6.00', 'popcorn'),
(2, '5.00', 'chocolate bar'),
(3, '8.00', 'cotton candy');

-- --------------------------------------------------------

--
-- Table structure for table `Movies`
--

CREATE TABLE `Movies` (
  `movie_id` int(11) NOT NULL,
  `movie_name` varchar(45) NOT NULL,
  `movie_description` varchar(255) NOT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `hall_number` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Movies`
--

INSERT INTO `Movies` (`movie_id`, `movie_name`, `movie_description`, `rating_id`, `hall_number`) VALUES
(1, 'Revenge of Darth Jar Jar', 'Somehow Darth Jar Jar has returned.', 2, 1),
(2, 'Finding Marlin', 'A clownfish journeys to bring father home.', 1, 1),
(3, 'More Fast More Furious', 'The crew team up in Miami to bring down crime lord Sequels.', 2, 2),
(4, 'The Godson: Part II', 'Continues the saga of the Linguini crime family and tells the story of a young Asparagus.', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Movies_has_Genres`
--

CREATE TABLE `Movies_has_Genres` (
  `movie_genre_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Movies_has_Genres`
--

INSERT INTO `Movies_has_Genres` (`movie_genre_id`, `movie_id`, `genre_id`) VALUES
(1, 1, 6),
(2, 1, 7),
(3, 2, 5),
(4, 2, 3),
(5, 3, 1),
(6, 3, 7),
(7, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Ratings`
--

CREATE TABLE `Ratings` (
  `rating_id` int(11) NOT NULL,
  `rating_description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Ratings`
--

INSERT INTO `Ratings` (`rating_id`, `rating_description`) VALUES
(1, 'G'),
(2, 'PG-13'),
(3, 'R');

-- --------------------------------------------------------

--
-- Table structure for table `Shows`
--

CREATE TABLE `Shows` (
  `show_id` int(11) NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Shows`
--

INSERT INTO `Shows` (`show_id`, `time_start`, `time_end`, `movie_id`) VALUES
(1, '2022-07-08 14:00:00', '2022-07-08 16:00:00', 2),
(2, '2022-07-08 16:30:00', '2022-07-08 18:00:00', 1),
(3, '2022-07-08 19:00:00', '2022-07-08 20:30:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Tickets`
--

CREATE TABLE `Tickets` (
  `ticket_id` int(11) NOT NULL,
  `ticket_count` int(11) DEFAULT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `show_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Tickets`
--

INSERT INTO `Tickets` (`ticket_id`, `ticket_count`, `ticket_type_id`, `seat_number`, `show_id`, `employee_id`) VALUES
(1, 101, 1, 11, 1, NULL),
(2, 102, 1, 8, 1, 1),
(3, 103, 3, 13, 1, 1),
(4, 104, 2, 36, 3, 2),
(5, 105, 3, 37, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Ticket_Types`
--

CREATE TABLE `Ticket_Types` (
  `ticket_type_id` int(11) NOT NULL,
  `ticket_type_name` varchar(45) NOT NULL,
  `ticket_price` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Ticket_Types`
--

INSERT INTO `Ticket_Types` (`ticket_type_id`, `ticket_type_name`, `ticket_price`) VALUES
(1, 'Child', '8.00'),
(2, 'Student', '10.00'),
(3, 'Adult', '12.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Concessions`
--
ALTER TABLE `Concessions`
  ADD PRIMARY KEY (`concessions_id`),
  ADD UNIQUE KEY `concessions_id` (`concessions_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `Concessions_has_Items`
--
ALTER TABLE `Concessions_has_Items`
  ADD PRIMARY KEY (`concession_details_id`),
  ADD UNIQUE KEY `concession_details_id` (`concession_details_id`),
  ADD KEY `concessions_id` (`concessions_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_id` (`item_id`);

--
-- Indexes for table `Movies`
--
ALTER TABLE `Movies`
  ADD PRIMARY KEY (`movie_id`),
  ADD UNIQUE KEY `movie_id` (`movie_id`),
  ADD KEY `rating_id` (`rating_id`);

--
-- Indexes for table `Movies_has_Genres`
--
ALTER TABLE `Movies_has_Genres`
  ADD PRIMARY KEY (`movie_genre_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Ratings`
--
ALTER TABLE `Ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `rating_id` (`rating_id`);

--
-- Indexes for table `Shows`
--
ALTER TABLE `Shows`
  ADD PRIMARY KEY (`show_id`),
  ADD UNIQUE KEY `show_id` (`show_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `Tickets`
--
ALTER TABLE `Tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`),
  ADD KEY `ticket_type_id` (`ticket_type_id`),
  ADD KEY `show_id` (`show_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `Ticket_Types`
--
ALTER TABLE `Ticket_Types`
  ADD PRIMARY KEY (`ticket_type_id`),
  ADD UNIQUE KEY `ticket_type_id` (`ticket_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Concessions`
--
ALTER TABLE `Concessions`
  MODIFY `concessions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Concessions_has_Items`
--
ALTER TABLE `Concessions_has_Items`
  MODIFY `concession_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Genres`
--
ALTER TABLE `Genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Movies`
--
ALTER TABLE `Movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Movies_has_Genres`
--
ALTER TABLE `Movies_has_Genres`
  MODIFY `movie_genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Ratings`
--
ALTER TABLE `Ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Shows`
--
ALTER TABLE `Shows`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Tickets`
--
ALTER TABLE `Tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Ticket_Types`
--
ALTER TABLE `Ticket_Types`
  MODIFY `ticket_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Concessions`
--
ALTER TABLE `Concessions`
  ADD CONSTRAINT `Concessions_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Concessions_has_Items`
--
ALTER TABLE `Concessions_has_Items`
  ADD CONSTRAINT `Concessions_has_Items_ibfk_1` FOREIGN KEY (`concessions_id`) REFERENCES `Concessions` (`concessions_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Concessions_has_Items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `Items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Movies`
--
ALTER TABLE `Movies`
  ADD CONSTRAINT `Movies_ibfk_1` FOREIGN KEY (`rating_id`) REFERENCES `Ratings` (`rating_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Movies_has_Genres`
--
ALTER TABLE `Movies_has_Genres`
  ADD CONSTRAINT `Movies_has_Genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `Movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Movies_has_Genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `Genres` (`genre_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Shows`
--
ALTER TABLE `Shows`
  ADD CONSTRAINT `Shows_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `Movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Tickets`
--
ALTER TABLE `Tickets`
  ADD CONSTRAINT `Tickets_ibfk_1` FOREIGN KEY (`ticket_type_id`) REFERENCES `Ticket_Types` (`ticket_type_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Tickets_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `Shows` (`show_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Tickets_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
