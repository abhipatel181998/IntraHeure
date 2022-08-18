-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2022 at 12:15 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intraheure`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendancefile`
--

CREATE TABLE IF NOT EXIST `attendancefile` (
  `fileId` int(11) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXIST `city` (
  `cityId` int(11) NOT NULL,
  `cityDesc` varchar(255) DEFAULT NULL,
  `cityName` varchar(255) DEFAULT NULL,
  `deleteStatus` varchar(255) DEFAULT NULL,
  `stateVo_stateId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityId`, `cityDesc`, `cityName`, `deleteStatus`, `stateVo_stateId`) VALUES
(1, 'Ahmedabad', 'Ahmedabad', 'deactive', 1);

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE IF NOT EXIST `complain` (
  `complainId` int(11) NOT NULL,
  `complainDate` varchar(255) DEFAULT NULL,
  `complainDesc` varchar(255) DEFAULT NULL,
  `complainStatus` int(11) DEFAULT NULL,
  `complainSub` varchar(255) DEFAULT NULL,
  `deleteStatus` varchar(255) DEFAULT NULL,
  `replyDate` varchar(255) DEFAULT NULL,
  `replyDesc` varchar(255) DEFAULT NULL,
  `complainFrom_loginId` int(11) DEFAULT NULL,
  `complainTo_loginId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXIST `department` (
  `departmentId` int(11) NOT NULL,
  `deleteStatus` varchar(255) DEFAULT NULL,
  `departmentDesc` varchar(255) DEFAULT NULL,
  `departmentName` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `deleteStatus`, `departmentDesc`, `departmentName`) VALUES
(1, 'deactive', 'IT', 'IT'),
(2, 'deactive', 'Finance', 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE IF NOT EXIST `designation` (
  `designationId` int(11) NOT NULL,
  `deleteStatus` varchar(255) DEFAULT NULL,
  `designationDesc` varchar(255) DEFAULT NULL,
  `designationName` varchar(255) DEFAULT NULL,
  `departmentVo_departmentId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designationId`, `deleteStatus`, `designationDesc`, `designationName`, `departmentVo_departmentId`) VALUES
(1, 'deactive', NULL, 'Human Resources(HR)', 1),
(2, 'deactive', NULL, 'Human Resources(HR)', 2),
(3, 'deactive', 'Ahmedabad', 'Developer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dynamicsalaryinfo`
--

CREATE TABLE IF NOT EXIST `dynamicsalaryinfo` (
  `id` int(11) NOT NULL,
  `freeLeave` int(11) DEFAULT NULL,
  `paidLeave` int(11) DEFAULT NULL,
  `salaryPerMonth` double DEFAULT NULL,
  `salaryToGet` double DEFAULT NULL,
  `loginVo_loginId` int(11) DEFAULT NULL,
  `salaryVo_salaryId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXIST `feedback` (
  `feedbackId` int(11) NOT NULL,
  `deleteStatus` varchar(255) DEFAULT NULL,
  `feedbackDate` varchar(255) DEFAULT NULL,
  `feedbackDesc` varchar(255) DEFAULT NULL,
  `ratings` int(11) DEFAULT NULL,
  `feedbackFrom_loginId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXIST `file` (
  `id` int(11) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leaverequest`
--

CREATE TABLE IF NOT EXIST `leaverequest` (
  `leaveRequestId` int(11) NOT NULL,
  `fromDate` varchar(255) DEFAULT NULL,
  `leaveReason` varchar(255) DEFAULT NULL,
  `rejectReason` varchar(255) DEFAULT NULL,
  `requestStatus` int(11) DEFAULT NULL,
  `toDate` varchar(255) DEFAULT NULL,
  `leaveTypeVo_leaveId` int(11) DEFAULT NULL,
  `loginVo_loginId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leavetype`
--

CREATE TABLE IF NOT EXIST `leavetype` (
  `leaveId` int(11) NOT NULL,
  `deleteStatus` varchar(255) DEFAULT NULL,
  `leaveDesc` varchar(255) DEFAULT NULL,
  `leaveName` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXIST `login` (
  `loginId` int(11) NOT NULL,
  `enabled` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`loginId`, `enabled`, `password`, `role`, `userName`) VALUES
(1, 1, 'admin', 'ROLE_ADMIN', 'admin@admin.com'),
(2, 1, 'ithr', 'ROLE_HR', 'ithr@hr.com'),
(3, 1, 'abhi', 'ROLE_EMPLOYEE', 'abhi@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `registeration`
--

CREATE TABLE IF NOT EXIST `registeration` (
  `userId` int(11) NOT NULL,
  `birthDate` varchar(255) DEFAULT NULL,
  `deleteStatus` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `joiningDate` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `profilePic` varchar(255) DEFAULT NULL,
  `residentialAddress` varchar(255) DEFAULT NULL,
  `cityVo_cityId` int(11) DEFAULT NULL,
  `departmentVo_departmentId` int(11) DEFAULT NULL,
  `designationVo_designationId` int(11) DEFAULT NULL,
  `loginVo_loginId` int(11) DEFAULT NULL,
  `stateVo_stateId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registeration`
--

INSERT INTO `registeration` (`userId`, `birthDate`, `deleteStatus`, `email`, `firstName`, `gender`, `joiningDate`, `lastName`, `mobileNumber`, `pincode`, `profilePic`, `residentialAddress`, `cityVo_cityId`, `departmentVo_departmentId`, `designationVo_designationId`, `loginVo_loginId`, `stateVo_stateId`) VALUES
(1, '01/01/1998', 'deactive', 'ithr@hr.com', 'ITHr', 'male', '18 Aug. 2022', 'ITHr', '4567891234', '123456', NULL, 'Ahmedabad', 1, 1, 1, 2, 1),
(2, '1998-07-01', 'deactive', 'abhi@mail.com', 'Abhi', 'male', '18 Aug. 2022', 'Patel', '1234567890', '123456', NULL, 'Ahmedabad', 1, 1, 3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `resignation`
--

CREATE TABLE IF NOT EXIST `resignation` (
  `resignationId` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `requestDate` varchar(255) DEFAULT NULL,
  `requestFrom_loginId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE IF NOT EXIST `salary` (
  `salaryId` int(11) NOT NULL,
  `basicSalary` double DEFAULT NULL,
  `conveyance` double DEFAULT NULL,
  `deletestatus` varchar(255) DEFAULT NULL,
  `esi` double DEFAULT NULL,
  `freeLeavePerYear` int(11) DEFAULT NULL,
  `hra` double DEFAULT NULL,
  `medical` double DEFAULT NULL,
  `netSalary` double DEFAULT NULL,
  `pf` double DEFAULT NULL,
  `profTax` double DEFAULT NULL,
  `tds` double DEFAULT NULL,
  `loginVo_loginId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXIST `state` (
  `stateId` int(11) NOT NULL,
  `deleteStatus` varchar(255) DEFAULT NULL,
  `stateDesc` varchar(255) DEFAULT NULL,
  `stateName` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`stateId`, `deleteStatus`, `stateDesc`, `stateName`) VALUES
(1, 'deactive', 'Gujarat', 'Gujarat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendancefile`
--
ALTER TABLE `attendancefile`
  ADD PRIMARY KEY (`fileId`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityId`),
  ADD KEY `FKgwite2044n2yhv3jv0p5qah1v` (`stateVo_stateId`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`complainId`),
  ADD KEY `FK409vd4ctjs9jojpytceqipmvv` (`complainFrom_loginId`),
  ADD KEY `FKe021fxk0pw1l1u2wy93ohjbmi` (`complainTo_loginId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`designationId`),
  ADD KEY `FKt2lwf6q4j2ai9iiy8axjvanpn` (`departmentVo_departmentId`);

--
-- Indexes for table `dynamicsalaryinfo`
--
ALTER TABLE `dynamicsalaryinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4i3b9jeks0fb157ts79rl2p3g` (`loginVo_loginId`),
  ADD KEY `FKb02vfwc7d13lvocuybgaxkn74` (`salaryVo_salaryId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`),
  ADD KEY `FK6gyuxsbyhw31c65ysj11yhhbk` (`feedbackFrom_loginId`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaverequest`
--
ALTER TABLE `leaverequest`
  ADD PRIMARY KEY (`leaveRequestId`),
  ADD KEY `FKslncd7i1rvtu2p02l8c57tcnp` (`leaveTypeVo_leaveId`),
  ADD KEY `FKfgif9d900lfh175dnmce0jb1t` (`loginVo_loginId`);

--
-- Indexes for table `leavetype`
--
ALTER TABLE `leavetype`
  ADD PRIMARY KEY (`leaveId`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`loginId`);

--
-- Indexes for table `registeration`
--
ALTER TABLE `registeration`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `FKcbvyb12t28a09ysyy14p6bn7l` (`cityVo_cityId`),
  ADD KEY `FK8eey43rpxbfawtuvs7wo22phm` (`departmentVo_departmentId`),
  ADD KEY `FKfyejr1eu9hhemrxy5ghge04db` (`designationVo_designationId`),
  ADD KEY `FKq2u3dxq18gqmj0w8hrw49mku7` (`loginVo_loginId`),
  ADD KEY `FK5tbhm73u5ti6urfvxohkwtv9u` (`stateVo_stateId`);

--
-- Indexes for table `resignation`
--
ALTER TABLE `resignation`
  ADD PRIMARY KEY (`resignationId`),
  ADD KEY `FKhwlk630um3nmovwiqed8fl7xj` (`requestFrom_loginId`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salaryId`),
  ADD KEY `FKbd4uvqkbvr6t32kse0q4smnp5` (`loginVo_loginId`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`stateId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendancefile`
--
ALTER TABLE `attendancefile`
  MODIFY `fileId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `complainId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `designationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dynamicsalaryinfo`
--
ALTER TABLE `dynamicsalaryinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaverequest`
--
ALTER TABLE `leaverequest`
  MODIFY `leaveRequestId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leavetype`
--
ALTER TABLE `leavetype`
  MODIFY `leaveId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `loginId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registeration`
--
ALTER TABLE `registeration`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resignation`
--
ALTER TABLE `resignation`
  MODIFY `resignationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `salaryId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `stateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
