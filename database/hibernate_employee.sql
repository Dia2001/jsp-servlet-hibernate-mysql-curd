--
-- Script was generated by Devart dbForge Studio 2022 for MySQL, Version 9.1.8.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 10/26/2022 8:56:07 PM
-- Server version: 5.7.36
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE hibernate_employee;

--
-- Drop table `employee`
--
DROP TABLE IF EXISTS employee;

--
-- Drop table `department`
--
DROP TABLE IF EXISTS department;

--
-- Set default database
--
USE hibernate_employee;

--
-- Create table `department`
--
CREATE TABLE department (
  DepartmentID int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id phòng ban',
  NAME varchar(100) NOT NULL COMMENT 'Tên phòng ban',
  PRIMARY KEY (DepartmentID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Bảng thông tin phòng ban';

--
-- Create index `DepartmentName` on table `department`
--
ALTER TABLE department
ADD UNIQUE INDEX DepartmentName (NAME);

--
-- Create table `employee`
--
CREATE TABLE employee (
  ID int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã nhân viên',
  NAME varchar(100) NOT NULL COMMENT 'Tên nhân viên',
  PASSWORD varchar(25) NOT NULL COMMENT 'Pass word',
  EMAIL varchar(100) DEFAULT NULL COMMENT 'Email',
  COUNTRY varchar(100) DEFAULT NULL COMMENT 'Quốc gia',
  DepartmentID int(11) NOT NULL COMMENT 'Id phòng ban',
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 53,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Bảng thông tin nhân viên';

--
-- Create index `EmployeenName` on table `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX EmployeenName (NAME);

--
-- Create foreign key
--
ALTER TABLE employee
ADD CONSTRAINT FK_employee_department_DepartmentID FOREIGN KEY (DepartmentID)
REFERENCES department (DepartmentID);

--
-- Create foreign key
--
ALTER TABLE employee
ADD CONSTRAINT FKpqnkyknoe4bmsfhnwdfaans5r FOREIGN KEY (DepartmentID)
REFERENCES department (DepartmentID);

-- 
-- Dumping data for table department
--
INSERT INTO department VALUES
(2, 'Finance'),
(5, 'Human Resources'),
(4, 'Manufacturing'),
(3, 'Research and Development'),
(1, 'Sales');

-- 
-- Dumping data for table employee
--
INSERT INTO employee VALUES
(1, 'Abraham968', 'WCC9', 'AbrahamAcevedo@example.com', 'Argentina', 2),
(2, 'Markus549', '4WA7', 'Jude_High169@example.com', 'Kuwait', 3),
(3, 'Jason4', 'S', 'Bauer@example.com', 'Bangladesh', 1),
(4, 'Mcnally2', '7', 'Alarcon@example.com', 'Netherlands', 1),
(5, 'Adolph45', '0', 'gndd9978@example.com', 'Zimbabwe', 2),
(6, 'Luther2020', 'J6O', NULL, NULL, 4),
(7, 'Ada2005', '3', 'Palmer_Lofton@example.com', 'Suriname', 3),
(8, 'Gerardo1992', '9D', 'Abernathy@example.com', 'Peru', 5),
(9, 'Carmela778', 'FL8', 'Adaline_Abbott@example.com', 'Belgium', 3),
(10, 'Florida343', '5', 'Shayne_Britton589@example.com', 'Indonesia', 2),
(11, 'Abel79', 'P', 'mxwygtmf_ahjpwboxdy@example.com', 'Lebanon', 3),
(12, 'Alesia1986', 'U', 'Steve.A.Pape@nowhere.com', 'Spain', 1),
(13, 'Abigail658', '77823', 'Ivan.Southern98@example.com', 'Austria', 4),
(14, 'Abernathy1968', 'H9A', 'Darell_Centeno27@example.com', 'Australia', 1),
(15, 'Allman22', 'NM99OGB57T0', 'Shanta.Beaver89@nowhere.com', 'Hungary', 1),
(16, 'Brandt151', '81J', 'GregoryMurrell@example.com', 'Romania', 2),
(17, 'Celestine1984', '04', 'rfgxqoso9811@example.com', 'Swaziland', 5),
(18, 'Andrew2004', '1U61', 'Violette_Maxey368@example.com', 'Viet Nam', 2),
(19, 'Lewis1950', '102', 'Sanderson@example.com', 'Turkey', 3),
(20, 'Alphonso1996', '7H', 'Dennis@example.com', 'Swaziland', 1),
(21, 'Huey266', 'EV', 'Shifflett@example.com', 'Fiji', 4),
(22, 'Sauer1', '1F47A95B5BNIL', 'Abbie.Watts@example.com', 'Australia', 4),
(23, 'Angelia7', '10', 'AlessandraNMckenzie72@example.com', 'Estonia', 1),
(24, 'Douglass6', 'U9', 'mivxztrm_txjxxsw@example.com', 'Canada', 3),
(25, 'Adrian25', 'M', 'Killian@nowhere.com', 'Cyprus', 1),
(26, 'Julius176', '5186E4', 'Maness@nowhere.com', 'Namibia', 3),
(27, 'Crocker161', 'J63S', 'KimberlieCrocker@nowhere.com', 'Panama', 1),
(28, 'Laci2018', '7JZC5', 'oxdngcmz8118@example.com', 'Saudi Arabia', 2),
(29, 'Najera259', '016J', 'Tiffanie.Romero27@nowhere.com', 'Bahrain', 5),
(30, 'Adah1954', '29XU', 'Gable@example.com', 'Ghana', 3),
(31, 'Banks331', '287N8G8H', 'Myrtle_Bernard@example.com', 'Zambia', 3),
(32, 'Alice7', '737987', 'Raynor8@example.com', 'Belize', 4),
(33, 'Antonio2012', '1', 'Sipes449@example.com', 'France', 3),
(34, 'Ivory222', 'K9B', 'Batson@example.com', 'Afghanistan', 2),
(35, 'Aiko2002', '7192', 'ReaReyna391@nowhere.com', 'Canada', 4),
(36, 'Alesia1990', '9', 'SeeleyJ@example.com', 'Panama', 5),
(37, 'Jessika1979', '31C56ZADG81848Q2', 'AbbieAbel@example.com', 'Peru', 4),
(38, 'Percy22', '44', 'Monty.Swan5@nowhere.com', 'Sierra Leone', 2),
(39, 'Marilu1968', 'M66K86', 'SteinerK@example.com', 'Gambia', 4),
(40, 'Trent844', '8L', 'Daily37@example.com', 'Lebanon', 1),
(41, 'Evalyn1973', 'Q07I2O', 'AddieTrice329@example.com', 'Tunisia', 2),
(42, 'Tyrell2000', 'L8V7KG0', 'Caballero313@example.com', 'Bangladesh', 5),
(43, 'Caleb49', 'Z569M8843208', 'uvrguf247@nowhere.com', 'Tunisia', 4),
(44, 'Vernon2007', 'ADS', 'Jewel.Albers24@nowhere.com', 'Malaysia', 1),
(45, 'Guillen2015', 'K90', NULL, NULL, 2),
(46, 'Mack1955', 'R7T', 'Oliva_Caskey572@example.com', 'Slovenia', 2),
(47, 'Marcelo13', 'A8', NULL, NULL, 5),
(48, 'Melody1989', 'J', 'Nannie_Farr@nowhere.com', 'Slovakia', 1),
(49, 'Chaney85', '7F1B9Z26Z41K1', 'mcvgy02@example.com', 'Hungary', 1),
(50, 'Abram2009', '6G', 'Mcnamara616@example.com', 'Sierra Leone', 4);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;