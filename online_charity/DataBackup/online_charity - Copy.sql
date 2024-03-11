-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2023 at 12:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_charity`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `album_id` int(10) NOT NULL,
  `album_title` varchar(50) NOT NULL,
  `album_description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `album_title`, `album_description`, `status`) VALUES
(3, 'Events', 'Celebrations of functions and festivals', 'Active'),
(11, 'Birthdays', 'Celebrating Birthdays with orphans', 'Active'),
(12, 'Food Donation', 'Our NGO helps to people to donate food to homeless people', 'Active'),
(13, 'Medical Camp', 'Providing medical help in rural areas and needy people.', 'Active'),
(14, 'Educations', 'Providing basic and advanced education to childrens and adults', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(10) NOT NULL,
  `appointment_title` varchar(25) NOT NULL,
  `donor_id` int(10) NOT NULL,
  `staff_id` int(10) NOT NULL,
  `reason_for_appoinment` text NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `appointment_title`, `donor_id`, `staff_id`, `reason_for_appoinment`, `appointment_date`, `appointment_time`, `status`) VALUES
(13, 'Birthday Celebration', 16, 0, 'I want to celebrate my daughters birthday with street kids', '2023-08-12', '10:50:00', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `child_adoption`
--

CREATE TABLE `child_adoption` (
  `child_adoption_id` int(11) NOT NULL,
  `donor_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `child_adoption` text NOT NULL,
  `child_adoption_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `child_adoption`
--

INSERT INTO `child_adoption` (`child_adoption_id`, `donor_id`, `member_id`, `child_adoption`, `child_adoption_status`) VALUES
(14, 18, 14, 'a:11:{s:9:\"member_id\";s:2:\"14\";s:13:\"maleapplicant\";s:5:\"Omkar\";s:15:\"femaleapplicant\";s:6:\"Janvhi\";s:10:\"workingfor\";s:3:\"TCS\";s:12:\"annualincome\";s:6:\"100000\";s:11:\"designation\";s:7:\"Manager\";s:4:\"pfno\";s:10:\"1234567890\";s:9:\"childname\";s:6:\"Minali\";s:22:\"applicationprocessdate\";s:10:\"2023-08-10\";s:17:\"reasonforadoption\";s:15:\"I want help her\";s:8:\"anynotes\";s:41:\"We will take care of her like real family\";}', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `donor_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(25) NOT NULL,
  `pin_code` varchar(10) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `profile_img` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`donor_id`, `name`, `address`, `city`, `pin_code`, `email_id`, `password`, `contact_no`, `profile_img`, `status`) VALUES
(15, 'Avadhut Shivaji Lad', '', '', '', 'avadhut@gmail.com', '1234', '1234567890', '', 'Active'),
(16, 'Mayur Patil', '', '', '', 'mayur123@gmail.com', '123', '9876543210', '', 'Active'),
(17, 'Aniruddha Kakade', '', '', '', 'aniruddha123@gmail.com', '123', '9876543210', '', 'Active'),
(18, 'Siddhi Gurav', '', '', '', 'siddhi123@gmail.com', '123', '9876543210', '', 'Active'),
(19, 'Aditi Mohite', '', '', '', 'aditi123@gmail.com', '123', '9876543210', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `food_donor`
--

CREATE TABLE `food_donor` (
  `food_donor_id` int(10) NOT NULL,
  `donor_id` int(10) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(25) NOT NULL,
  `pin_code` varchar(10) NOT NULL,
  `datetime` datetime NOT NULL,
  `food_item_detail` text NOT NULL,
  `quantity` int(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `food_donor`
--

INSERT INTO `food_donor` (`food_donor_id`, `donor_id`, `staff_id`, `address`, `city`, `pin_code`, `datetime`, `food_item_detail`, `quantity`, `status`) VALUES
(9, 19, 0, 'DYPIMCA Akurdi', 'Pune', '411607', '2023-08-04 22:38:00', 'Dal Rice', 18, 'Accepted'),
(10, 17, 0, 'Nigdi Pradhikaran', 'Pune', '123452', '2023-08-09 00:00:00', 'Full Rice Plate', 49, 'Pending'),
(11, 16, 0, 'Dmart, Akurdi', 'Pune', '123456', '2023-08-10 00:00:00', 'Maggi', 99, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `fund_collection`
--

CREATE TABLE `fund_collection` (
  `fund_collection_id` int(10) NOT NULL,
  `fund_raiser_id` int(10) NOT NULL,
  `donor_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `paid_amt` float(10,2) NOT NULL,
  `paid_date` date NOT NULL,
  `payment_type` varchar(25) NOT NULL,
  `payment_detail` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fund_collection`
--

INSERT INTO `fund_collection` (`fund_collection_id`, `fund_raiser_id`, `donor_id`, `name`, `paid_amt`, `paid_date`, `payment_type`, `payment_detail`, `status`) VALUES
(30, 33, 19, 'Aditi Mohite', 5000.00, '2023-08-03', 'VISA', 'a:4:{i:0;s:5:\"aditi\";i:1;s:16:\"1234567890157868\";i:2;s:7:\"2023-12\";i:3;s:3:\"123\";}', 'Active'),
(31, 31, 16, 'Mayur Patil', 10000.00, '2023-08-03', 'MASTER CARD', 'a:4:{i:0;s:5:\"Mayur\";i:1;s:16:\"1539750563180609\";i:2;s:7:\"2023-11\";i:3;s:3:\"123\";}', 'Active'),
(32, 34, 18, 'Siddhi Gurav', 2500.00, '2023-08-03', 'RUPAY', 'a:4:{i:0;s:6:\"Siddhi\";i:1;s:16:\"1234567899876541\";i:2;s:7:\"2023-11\";i:3;s:3:\"123\";}', 'Active'),
(33, 32, 17, 'Aniruddha Kakade', 5000.00, '2023-08-04', 'AMERICAN EXPRESS', 'a:4:{i:0;s:9:\"Aniruddha\";i:1;s:16:\"1234567891053975\";i:2;s:7:\"2023-12\";i:3;s:3:\"789\";}', 'Active'),
(34, 34, 0, 'Avadhut Lad', 5000.00, '2023-08-04', 'VISA', 'a:4:{i:0;s:7:\"Avadhut\";i:1;s:16:\"1254894328763136\";i:2;s:7:\"2023-11\";i:3;s:3:\"256\";}', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `fund_raiser`
--

CREATE TABLE `fund_raiser` (
  `fund_raiser_id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `banner_img` varchar(100) NOT NULL,
  `fund_raiser_description` text NOT NULL,
  `fund_amount` float(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fund_raiser`
--

INSERT INTO `fund_raiser` (`fund_raiser_id`, `title`, `banner_img`, `fund_raiser_description`, `fund_amount`, `start_date`, `end_date`, `status`) VALUES
(31, 'Empowering Futures Fundraising for Child Education', '654142427Fundrise1.jpg', '<p>Join us in our mission to provide underprivileged children with access to quality education. Your generous contributions will help us build schools, provide learning resources, and offer scholarships to deserving students. Together, let\'s unlock the potential of these young minds and create a brighter, more promising future for our children. Every donation matters, and your support will be the key to transforming lives and breaking the cycle of poverty through education. Join the movement and be a catalyst for change today!</p>', 50000.00, '2023-08-01', '2023-12-31', 'Active'),
(32, 'Greening Our World Fundraising for Tree Plantation', '1040803478Fundrise2.jpg', '<p class=\"MsoNormal\">Join us in our mission to create a greener, more sustainable future by supporting our tree plantation initiative. Your generous contributions will help us plant trees in urban areas, reforest deforested lands, and restore fragile ecosystems. Together, we can combat climate change, improve air quality, and provide a thriving habitat for wildlife. Let\'s unite for a greener planet and leave a legacy of environmental stewardship for generations to come. Every donation counts, and together, we can make a significant impact on our planet\'s health and biodiversity. Join the movement and be a part of this vital tree planting effort today.</p>', 25000.00, '2023-08-01', '2023-12-31', 'Active'),
(33, 'A Home for Hope Fundraising for Homeless Individuals', '1028006197Fundrise3.jpg', '<p class=\"MsoNormal\">Help us extend a helping hand to those without a home by supporting our fundraising campaign for homeless individuals. Your compassionate contributions will provide shelters, meals, clothing, and essential resources to those facing homelessness. Together, we can restore dignity, offer warmth, and create a supportive community for those in need. Let\'s stand together in solidarity to break the cycle of homelessness and offer a pathway towards a brighter future. Your generosity can make a profound difference in the lives of those less fortunate, providing them with a chance to rebuild their lives and regain hope. Join us today and let\'s make a lasting impact on the lives of our homeless neighbors.</p>', 75000.00, '2023-08-01', '2023-12-31', 'Active'),
(34, 'Rebuilding Lives Fundraising for Disaster Relief', '982466699Fundrise4.jpg', '<p>Description: Stand with us in providing urgent aid and support to communities devastated by natural disasters. Your generous contributions will help us deliver essential supplies, medical assistance, and temporary shelters to those affected by earthquakes, floods, hurricanes, and other calamities. Together, we can offer a lifeline to survivors, offering them a chance to recover, rebuild, and heal in the face of adversity. Every donation counts, and your support will make a tangible difference in alleviating suffering and restoring hope for those who have lost so much. Join our disaster relief efforts today and be a beacon of light in times of darkness.</p>', 50000.00, '2023-08-01', '2023-12-31', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(10) NOT NULL,
  `member_type_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `id_proof` varchar(100) NOT NULL,
  `adress_proof` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `member_type_id`, `name`, `image`, `address`, `contact_no`, `id_proof`, `adress_proof`, `description`, `status`) VALUES
(13, 1, 'JayKumar', '510759525orp1.jpeg', 'Pune', '1234567890', '421114658ID.jpeg', '983470885ID.png', 'He 5 year orphan kid with bright mind', 'Active'),
(14, 1, 'Mina', '964735801orp3.jpeg', 'Pune', '1234567890', '1488946096ID.jpeg', '1311802660ID.png', 'She is 4 year kid ', 'Adopted'),
(15, 1, 'Mohit', '357798083orp2.jpeg', 'Pune', '1234567890', '451454765ID.jpeg', '166732236ID.png', 'He is suffering from 1 stage cancer', 'Active'),
(16, 3, 'Komal', '1011021831orp4.jpeg', 'Pune', '1234567890', '944157444ID.jpeg', '41801564ID.png', 'She has 2 stage cancer', 'Active'),
(17, 2, 'Tejas', '1318253720orp5.jpeg', 'Pune', '1234567890', '1917752924ID.jpeg', '476148540ID.png', 'He is brilliant minded student', 'Active'),
(18, 1, 'Monica', '1174134545orp6.jpeg', 'Pune', '1234567891', '1354864894ID.jpeg', '1375094729ID.png', 'She very good at singing', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `member_type`
--

CREATE TABLE `member_type` (
  `member_type_id` int(10) NOT NULL,
  `member_type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `member_type`
--

INSERT INTO `member_type` (`member_type_id`, `member_type`, `description`, `status`) VALUES
(1, 'Homeless Child', 'Homeless Child', 'Active'),
(2, 'Blind', 'Blind', 'Active'),
(3, 'Cancer', 'Cancer', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(10) NOT NULL,
  `album_id` int(10) NOT NULL,
  `photo_title` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `photo_description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photo_id`, `album_id`, `photo_title`, `photo`, `photo_description`, `status`) VALUES
(28, 11, 'Jay Birthday', '1405275170birthday1.jpg', 'Jay celebrated his birthday with the help of our NGO with Steet kids', 'Active'),
(29, 11, 'Komals Birthday', '701282181birthday2.jpg', 'Komals Birthday celebration with orphans', 'Active'),
(30, 11, 'Orphans Birthday', '1878508430birthday3.jpg', 'We Celebrated orphans birthday with peoples', 'Active'),
(31, 11, 'Birthday', '1474274095birthday4.jpg', 'New members birthday', 'Active'),
(32, 12, 'Food Donation', '1729647372food1.jpeg', 'Food donation in old age home', 'Active'),
(33, 12, 'Food donation', '2133450772food2.jpeg', 'Food donation for street peoples', 'Active'),
(34, 12, 'Food Donation', '2141896466food3.jpeg', 'Food donated to street kids', 'Active'),
(35, 12, 'Food Donation', '791777163food4.jpeg', 'Food donation in orphanages', 'Active'),
(36, 3, 'Festival', '540832413fest1.jpeg', 'Holi with Orphanage kids', 'Active'),
(37, 3, 'Festivals', '583487506fest2.jpeg', 'Christmas with street kids', 'Active'),
(38, 3, 'Festival', '1213621313fest3.jpeg', 'Diwali with homeless kids', 'Active'),
(39, 13, 'Medical Help', '360240891medi1.jpeg', 'Medical camp in village', 'Active'),
(40, 13, 'Medial Help', '259660735medi2.jpeg', 'Medical camp association with government', 'Active'),
(41, 13, 'Medical Help', '307177566medi3.jpeg', 'Health checkup of street kids', 'Active'),
(42, 14, 'Educations', '1457444871edu1.jpeg', 'Education for orphanage kids', 'Active'),
(43, 14, 'Educations', '601663953edu2.jpeg', 'Education for street kids', 'Active'),
(44, 14, 'Educations', '1529395611edu3.jpeg', 'Adult education in village', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(10) NOT NULL,
  `staff_type` varchar(20) NOT NULL,
  `staff_name` varchar(56) NOT NULL,
  `login_id` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_type`, `staff_name`, `login_id`, `password`, `status`) VALUES
(2, 'Admin', 'admin', 'admin', 'admin', 'Active'),
(5, 'Employee ', 'Mayur ', 'mayur', '123', 'Active'),
(6, 'Employee ', 'Avadhut ', 'avadhut', '123', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `child_adoption`
--
ALTER TABLE `child_adoption`
  ADD PRIMARY KEY (`child_adoption_id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`donor_id`);

--
-- Indexes for table `food_donor`
--
ALTER TABLE `food_donor`
  ADD PRIMARY KEY (`food_donor_id`);

--
-- Indexes for table `fund_collection`
--
ALTER TABLE `fund_collection`
  ADD PRIMARY KEY (`fund_collection_id`);

--
-- Indexes for table `fund_raiser`
--
ALTER TABLE `fund_raiser`
  ADD PRIMARY KEY (`fund_raiser_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `member_type`
--
ALTER TABLE `member_type`
  ADD PRIMARY KEY (`member_type_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `child_adoption`
--
ALTER TABLE `child_adoption`
  MODIFY `child_adoption_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `donor_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `food_donor`
--
ALTER TABLE `food_donor`
  MODIFY `food_donor_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fund_collection`
--
ALTER TABLE `fund_collection`
  MODIFY `fund_collection_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `fund_raiser`
--
ALTER TABLE `fund_raiser`
  MODIFY `fund_raiser_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `member_type`
--
ALTER TABLE `member_type`
  MODIFY `member_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
