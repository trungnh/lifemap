-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 02, 2012 at 12:01 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lifemap_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_data`
--

CREATE TABLE IF NOT EXISTS `activity_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `in_reply_to_activity_id` int(11) DEFAULT NULL COMMENT 'Activity data id is in reply to',
  `body` varchar(140) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Activity body',
  `uri` text COLLATE utf8_unicode_ci COMMENT 'Activity URI',
  `public_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Public flag of activity',
  `is_pc` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Display this in PC?',
  `is_mobile` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Display this in Mobile?',
  `source` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The source caption',
  `source_uri` text COLLATE utf8_unicode_ci COMMENT 'The source URI',
  `foreign_table` text COLLATE utf8_unicode_ci COMMENT 'Reference table name',
  `foreign_id` bigint(20) DEFAULT NULL COMMENT 'The id of reference table',
  `template` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Template name',
  `template_param` longtext COLLATE utf8_unicode_ci COMMENT 'Params for template',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `in_reply_to_activity_id_idx` (`in_reply_to_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves activities' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `activity_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `activity_image`
--

CREATE TABLE IF NOT EXISTS `activity_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `activity_data_id` int(11) NOT NULL COMMENT 'Activity data id',
  `mime_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'MIME type',
  `uri` text COLLATE utf8_unicode_ci COMMENT 'Image URI',
  `file_id` int(11) DEFAULT NULL COMMENT 'File id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_data_id_idx` (`activity_data_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves image information of activity' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `activity_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Administrator''s username',
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Administrator''s password',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE_idx` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations to login administration page' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', '2011-06-22 08:46:11', '2011-06-22 08:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `public_flag` tinyint(4) NOT NULL DEFAULT '1',
  `file_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `member_id`, `title`, `body`, `public_flag`, `file_id`, `created_at`, `updated_at`) VALUES
(1, 9, 'ash', 'sjdj', 1, NULL, '2011-06-26 11:35:25', '2011-06-26 11:35:25'),
(2, 1, 'Album ABC', 'mô tả abc', 1, 8, '2011-07-22 17:49:10', '2011-07-22 17:49:10'),
(3, 1, 'Album BCD', 'mô tả BCD', 1, 9, '2011-07-22 17:51:09', '2011-07-22 17:51:09'),
(4, 3, 'Ảnh cá nhân', 'Ảnh cá nhân', 1, 10, '2011-07-23 12:17:11', '2011-07-23 12:17:11'),
(5, 1, 'Sample', 'Sample Sample Sample', 1, 11, '2011-07-29 13:42:05', '2011-07-29 13:42:05'),
(6, 1, 'Sample', 'Sample Sample Sample', 1, 12, '2011-07-29 13:42:16', '2011-07-29 13:42:16'),
(7, 1, 'Sample ', 'Sample Sample Sample', 1, 13, '2011-07-29 13:42:33', '2011-07-29 13:43:37'),
(8, 1, 'Sample Sample ', 'Sample Sample Sample', 1, 14, '2011-07-29 13:42:45', '2011-07-29 13:43:16'),
(9, 1, 'Sample', 'Sample Sample SampleSample Sample Sample', 1, 15, '2011-07-29 13:44:11', '2011-07-29 13:44:11'),
(10, 1, 'Sample', 'Sample Sample SampleSample Sample Sample', 1, 16, '2011-07-29 13:44:19', '2011-07-29 13:44:19'),
(11, 1, 'Sample', 'Sample Sample SampleSample Sample Sample', 1, 17, '2011-07-29 13:44:28', '2011-07-29 13:44:28'),
(12, 1, 'Sample', 'Sample Sample SampleSample Sample Sample', 1, 18, '2011-07-29 13:46:48', '2011-07-29 13:46:48'),
(13, 3, 'Project', 'Project', 1, 22, '2011-07-30 12:04:41', '2011-07-30 12:04:41'),
(14, 15, 'nice day', 'nice is nice, always nice', 1, 23, '2011-07-30 12:06:42', '2011-07-30 12:06:42'),
(15, 15, 'bam bo o o o ', 'day thoi ', 1, 28, '2011-07-30 12:15:13', '2011-07-30 12:15:13'),
(16, 1, 'galery bui xuan phai', 'thuclh', 1, 40, '2011-08-04 23:32:31', '2011-08-04 23:32:31'),
(17, 3, 'LifeTek', 'LifeTek', 1, 47, '2011-08-19 17:05:12', '2011-08-19 17:05:12'),
(18, 19, 'My Photos', 'Nude', 1, 58, '2011-08-27 11:15:39', '2011-08-27 11:15:39'),
(19, 18, 'my family', 'jskljfjljklajlkjk', 1, 60, '2011-08-27 11:58:31', '2011-08-27 11:58:31');

-- --------------------------------------------------------

--
-- Table structure for table `album_image`
--

CREATE TABLE IF NOT EXISTS `album_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `description` text,
  `filesize` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id_idx` (`album_id`),
  KEY `file_id_idx` (`file_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `album_image`
--

INSERT INTO `album_image` (`id`, `album_id`, `member_id`, `file_id`, `description`, `filesize`, `created_at`, `updated_at`) VALUES
(1, 15, 15, 29, 'gio bao ', 0, '2011-07-30 12:27:33', '2011-07-30 12:27:33'),
(2, 15, 15, 30, 'troi mua', 0, '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(3, 15, 15, 31, 'e o ', 0, '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(4, 15, 15, 32, 'tenten ten ', 0, '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(5, 15, 15, 33, 'um ba la ', 0, '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(6, 13, 3, 38, 'eb0f8565838f021d3bc27fbb75160a8993118f33_jpg', 0, '2011-08-04 13:50:54', '2011-08-04 13:50:54'),
(7, 13, 3, 39, 'd09cdfbdbfac3cbcefeed7737e4b303db6971f4e_jpg', 0, '2011-08-04 13:50:54', '2011-08-04 13:50:54'),
(8, 16, 1, 41, '24d406849d401be5c54eb369ca0c3b4967c66652_jpg', 0, '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(9, 16, 1, 42, 'b72d84691a90e5c3596a061ce697503e2879df0b_jpg', 0, '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(10, 16, 1, 43, 'c7382a211f75756048edded1df01275e866ba98d_jpg', 0, '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(11, 16, 1, 65, 'Lâu đài', 0, '2011-10-21 14:57:23', '2011-10-21 14:57:23'),
(12, 12, 1, 188, 'Hoa cúc', 0, '2012-01-13 09:01:21', '2012-01-13 09:01:21'),
(13, 12, 1, 189, 'Hoa Tulips', 0, '2012-01-13 09:01:21', '2012-01-13 09:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `url` varchar(128) NOT NULL,
  `height` bigint(20) DEFAULT NULL,
  `scrolling` tinyint(1) NOT NULL DEFAULT '0',
  `singleton` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_pc` tinyint(1) NOT NULL DEFAULT '1',
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `links` longtext,
  `consumer_key` varchar(16) NOT NULL DEFAULT '',
  `consumer_secret` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`id`, `member_id`, `url`, `height`, `scrolling`, `singleton`, `is_active`, `is_pc`, `is_mobile`, `links`, `consumer_key`, `consumer_secret`) VALUES
(1, NULL, 'http://labs.spicebox.jp/opensocial/apps/paypalbutton.xml', NULL, 0, 1, 1, 1, 0, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `application_invite`
--

CREATE TABLE IF NOT EXISTS `application_invite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  `to_member_id` int(11) NOT NULL,
  `from_member_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id_idx` (`application_id`),
  KEY `to_member_id_idx` (`to_member_id`),
  KEY `from_member_id_idx` (`from_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `application_invite`
--


-- --------------------------------------------------------

--
-- Table structure for table `application_lifecycle_event_queue`
--

CREATE TABLE IF NOT EXISTS `application_lifecycle_event_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `params` longtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id_idx` (`application_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `application_lifecycle_event_queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `application_persistent_data`
--

CREATE TABLE IF NOT EXISTS `application_persistent_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  `member_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`application_id`,`member_id`,`name`),
  KEY `application_id_idx` (`application_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `application_persistent_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `application_translation`
--

CREATE TABLE IF NOT EXISTS `application_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `title_url` varchar(128) DEFAULT NULL,
  `description` text,
  `directory_title` varchar(128) DEFAULT NULL,
  `screenshot` varchar(128) DEFAULT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `author` varchar(128) DEFAULT NULL,
  `author_aboutme` text,
  `author_affiliation` varchar(128) DEFAULT NULL,
  `author_email` varchar(128) DEFAULT NULL,
  `author_photo` varchar(128) DEFAULT NULL,
  `author_link` varchar(128) DEFAULT NULL,
  `author_quote` text,
  `settings` longtext,
  `views` longtext,
  `lang` char(5) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application_translation`
--

INSERT INTO `application_translation` (`id`, `title`, `title_url`, `description`, `directory_title`, `screenshot`, `thumbnail`, `author`, `author_aboutme`, `author_affiliation`, `author_email`, `author_photo`, `author_link`, `author_quote`, `settings`, `views`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'PayPal ボタン（寄付・購入）', NULL, 'PayPal（ペイパル）の決済サービスを簡単に設置・利用できるアプリです。会費の集金、アイテム購入の支払いに使える「購入ボタン」と、SNSへの寄付や募金に使える「寄付」ボタンがあります。PayPal ボタンのご利用には PayPal アカウントの登録が必要です。', NULL, 'http://labs.spicebox.jp/opensocial/apps/paypalbutton/ppbutton_screenshot280.png', 'http://labs.spicebox.jp/opensocial/apps/paypalbutton/ppgadget.png', 'スパイスボックスラボラトリ', '神部竜二', 'SPICEBOX LABORATORY', 'lab@spicebox.co.jp', 'http://labs.spicebox.jp/about/images/members/member002.jpg', 'http://labs.spicebox.jp/', 'spicebox.NEXT をつくる', NULL, NULL, 'ja_JP', '2011-06-22 08:46:10', '1989-01-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ashiato`
--

CREATE TABLE IF NOT EXISTS `ashiato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id_from` int(11) DEFAULT NULL,
  `member_id_to` int(11) DEFAULT NULL,
  `r_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at_idx` (`created_at`),
  KEY `member_id_to_member_id_from_updated_at_idx` (`member_id_to`,`member_id_from`,`updated_at`),
  KEY `member_id_to_r_date_idx` (`member_id_to`,`r_date`),
  KEY `member_id_to_idx` (`member_id_to`),
  KEY `member_id_from_idx` (`member_id_from`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=168 ;

--
-- Dumping data for table `ashiato`
--

INSERT INTO `ashiato` (`id`, `member_id_from`, `member_id_to`, `r_date`, `created_at`, `updated_at`) VALUES
(1, 1, 9, '2011-06-26', '2011-06-26 11:34:49', '2011-06-26 11:34:49'),
(2, 3, 9, '2011-07-06', '2011-07-06 06:37:10', '2011-07-06 06:37:10'),
(3, 3, 1, '2011-07-06', '2011-07-06 06:37:45', '2011-07-06 06:37:45'),
(4, 1, 3, '2011-07-06', '2011-07-06 06:38:38', '2011-07-06 06:38:38'),
(5, 1, 9, '2011-07-06', '2011-07-06 06:38:52', '2011-07-06 06:38:52'),
(6, 1, 3, '2011-07-09', '2011-07-09 11:13:57', '2011-07-09 11:13:57'),
(7, 3, 1, '2011-07-09', '2011-07-09 11:15:27', '2011-07-09 11:15:27'),
(8, 1, 3, '2011-07-09', '2011-07-09 11:57:12', '2011-07-09 11:57:12'),
(9, 1, 9, '2011-07-17', '2011-07-17 17:22:57', '2011-07-17 17:22:57'),
(10, 3, 1, '2011-07-17', '2011-07-17 17:55:17', '2011-07-17 17:55:17'),
(11, 3, 1, '2011-07-21', '2011-07-21 19:45:33', '2011-07-21 19:45:33'),
(12, 3, 1, '2011-07-21', '2011-07-21 19:50:40', '2011-07-21 19:50:40'),
(13, 1, 3, '2011-07-23', '2011-07-23 08:36:09', '2011-07-23 08:36:09'),
(14, 1, 3, '2011-07-23', '2011-07-23 11:09:38', '2011-07-23 11:09:38'),
(15, 3, 14, '2011-07-28', '2011-07-28 14:03:02', '2011-07-28 14:03:02'),
(16, 1, 5, '2011-07-28', '2011-07-28 18:19:11', '2011-07-28 18:19:11'),
(17, 1, 3, '2011-07-29', '2011-07-29 14:04:30', '2011-07-29 14:04:30'),
(18, 1, 3, '2011-07-29', '2011-07-29 14:09:36', '2011-07-29 14:09:36'),
(19, 5, 3, '2011-07-29', '2011-07-29 16:46:20', '2011-07-29 16:46:20'),
(20, 15, 3, '2011-07-30', '2011-07-30 12:10:06', '2011-07-30 12:10:06'),
(21, 3, 16, '2011-07-31', '2011-07-31 06:38:00', '2011-07-31 06:38:00'),
(22, 3, 15, '2011-08-01', '2011-08-01 19:26:26', '2011-08-01 19:26:26'),
(23, 3, 15, '2011-08-02', '2011-08-02 07:41:48', '2011-08-02 07:41:48'),
(24, 3, 14, '2011-08-02', '2011-08-02 07:56:24', '2011-08-02 07:56:24'),
(25, 3, 15, '2011-08-02', '2011-08-02 08:18:14', '2011-08-02 08:18:14'),
(26, 3, 16, '2011-08-02', '2011-08-02 08:46:37', '2011-08-02 08:46:37'),
(27, 1, 3, '2011-08-03', '2011-08-03 15:47:24', '2011-08-03 15:47:24'),
(28, 15, 3, '2011-08-05', '2011-08-05 02:26:06', '2011-08-05 02:26:06'),
(29, 1, 3, '2011-08-14', '2011-08-14 07:56:28', '2011-08-14 07:56:28'),
(30, 1, 3, '2011-08-19', '2011-08-19 11:12:14', '2011-08-19 11:12:14'),
(31, 1, 3, '2011-08-19', '2011-08-19 13:47:37', '2011-08-19 13:47:37'),
(32, 3, 5, '2011-08-19', '2011-08-19 17:01:15', '2011-08-19 17:01:15'),
(33, 5, 3, '2011-08-19', '2011-08-19 18:15:36', '2011-08-19 18:15:36'),
(34, 18, 3, '2011-08-22', '2011-08-22 14:39:53', '2011-08-22 14:39:53'),
(35, 1, 5, '2011-08-22', '2011-08-22 20:55:26', '2011-08-22 20:55:26'),
(36, 20, 3, '2011-08-23', '2011-08-23 09:55:30', '2011-08-23 09:55:30'),
(37, 5, 3, '2011-08-23', '2011-08-23 16:32:40', '2011-08-23 16:32:40'),
(38, 5, 3, '2011-08-23', '2011-08-23 22:20:51', '2011-08-23 22:20:51'),
(39, 1, 15, '2011-08-25', '2011-08-25 21:02:15', '2011-08-25 21:02:15'),
(40, 1, 3, '2011-08-25', '2011-08-25 21:26:09', '2011-08-25 21:26:09'),
(41, 1, 20, '2011-08-25', '2011-08-25 21:38:21', '2011-08-25 21:38:21'),
(42, 1, 17, '2011-08-25', '2011-08-25 21:38:47', '2011-08-25 21:38:47'),
(43, 1, 15, '2011-08-25', '2011-08-25 21:39:19', '2011-08-25 21:39:19'),
(44, 1, 3, '2011-08-26', '2011-08-26 01:40:28', '2011-08-26 01:40:28'),
(45, 1, 20, '2011-08-27', '2011-08-27 11:40:47', '2011-08-27 11:40:47'),
(46, 20, 19, '2011-08-27', '2011-08-27 11:41:12', '2011-08-27 11:41:12'),
(47, 19, 20, '2011-08-27', '2011-08-27 11:42:25', '2011-08-27 11:42:25'),
(48, 19, 18, '2011-08-27', '2011-08-27 11:43:16', '2011-08-27 11:43:16'),
(49, 18, 17, '2011-08-27', '2011-08-27 11:43:34', '2011-08-27 11:43:34'),
(50, 18, 20, '2011-08-27', '2011-08-27 11:45:35', '2011-08-27 11:45:35'),
(51, 19, 17, '2011-08-27', '2011-08-27 11:45:48', '2011-08-27 11:45:48'),
(52, 18, 16, '2011-08-27', '2011-08-27 11:46:18', '2011-08-27 11:46:18'),
(53, 18, 15, '2011-08-27', '2011-08-27 11:46:59', '2011-08-27 11:46:59'),
(54, 18, 14, '2011-08-27', '2011-08-27 11:47:35', '2011-08-27 11:47:35'),
(55, 19, 14, '2011-08-27', '2011-08-27 11:47:57', '2011-08-27 11:47:57'),
(56, 18, 11, '2011-08-27', '2011-08-27 11:49:03', '2011-08-27 11:49:03'),
(57, 18, 9, '2011-08-27', '2011-08-27 11:49:26', '2011-08-27 11:49:26'),
(58, 18, 5, '2011-08-27', '2011-08-27 11:49:51', '2011-08-27 11:49:51'),
(59, 5, 20, '2011-08-27', '2011-08-27 11:50:00', '2011-08-27 11:50:00'),
(60, 19, 16, '2011-08-27', '2011-08-27 11:50:18', '2011-08-27 11:50:18'),
(61, 19, 15, '2011-08-27', '2011-08-27 11:50:58', '2011-08-27 11:50:58'),
(62, 19, 11, '2011-08-27', '2011-08-27 11:51:29', '2011-08-27 11:51:29'),
(63, 19, 5, '2011-08-27', '2011-08-27 11:52:01', '2011-08-27 11:52:01'),
(64, 20, 17, '2011-08-27', '2011-08-27 11:57:56', '2011-08-27 11:57:56'),
(65, 20, 16, '2011-08-27', '2011-08-27 11:58:20', '2011-08-27 11:58:20'),
(66, 20, 14, '2011-08-27', '2011-08-27 11:58:47', '2011-08-27 11:58:47'),
(67, 20, 5, '2011-08-27', '2011-08-27 11:59:41', '2011-08-27 11:59:41'),
(68, 20, 3, '2011-08-27', '2011-08-27 12:00:18', '2011-08-27 12:00:18'),
(69, 1, 18, '2011-08-29', '2011-08-29 09:57:34', '2011-08-29 09:57:34'),
(70, 1, 18, '2011-08-29', '2011-08-29 14:34:53', '2011-08-29 14:34:53'),
(71, 18, 1, '2011-08-30', '2011-08-30 17:17:03', '2011-08-30 17:17:03'),
(72, 18, 14, '2011-08-30', '2011-08-30 21:26:01', '2011-08-30 21:26:01'),
(73, 18, 1, '2011-08-31', '2011-08-31 17:55:12', '2011-08-31 17:55:12'),
(74, 18, 1, '2011-08-31', '2011-08-31 21:41:00', '2011-08-31 21:41:00'),
(75, 1, 18, '2011-09-13', '2011-09-13 18:38:32', '2011-09-13 18:38:32'),
(76, 1, 3, '2011-09-13', '2011-09-13 21:06:56', '2011-09-13 21:06:56'),
(77, 1, 3, '2011-09-14', '2011-09-14 09:24:29', '2011-09-14 09:24:29'),
(78, 18, 1, '2011-09-15', '2011-09-15 18:41:47', '2011-09-15 18:41:47'),
(79, 18, 1, '2011-09-19', '2011-09-19 09:48:16', '2011-09-19 09:48:16'),
(80, 18, 20, '2011-09-19', '2011-09-19 09:50:23', '2011-09-19 09:50:23'),
(81, 18, 20, '2011-09-23', '2011-09-23 15:07:52', '2011-09-23 15:07:52'),
(82, 18, 19, '2011-09-23', '2011-09-23 15:16:19', '2011-09-23 15:16:19'),
(83, 18, 11, '2011-09-24', '2011-09-24 16:19:51', '2011-09-24 16:19:51'),
(84, 18, 1, '2011-09-24', '2011-09-24 17:38:39', '2011-09-24 17:38:39'),
(85, 18, 11, '2011-09-24', '2011-09-24 17:40:42', '2011-09-24 17:40:42'),
(86, 18, 1, '2011-09-26', '2011-09-26 09:31:07', '2011-09-26 09:31:07'),
(87, 18, 3, '2011-09-26', '2011-09-26 09:41:11', '2011-09-26 09:41:11'),
(88, 18, 3, '2011-09-26', '2011-09-26 09:46:40', '2011-09-26 09:46:40'),
(89, 18, 3, '2011-09-26', '2011-09-26 09:52:50', '2011-09-26 09:52:50'),
(90, 18, 3, '2011-09-26', '2011-09-26 11:28:08', '2011-09-26 11:28:08'),
(91, 18, 3, '2011-09-26', '2011-09-26 11:33:50', '2011-09-26 11:33:50'),
(92, 18, 3, '2011-09-26', '2011-09-26 11:52:54', '2011-09-26 11:52:54'),
(93, 18, 3, '2011-09-26', '2011-09-26 12:02:19', '2011-09-26 12:02:19'),
(94, 18, 3, '2011-09-26', '2011-09-26 12:07:25', '2011-09-26 12:07:25'),
(95, 18, 3, '2011-09-26', '2011-09-26 12:15:21', '2011-09-26 12:15:21'),
(96, 18, 3, '2011-09-26', '2011-09-26 12:27:55', '2011-09-26 12:27:55'),
(97, 18, 3, '2011-09-26', '2011-09-26 12:33:17', '2011-09-26 12:33:17'),
(98, 18, 3, '2011-09-26', '2011-09-26 12:43:55', '2011-09-26 12:43:55'),
(99, 18, 3, '2011-09-26', '2011-09-26 12:55:48', '2011-09-26 12:55:48'),
(100, 18, 3, '2011-09-26', '2011-09-26 14:39:35', '2011-09-26 14:39:35'),
(101, 18, 3, '2011-09-26', '2011-09-26 15:08:49', '2011-09-26 15:08:49'),
(102, 18, 3, '2011-09-26', '2011-09-26 15:13:54', '2011-09-26 15:13:54'),
(103, 18, 1, '2011-09-26', '2011-09-26 15:14:50', '2011-09-26 15:14:50'),
(104, 18, 1, '2011-09-26', '2011-09-26 15:33:38', '2011-09-26 15:33:38'),
(105, 18, 19, '2011-09-26', '2011-09-26 15:37:48', '2011-09-26 15:37:48'),
(106, 18, 20, '2011-09-26', '2011-09-26 15:49:52', '2011-09-26 15:49:52'),
(107, 18, 5, '2011-09-26', '2011-09-26 15:50:14', '2011-09-26 15:50:14'),
(108, 18, 3, '2011-09-26', '2011-09-26 15:54:34', '2011-09-26 15:54:34'),
(109, 18, 1, '2011-09-26', '2011-09-26 16:41:00', '2011-09-26 16:41:00'),
(110, 18, 1, '2011-09-26', '2011-09-26 18:31:41', '2011-09-26 18:31:41'),
(111, 18, 1, '2011-09-27', '2011-09-27 14:34:47', '2011-09-27 14:34:47'),
(112, 18, 1, '2011-10-01', '2011-10-01 09:31:45', '2011-10-01 09:31:45'),
(113, 18, 1, '2011-10-01', '2011-10-01 09:37:46', '2011-10-01 09:37:46'),
(114, 18, 1, '2011-10-03', '2011-10-03 09:20:06', '2011-10-03 09:20:06'),
(115, 18, 19, '2011-10-03', '2011-10-03 11:57:58', '2011-10-03 11:57:58'),
(116, 18, 1, '2011-10-03', '2011-10-03 12:36:33', '2011-10-03 12:36:33'),
(117, 18, 1, '2011-10-03', '2011-10-03 12:51:04', '2011-10-03 12:51:04'),
(118, 1, 19, '2011-10-12', '2011-10-12 16:42:16', '2011-10-12 16:42:16'),
(119, 1, 3, '2011-10-24', '2011-10-24 18:32:22', '2011-10-24 18:32:22'),
(120, 1, 3, '2011-10-26', '2011-10-26 09:47:37', '2011-10-26 09:47:37'),
(121, 1, 3, '2011-10-26', '2011-10-26 11:36:52', '2011-10-26 11:36:52'),
(122, 1, 16, '2011-10-31', '2011-10-31 10:20:24', '2011-10-31 10:20:24'),
(123, 1, 15, '2011-10-31', '2011-10-31 11:46:31', '2011-10-31 11:46:31'),
(124, 18, 19, '2011-10-31', '2011-10-31 15:16:23', '2011-10-31 15:16:23'),
(125, 18, 3, '2011-10-31', '2011-10-31 15:17:19', '2011-10-31 15:17:19'),
(126, 3, 18, '2011-10-31', '2011-10-31 15:43:35', '2011-10-31 15:43:35'),
(127, 3, 20, '2011-10-31', '2011-10-31 16:18:44', '2011-10-31 16:18:44'),
(128, 3, 19, '2011-10-31', '2011-10-31 17:35:45', '2011-10-31 17:35:45'),
(129, 18, 14, '2011-11-03', '2011-11-03 10:52:43', '2011-11-03 10:52:43'),
(130, 18, 3, '2011-11-03', '2011-11-03 10:53:39', '2011-11-03 10:53:39'),
(131, 1, 19, '2011-11-03', '2011-11-03 11:01:49', '2011-11-03 11:01:49'),
(132, 1, 20, '2011-11-04', '2011-11-04 10:08:04', '2011-11-04 10:08:04'),
(133, 1, 3, '2011-11-04', '2011-11-04 11:44:38', '2011-11-04 11:44:38'),
(134, 1, 20, '2011-11-07', '2011-11-07 09:04:17', '2011-11-07 09:04:17'),
(135, 1, 20, '2011-11-07', '2011-11-07 09:18:07', '2011-11-07 09:18:07'),
(136, 1, 20, '2011-11-07', '2011-11-07 10:04:38', '2011-11-07 10:04:38'),
(137, 1, 20, '2011-11-07', '2011-11-07 10:11:45', '2011-11-07 10:11:45'),
(138, 1, 20, '2011-11-07', '2011-11-07 10:19:32', '2011-11-07 10:19:32'),
(139, 1, 20, '2011-11-07', '2011-11-07 10:28:02', '2011-11-07 10:28:02'),
(140, 1, 20, '2011-11-07', '2011-11-07 10:38:00', '2011-11-07 10:38:00'),
(141, 1, 3, '2011-11-07', '2011-11-07 11:00:28', '2011-11-07 11:00:28'),
(142, 1, 11, '2011-11-07', '2011-11-07 11:02:25', '2011-11-07 11:02:25'),
(143, 1, 17, '2011-11-07', '2011-11-07 11:04:25', '2011-11-07 11:04:25'),
(144, 1, 18, '2011-11-07', '2011-11-07 11:23:07', '2011-11-07 11:23:07'),
(145, 1, 3, '2011-11-22', '2011-11-22 14:36:01', '2011-11-22 14:36:01'),
(146, 1, 3, '2011-12-19', '2011-12-19 09:53:20', '2011-12-19 09:53:20'),
(147, 1, 11, '2011-12-22', '2011-12-22 16:10:04', '2011-12-22 16:10:04'),
(148, 1, 18, '2011-12-23', '2011-12-23 11:49:25', '2011-12-23 11:49:25'),
(149, 1, 18, '2011-12-23', '2011-12-23 14:34:52', '2011-12-23 14:34:52'),
(150, 1, 3, '2011-12-23', '2011-12-23 14:36:54', '2011-12-23 14:36:54'),
(151, 1, 18, '2011-12-23', '2011-12-23 14:46:42', '2011-12-23 14:46:42'),
(152, 1, 3, '2011-12-30', '2011-12-30 14:26:31', '2011-12-30 14:26:31'),
(153, 1, 3, '2011-12-30', '2011-12-30 15:01:39', '2011-12-30 15:01:39'),
(154, 1, 3, '2012-01-03', '2012-01-03 11:34:22', '2012-01-03 11:34:22'),
(155, 1, 18, '2012-01-03', '2012-01-03 11:37:03', '2012-01-03 11:37:03'),
(156, 1, 3, '2012-01-03', '2012-01-03 15:50:28', '2012-01-03 15:50:28'),
(157, 1, 3, '2012-01-04', '2012-01-04 00:49:51', '2012-01-04 00:49:51'),
(158, 1, 3, '2012-01-04', '2012-01-04 09:34:02', '2012-01-04 09:34:02'),
(159, 1, 3, '2012-01-04', '2012-01-04 16:00:59', '2012-01-04 16:00:59'),
(160, 1, 3, '2012-01-16', '2012-01-16 17:44:27', '2012-01-16 17:44:27'),
(161, 1, 14, '2012-02-01', '2012-02-01 15:16:25', '2012-02-01 15:16:25'),
(162, 1, 3, '2012-02-01', '2012-02-01 15:17:35', '2012-02-01 15:17:35'),
(163, 1, 15, '2012-02-02', '2012-02-02 09:48:50', '2012-02-02 09:48:50'),
(164, 1, 28, '2012-02-04', '2012-02-04 11:56:27', '2012-02-04 11:56:27'),
(165, 1, 20, '2012-02-05', '2012-02-05 21:06:16', '2012-02-05 21:06:16'),
(166, 1, 17, '2012-02-06', '2012-02-06 17:01:37', '2012-02-06 17:01:37'),
(167, 1, 11, '2012-02-07', '2012-02-07 17:09:55', '2012-02-07 17:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Banner name',
  `html` text COLLATE utf8_unicode_ci COMMENT 'HTML of free input banner',
  `is_use_html` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This is free HTML banner',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations about banner' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `name`, `html`, `is_use_html`) VALUES
(1, 'top_before', '', 0),
(2, 'side_before', NULL, 0),
(3, 'top_after', '', 0),
(4, 'side_after', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banner_image`
--

CREATE TABLE IF NOT EXISTS `banner_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `file_id` int(11) NOT NULL COMMENT 'An image''s file id',
  `url` text COLLATE utf8_unicode_ci COMMENT 'URL of linked Web page',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Banner image name',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations about banner image files' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `banner_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `banner_translation`
--

CREATE TABLE IF NOT EXISTS `banner_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `caption` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banner_translation`
--

INSERT INTO `banner_translation` (`id`, `caption`, `lang`) VALUES
(1, 'Top banner(before login)', 'en'),
(1, 'トップバナー（ログイン前）', 'ja_JP'),
(2, 'Side banner(before login)', 'en'),
(2, 'サイドバナー（ログイン前）', 'ja_JP'),
(3, 'Top banner (after login)', 'en'),
(3, 'トップバナー（ログイン後）', 'ja_JP'),
(4, 'Side banner (after login)', 'en'),
(4, 'サイドバナー（ログイン後）', 'ja_JP');

-- --------------------------------------------------------

--
-- Table structure for table `banner_use_image`
--

CREATE TABLE IF NOT EXISTS `banner_use_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `banner_id` int(11) NOT NULL COMMENT 'Banner id',
  `banner_image_id` int(11) NOT NULL COMMENT 'BannerImage id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_id_idx` (`banner_id`),
  KEY `banner_image_id_idx` (`banner_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves relations between banners and their images' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `banner_use_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE IF NOT EXISTS `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Mobile identified number',
  `memo` text COLLATE utf8_unicode_ci COMMENT 'Free memo',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE_idx` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of blacklist' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `blacklist`
--


-- --------------------------------------------------------

--
-- Table structure for table `blog_rss_cache`
--

CREATE TABLE IF NOT EXISTS `blog_rss_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `title` text,
  `description` text,
  `link` text,
  `date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_INDEX_idx` (`date`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `blog_rss_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE IF NOT EXISTS `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Community name',
  `file_id` int(11) DEFAULT NULL COMMENT 'Top image file id',
  `community_category_id` int(11) DEFAULT NULL COMMENT 'Community category id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`),
  KEY `file_id_idx` (`file_id`),
  KEY `community_category_id_idx` (`community_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of communities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `community`
--

INSERT INTO `community` (`id`, `name`, `file_id`, `community_category_id`, `created_at`, `updated_at`) VALUES
(1, 'bong da', 2, 3, '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(2, 'sports', 6, 4, '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(3, 'xem phim', 36, 3, '2011-08-02 08:12:34', '2011-08-02 08:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `community_category`
--

CREATE TABLE IF NOT EXISTS `community_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Category name',
  `is_allow_member_community` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Member can create this category community',
  `tree_key` int(11) DEFAULT NULL COMMENT 'Nested tree key',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lft_INDEX_idx` (`lft`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves categories of community' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `community_category`
--

INSERT INTO `community_category` (`id`, `name`, `is_allow_member_community`, `tree_key`, `sort_order`, `lft`, `rgt`, `level`, `created_at`, `updated_at`) VALUES
(1, 'Phân loại', 1, 1, NULL, 1, 8, 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(2, 'Địa phương', 1, 1, NULL, 2, 3, 1, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(3, 'Ẩm thực', 1, 1, NULL, 4, 5, 1, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(4, 'Thể thao', 1, 1, NULL, 6, 7, 1, '2011-06-22 08:46:11', '2011-06-22 08:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `community_config`
--

CREATE TABLE IF NOT EXISTS `community_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `community_id_idx` (`community_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of communities' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `community_config`
--

INSERT INTO `community_config` (`id`, `community_id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'public_flag', 'public', '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(2, 1, 'topic_authority', 'public', '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(3, 1, 'register_policy', 'open', '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(4, 1, 'description', 'Football', '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(5, 2, 'public_flag', 'public', '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(6, 2, 'topic_authority', 'public', '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(7, 2, 'register_policy', 'open', '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(8, 2, 'description', 'play now!', '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(9, 3, 'public_flag', 'public', '2011-08-02 08:12:34', '2011-08-02 08:12:34'),
(10, 3, 'topic_authority', 'public', '2011-08-02 08:12:34', '2011-08-02 08:12:34'),
(11, 3, 'register_policy', 'open', '2011-08-02 08:12:34', '2011-08-02 08:12:34'),
(12, 3, 'description', 'tre', '2011-08-02 08:12:34', '2011-08-02 08:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `community_event`
--

CREATE TABLE IF NOT EXISTS `community_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `body` text NOT NULL,
  `event_updated_at` datetime DEFAULT NULL,
  `open_date` datetime NOT NULL,
  `open_date_comment` text NOT NULL,
  `area` text NOT NULL,
  `application_deadline` datetime DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_id_idx` (`community_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `community_event`
--

INSERT INTO `community_event` (`id`, `community_id`, `member_id`, `name`, `body`, `event_updated_at`, `open_date`, `open_date_comment`, `area`, `application_deadline`, `capacity`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'test event', 'event', '2011-08-26 01:49:14', '2011-08-26 00:00:00', '', 'ff ádfsd', NULL, NULL, '2011-08-26 01:49:14', '2011-08-26 01:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `community_event_comment`
--

CREATE TABLE IF NOT EXISTS `community_event_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_event_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_event_id_idx` (`community_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `community_event_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `community_event_comment_image`
--

CREATE TABLE IF NOT EXISTS `community_event_comment_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number_idx` (`id`,`number`),
  KEY `post_id_idx` (`post_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `community_event_comment_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `community_event_image`
--

CREATE TABLE IF NOT EXISTS `community_event_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number_idx` (`id`,`number`),
  KEY `post_id_idx` (`post_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `community_event_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `community_event_member`
--

CREATE TABLE IF NOT EXISTS `community_event_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_event_id_idx` (`community_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `community_event_member`
--


-- --------------------------------------------------------

--
-- Table structure for table `community_member`
--

CREATE TABLE IF NOT EXISTS `community_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `is_pre` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is pre member?',
  `is_receive_mail_pc` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Notification of posting in community by computer E-mail.',
  `is_receive_mail_mobile` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Notification of posting in community by mobile E-mail.',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `community_id_idx` (`community_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of members joined' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `community_member`
--

INSERT INTO `community_member` (`id`, `community_id`, `member_id`, `is_pre`, `is_receive_mail_pc`, `is_receive_mail_mobile`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 0, 0, 0, '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(2, 1, 1, 0, 0, 0, '2011-07-09 11:18:46', '2011-07-09 11:18:46'),
(3, 2, 1, 0, 0, 0, '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(4, 3, 3, 0, 0, 0, '2011-08-02 08:12:34', '2011-08-02 08:12:34'),
(5, 2, 3, 0, 0, 0, '2011-08-02 08:15:29', '2011-08-02 08:15:29'),
(6, 3, 15, 0, 0, 0, '2011-08-05 00:22:39', '2011-08-05 00:22:39'),
(7, 1, 15, 0, 0, 0, '2011-08-05 02:26:31', '2011-08-05 02:26:31'),
(8, 3, 18, 0, 1, 1, '2011-08-22 14:39:26', '2011-08-27 11:53:47'),
(9, 3, 1, 0, 1, 1, '2011-08-26 01:47:47', '2011-08-26 01:48:27'),
(10, 3, 17, 0, 0, 0, '2011-08-27 10:01:56', '2011-08-27 10:01:56'),
(11, 1, 19, 0, 0, 0, '2011-08-27 11:18:47', '2011-08-27 11:18:47');

-- --------------------------------------------------------

--
-- Table structure for table `community_member_position`
--

CREATE TABLE IF NOT EXISTS `community_member_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `community_member_id` int(11) NOT NULL COMMENT 'Community Member id',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Member''s position name in this community',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`community_member_id`,`name`),
  KEY `community_id_idx` (`community_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_member_id_idx` (`community_member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of the Community''''s member roles' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `community_member_position`
--

INSERT INTO `community_member_position` (`id`, `community_id`, `member_id`, `community_member_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 'admin', '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(2, 2, 1, 3, 'admin', '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(3, 3, 3, 4, 'admin', '2011-08-02 08:12:34', '2011-08-02 08:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `community_topic`
--

CREATE TABLE IF NOT EXISTS `community_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `body` text NOT NULL,
  `topic_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_id_idx` (`community_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `community_topic`
--

INSERT INTO `community_topic` (`id`, `community_id`, `member_id`, `name`, `body`, `topic_updated_at`, `created_at`, `updated_at`) VALUES
(1, 3, 15, 'topic 1 ', 'ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ola la ', '2011-08-05 02:08:17', '2011-08-05 02:08:17', '2011-08-05 02:08:17'),
(2, 3, 15, 'ggggggggg', 'ggggggggggg', '2011-08-05 02:09:20', '2011-08-05 02:09:20', '2011-08-05 02:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `community_topic_comment`
--

CREATE TABLE IF NOT EXISTS `community_topic_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_topic_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_topic_id_idx` (`community_topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `community_topic_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `community_topic_comment_image`
--

CREATE TABLE IF NOT EXISTS `community_topic_comment_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number_idx` (`id`,`number`),
  KEY `post_id_idx` (`post_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `community_topic_comment_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `community_topic_image`
--

CREATE TABLE IF NOT EXISTS `community_topic_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number_idx` (`id`,`number`),
  KEY `post_id_idx` (`post_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `community_topic_image`
--

INSERT INTO `community_topic_image` (`id`, `post_id`, `file_id`, `number`) VALUES
(1, 1, 44, 1),
(2, 2, 45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `deleted_message`
--

CREATE TABLE IF NOT EXISTS `deleted_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `message_id` int(11) NOT NULL,
  `message_send_list_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `deleted_message`
--

INSERT INTO `deleted_message` (`id`, `member_id`, `message_id`, `message_send_list_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
(2, 18, 0, 32, 0, '2011-09-15 16:28:06', '2011-09-15 16:28:06'),
(3, 18, 35, 0, 0, '2011-09-15 16:32:34', '2011-09-15 16:32:34'),
(4, 18, 37, 0, 0, '2011-09-15 16:33:24', '2011-09-15 16:33:24'),
(5, 18, 34, 0, 1, '2011-09-15 16:53:40', '2011-09-15 17:12:27'),
(6, 18, 41, 0, 0, '2011-09-15 17:56:48', '2011-09-15 17:56:48'),
(7, 18, 36, 0, 0, '2011-09-15 17:57:20', '2011-09-15 17:57:20'),
(8, 18, 42, 0, 0, '2011-09-15 18:05:08', '2011-09-15 18:05:08'),
(9, 18, 43, 0, 1, '2011-09-15 18:08:23', '2011-09-15 18:13:06'),
(10, 18, 44, 0, 1, '2011-09-15 18:10:00', '2011-09-15 18:12:50'),
(12, 1, 45, 0, 1, '2011-09-15 19:20:13', '2011-09-15 19:20:47'),
(15, 1, 40, 0, 0, '2011-09-15 19:38:00', '2011-09-15 19:38:00'),
(17, 1, 46, 0, 1, '2011-09-15 19:46:54', '2011-09-15 21:15:27'),
(18, 18, 59, 0, 0, '2011-09-19 12:48:18', '2011-09-19 12:48:18'),
(19, 18, 58, 0, 0, '2011-09-19 12:48:38', '2011-09-19 12:48:38'),
(20, 18, 57, 0, 0, '2011-09-19 12:51:50', '2011-09-19 12:51:50'),
(21, 18, 56, 0, 0, '2011-09-19 12:52:05', '2011-09-19 12:52:05'),
(22, 18, 55, 0, 0, '2011-09-19 12:52:18', '2011-09-19 12:52:18'),
(23, 18, 54, 0, 0, '2011-09-19 13:14:25', '2011-09-19 13:14:25'),
(24, 18, 53, 0, 0, '2011-09-19 13:14:38', '2011-09-19 13:14:38'),
(25, 18, 14, 0, 0, '2011-09-19 13:15:58', '2011-09-19 13:15:58'),
(26, 18, 13, 0, 0, '2011-09-19 13:16:08', '2011-09-19 13:16:08'),
(27, 1, 32, 0, 0, '2011-09-19 15:29:00', '2011-09-19 15:29:00'),
(28, 1, 9, 0, 0, '2011-09-19 15:29:11', '2011-09-19 15:29:11'),
(29, 1, 76, 0, 0, '2011-09-19 16:48:54', '2011-09-19 16:48:54'),
(30, 1, 84, 0, 0, '2011-09-19 17:11:45', '2011-09-19 17:11:45'),
(31, 1, 83, 0, 0, '2011-09-19 17:11:59', '2011-09-19 17:11:59'),
(32, 18, 68, 0, 0, '2011-09-22 21:56:16', '2011-09-22 21:56:16'),
(33, 18, 67, 0, 0, '2011-09-22 21:56:26', '2011-09-22 21:56:26'),
(34, 20, 31, 0, 0, '2011-09-22 22:08:15', '2011-09-22 22:08:15'),
(35, 20, 30, 0, 0, '2011-09-22 22:08:26', '2011-09-22 22:08:26'),
(36, 20, 29, 0, 0, '2011-09-22 22:08:29', '2011-09-22 22:08:29'),
(37, 20, 28, 0, 0, '2011-09-22 22:08:40', '2011-09-22 22:08:40'),
(38, 20, 27, 0, 0, '2011-09-22 22:08:42', '2011-09-22 22:08:42'),
(39, 20, 11, 0, 0, '2011-09-22 22:08:44', '2011-09-22 22:08:44'),
(40, 18, 91, 0, 0, '2011-10-03 11:57:45', '2011-10-03 11:57:45'),
(41, 1, 0, 3, 0, '2011-10-13 13:15:18', '2011-10-13 13:15:18'),
(42, 1, 0, 97, 0, '2011-10-13 14:24:40', '2011-10-13 14:24:40'),
(43, 1, 0, 96, 0, '2011-10-13 14:24:55', '2011-10-13 14:24:55'),
(44, 1, 0, 95, 0, '2011-10-21 09:32:21', '2011-10-21 09:32:21'),
(45, 1, 155, 0, 0, '2011-10-25 11:38:21', '2011-10-25 11:38:21'),
(46, 1, 154, 0, 0, '2011-10-25 11:38:31', '2011-10-25 11:38:31'),
(47, 1, 152, 0, 0, '2011-10-25 11:39:18', '2011-10-25 11:39:18'),
(48, 1, 153, 0, 0, '2011-10-25 11:39:33', '2011-10-25 11:39:33'),
(49, 1, 159, 0, 0, '2011-10-27 09:52:41', '2011-10-27 09:52:41'),
(50, 1, 160, 0, 0, '2011-10-27 09:52:53', '2011-10-27 09:52:53'),
(51, 1, 165, 0, 0, '2011-10-27 09:59:18', '2011-10-27 09:59:18'),
(52, 1, 164, 0, 0, '2011-10-27 09:59:31', '2011-10-27 09:59:31'),
(53, 19, 169, 0, 0, '2011-11-01 14:32:54', '2011-11-01 14:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `diary`
--

CREATE TABLE IF NOT EXISTS `diary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `public_flag` tinyint(4) NOT NULL DEFAULT '1',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `has_images` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at_idx` (`created_at`),
  KEY `member_id_created_at_idx` (`member_id`,`created_at`),
  KEY `public_flag_craeted_at_idx` (`public_flag`,`created_at`),
  KEY `is_open_created_at_idx` (`is_open`,`created_at`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `diary`
--

INSERT INTO `diary` (`id`, `member_id`, `title`, `body`, `public_flag`, `is_open`, `has_images`, `created_at`, `updated_at`) VALUES
(1, 1, 'code', 'code codecodecodecodecodecodecodecode', 1, 0, 1, '2011-07-17 17:28:10', '2011-07-17 17:28:10'),
(2, 15, 'jfj', 'nhat ky doi toi [i:236][i:236][i:236][i:236][i:236][i:236][i:236][i:236][i:236]', 1, 0, 1, '2011-07-30 12:12:12', '2011-07-30 12:12:12'),
(3, 3, 'oh man', 'test cái nhé', 1, 0, 1, '2011-08-02 07:45:03', '2011-08-02 07:45:03'),
(4, 3, 'Ngày thứ 6 mưa', 'Ngày thứ 6 mưa thật', 1, 0, 1, '2011-08-19 17:04:09', '2011-08-19 17:04:09'),
(5, 5, 'Ngày cuối tuần', 'Ngày cuối tuần[i:138][i:210]', 1, 0, 1, '2011-08-19 18:24:38', '2011-08-19 18:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `diary_comment`
--

CREATE TABLE IF NOT EXISTS `diary_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diary_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `body` text NOT NULL,
  `has_images` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `diary_id_number_idx` (`diary_id`,`number`),
  KEY `diary_id_idx` (`diary_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `diary_comment`
--

INSERT INTO `diary_comment` (`id`, `diary_id`, `member_id`, `number`, `body`, `has_images`, `created_at`, `updated_at`) VALUES
(1, 2, 15, 1, 'teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeennnnagkahkjaglvhlah vkagvlka', 1, '2011-07-30 12:12:52', '2011-07-30 12:12:52'),
(2, 2, 3, 2, 'oi gioi oi', 0, '2011-08-01 19:26:47', '2011-08-01 19:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `diary_comment_image`
--

CREATE TABLE IF NOT EXISTS `diary_comment_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diary_comment_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `diary_comment_id_idx` (`diary_comment_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `diary_comment_image`
--

INSERT INTO `diary_comment_image` (`id`, `diary_comment_id`, `file_id`) VALUES
(1, 1, 27);

-- --------------------------------------------------------

--
-- Table structure for table `diary_comment_unread`
--

CREATE TABLE IF NOT EXISTS `diary_comment_unread` (
  `diary_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`diary_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diary_comment_unread`
--

INSERT INTO `diary_comment_unread` (`diary_id`, `member_id`) VALUES
(2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `diary_comment_update`
--

CREATE TABLE IF NOT EXISTS `diary_comment_update` (
  `diary_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `last_comment_time` datetime NOT NULL,
  `my_last_comment_time` datetime NOT NULL,
  PRIMARY KEY (`diary_id`,`member_id`),
  KEY `member_id_last_comment_time_idx` (`member_id`,`last_comment_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diary_comment_update`
--

INSERT INTO `diary_comment_update` (`diary_id`, `member_id`, `last_comment_time`, `my_last_comment_time`) VALUES
(2, 3, '2011-08-01 19:26:47', '2011-08-01 19:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `diary_image`
--

CREATE TABLE IF NOT EXISTS `diary_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diary_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `diary_id_number_idx` (`diary_id`,`number`),
  KEY `diary_id_idx` (`diary_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `diary_image`
--

INSERT INTO `diary_image` (`id`, `diary_id`, `file_id`, `number`) VALUES
(1, 1, 7, 1),
(2, 2, 26, 1),
(3, 3, 35, 1),
(4, 4, 46, 1),
(5, 5, 51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE IF NOT EXISTS `favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id_to` int(11) NOT NULL,
  `member_id_from` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_from_INDEX_idx` (`member_id_from`),
  KEY `member_id_to_idx` (`member_id_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `favorite`
--


-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'File name',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of this file',
  `filesize` int(11) NOT NULL DEFAULT '0' COMMENT 'File size',
  `original_filename` text COLLATE utf8_unicode_ci COMMENT 'Original filename',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of files uploaded' AUTO_INCREMENT=387 ;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`id`, `name`, `type`, `filesize`, `original_filename`, `created_at`, `updated_at`) VALUES
(2, 'c_1_0d1f968ed17c08e960c7eced2cb0cd9d1d1e2f69_jpg', 'image/jpeg', 90852, '001.jpg', '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(3, 'b_c28d6f5178f014f7e64cdab8606559cdc28a2e7b_png', 'image/png', 677893, 'vlcsnap-2011-06-08-07h46m11s34.png', '2011-07-11 23:20:32', '2011-07-11 23:20:32'),
(6, 'c_2_d5bb7438188fa6b7e7128096a0c6154b37796c5f_jpg', 'image/jpeg', 73236, 'cay5.jpg', '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(7, '2cf43c4503fe5e7724b34158aa958f18b13ec316_jpg', 'image/jpeg', 25029, 'HaHuynhMy_painting.jpg', '2011-07-17 17:28:10', '2011-07-17 17:28:10'),
(8, '64a28c2a58ed23e3e2e28a81021d1dfe890e1c3e_jpg', 'image/jpeg', 43690, 'baotran.jpg', '2011-07-22 17:49:10', '2011-07-22 17:49:10'),
(9, '93d5bd68d18c457863d420ae21cd406b19422e2d_jpg', 'image/jpeg', 52554, 'photo1.jpg', '2011-07-22 17:51:09', '2011-07-22 17:51:09'),
(10, 'a9f8a6a92f1b8989cc83eef8afc2f205778e5ac2_jpg', 'image/jpeg', 7917, 'images.jpg', '2011-07-23 12:17:11', '2011-07-23 12:17:11'),
(11, '5615eb08f55d5cedb65adfeb38601024ac608804_jpg', 'image/jpeg', 879394, 'Chrysanthemum.jpg', '2011-07-29 13:42:04', '2011-07-29 13:42:04'),
(12, '1e9e3049cd46068c0c998219659f832fe7051649_jpg', 'image/jpeg', 845941, 'Desert.jpg', '2011-07-29 13:42:16', '2011-07-29 13:42:16'),
(13, '134c1f8bf427aa97ef89f6fc6c1a6e392a07ea3d_jpg', 'image/jpeg', 595284, 'Hydrangeas.jpg', '2011-07-29 13:42:33', '2011-07-29 13:42:33'),
(14, '783ca3cf6ee42db7b1da51b0104f9613a1f98ff7_jpg', 'image/jpeg', 775702, 'Jellyfish.jpg', '2011-07-29 13:42:45', '2011-07-29 13:42:45'),
(15, 'eb462331722b2a90a78cf828d77e305a6b94b35e_jpg', 'image/jpeg', 780831, 'Koala.jpg', '2011-07-29 13:44:11', '2011-07-29 13:44:11'),
(16, 'c781977a3ebee44a61d896aa47d6a4bd462f2926_jpg', 'image/jpeg', 561276, 'Lighthouse.jpg', '2011-07-29 13:44:19', '2011-07-29 13:44:19'),
(17, '7e99df8071f150c490290ef1657ee2b476c9c34a_jpg', 'image/jpeg', 777835, 'Penguins.jpg', '2011-07-29 13:44:28', '2011-07-29 13:44:28'),
(18, 'dd450d211a17c3370c4ac808cb1149bbd404aedf_jpg', 'image/jpeg', 620888, 'Tulips.jpg', '2011-07-29 13:46:48', '2011-07-29 13:46:48'),
(21, 'm_3_bc447b8dec15935861b74b4ad4d4e96652a2ae50_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-07-30 12:01:07', '2011-07-30 12:01:07'),
(22, 'fc1e797a6eaacd09aceb323304a5c84764608ac0_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-07-30 12:04:41', '2011-07-30 12:04:41'),
(23, '71dd2e0088c8a6ffa874d4a993efa7b5990323d3_jpg', 'image/jpeg', 0, 'boral__australia_lifestyle_by_jermilex-d33vb84.jpg', '2011-07-30 12:06:42', '2011-07-30 12:06:42'),
(24, 'm_15_8490b6f2095e21d361755f90fa0d3f83799880a1_jpg', 'image/jpeg', 0, 'fantasy_girls_wallpaper-24.jpg', '2011-07-30 12:07:32', '2011-07-30 12:07:32'),
(25, 'm_15_acc47718cca8ef62859872de5a9e21a082b55449_jpg', 'image/jpeg', 0, 'IMG_3578.JPG', '2011-07-30 12:09:14', '2011-07-30 12:09:14'),
(26, 'c1bb591b09938d53992d3831ec25aead950669cf_jpg', 'image/jpeg', 0, 'IMG_3541.JPG', '2011-07-30 12:12:12', '2011-07-30 12:12:12'),
(27, 'a9c2c1e48f5f877056eaafb6e30da3fbc4579f3a_jpg', 'image/jpeg', 0, 'IMG_3560_a.jpg', '2011-07-30 12:12:52', '2011-07-30 12:12:52'),
(28, '40ae195e33a97be3e927aad94a48f1e7a21c4101_jpg', 'image/jpeg', 0, 'IMG_3797.JPG', '2011-07-30 12:15:13', '2011-07-30 12:15:13'),
(29, 'a_15_839ae70274892d9d5b31b92f95f95c3dc4415d82_jpg', 'image/jpeg', 0, 'IMG_3755.JPG', '2011-07-30 12:27:33', '2011-07-30 12:27:34'),
(30, 'a_15_d858ed483873cd005de4ac01fa062ba2b2f61718_jpg', 'image/jpeg', 0, 'IMG_3765.JPG', '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(31, 'a_15_e291978bf76fcfc62d3b7283ea08a08f2648f9da_jpg', 'image/jpeg', 0, 'IMG_3854.JPG', '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(32, 'a_15_d34c02de5654d5c5d4bc1baac663221e2a93fd60_jpg', 'image/jpeg', 0, 'IMG_3918.JPG', '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(33, 'a_15_0c238e07185aed92df7d208678301b68b3b2e0c5_jpg', 'image/jpeg', 0, 'IMG_4109.JPG', '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(34, 'm_3_f00197cc5f16bba72203d6c337c235e36ac8e2fd_jpg', 'image/jpeg', 0, 'TF002.jpg', '2011-07-31 06:51:24', '2011-07-31 06:51:24'),
(35, '033f40e08daa7f02beae6174377f79e941780924_png', 'image/png', 0, 'vlcsnap-2011-06-08-07h45m46s29.png', '2011-08-02 07:45:03', '2011-08-02 07:45:03'),
(36, 'c_3_8124dd031a70c4e124c7ef8bc941da7a65439471_png', 'image/png', 0, 'vlcsnap-2011-06-08-07h46m11s34.png', '2011-08-02 08:12:34', '2011-08-02 08:12:34'),
(37, 'm_1_cfed6b56f7b93c438b8c2a1542197ff9550d7de1_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-08-03 15:44:19', '2011-08-03 15:44:19'),
(38, 'a_13_eb0f8565838f021d3bc27fbb75160a8993118f33_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-08-04 13:50:54', '2011-08-04 13:50:54'),
(39, 'a_13_d09cdfbdbfac3cbcefeed7737e4b303db6971f4e_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-08-04 13:50:54', '2011-08-04 13:50:54'),
(40, '8ccf8fe57e14538316cfb9b18645c5dccde68faa_jpg', 'image/jpeg', 0, 'HaHuynhMy_painting.jpg', '2011-08-04 23:32:31', '2011-08-04 23:32:31'),
(41, 'a_16_24d406849d401be5c54eb369ca0c3b4967c66652_jpg', 'image/jpeg', 0, 'Art_Vietnam_1.jpg', '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(42, 'a_16_b72d84691a90e5c3596a061ce697503e2879df0b_jpg', 'image/jpeg', 0, 'art1.jpg', '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(43, 'a_16_c7382a211f75756048edded1df01275e866ba98d_jpg', 'image/jpeg', 0, 'Art-Ethnic_music_Instruments-Asian1838.jpg', '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(44, 'fee2b6c5724a51161fd40e0b0a13cbeedfdbab6c_jpg', 'image/jpeg', 0, 'main_area.jpg', '2011-08-05 02:08:17', '2011-08-05 02:08:17'),
(45, 'a588d937e969f5e7ce3e1349eee0c20ae927a6d1_png', 'image/png', 0, '1311987375_user-male-green-add.png', '2011-08-05 02:09:20', '2011-08-05 02:09:20'),
(46, '78fc74c03d93245997b04e8ce7f266e1d83054fc_jpg', 'image/jpeg', 0, 'images.jpg', '2011-08-19 17:04:09', '2011-08-19 17:04:09'),
(47, '629cbc9e73b14e9a2abaf9c459bec0360e4a3253_jpg', 'image/jpeg', 0, 'imag1es.jpg', '2011-08-19 17:05:12', '2011-08-19 17:05:12'),
(49, 'm_5_253d5bce42f7433590cc54ba712f55221472e895_jpg', 'image/jpeg', 0, '03-04-09_1702.jpg', '2011-08-19 17:12:44', '2011-08-19 17:12:44'),
(50, 'm_5_4f24e6453d492b6f6aeb0806561aa31f3eee3c74_jpg', 'image/jpeg', 0, 'obama.jpg', '2011-08-19 17:13:13', '2011-08-19 17:13:13'),
(51, '109c768dd7d621f9827b8b028b693a61d7bc0c34_png', 'image/png', 0, 'Video call snapshot 46.png', '2011-08-19 18:24:38', '2011-08-19 18:24:38'),
(52, 'm_18_b320f2432d1258f06d25ceb57a35b78853102c33_jpg', 'image/jpeg', 0, 'Koala.jpg', '2011-08-22 14:38:44', '2011-08-22 14:38:44'),
(57, 'm_17_9ab7e84eed5023184d3559c4e6d4673709e5583c_jpg', 'image/jpeg', 0, 'OK 112.JPG', '2011-08-27 11:11:55', '2011-08-27 11:11:55'),
(58, '5d1b5a388d0153f452ed24b1c88f1be8ced83f5c_jpg', 'image/jpeg', 0, '100hanoi_elly_tran_sexy_xxx_hotgirl (11).jpg', '2011-08-27 11:15:39', '2011-08-27 11:15:39'),
(59, 'm_20_f355cd844ff848ee2f676d0d15b47ed00be92865_jpg', 'image/jpeg', 0, 'SKMBT2_C36011080213130_0002 copy1.jpg', '2011-08-27 11:57:02', '2011-08-27 11:57:02'),
(60, '7c3c44701c5d143af176e3cc63a9e7fe946beb13_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-08-27 11:58:31', '2011-08-27 11:58:31'),
(61, 'm_18_fb0f35e38ff9b6fd7d3a9824f740604644e41667_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-08-27 11:58:54', '2011-08-27 11:58:54'),
(62, 'm_18_9c97d56c196b7c17f6d9926651195917169c0ee1_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-08-27 12:26:44', '2011-08-27 12:26:44'),
(63, 'm_18_5693fd22a262fe2b7110d918bbd7eced4fe9cf54_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-09-17 11:16:21', '2011-09-17 11:16:21'),
(64, 'm_18_2a6e2d8e8f22732b132bc05be5fac078c7ebdba9_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-09-23 15:17:13', '2011-09-23 15:17:13'),
(65, 'a_16_940076704df2f470ffb27827139f8d07c4850e30_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-10-21 14:57:23', '2011-10-21 14:57:23'),
(67, 'p_1_1_538dcf9d8b98ac9a193a01f25d975ad2_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-11-21 14:12:55', '2011-11-21 14:12:55'),
(68, 'p_1_1_453859528b76397a5a12a9d2f36ba702_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-11-21 14:35:47', '2011-11-21 14:35:47'),
(69, 'p_1_1_4f6a306c94af679657ced7273b5ad4ea_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-11-21 14:42:39', '2011-11-21 14:42:39'),
(70, 'p_1_1_a49fe8914df0eada4d4b7d530d7fa5ba_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-11-21 14:48:37', '2011-11-21 14:48:37'),
(71, 'p_1_1_87d07f90f10c40ed8075f45c042fe6f6_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-11-21 15:11:40', '2011-11-21 15:11:40'),
(72, 'p_1_1_bd6661231506e0fe52c15a3a77ecc1e7_jpg', 'image/jpeg', 0, 'Jellyfish.jpg', '2011-11-21 15:12:46', '2011-11-21 15:12:46'),
(73, 'p_1_1_571e32a9497bc9ce85a05dda04543fd6_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2011-11-21 16:53:25', '2011-11-21 16:53:25'),
(74, 'p_1_1_06d3bc740e8ba0c8f64427649f537269_jpg', 'image/jpeg', 0, 'Koala.jpg', '2011-11-21 17:32:12', '2011-11-21 17:32:12'),
(75, 'p_1_1_4008168d011ba324d3af955e32cb1907_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-11-21 17:44:53', '2011-11-21 17:44:53'),
(76, 'p_1_1_3a0b8adf584aef7eea622391a9cfadbf_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-11-21 17:45:18', '2011-11-21 17:45:18'),
(77, 'p_1_1_006edf8ce12b4bfd61f0fd684d23b058_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-11-21 17:49:22', '2011-11-21 17:49:22'),
(78, 'p_1_1_b25de1fc63ae23ed668f408ba84456fa_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-11-21 17:49:30', '2011-11-21 17:49:30'),
(79, 'p_1_1_101054febcac4f03a7603d7e01c79f68_jpg', 'image/jpeg', 0, 'Koala.jpg', '2011-11-21 17:50:30', '2011-11-21 17:50:30'),
(80, 'p_1_1_7dde528614b6f0a996a71fc04c39adc3_jpg', 'image/jpeg', 0, 'Jellyfish.jpg', '2011-11-22 14:03:02', '2011-11-22 14:03:02'),
(81, 'p_1_1_ca5d493da447126f97f24df25932edcb_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-11-22 14:16:55', '2011-11-22 14:16:55'),
(82, 'p_1_1_bfe538b216f87462660858da7f4bd595_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-11-22 14:18:13', '2011-11-22 14:18:13'),
(83, 'p_25_18_8a5dfb7b0bb078d33d78246aeeb89980_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-11-22 15:44:37', '2011-11-22 15:44:37'),
(84, 'p_25_18_7c34e54d854cc6e5576fad8e44aa2661_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-11-22 15:45:45', '2011-11-22 15:45:45'),
(85, 'p_1_1_cfd63c5cc9f0d7a21676de055b69aab4_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-11-23 14:35:07', '2011-11-23 14:35:07'),
(86, 'p_28_3_016f79f645b540d18313dfc34ea1f236_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-11-25 11:09:25', '2011-11-25 11:09:25'),
(87, 'p_24_1_4feb1832edc1f33e316e3b37c492263a_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-11-25 14:50:30', '2011-11-25 14:50:30'),
(88, 'p_24_1_32a222f8152d9653079105a95a0637c9_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-11-25 14:53:22', '2011-11-25 14:53:22'),
(89, 'p_1_1_9a95f1aa30e6d3b0dfe1974703e4cecd_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-11-28 15:00:42', '2011-11-28 15:00:42'),
(90, 'p_1_1_472ff74503824b802597f32a6cbe6893_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-11-28 15:30:05', '2011-11-28 15:30:05'),
(91, 'p_1_1_776dbdce93f68745ce6f44e518203c88_jpg', 'image/jpeg', 0, 'Koala.jpg', '2011-11-29 17:02:09', '2011-11-29 17:02:09'),
(92, 'p_34_1_935e344504d588abf5dc5e3e1183d257_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-01 10:47:25', '2011-12-01 10:47:25'),
(93, 'p_34_1_aeeafa0fe29176df4e6c8300a71baf87_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-01 10:47:43', '2011-12-01 10:47:43'),
(94, 'p_34_1_9791bb11e88a6390a3a28c32434c3434_jpg', 'image/jpeg', 0, 'Jellyfish.jpg', '2011-12-01 11:14:36', '2011-12-01 11:14:36'),
(95, 'p_34_1_12836ad5cf578a612687d98e90c564da_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-01 11:25:19', '2011-12-01 11:25:19'),
(96, 'p_34_1_44a70bd4149822a1288405642705d83f_jpg', 'image/jpeg', 0, 'Jellyfish.jpg', '2011-12-01 11:25:48', '2011-12-01 11:25:48'),
(97, 'p_34_1_b6059c9e8866c442c90ab7860e990949_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-12-01 11:32:01', '2011-12-01 11:32:01'),
(98, 'p_34_1_5f10111c5c1ad46e8cbbcb56dd008444_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2011-12-01 11:32:22', '2011-12-01 11:32:22'),
(99, 'p_34_1_f9c4a7e98a58849dbca61e7114433f55_jpg', 'image/jpeg', 0, 'Koala.jpg', '2011-12-01 11:32:40', '2011-12-01 11:32:40'),
(100, 'p_34_1_d4e22fb852b28fc0831a86a00f386625_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-01 11:32:47', '2011-12-01 11:32:47'),
(101, 'p_34_1_d7e7336d9a9765c7ee5f0a269e93c27a_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-01 11:32:54', '2011-12-01 11:32:54'),
(102, 'p_34_1_16b09bba8e42661f1eca222fa4b47880_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-01 11:35:47', '2011-12-01 11:35:47'),
(103, 'p_34_1_b2e20b2868ff9b7f5678fa52eeef7cff_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-01 11:36:08', '2011-12-01 11:36:08'),
(104, 'p_34_1_c61c56d96f6f83b39b31f83ecfb899f3_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-01 11:36:18', '2011-12-01 11:36:18'),
(105, 'p_34_1_f134a01d04d6fe21aa9df12f83f4a12e_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-01 11:36:25', '2011-12-01 11:36:25'),
(106, 'p_32_1_1decbf8f605b6f26890431a4aa2ddc96_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-01 15:20:16', '2011-12-01 15:20:16'),
(107, 'p_1_1_ea6be8257b2ea835e339add2d7996af8_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-01 15:34:36', '2011-12-01 15:34:36'),
(108, 'p_35_1_dc04a977ed85974ba7469e517a7f8598_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-02 16:14:16', '2011-12-02 16:14:16'),
(109, 'p_35_1_6264ef5bcc0d68a5c6732a3fb46c78f4_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-05 11:35:54', '2011-12-05 11:35:54'),
(110, 'p_35_1_15689b6fd58c5688c5ec10e8576726ca_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-12-09 11:49:55', '2011-12-09 11:49:55'),
(111, 'p_35_1_f7cfecb8fccd4641dfaf9fff7318a401_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-09 11:58:11', '2011-12-09 11:58:11'),
(112, 'p_35_1_d4d6b48ba3000ecad7d445ba1f7a2426_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-09 11:58:43', '2011-12-09 11:58:43'),
(113, 'p_35_1_a8af3dd9245390345ac8c4c6a6d7b4a6_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-09 14:01:10', '2011-12-09 14:01:10'),
(114, 'm_1_0605f196195d4538401af79be75c2734652008f1_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-09 14:17:33', '2011-12-09 14:17:33'),
(115, 'p_35_1_4e48a6fcde8bb70f4fe2b7be88f26485_jpg', 'image/jpeg', 0, 'Koala.jpg', '2011-12-10 10:04:18', '2011-12-10 10:04:18'),
(116, 'p_35_1_dde084acf32af383b4521ecbaecfed91_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-15 09:04:56', '2011-12-15 09:04:56'),
(117, 'p_35_1_92b1a585d96c1f34a7bf2384714ba07b_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-15 09:06:00', '2011-12-15 09:06:00'),
(118, 'p_35_1_ba9be9617c06db1871d9a1a73f00f81d_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-15 09:10:35', '2011-12-15 09:10:35'),
(119, 'p_2_1_208a37474df97d59f80b116f2cb856e5_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-19 12:00:00', '2011-12-19 12:00:00'),
(120, 'p_1_1_af8f5c6be03c9db3fe04d6f5e370048f_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-21 15:24:07', '2011-12-21 15:24:07'),
(121, 'p_41_1_5d4e06ec730e4ebd9fc3c5b61c277d96_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-12-21 15:37:02', '2011-12-21 15:37:02'),
(122, 'p_43_1_7afd3f3fc74685912d864efb843b3e49_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-21 16:08:10', '2011-12-21 16:08:10'),
(123, 'p_45_1_f5132c99d7a56d8d6eb1186efb8b0293_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-21 16:12:25', '2011-12-21 16:12:25'),
(124, 'p_47_1_92ae8f74ba9b23ff76f7c95c46b51099_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-21 16:20:55', '2011-12-21 16:20:55'),
(125, 'p_49_1_8c1cbcb53af57b4475bb4da74261a8cb_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2011-12-21 16:24:26', '2011-12-21 16:24:26'),
(126, 'p_51_1_9f13f1479b18934b236885095eaebd37_jpg', 'image/jpeg', 0, 'Jellyfish.jpg', '2011-12-21 16:28:52', '2011-12-21 16:28:52'),
(127, 'p_53_1_738636ffd23126b46a7f6eedd147e01a_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-21 16:33:58', '2011-12-21 16:33:58'),
(128, 'p_55_1_5e96a3bad9d2e549d01f4b761634542e_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-21 16:35:15', '2011-12-21 16:35:15'),
(129, 'p_57_1_2e02686207d3a0bea68e72b2babd8013_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-12-21 16:41:14', '2011-12-21 16:41:14'),
(130, 'p_59_1_dd653ea5eb06ee9660256808ea731c8e_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-21 16:49:33', '2011-12-21 16:49:33'),
(131, 'p_61_1_2a6e48a0887c0c482e9dce45d55155f5_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-21 16:54:39', '2011-12-21 16:54:39'),
(132, 'p_63_1_74ccae4c2646156d0ce2255406b63263_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-21 17:00:05', '2011-12-21 17:00:05'),
(133, 'p_65_1_5d71159f7fe3486c9bc84b0933f07cf9_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-21 17:06:47', '2011-12-21 17:06:47'),
(134, 'p_67_1_304cd6fbf5156e068e302ace997315e4_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-21 17:19:17', '2011-12-21 17:19:17'),
(135, 'p_69_1_33c94fa1f1ff70b399ae5b3bf024dea3_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2011-12-21 17:35:58', '2011-12-21 17:35:58'),
(136, 'p_71_1_54c398ad0113c75cb665a3f4a3bfc4e7_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-21 17:50:45', '2011-12-21 17:50:45'),
(137, 'p_73_1_24002960b322e25ff49a6d231c48fbd5_jpg', 'image/jpeg', 0, '1.jpg', '2011-12-21 18:04:01', '2011-12-21 18:04:01'),
(138, 'p_75_1_d94f2d1e36347d39c686751046b35ff0_jpg', 'image/jpeg', 0, '1.jpg', '2011-12-21 18:08:41', '2011-12-21 18:08:41'),
(139, 'p_75_1_adb137c114c802d0ce572a1431ee55c5_jpg', 'image/jpeg', 0, '1.jpg', '2011-12-21 18:13:00', '2011-12-21 18:13:00'),
(140, 'p_77_1_e11885d10340c892c267dd47549cbdca_jpg', 'image/jpeg', 0, '1.jpg', '2011-12-21 18:18:06', '2011-12-21 18:18:06'),
(141, 'p_77_1_7b0f41b3f322adf3a8666ca0d8c54c74_jpg', 'image/jpeg', 0, '1.jpg', '2011-12-21 18:19:28', '2011-12-21 18:19:28'),
(142, 'p_79_1_3e5316946be3de14ff6bdcc7300219a1_jpg', 'image/jpeg', 0, '1.jpg', '2011-12-21 18:22:28', '2011-12-21 18:22:28'),
(143, 'p_81_1_83444d4457040035336419ebfb88abd7_jpg', 'image/jpeg', 0, '1.jpg', '2011-12-21 18:25:08', '2011-12-21 18:25:08'),
(144, 'p_83_1_e9a61164070fe30066d27bbc7b848908_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-12-22 10:08:48', '2011-12-22 10:08:48'),
(145, 'p_87_1_0b1221d83b443e6f4e29fe131672b430_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-22 10:27:38', '2011-12-22 10:27:38'),
(146, 'p_89_1_97fcdf187ff1f75ca6d282f212f09a6d_jpg', 'image/jpeg', 0, 'Jellyfish.jpg', '2011-12-22 10:50:26', '2011-12-22 10:50:26'),
(147, 'p_91_1_77644d4ee77ddf7a89fcce760404c15b_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-12-22 10:53:03', '2011-12-22 10:53:03'),
(148, 'p_35_1_1c8f112ceb26880db630300c18b56794_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-22 11:07:39', '2011-12-22 11:07:39'),
(149, 'p_35_1_5f0b3d886e917f48cdf276773570f9f1_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2011-12-22 11:09:32', '2011-12-22 11:09:32'),
(150, 'p_35_1_30ecb60781db9ddef02d063675084c95_jpg', 'image/jpeg', 0, 'Koala.jpg', '2011-12-22 11:14:42', '2011-12-22 11:14:42'),
(151, 'p_35_1_b90505cad06f10150ba94d23aa2881cb_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-22 11:17:15', '2011-12-22 11:17:15'),
(152, 'p_35_1_6ff5a602c3ea04bffd71e47e360b8023_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-22 11:18:47', '2011-12-22 11:18:47'),
(153, 'p_35_1_76c6f2fc1542bc90eed0e765fe07c163_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-22 11:21:05', '2011-12-22 11:21:05'),
(154, 'p_35_1_78062a27ab8f1373adcdd91f01b1b533_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 11:22:39', '2011-12-22 11:22:39'),
(155, 'p_35_1_1d1969c2c2bbaf6ba84265f17d4c64d3_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-22 11:25:07', '2011-12-22 11:25:07'),
(156, 'p_35_1_e7a889366b5bd53134a94135ca37b02c_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-22 11:25:36', '2011-12-22 11:25:36'),
(157, 'p_35_1_333fd1c612d1c93b764d6f4c908ed934_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-12-22 11:25:50', '2011-12-22 11:25:50'),
(158, 'p_35_1_0580022d9d6991013519b78bd1629f5e_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2011-12-22 11:28:10', '2011-12-22 11:28:10'),
(159, 'p_35_1_2eec79488b9da9a4462d4cb841ad0fc9_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2011-12-22 11:28:24', '2011-12-22 11:28:24'),
(160, 'p_35_1_795b0179d0fa0fc61499f06c8c1b55cb_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 11:31:30', '2011-12-22 11:31:30'),
(161, 'p_35_1_1ffd985385897ab3788a8bbac25dfc24_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-22 11:31:48', '2011-12-22 11:31:48'),
(162, 'p_35_1_213d3622c27064f20f0c01ce52c831b7_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-22 11:44:17', '2011-12-22 11:44:17'),
(163, 'p_35_1_56a6f119f5755ae0239d085bd84ec7b4_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2011-12-22 11:44:32', '2011-12-22 11:44:32'),
(164, 'p_35_1_32d0927e78b9f34f756090fa04afffcf_jpg', 'image/jpeg', 0, 'Jellyfish.jpg', '2011-12-22 11:46:10', '2011-12-22 11:46:10'),
(165, 'p_35_1_20080a73253affa089ff240de92bb246_jpg', 'image/jpeg', 0, 'Desert.jpg', '2011-12-22 11:48:40', '2011-12-22 11:48:40'),
(166, 'p_35_1_e2886aa8eeb069c3b34f544fe923ba24_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 11:50:06', '2011-12-22 11:50:06'),
(167, 'p_35_1_dadad05e4c091b90bc17ef4a1274cd06_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-22 11:53:47', '2011-12-22 11:53:47'),
(168, 'p_35_1_3b3abd7b8917e71f21ff9fd8626e2cf9_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 11:58:16', '2011-12-22 11:58:16'),
(169, 'p_35_1_b55697ed69aa01df40c6298d0a34af87_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-22 14:12:19', '2011-12-22 14:12:19'),
(170, 'p_35_1_12899fc17c69ff7253419892b0364ca6_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 14:14:32', '2011-12-22 14:14:32'),
(171, 'p_35_1_c4d86d3b4204f2419a7be5d0fb4cddcf_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 14:15:39', '2011-12-22 14:15:39'),
(172, 'p_93_1_ccc246a640a175c431ffd92397b47ad1_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-22 14:21:16', '2011-12-22 14:21:16'),
(173, 'p_95_1_951ba33f21ae6eb3c55eba66311039d6_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-22 14:31:12', '2011-12-22 14:31:12'),
(174, 'p_97_1_33f18a9ce1a8ecb0f6f3899ecaa44178_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-22 14:40:06', '2011-12-22 14:40:06'),
(175, 'p_99_1_b118ee0a2cfe919535cf6bc081aa6441_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-22 14:57:40', '2011-12-22 14:57:40'),
(176, 'p_99_1_8b16b5fd9dc7deac9776a2305e51f1cb_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2011-12-22 14:57:54', '2011-12-22 14:57:54'),
(177, 'p_101_1_ca7f9b4fc844cea17bab23b283b1e4b7_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 15:30:29', '2011-12-22 15:30:29'),
(178, 'p_101_1_edffb74720cdcb32c718861f1a20ce68_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2011-12-22 15:30:43', '2011-12-22 15:30:43'),
(179, 'p_103_1_b987d0bbd2af8072eeff2dfa184950de_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 15:34:28', '2011-12-22 15:34:28'),
(180, 'p_103_1_4a822ceb28f6c8290ccdea5730d79446_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 15:34:39', '2011-12-22 15:34:39'),
(181, 'p_127_1_d83a4deae9fe2257d389620d3518c974_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-27 17:32:13', '2011-12-27 17:32:13'),
(182, 'p_131_1_026026c47992a42c5404743c98f496b3_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-28 09:04:39', '2011-12-28 09:04:39'),
(183, 'p_133_1_4733110e183fdf9cd53c13a82817394e_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2011-12-29 09:26:15', '2011-12-29 09:26:15'),
(184, 'p_130_1_a932240a78dc9ad7083ab5612cae80c8_jpg', 'image/jpeg', 0, 'banner_nukeviet_88x15.jpg', '2011-12-29 20:49:56', '2011-12-29 20:49:56'),
(185, 'p_135_1_3b17fa7dcd9142b10ebacd329daea0a1_png', 'image/png', 0, 'banner88x31.png', '2011-12-29 20:53:37', '2011-12-29 20:53:37'),
(186, 'p_135_1_09ff3d15f654ad7a39adf908fc71dab1_jpg', 'image/jpeg', 0, 'web2012.jpg', '2011-12-29 20:53:55', '2011-12-29 20:53:55'),
(187, 'p_136_1_5bc9be469d8e3f278bd5a44d19687da7_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2012-01-06 17:56:36', '2012-01-06 17:56:36'),
(188, 'a_12_6cbbb5e441266ab66865d33079f695ec1ee23a49_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2012-01-13 09:01:20', '2012-01-13 09:01:20'),
(189, 'a_12_ea40c75f3aeef17a1eee49e796f8e2bbe4f03d15_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2012-01-13 09:01:21', '2012-01-13 09:01:21'),
(190, 'p_136_1_4a843d5f301fb722dad3b3bab494a21a_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2012-01-13 17:13:36', '2012-01-13 17:13:36'),
(191, 'p_191_1_1957939fb27ae1c6ce9e2006fb7c4e9c_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:19', '2012-01-14 16:30:19'),
(192, 'p_192_1_15e47d68a9f627f1914e8d49ac9766e1_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20'),
(193, 'p_193_1_233b10d1a0ef8e0f4c510eb2b19dfa7a_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20'),
(194, 'p_194_1_455f46505e52339de5e8d06b8f51b8a9_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20'),
(195, 'p_195_1_b17371bb5d4566cb58888ece05e0614d_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21'),
(196, 'p_196_1_351a1787f55c9232fa934b3a4279336d_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21'),
(197, 'p_197_1_1ea3ca80706ed65db99cfc31d2d79290_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21'),
(198, 'p_198_1_48af59107867c5fb3d65f612d02cb5aa_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22'),
(199, 'p_199_1_67a2deda70753ba7261706830fa50406_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22'),
(200, 'p_200_1_eddcbd9ca20cff86a427f0bd8585e6c6_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22'),
(201, 'p_201_1_efc3a91db35ea776833a4ceb2c8cce8c_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23'),
(202, 'p_202_1_9bf40464a7ee93f4a73e5ac256919243_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23'),
(203, 'p_203_1_42cabe9f92295240094cf5ae953eb7af_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23'),
(204, 'p_204_1_fe9720e7579fe944ce2ad0ada5692daf_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24'),
(205, 'p_205_1_73b936f1d741ea8f75342d5271217472_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24'),
(206, 'p_206_1_da950f250ea5e05c9132195a4e7339da_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24'),
(207, 'p_207_1_6cea8aae6e3f71376a4efbd2220b0351_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25'),
(208, 'p_208_1_671c3f25c8054922ac9521f478c8a3c8_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26'),
(209, 'p_209_1_bcac318d4a9c032cca689455ea4a4821_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26'),
(210, 'p_210_1_56ca8884198ab055c8af4add8908e490_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26'),
(211, 'p_211_1_f0e2e8413bb2724c67cf7533d58613e8_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27'),
(212, 'p_212_1_1cfb83e0840f2731481fb54c81e1a55c_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27'),
(213, 'p_213_1_85f799b6fcc5c905434fd2a4a58f0388_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27'),
(214, 'p_214_1_fb42d3d8674008005e6e11fd850e239f_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28'),
(215, 'p_215_1_805b635d3c7e465c1c2a95592ccc96f3_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28'),
(216, 'p_216_1_8658a871d34be206d21968cd2c649807_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53'),
(217, 'p_217_1_35f85567b375127b1a3efdb090a3ca22_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53'),
(218, 'p_218_1_39b5ff46f4a7b5bf954232e3f91f5ac7_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53'),
(219, 'p_219_1_c96853459706f8d2b36d9ea91da82726_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54'),
(220, 'p_220_1_721f027f542c495e723fd4e956e66916_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54'),
(221, 'p_221_1_82913c560b837784f8359a518ec93477_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54'),
(222, 'p_222_1_0570de4f3d314544586952d2d9354381_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55'),
(223, 'p_223_1_68cddc596170c2357e3d296bc2cf83f9_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55'),
(224, 'p_224_1_62568a1bbc5994de5c582abc64b670d4_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55'),
(225, 'p_225_1_192d20f15fe24f981ce2ffa2e46b52cb_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55'),
(226, 'p_226_1_03b0810f571de2d9c184fb1c41db9e2b_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56'),
(227, 'p_227_1_a0873507d0384011e3f84953bfbbcffa_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56'),
(228, 'p_228_1_9743c781c565c0d01e805d2c02f81181_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56'),
(229, 'p_229_1_1e1ad524778c8955fa0db6a828253856_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57'),
(230, 'p_230_1_1f0680f42aa389ec370da2fa112b86bc_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57'),
(231, 'p_231_1_653063f6e4eb75e3aaaf10d421889f35_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57'),
(232, 'p_232_1_9e26cd29b8404dcee2a1e119408b3e07_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57'),
(233, 'p_233_1_8159a354d7690c3bf94f656c49ce71ea_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58'),
(234, 'p_234_1_9d561c4dd51b9520401a96b57432bc00_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58'),
(235, 'p_235_1_07b2f2662eccb6486e0953b8d7c3d921_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58'),
(236, 'p_236_1_20b303adfadbf76838113943a5f357c7_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59'),
(237, 'p_237_1_c476d8956df5e41c52d292b75380349a_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59'),
(238, 'p_238_1_b2b871588a5f88ab4b9f3bb10cb3c1ac_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59'),
(239, 'p_239_1_b7d1c6eaf6a3b511ed0773121ce1e9a2_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59'),
(240, 'p_240_1_bb2d41c0bbbfe328e030d731e140ef3c_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00'),
(241, 'p_241_1_f0a5d84496fdf135d5e3d821f02fab1b_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00'),
(242, 'p_242_1_e41126e8ff0fa6aae967a24e84e0cc87_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00'),
(243, 'p_243_1_7343cea91b2e42049fd7d515530a1f27_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01'),
(244, 'p_244_1_a6befdc648ed8a131741f218786919e1_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01'),
(245, 'p_245_1_15125b7fdc68d6faf65a8c11d0667b6e_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01'),
(246, 'p_246_1_7e437bc0e4e737f1ae143fff9bb4bafb_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02'),
(247, 'p_247_1_ebb968108dffd31436b0170ef6f7911e_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02'),
(248, 'p_248_1_96dad5a64c88bf8fb3768eebe81cb87f_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02'),
(249, 'p_249_1_de9c30fdab97639dd3400d0c529d4c2a_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03'),
(250, 'p_250_1_261019b96642f8b7a9337bc077f729c1_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03'),
(251, 'p_251_1_acf3d9487770ab0bd190c1cf0fc4845d_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03'),
(252, 'p_252_1_6885abf02e6bc7bd1baaf1b46ecf1fcd_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04'),
(253, 'p_253_1_e3170636730906ecc3f8c70b5435f01c_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04'),
(254, 'p_254_1_949cf08e48e96dbad2977374b0227177_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05'),
(255, 'p_255_1_e2c1987f6d680bbbf22273ea42b14d1a_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05'),
(256, 'p_256_1_dc95c946d4e2fa5eea22083fe9bfb4d7_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05'),
(257, 'p_257_1_0266ea53607bffac07452d1ad46b777f_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:06', '2012-01-14 16:31:06'),
(258, 'p_258_1_e8c30a68e47afb06ebad4df5541cbd85_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:31:06', '2012-01-14 16:31:06'),
(259, 'p_259_1_5a57eae547ab246f4c6c9745b18226c0_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:36', '2012-01-14 16:32:36'),
(260, 'p_260_1_726fe1cf2c1b279b0b8d2246591c46e1_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:36', '2012-01-14 16:32:36'),
(261, 'p_261_1_d902cc0a6208a2ad921fa5acc90c38e0_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37'),
(262, 'p_262_1_baac592a13bb515ec98cf350c525db06_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37'),
(263, 'p_263_1_2f491bb88dda5d7e4240cb7e70e2a93a_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37'),
(264, 'p_264_1_be65dcc9599a80323895717ca6e50199_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38'),
(265, 'p_265_1_2ea26350287c529eff21b900a7f618b7_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38'),
(266, 'p_266_1_b63229d17a1acbf3988c52883c6982cc_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38'),
(267, 'p_267_1_ad6fe613395b9b997174afa0d6a4489b_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38'),
(268, 'p_268_1_461216804dccc7eeb67c20ead65baa3a_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39'),
(269, 'p_269_1_0f47a205ff0a6eff00801e317f5cf884_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39'),
(270, 'p_270_1_15478c9b3145dea9abeaaeb77806462d_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39'),
(271, 'p_271_1_9246020a364b3af9874c2370428e0245_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39'),
(272, 'p_272_1_495c3cf2c915b435bca1f8c6657aeb95_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40'),
(273, 'p_273_1_498da88f8112807f0ca8417e576497fe_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40'),
(274, 'p_274_1_6739480a0c577a1ebe1046308aa7d64b_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40'),
(275, 'p_275_1_16dbae5db11e490707edc9b77eaae529_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41'),
(276, 'p_276_1_46396744b3544ca650805abcd84b755b_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41'),
(277, 'p_277_1_8c2e7f108b0a5165124e906060989504_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42'),
(278, 'p_278_1_398ecc87246a86210721450fa414e7a0_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42'),
(279, 'p_279_1_fa3893a895c930dc10c10cf305bb9836_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42'),
(280, 'p_280_1_3b4e13485d4cca9e6da511df9370f57d_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43'),
(281, 'p_281_1_10ed7fea9d0d0457f49f6af6dad539ec_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43'),
(282, 'p_282_1_2503f03de4332c104ee4e56811af374f_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43'),
(283, 'p_283_1_9b275831518890617c84fe193fa6b93e_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43'),
(284, 'p_284_1_c176768d59028ba4811b4e62bfc3fe4a_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44'),
(285, 'p_285_1_9e65fc03b2af8f88b958481e02164524_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44'),
(286, 'p_286_1_ac0342ce8869230ceb180a0f2c145368_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44'),
(287, 'p_287_1_2db2a18f77c0a953646940480173758f_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:45'),
(288, 'p_288_1_94a8f66b5902d5139a8b7afc2de5020a_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45'),
(289, 'p_289_1_240d74e94c32cd2bfceaf9fda72114ee_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45'),
(290, 'p_290_1_54c2f5fa4c3af64fe8dd8bcf45bceb71_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45'),
(291, 'p_291_1_34004b325799b3bcdf2b94a02c6151c0_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46'),
(292, 'p_292_1_51bf59c07caea8a794923926a9da1d06_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47'),
(293, 'p_293_1_f9dfa0e1ffe8ffdd318023ce8f4049a4_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47'),
(294, 'p_294_1_3b4010d6f23e6386763844487ddffdf4_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47'),
(295, 'p_295_1_1c6df0d568cc76cf91d217be8b989c8c_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47'),
(296, 'p_296_1_facec09e507151efb9da5e6994da02c5_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48'),
(297, 'p_297_1_7c0b7651de94d058f185d5241a60cb13_jpg', 'image/jpeg', 0, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48'),
(298, 'p_298_1_552f6e86c13de226f9d1e0d89e1a71ab_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:14', '2012-01-16 13:14:14'),
(299, 'p_299_1_256c884e610442300cd806707216603f_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:30', '2012-01-16 13:14:30'),
(300, 'p_300_1_8ab5e57326d43e225703919231fbafc2_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:30', '2012-01-16 13:14:30'),
(301, 'p_301_1_9bf6ef91c717c904a4d019f86345f9e2_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36'),
(302, 'p_302_1_9e8c34a2cb09fdd01e9f1da13c5fabb1_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36'),
(303, 'p_303_1_50ba3e5f8cbea0ae098829025d9af46b_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36'),
(304, 'p_304_1_54139d49e375c81581a25415a2d2311f_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36'),
(305, 'p_305_1_9039402bdfd2c777c5528fecf2192b1a_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:42', '2012-01-16 13:14:42'),
(306, 'p_306_1_11f02fad66d10a0b60002b057aa146f8_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:47', '2012-01-16 13:14:47'),
(307, 'p_307_1_09ae85a2ce201ab91886d4d40bf801d0_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:14:57', '2012-01-16 13:14:57'),
(308, 'p_308_1_d7dc80dd4e777628c84548d71ae8ef32_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:08', '2012-01-16 13:15:08'),
(309, 'p_309_1_5e517ca47b6d12370d6ea88f86b5c7d0_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13'),
(310, 'p_310_1_c7b3418aa949a6b98632636691f103a1_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:14', '2012-01-16 13:15:14'),
(311, 'p_311_1_afc13f10236bda34544545579cdbea3a_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:22', '2012-01-16 13:15:22'),
(312, 'p_312_1_3421e61cd362af00f14d1cd8bac785c6_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:37', '2012-01-16 13:15:37'),
(313, 'p_313_1_2d6a64170a523f3ba97bf5db7619a2ed_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:40', '2012-01-16 13:15:40'),
(314, 'p_314_1_4339a78c3b5a3ca640750743b95ec86b_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:40', '2012-01-16 13:15:41'),
(315, 'p_315_1_ba3859d7491d4ee93be342b59d51f430_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:41', '2012-01-16 13:15:41'),
(316, 'p_316_1_f6fda8e12e1b868fddc3fd9a1375d605_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:44', '2012-01-16 13:15:44'),
(317, 'p_317_1_90d4dd12a24dfa553c144396c2381738_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45'),
(318, 'p_318_1_f57121a3d708104912092b5296fed1e9_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45'),
(319, 'p_319_1_d6980c1a22d691d764722b9253d5fde1_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45'),
(320, 'p_320_1_18af10333b1f09ba342e6b64c0746d27_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:50', '2012-01-16 13:15:50'),
(321, 'p_321_1_318a7b2113b52e3fc532374a8577bb35_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:15:56', '2012-01-16 13:15:56'),
(322, 'p_322_1_3d22939701e10d8105ff38fbe1b03fde_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:06', '2012-01-16 13:16:06'),
(323, 'p_323_1_84cb1e63b68486113faa504452c64f45_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17'),
(324, 'p_324_1_1cca382571401bff3188f1111e3445a6_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17'),
(325, 'p_325_1_fd32e14ef9dee9d669bf1abc943466d6_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:22', '2012-01-16 13:16:22'),
(326, 'p_326_1_c2aaa78dff9348fa1f17e28cc930cf2f_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:23', '2012-01-16 13:16:23'),
(327, 'p_327_1_407a54c0f4b6576bdd04b7c7d7b1e177_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33'),
(328, 'p_328_1_e41e237c230942a01cfd1c9d69d826f2_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33'),
(329, 'p_329_1_44db531796deb751b11490d42364746c_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33'),
(330, 'p_330_1_5ee30501ba35c46773bcc0dc3cc8927d_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39'),
(331, 'p_331_1_73374880ed23ffbf8a3e432c86a1f4bf_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:48', '2012-01-16 13:16:48'),
(332, 'p_332_1_c8e5825c149253174bcb87bfb4ad8ad5_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50'),
(333, 'p_333_1_21d943e372d7d0b54e112508c0fb664e_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50'),
(334, 'p_334_1_e419539acb4d42f712d305bf527afd61_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51'),
(335, 'p_335_1_ce5e91fb5f843f852d20e3cb2978390c_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51'),
(336, 'p_336_1_bbfdc8d147fd7a41d1f0ddfc9bb09e42_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51'),
(337, 'p_337_1_ef294e69ad0c309c36f512286005ece0_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:55', '2012-01-16 13:16:55'),
(338, 'p_338_1_ffbd78ecf4b3d33021ace31751874990_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:55', '2012-01-16 13:16:55'),
(339, 'p_339_1_e694f532fdbf12861c5863bf64b7a546_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:16:58', '2012-01-16 13:16:58'),
(340, 'p_340_1_a8b2e3ea5a46738de8f79f4de175dfe0_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:24', '2012-01-16 13:17:24'),
(341, 'p_341_1_dc00e092faf17ad767620fd634a5889d_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(342, 'p_342_1_af33edbdbd561b15e7a4cd7f07d3758d_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(343, 'p_343_1_020062df8a8e0c4b9ae781c3cd90331e_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(344, 'p_344_1_361d1a30e5e5910990fa1cb726d2303f_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(345, 'p_345_1_8d1d5dec757b89b7909e207b7cd8c724_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:31'),
(346, 'p_346_1_eaca8413730bd1731e45e261413f3471_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31'),
(347, 'p_347_1_0311f31108e31874eeeeac06a5941059_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31'),
(348, 'p_348_1_0801dc31a2755a0299c8b364825d9a5d_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31'),
(349, 'p_349_1_6aa9ffaec242fc5eb2f4c3ed12b8d278_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31'),
(350, 'p_350_1_161947a7370a79d302cbde0d58975571_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(351, 'p_351_1_9dda28c5bd45cd8d9a4a2baed667a519_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(352, 'p_352_1_b38f11bbec3c4aaaa0a7cd716c5e457b_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(353, 'p_353_1_18a1da9bfb0902be8b8e8e23b2c23e56_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(354, 'p_354_1_abfd144bdeafafb5f0e42a78d40164a4_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(355, 'p_355_1_df8349e4081d0a1870680296494588ae_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(356, 'p_356_1_7b40b1fc4b8ad9ffcf6e113680ebeb22_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(357, 'p_357_1_adc71a784aa4e2ddf56ad76f2feabb09_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(358, 'p_358_1_18665a1190d8afdb07c8e4ab65bf567f_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(359, 'p_359_1_42050218da77f2fa2dfa717d22c26d5c_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(360, 'p_360_1_417d436a7178753bd985c35399b80517_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34'),
(361, 'p_361_1_c82f4875db84d2c9efab86dd30c3cb7c_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34'),
(362, 'p_362_1_0fb6784c3ac5b23b492056884185c745_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34'),
(363, 'p_363_1_96bae97532699252747b9b360f9940c1_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34'),
(364, 'p_364_1_d2d3794b88b87916f2726508aad19b11_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(365, 'p_365_1_bfe315059e66bbf17d0ff143eddf88ce_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(366, 'p_366_1_18ca4cf6a5cfcf1c5df8cfd621ebec93_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(367, 'p_367_1_d7555e390d29050b2bbd2d93f0ba329e_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(368, 'p_368_1_e120c9172d979645e2ea39bb05889586_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(369, 'p_369_1_2676f0a88659fb1e756f36b96b7e75b7_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36'),
(370, 'p_370_1_41bb07f11e9fe56e52c50000ae7f8b76_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36'),
(371, 'p_371_1_b2e259c3a7616f85f05b9eae2692d950_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36'),
(372, 'p_372_1_36a3c6be060ed2a041b2ff5904daaddb_jpg', 'image/jpeg', 0, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36'),
(373, 'p_1340_1_2af0b27eb6c615df14601ee52d7d4c60_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2012-01-16 17:46:41', '2012-01-16 17:46:41'),
(374, 'p_1340_1_c4713158cbd0e30c6630692fa2ecf1ca_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2012-01-16 17:47:47', '2012-01-16 17:47:47'),
(375, 'p_1319_1_1a16f9baa4d161fa59ad44d91747e8cb_jpg', 'image/jpeg', 0, 'Desert.jpg', '2012-01-17 11:19:20', '2012-01-17 11:19:20'),
(376, 'p_1319_1_3ad95fd6049148c82fcb8bcfc18cc790_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2012-01-17 11:19:35', '2012-01-17 11:19:35'),
(377, 'p_678_1_96f95f47aa70e49fead65a070d288ffb_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2012-01-18 07:38:57', '2012-01-18 07:38:57'),
(378, 'p_678_1_fe4201801fec33fb6695f186edc287e5_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2012-01-18 09:32:04', '2012-01-18 09:32:04'),
(379, 'm_28_930adab6871a79a529fd8ebfe810a14441d652c2_jpg', 'image/jpeg', 0, 'Penguins.jpg', '2012-01-31 15:47:49', '2012-01-31 15:47:49'),
(380, 'p_1346_1_8531e4f308f435af081a9e0eb95bc0a9_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2012-01-31 17:33:06', '2012-01-31 17:33:06'),
(381, 'p_1349_1_88d7acd329ae7db52b0397f7193a6a70_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2012-02-01 10:17:30', '2012-02-01 10:17:30'),
(383, 'p_1355_1_3602fb6b6811da79074096a1ac7a1a04_jpg', 'image/jpeg', 0, 'Lighthouse.jpg', '2012-02-03 14:02:23', '2012-02-03 14:02:23'),
(384, 'p_1356_1_3daba0eea61eed207dac7473611dea05_jpg', 'image/jpeg', 0, 'Chrysanthemum.jpg', '2012-02-03 14:03:28', '2012-02-03 14:03:28'),
(385, 'p_1356_1_53a407a81fc2a47ed5e2d9b3bf1462d0_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2012-02-03 14:08:30', '2012-02-03 14:08:30'),
(386, 'p_1357_1_4845541dc50096a0bb1e4db819cf517e_jpg', 'image/jpeg', 0, 'Tulips.jpg', '2012-02-03 14:09:08', '2012-02-03 14:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `file_bin`
--

CREATE TABLE IF NOT EXISTS `file_bin` (
  `file_id` int(11) NOT NULL DEFAULT '0' COMMENT 'File id',
  `bin` longblob COMMENT 'Content of file',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves content of files';

--
-- Dumping data for table `file_bin`
--

INSERT INTO `file_bin` (`file_id`, `bin`, `created_at`, `updated_at`) VALUES
(2, '', '2011-07-09 11:18:21', '2011-07-09 11:18:21'),
(3, '', '2011-07-11 23:20:32', '2011-07-11 23:20:32'),
(6, '', '2011-07-16 19:29:29', '2011-07-16 19:29:29'),
(7, '', '2011-07-17 17:28:10', '2011-07-17 17:28:10'),
(8, '', '2011-07-22 17:49:10', '2011-07-22 17:49:10'),
(9, '', '2011-07-22 17:51:09', '2011-07-22 17:51:09'),
(10, '', '2011-07-23 12:17:11', '2011-07-23 12:17:11'),
(11, '', '2011-07-29 13:42:04', '2011-07-29 13:42:04'),
(12, '', '2011-07-29 13:42:16', '2011-07-29 13:42:16'),
(13, '', '2011-07-29 13:42:33', '2011-07-29 13:42:33'),
(14, '', '2011-07-29 13:42:45', '2011-07-29 13:42:45'),
(15, '', '2011-07-29 13:44:11', '2011-07-29 13:44:11'),
(16, '', '2011-07-29 13:44:19', '2011-07-29 13:44:19'),
(17, '', '2011-07-29 13:44:28', '2011-07-29 13:44:28'),
(18, '', '2011-07-29 13:46:48', '2011-07-29 13:46:48'),
(21, '', '2011-07-30 12:01:07', '2011-07-30 12:01:07'),
(22, '', '2011-07-30 12:04:41', '2011-07-30 12:04:41'),
(23, '', '2011-07-30 12:06:42', '2011-07-30 12:06:42'),
(24, '', '2011-07-30 12:07:32', '2011-07-30 12:07:32'),
(25, '', '2011-07-30 12:09:14', '2011-07-30 12:09:14'),
(26, '', '2011-07-30 12:12:12', '2011-07-30 12:12:12'),
(27, '', '2011-07-30 12:12:52', '2011-07-30 12:12:52'),
(28, '', '2011-07-30 12:15:13', '2011-07-30 12:15:13'),
(29, '', '2011-07-30 12:27:33', '2011-07-30 12:27:33'),
(30, '', '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(31, '', '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(32, '', '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(33, '', '2011-07-30 12:27:34', '2011-07-30 12:27:34'),
(34, '', '2011-07-31 06:51:24', '2011-07-31 06:51:24'),
(35, '', '2011-08-02 07:45:03', '2011-08-02 07:45:03'),
(36, '', '2011-08-02 08:12:34', '2011-08-02 08:12:34'),
(37, '', '2011-08-03 15:44:19', '2011-08-03 15:44:19'),
(38, '', '2011-08-04 13:50:54', '2011-08-04 13:50:54'),
(39, '', '2011-08-04 13:50:54', '2011-08-04 13:50:54'),
(40, '', '2011-08-04 23:32:31', '2011-08-04 23:32:31'),
(41, '', '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(42, '', '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(43, '', '2011-08-04 23:32:57', '2011-08-04 23:32:57'),
(44, '', '2011-08-05 02:08:17', '2011-08-05 02:08:17'),
(45, '', '2011-08-05 02:09:20', '2011-08-05 02:09:20'),
(46, '', '2011-08-19 17:04:09', '2011-08-19 17:04:09'),
(47, '', '2011-08-19 17:05:12', '2011-08-19 17:05:12'),
(49, '', '2011-08-19 17:12:44', '2011-08-19 17:12:44'),
(50, '', '2011-08-19 17:13:13', '2011-08-19 17:13:13'),
(51, '', '2011-08-19 18:24:38', '2011-08-19 18:24:38'),
(52, '', '2011-08-22 14:38:44', '2011-08-22 14:38:44'),
(57, '', '2011-08-27 11:11:55', '2011-08-27 11:11:55'),
(58, '', '2011-08-27 11:15:39', '2011-08-27 11:15:39'),
(59, '', '2011-08-27 11:57:02', '2011-08-27 11:57:02'),
(60, '', '2011-08-27 11:58:31', '2011-08-27 11:58:31'),
(61, '', '2011-08-27 11:58:54', '2011-08-27 11:58:54'),
(62, '', '2011-08-27 12:26:44', '2011-08-27 12:26:44'),
(63, '', '2011-09-17 11:16:21', '2011-09-17 11:16:21'),
(64, '', '2011-09-23 15:17:13', '2011-09-23 15:17:13'),
(65, '', '2011-10-21 14:57:23', '2011-10-21 14:57:23'),
(67, NULL, '2011-11-21 14:12:55', '2011-11-21 14:12:55'),
(68, NULL, '2011-11-21 14:35:47', '2011-11-21 14:35:47'),
(69, NULL, '2011-11-21 14:42:39', '2011-11-21 14:42:39'),
(70, NULL, '2011-11-21 14:48:37', '2011-11-21 14:48:37'),
(71, NULL, '2011-11-21 15:11:40', '2011-11-21 15:11:40'),
(72, NULL, '2011-11-21 15:12:46', '2011-11-21 15:12:46'),
(73, NULL, '2011-11-21 16:53:25', '2011-11-21 16:53:25'),
(74, NULL, '2011-11-21 17:32:12', '2011-11-21 17:32:12'),
(75, NULL, '2011-11-21 17:44:53', '2011-11-21 17:44:53'),
(76, NULL, '2011-11-21 17:45:18', '2011-11-21 17:45:18'),
(77, NULL, '2011-11-21 17:49:22', '2011-11-21 17:49:22'),
(78, NULL, '2011-11-21 17:49:30', '2011-11-21 17:49:30'),
(79, NULL, '2011-11-21 17:50:30', '2011-11-21 17:50:30'),
(80, NULL, '2011-11-22 14:03:02', '2011-11-22 14:03:02'),
(81, NULL, '2011-11-22 14:16:55', '2011-11-22 14:16:55'),
(82, NULL, '2011-11-22 14:18:13', '2011-11-22 14:18:13'),
(83, NULL, '2011-11-22 15:44:37', '2011-11-22 15:44:37'),
(84, NULL, '2011-11-22 15:45:45', '2011-11-22 15:45:45'),
(85, NULL, '2011-11-23 14:35:07', '2011-11-23 14:35:07'),
(86, NULL, '2011-11-25 11:09:25', '2011-11-25 11:09:25'),
(87, NULL, '2011-11-25 14:50:30', '2011-11-25 14:50:30'),
(88, NULL, '2011-11-25 14:53:22', '2011-11-25 14:53:22'),
(89, NULL, '2011-11-28 15:00:42', '2011-11-28 15:00:42'),
(90, NULL, '2011-11-28 15:30:05', '2011-11-28 15:30:05'),
(91, NULL, '2011-11-29 17:02:09', '2011-11-29 17:02:09'),
(92, NULL, '2011-12-01 10:47:25', '2011-12-01 10:47:25'),
(93, NULL, '2011-12-01 10:47:43', '2011-12-01 10:47:43'),
(94, NULL, '2011-12-01 11:14:36', '2011-12-01 11:14:36'),
(95, NULL, '2011-12-01 11:25:19', '2011-12-01 11:25:19'),
(96, NULL, '2011-12-01 11:25:48', '2011-12-01 11:25:48'),
(97, NULL, '2011-12-01 11:32:01', '2011-12-01 11:32:01'),
(98, NULL, '2011-12-01 11:32:22', '2011-12-01 11:32:22'),
(99, NULL, '2011-12-01 11:32:40', '2011-12-01 11:32:40'),
(100, NULL, '2011-12-01 11:32:47', '2011-12-01 11:32:47'),
(101, NULL, '2011-12-01 11:32:54', '2011-12-01 11:32:54'),
(102, NULL, '2011-12-01 11:35:47', '2011-12-01 11:35:47'),
(103, NULL, '2011-12-01 11:36:08', '2011-12-01 11:36:08'),
(104, NULL, '2011-12-01 11:36:18', '2011-12-01 11:36:18'),
(105, NULL, '2011-12-01 11:36:25', '2011-12-01 11:36:25'),
(106, NULL, '2011-12-01 15:20:16', '2011-12-01 15:20:16'),
(107, NULL, '2011-12-01 15:34:36', '2011-12-01 15:34:36'),
(108, NULL, '2011-12-02 16:14:16', '2011-12-02 16:14:16'),
(109, NULL, '2011-12-05 11:35:54', '2011-12-05 11:35:54'),
(110, NULL, '2011-12-09 11:49:55', '2011-12-09 11:49:55'),
(111, NULL, '2011-12-09 11:58:11', '2011-12-09 11:58:11'),
(112, NULL, '2011-12-09 11:58:43', '2011-12-09 11:58:43'),
(113, NULL, '2011-12-09 14:01:10', '2011-12-09 14:01:10'),
(114, '', '2011-12-09 14:17:33', '2011-12-09 14:17:33'),
(115, NULL, '2011-12-10 10:04:18', '2011-12-10 10:04:18'),
(116, NULL, '2011-12-15 09:04:56', '2011-12-15 09:04:56'),
(117, NULL, '2011-12-15 09:06:00', '2011-12-15 09:06:00'),
(118, NULL, '2011-12-15 09:10:35', '2011-12-15 09:10:35'),
(119, NULL, '2011-12-19 12:00:00', '2011-12-19 12:00:00'),
(120, NULL, '2011-12-21 15:24:07', '2011-12-21 15:24:07'),
(121, NULL, '2011-12-21 15:37:02', '2011-12-21 15:37:02'),
(122, NULL, '2011-12-21 16:08:10', '2011-12-21 16:08:10'),
(123, NULL, '2011-12-21 16:12:25', '2011-12-21 16:12:25'),
(124, NULL, '2011-12-21 16:20:55', '2011-12-21 16:20:55'),
(125, NULL, '2011-12-21 16:24:26', '2011-12-21 16:24:26'),
(126, NULL, '2011-12-21 16:28:52', '2011-12-21 16:28:52'),
(127, NULL, '2011-12-21 16:33:58', '2011-12-21 16:33:58'),
(128, NULL, '2011-12-21 16:35:15', '2011-12-21 16:35:15'),
(129, NULL, '2011-12-21 16:41:14', '2011-12-21 16:41:14'),
(130, NULL, '2011-12-21 16:49:33', '2011-12-21 16:49:33'),
(131, NULL, '2011-12-21 16:54:39', '2011-12-21 16:54:39'),
(132, NULL, '2011-12-21 17:00:05', '2011-12-21 17:00:05'),
(133, NULL, '2011-12-21 17:06:47', '2011-12-21 17:06:47'),
(134, NULL, '2011-12-21 17:19:17', '2011-12-21 17:19:17'),
(135, NULL, '2011-12-21 17:35:58', '2011-12-21 17:35:58'),
(136, NULL, '2011-12-21 17:50:45', '2011-12-21 17:50:45'),
(137, NULL, '2011-12-21 18:04:01', '2011-12-21 18:04:01'),
(138, NULL, '2011-12-21 18:08:41', '2011-12-21 18:08:41'),
(139, NULL, '2011-12-21 18:13:00', '2011-12-21 18:13:00'),
(140, NULL, '2011-12-21 18:18:06', '2011-12-21 18:18:06'),
(141, NULL, '2011-12-21 18:19:28', '2011-12-21 18:19:28'),
(142, NULL, '2011-12-21 18:22:28', '2011-12-21 18:22:28'),
(143, NULL, '2011-12-21 18:25:08', '2011-12-21 18:25:08'),
(144, NULL, '2011-12-22 10:08:48', '2011-12-22 10:08:48'),
(145, NULL, '2011-12-22 10:27:38', '2011-12-22 10:27:38'),
(146, NULL, '2011-12-22 10:50:26', '2011-12-22 10:50:26'),
(147, NULL, '2011-12-22 10:53:03', '2011-12-22 10:53:03'),
(148, NULL, '2011-12-22 11:07:39', '2011-12-22 11:07:39'),
(149, NULL, '2011-12-22 11:09:32', '2011-12-22 11:09:32'),
(150, NULL, '2011-12-22 11:14:42', '2011-12-22 11:14:42'),
(151, NULL, '2011-12-22 11:17:15', '2011-12-22 11:17:15'),
(152, NULL, '2011-12-22 11:18:47', '2011-12-22 11:18:47'),
(153, NULL, '2011-12-22 11:21:05', '2011-12-22 11:21:05'),
(154, NULL, '2011-12-22 11:22:39', '2011-12-22 11:22:39'),
(155, NULL, '2011-12-22 11:25:07', '2011-12-22 11:25:07'),
(156, NULL, '2011-12-22 11:25:36', '2011-12-22 11:25:36'),
(157, NULL, '2011-12-22 11:25:50', '2011-12-22 11:25:50'),
(158, NULL, '2011-12-22 11:28:10', '2011-12-22 11:28:10'),
(159, NULL, '2011-12-22 11:28:24', '2011-12-22 11:28:24'),
(160, NULL, '2011-12-22 11:31:30', '2011-12-22 11:31:30'),
(161, NULL, '2011-12-22 11:31:48', '2011-12-22 11:31:48'),
(162, NULL, '2011-12-22 11:44:17', '2011-12-22 11:44:17'),
(163, NULL, '2011-12-22 11:44:32', '2011-12-22 11:44:32'),
(164, NULL, '2011-12-22 11:46:10', '2011-12-22 11:46:10'),
(165, NULL, '2011-12-22 11:48:40', '2011-12-22 11:48:40'),
(166, NULL, '2011-12-22 11:50:06', '2011-12-22 11:50:06'),
(167, NULL, '2011-12-22 11:53:47', '2011-12-22 11:53:47'),
(168, NULL, '2011-12-22 11:58:16', '2011-12-22 11:58:16'),
(169, NULL, '2011-12-22 14:12:19', '2011-12-22 14:12:19'),
(170, NULL, '2011-12-22 14:14:32', '2011-12-22 14:14:32'),
(171, NULL, '2011-12-22 14:15:39', '2011-12-22 14:15:39'),
(172, NULL, '2011-12-22 14:21:16', '2011-12-22 14:21:16'),
(173, NULL, '2011-12-22 14:31:12', '2011-12-22 14:31:12'),
(174, NULL, '2011-12-22 14:40:06', '2011-12-22 14:40:06'),
(175, NULL, '2011-12-22 14:57:40', '2011-12-22 14:57:40'),
(176, NULL, '2011-12-22 14:57:54', '2011-12-22 14:57:54'),
(177, NULL, '2011-12-22 15:30:29', '2011-12-22 15:30:29'),
(178, NULL, '2011-12-22 15:30:43', '2011-12-22 15:30:43'),
(179, NULL, '2011-12-22 15:34:28', '2011-12-22 15:34:28'),
(180, NULL, '2011-12-22 15:34:39', '2011-12-22 15:34:39'),
(181, NULL, '2011-12-27 17:32:14', '2011-12-27 17:32:14'),
(182, NULL, '2011-12-28 09:04:39', '2011-12-28 09:04:39'),
(183, NULL, '2011-12-29 09:26:15', '2011-12-29 09:26:15'),
(184, NULL, '2011-12-29 20:49:56', '2011-12-29 20:49:56'),
(185, NULL, '2011-12-29 20:53:37', '2011-12-29 20:53:37'),
(186, NULL, '2011-12-29 20:53:55', '2011-12-29 20:53:55'),
(187, NULL, '2012-01-06 17:56:36', '2012-01-06 17:56:36'),
(188, '', '2012-01-13 09:01:21', '2012-01-13 09:01:21'),
(189, '', '2012-01-13 09:01:21', '2012-01-13 09:01:21'),
(190, NULL, '2012-01-13 17:13:36', '2012-01-13 17:13:36'),
(191, NULL, '2012-01-14 16:30:19', '2012-01-14 16:30:19'),
(192, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20'),
(193, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20'),
(194, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20'),
(195, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21'),
(196, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21'),
(197, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21'),
(198, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22'),
(199, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22'),
(200, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22'),
(201, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23'),
(202, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23'),
(203, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23'),
(204, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24'),
(205, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24'),
(206, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24'),
(207, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25'),
(208, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26'),
(209, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26'),
(210, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26'),
(211, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27'),
(212, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27'),
(213, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27'),
(214, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28'),
(215, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28'),
(216, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53'),
(217, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53'),
(218, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53'),
(219, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54'),
(220, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54'),
(221, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54'),
(222, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55'),
(223, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55'),
(224, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55'),
(225, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55'),
(226, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56'),
(227, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56'),
(228, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56'),
(229, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57'),
(230, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57'),
(231, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57'),
(232, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57'),
(233, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58'),
(234, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58'),
(235, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58'),
(236, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59'),
(237, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59'),
(238, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59'),
(239, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59'),
(240, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00'),
(241, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00'),
(242, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00'),
(243, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01'),
(244, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01'),
(245, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01'),
(246, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02'),
(247, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02'),
(248, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02'),
(249, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03'),
(250, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03'),
(251, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03'),
(252, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04'),
(253, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04'),
(254, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05'),
(255, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05'),
(256, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05'),
(257, NULL, '2012-01-14 16:31:06', '2012-01-14 16:31:06'),
(258, NULL, '2012-01-14 16:31:06', '2012-01-14 16:31:06'),
(259, NULL, '2012-01-14 16:32:36', '2012-01-14 16:32:36'),
(260, NULL, '2012-01-14 16:32:36', '2012-01-14 16:32:36'),
(261, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37'),
(262, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37'),
(263, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37'),
(264, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38'),
(265, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38'),
(266, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38'),
(267, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38'),
(268, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39'),
(269, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39'),
(270, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39'),
(271, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39'),
(272, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40'),
(273, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40'),
(274, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40'),
(275, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41'),
(276, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41'),
(277, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42'),
(278, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42'),
(279, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42'),
(280, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43'),
(281, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43'),
(282, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43'),
(283, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43'),
(284, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44'),
(285, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44'),
(286, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44'),
(287, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44'),
(288, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45'),
(289, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45'),
(290, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45'),
(291, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46'),
(292, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47'),
(293, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47'),
(294, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47'),
(295, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47'),
(296, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48'),
(297, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48'),
(298, NULL, '2012-01-16 13:14:14', '2012-01-16 13:14:14'),
(299, NULL, '2012-01-16 13:14:30', '2012-01-16 13:14:30'),
(300, NULL, '2012-01-16 13:14:30', '2012-01-16 13:14:30'),
(301, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36'),
(302, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36'),
(303, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36'),
(304, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36'),
(305, NULL, '2012-01-16 13:14:42', '2012-01-16 13:14:42'),
(306, NULL, '2012-01-16 13:14:47', '2012-01-16 13:14:47'),
(307, NULL, '2012-01-16 13:14:57', '2012-01-16 13:14:57'),
(308, NULL, '2012-01-16 13:15:08', '2012-01-16 13:15:08'),
(309, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13'),
(310, NULL, '2012-01-16 13:15:14', '2012-01-16 13:15:14'),
(311, NULL, '2012-01-16 13:15:22', '2012-01-16 13:15:22'),
(312, NULL, '2012-01-16 13:15:37', '2012-01-16 13:15:37'),
(313, NULL, '2012-01-16 13:15:40', '2012-01-16 13:15:40'),
(314, NULL, '2012-01-16 13:15:41', '2012-01-16 13:15:41'),
(315, NULL, '2012-01-16 13:15:41', '2012-01-16 13:15:41'),
(316, NULL, '2012-01-16 13:15:44', '2012-01-16 13:15:44'),
(317, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45'),
(318, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45'),
(319, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45'),
(320, NULL, '2012-01-16 13:15:50', '2012-01-16 13:15:50'),
(321, NULL, '2012-01-16 13:15:56', '2012-01-16 13:15:56'),
(322, NULL, '2012-01-16 13:16:06', '2012-01-16 13:16:06'),
(323, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17'),
(324, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17'),
(325, NULL, '2012-01-16 13:16:22', '2012-01-16 13:16:22'),
(326, NULL, '2012-01-16 13:16:23', '2012-01-16 13:16:23'),
(327, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33'),
(328, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33'),
(329, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33'),
(330, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39'),
(331, NULL, '2012-01-16 13:16:48', '2012-01-16 13:16:48'),
(332, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50'),
(333, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50'),
(334, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51'),
(335, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51'),
(336, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51'),
(337, NULL, '2012-01-16 13:16:55', '2012-01-16 13:16:55'),
(338, NULL, '2012-01-16 13:16:55', '2012-01-16 13:16:55'),
(339, NULL, '2012-01-16 13:16:58', '2012-01-16 13:16:58'),
(340, NULL, '2012-01-16 13:17:24', '2012-01-16 13:17:24'),
(341, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(342, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(343, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(344, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(345, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30'),
(346, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31'),
(347, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31'),
(348, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31'),
(349, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31'),
(350, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(351, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(352, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(353, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(354, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32'),
(355, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(356, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(357, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(358, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(359, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33'),
(360, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34'),
(361, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34'),
(362, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34'),
(363, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34'),
(364, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(365, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(366, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(367, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(368, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35'),
(369, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36'),
(370, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36'),
(371, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36'),
(372, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36'),
(373, NULL, '2012-01-16 17:46:41', '2012-01-16 17:46:41'),
(374, NULL, '2012-01-16 17:47:47', '2012-01-16 17:47:47'),
(375, NULL, '2012-01-17 11:19:20', '2012-01-17 11:19:20'),
(376, NULL, '2012-01-17 11:19:35', '2012-01-17 11:19:35'),
(377, NULL, '2012-01-18 07:38:59', '2012-01-18 07:38:59'),
(378, NULL, '2012-01-18 09:32:04', '2012-01-18 09:32:04'),
(379, '', '2012-01-31 15:47:49', '2012-01-31 15:47:49'),
(380, NULL, '2012-01-31 17:33:06', '2012-01-31 17:33:06'),
(381, NULL, '2012-02-01 10:17:30', '2012-02-01 10:17:30'),
(383, NULL, '2012-02-03 14:02:23', '2012-02-03 14:02:23'),
(384, NULL, '2012-02-03 14:03:28', '2012-02-03 14:03:28'),
(385, NULL, '2012-02-03 14:08:30', '2012-02-03 14:08:30'),
(386, NULL, '2012-02-03 14:09:08', '2012-02-03 14:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `gadget`
--

CREATE TABLE IF NOT EXISTS `gadget` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Gadget type',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Gadget name',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_order_INDEX_idx` (`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of gadget' AUTO_INCREMENT=111 ;

--
-- Dumping data for table `gadget`
--

INSERT INTO `gadget` (`id`, `type`, `name`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'sideRightMenu', 'birthdayBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(2, 'top', 'searchBox\r\n', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(3, 'sideRightMenu', 'informationBox', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(4, 'sideMenu', 'memberImageBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(5, 'sideMenu', 'friendListBox', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(6, 'sideRightMenu', 'communityJoinListBox', 30, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(8, 'sideBannerContents', 'sideBanner', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(9, 'mobileTop', 'birthdayBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(10, 'mobileTop', 'informationBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(11, 'loginTop', 'loginForm', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(12, 'mobileLoginContents', 'loginForm', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(13, 'profileTop', 'birthdayBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(14, 'profileSideMenu', 'memberImageBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(15, 'profileSideMenu', 'friendListBox', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(16, 'profileSideMenu', 'communityJoinListBox', 30, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(17, 'profileContents', 'profileListBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(18, 'mobileProfileTop', 'birthdayBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(19, 'mobileProfileBottom', 'friendListBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(20, 'mobileProfileBottom', 'communityJoinListBox', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(29, 'mobileContents', 'recentCommunityTopicComment', 110, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(31, 'mobileContents', 'recentCommunityEventComment', 111, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(37, 'mobileContents', 'diaryFriendList', 101, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(38, 'mobileContents', 'diaryList', 102, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(39, 'mobileContents', 'diaryCommentHistory', 103, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(40, 'mobileContents', 'diaryMyList', 104, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(41, 'mobileProfileContents', 'diaryMemberList', 101, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(42, 'sideMenu', 'favoriteListBox', 40, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(45, 'mobileContents', 'favoriteDiaryNews', 105, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(48, 'sideMenu', 'localNav', 15, '2011-07-12 21:32:35', '2011-07-12 21:32:40'),
(49, 'communitySideMenu', 'memberImageBox', 10, '2011-07-14 08:01:23', '2011-07-14 08:01:23'),
(50, 'communitySideMenu', 'localNav', 20, '2011-07-14 08:03:09', '2011-07-14 08:03:09'),
(51, 'profileSideMenu', 'localNav', 15, '2011-07-23 07:40:54', '2011-07-23 07:40:58'),
(52, 'posContents', 'informationPosBox', 1, '2011-11-05 00:00:00', '2011-11-05 00:00:00'),
(53, 'posContents', 'commentsPosListBox', 5, '2011-11-05 00:00:00', '2011-11-05 00:00:00'),
(54, 'posSideRightMenu', 'checkinListBox', 1, '2011-11-05 00:00:00', '2011-11-05 00:00:00'),
(55, 'posSideMenu', 'posImageBox', 1, '2011-11-05 00:00:00', '2011-11-05 00:00:00'),
(56, 'posSideMenu', 'imagePosListBox', 5, '2011-11-05 00:00:00', '2011-11-05 00:00:00'),
(57, 'posRentHouseContents', 'informationPosRentHouseBox', 1, '2011-12-02 16:29:49', '2011-12-02 16:29:55'),
(58, 'posRentHouseContents', 'commentsPosListBox', 5, '2011-12-02 16:30:29', '2011-12-02 16:30:34'),
(60, 'posRentHouseSideMenu', 'posImageBox', 1, '2011-12-02 17:04:52', '2011-12-02 17:04:57'),
(61, 'posRentHouseSideMenu', 'imagePosListBox', 5, '2011-12-02 17:05:52', '2011-12-02 17:05:57'),
(62, 'posRentHouseSideRightMenu', 'checkinListBox', 1, '2011-12-02 17:06:54', '2011-12-02 17:06:59'),
(63, 'profileTop', 'listPosFollowBox', 15, '2011-12-23 09:01:21', '2011-12-23 09:01:26'),
(64, 'profileTop', 'listPosCheckinBox', 20, '2011-12-23 09:02:26', '2011-12-23 09:02:31'),
(65, 'profileTop', 'listPosCommentBox', 25, '2011-12-23 09:03:14', '2011-12-23 09:03:20'),
(67, 'posSideRightMenu', 'listSponsorSuggest', 3, '2011-12-02 17:06:54', '2011-12-02 17:06:59'),
(68, 'profileContents', 'listActionMemberTimeLine', 20, '2012-01-03 11:24:24', '2012-01-03 11:24:29'),
(69, 'memberActionContents', 'listCFCMemberPos', 10, '2012-01-04 15:56:41', '2012-01-04 15:56:46'),
(70, 'memberActionSideMenu', 'memberImageBox', 5, '2012-01-04 15:57:26', '2012-01-04 15:57:30'),
(71, 'memberActionSideMenu', 'localNav', 10, '2012-01-04 15:58:02', '2012-01-04 15:58:05'),
(72, 'memberActionSideMenu', 'friendListBox', 15, '2012-01-04 15:58:29', '2012-01-04 15:58:32'),
(73, 'memberActionTop', 'listPosFollowBox', 10, '2012-01-04 15:59:01', '2012-01-04 15:59:04'),
(74, 'memberActionTop', 'listPosCheckinBox', 20, '2012-01-04 15:59:26', '2012-01-04 15:59:28'),
(75, 'memberActionTop', 'listPosCommentBox', 30, '2012-01-04 15:59:48', '2012-01-04 15:59:50'),
(76, 'contents', 'relatedActionMemberList', 100, '2012-01-05 09:46:24', '2012-01-05 09:46:27'),
(78, 'dashboardPosContents', 'memberCheckinNewPosList', 110, '2012-01-06 16:59:33', '2012-01-06 16:59:36'),
(80, 'dashboardPosContents', 'newCommentPosList', 120, '2012-01-06 17:00:30', '2012-01-06 17:00:32'),
(81, 'dashboardPosContents', 'memberFollowPosList', 130, '2012-01-06 17:00:59', '2012-01-06 17:01:02'),
(82, 'dashboardPosContents', 'memberCommentPosList', 140, '2012-01-06 17:01:24', '2012-01-06 17:01:27'),
(83, 'dashboardPosContents', 'memberCheckinPosList', 150, '2012-01-06 17:01:52', '2012-01-06 17:01:55'),
(84, 'dashboardPosContents', 'newPhotoPosList', 160, '2012-01-06 17:19:14', '2012-01-06 17:19:17'),
(87, 'posRentHouseSideRightMenu', 'listSponsorSuggest', 100, '2012-01-09 16:03:12', '2012-01-09 16:03:15'),
(89, 'dashboardRentHouseContents', 'updateStatusRentHouseList', 110, '2012-01-10 11:19:02', '2012-01-10 11:19:06'),
(90, 'dashboardRentHouseContents', 'newCommentRentHouseList', 120, '2012-01-10 11:19:37', '2012-01-10 11:19:40'),
(91, 'dashboardRentHouseContents', 'manyFollowRentHouseList', 130, '2012-01-10 11:20:06', '2012-01-10 11:20:08'),
(92, 'dashboardRentHouseContents', 'manyCommentRentHouseList', 140, '2012-01-10 11:20:44', '2012-01-10 11:20:46'),
(93, 'dashboardRentHouseContents', 'newPhotoRentHouseList', 150, '2012-01-10 11:21:05', '2012-01-10 11:21:08'),
(94, 'dashboardRentHouseTop', 'listSponsorSuggest', 100, '2012-01-10 11:21:39', '2012-01-10 11:21:42'),
(95, 'dashboardMainTop', 'listSponsorSuggest', 100, '2012-01-11 09:00:09', '2012-01-11 09:00:12'),
(97, 'dashboardMainContents', 'slideShow', 80, '2012-01-11 09:01:14', '2012-01-11 09:01:17'),
(98, 'dashboardMainContents', 'newRentHouseList', 200, '2012-01-11 09:01:48', '2012-01-11 09:01:50'),
(99, 'dashboardMainContents', 'newMemberList', 300, '2012-01-11 09:02:19', '2012-01-11 09:02:21'),
(101, 'dashboardMemberContents', 'memberPositiveList', 150, '2012-01-11 17:57:51', '2012-01-11 17:57:53'),
(102, 'dashboardMemberContents', 'newPhotoMemberList', 200, '2012-01-11 17:58:21', '2012-01-11 17:58:23'),
(103, 'dashboardMemberTop', 'listSponsorSuggest', 100, '2012-01-11 17:58:55', '2012-01-11 17:58:57'),
(104, 'dashboardMainContents', 'newPosList', 100, '2012-01-12 17:56:28', '2012-01-12 17:56:30'),
(105, 'dashboardPosTop', 'listSponsorSuggest', 100, '2012-01-13 08:48:10', '2012-01-13 08:48:12'),
(106, 'posSideRightMenu', 'listNearPos', 2, '2012-01-17 18:05:21', '2012-01-17 18:05:23'),
(107, 'searchallByTextTop', 'listSponsorSuggest', 100, '2012-02-09 17:35:32', '2012-02-09 17:35:35'),
(108, 'searchallBytextContents', 'posList', 100, '2012-02-09 17:36:14', '2012-02-09 17:36:16'),
(109, 'searchallBytextContents', 'posRentHouseList', 150, '2012-02-09 17:36:44', '2012-02-09 17:36:46'),
(110, 'searchallBytextContents', 'memberList', 200, '2012-02-09 17:37:18', '2012-02-09 17:37:20');

-- --------------------------------------------------------

--
-- Table structure for table `gadget_config`
--

CREATE TABLE IF NOT EXISTS `gadget_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `gadget_id` int(11) DEFAULT NULL COMMENT 'Gadget id',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gadget_id_idx` (`gadget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of gadget' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gadget_config`
--


-- --------------------------------------------------------

--
-- Table structure for table `intro_friend`
--

CREATE TABLE IF NOT EXISTS `intro_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id_to` int(11) NOT NULL,
  `member_id_from` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at_idx` (`created_at`),
  KEY `member_id_from_member_id_to_idx` (`member_id_from`,`member_id_to`),
  KEY `member_id_to_idx` (`member_id_to`),
  KEY `member_id_from_idx` (`member_id_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `intro_friend`
--


-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Nickname',
  `invite_member_id` int(11) DEFAULT NULL COMMENT 'Member id of the person who invited this member',
  `is_login_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Rejected member',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `rank` int(11) DEFAULT NULL COMMENT 'rank of member',
  PRIMARY KEY (`id`),
  KEY `is_active_INDEX_idx` (`is_active`),
  KEY `invite_member_id_idx` (`invite_member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of members' AUTO_INCREMENT=33 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name`, `invite_member_id`, `is_login_rejected`, `created_at`, `updated_at`, `is_active`, `rank`) VALUES
(1, 'LifeMap', NULL, 0, '2011-06-22 08:46:10', '2011-06-22 08:46:10', 1, NULL),
(3, 'thuc.lehuy', NULL, 0, '2011-06-23 08:19:16', '2011-06-23 08:29:10', 1, NULL),
(4, '', NULL, 0, '2011-06-23 08:30:13', '2011-06-23 08:30:13', 0, NULL),
(5, 'Trường', 3, 0, '2011-06-23 08:30:20', '2011-07-28 14:56:52', 1, NULL),
(6, '', NULL, 0, '2011-06-23 08:30:31', '2011-06-23 08:30:31', 0, NULL),
(7, '', NULL, 0, '2011-06-23 08:30:37', '2011-06-23 08:30:37', 0, NULL),
(9, 'gomugomu', NULL, 0, '2011-06-26 11:24:11', '2011-06-26 11:32:34', 1, NULL),
(10, '', NULL, 0, '2011-07-12 08:44:34', '2011-07-12 08:44:34', 0, NULL),
(11, 'Shaun the Sheep', 1, 0, '2011-07-17 17:26:36', '2011-08-20 12:07:38', 1, NULL),
(12, '', NULL, 0, '2011-07-23 11:47:34', '2011-07-23 11:47:34', 0, NULL),
(13, '', NULL, 0, '2011-07-23 11:51:24', '2011-07-23 11:51:24', 0, NULL),
(14, 'le_huy_thuc', NULL, 0, '2011-07-27 14:22:20', '2011-07-28 13:59:54', 1, NULL),
(15, 'Hanh', NULL, 0, '2011-07-30 12:02:27', '2011-07-30 12:04:22', 1, NULL),
(16, 'Ng Hong Phuc', NULL, 0, '2011-07-30 12:23:36', '2011-07-30 12:26:15', 1, NULL),
(17, 'ThaoDH', NULL, 0, '2011-08-16 15:23:08', '2011-08-16 15:25:15', 1, NULL),
(18, 'hue', NULL, 0, '2011-08-22 14:35:02', '2011-08-22 14:37:46', 1, NULL),
(19, 'tuent', NULL, 0, '2011-08-22 20:03:00', '2011-08-27 10:54:55', 1, NULL),
(20, 'baond', NULL, 0, '2011-08-23 09:49:11', '2011-08-23 09:54:34', 1, NULL),
(21, '', 18, 0, '2011-08-27 10:00:02', '2011-08-27 10:00:02', 0, NULL),
(22, '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
(23, 'huent', 1, 0, '2011-12-07 11:25:52', '2012-02-10 10:59:43', 1, NULL),
(24, '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
(25, '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
(26, '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
(27, 'LifeMap', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
(28, 'LM', NULL, 0, '2012-01-31 15:46:47', '2012-01-31 15:47:27', 1, NULL),
(29, 'muoidv', NULL, 0, '2012-02-09 08:57:26', '2012-02-09 08:58:54', 1, NULL),
(30, 'domuoi', NULL, 0, '2012-02-09 10:28:42', '2012-02-10 09:11:33', 1, NULL),
(31, 'giangha', NULL, 0, '2012-02-10 11:04:00', '2012-02-10 11:05:23', 1, NULL),
(32, 'thanh', NULL, 0, '2012-02-10 11:42:07', '2012-02-10 11:42:56', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member_application`
--

CREATE TABLE IF NOT EXISTS `member_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `public_flag` varchar(255) NOT NULL DEFAULT 'public',
  `sort_order` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `application_id_idx` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `member_application`
--


-- --------------------------------------------------------

--
-- Table structure for table `member_application_setting`
--

CREATE TABLE IF NOT EXISTS `member_application_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_application_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'application',
  `name` varchar(255) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_UNIQUE_idx` (`hash`),
  KEY `member_application_id_idx` (`member_application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `member_application_setting`
--


-- --------------------------------------------------------

--
-- Table structure for table `member_config`
--

CREATE TABLE IF NOT EXISTS `member_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `value` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Configuration value',
  `value_datetime` datetime DEFAULT NULL COMMENT 'Configuration datetime value',
  `name_value_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Hash value for searching name & value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_INDEX_idx` (`name`),
  KEY `name_value_hash_INDEX_idx` (`name_value_hash`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of each members' AUTO_INCREMENT=256 ;

--
-- Dumping data for table `member_config`
--

INSERT INTO `member_config` (`id`, `member_id`, `name`, `value`, `value_datetime`, `name_value_hash`, `created_at`, `updated_at`) VALUES
(1, 1, 'pc_address', 'sns@example.com', NULL, '885654aa381dfadbc6ea2c47a4a30f6a', '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(2, 1, 'password', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '927246e0e2492bb1c4334e89edfa252f', '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(3, 1, 'secret_question', '5', NULL, '0ca0709b3ef4d5c7bde5e0f67c2021e1', '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(4, 1, 'secret_answer', 'c81c00cad27aa757b313626c3c02094f', NULL, '8e460ad7facdeae96bfb1871f5d7a5b3', '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(5, 1, 'lastLogin', '', '2012-03-01 23:57:57', '83f893f513b36f24c7bbdf4839c518b0', '2011-06-22 15:48:25', '2012-03-01 23:57:57'),
(6, 1, 'remember_key', 'b8359c5363696dbf7938566bd83deac6b1d3c6c0b01ad000b48b8cfb7667f80f', NULL, '495061ca7a94f8594f95d2d82fbefd37', '2011-06-22 22:20:35', '2012-03-01 17:46:02'),
(10, 3, 'pc_address', 'thuc.lehuy1@gmail.com', NULL, '538611991e09e8bd308f1cc7b3b1db70', '2011-06-23 08:19:16', '2011-06-23 08:29:09'),
(12, 3, 'register_token', '3e63d83172c0d15bbd22e170c777a3431', NULL, 'aeff2e0fde2ae628927e87fd4326baf8', '2011-06-23 08:19:16', '2011-06-23 08:19:16'),
(13, 3, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-06-23 08:19:20', '2011-06-23 08:19:20'),
(14, 3, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-06-23 08:19:20', '2011-06-23 08:19:20'),
(15, 3, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(16, 3, 'secret_answer', 'e3da0a13b092a28b3a3cd57defeade7b', NULL, '690449687ba140d7e8bf8fec30c1cb82', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(17, 3, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(18, 3, 'password', '3d217ef7dcca205e4bc1a08281d669d2', NULL, 'c507ac2c0399311b4a89914482e53ce2', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(19, 3, 'mail_address_hash', 'cq3bd54elbfn', NULL, 'f5fa3322197e678a9f8cc4d52a0a012c', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(20, 3, 'lastLogin', '', '2012-01-17 16:23:43', '83f893f513b36f24c7bbdf4839c518b0', '2011-06-23 08:29:13', '2012-01-17 16:23:48'),
(21, 4, 'pc_address_pre', 'dustilnguyen0211@gmail.com', NULL, 'f695e694156fa91c66f2424cec14db54', '2011-06-23 08:30:13', '2011-06-23 08:30:13'),
(22, 4, 'pc_address_token', '2acb553b39fcec85b15a4978eeb1f0b8', NULL, '495eb876491b9ca8178cb01f71f2a803', '2011-06-23 08:30:13', '2011-06-23 08:30:13'),
(23, 4, 'register_token', '4c1bca3b5626780690efd21e2bcf001a6', NULL, 'd479aee193338fddc8d2cec27dde86d8', '2011-06-23 08:30:13', '2011-06-23 08:30:13'),
(24, 4, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-06-23 08:30:16', '2011-06-23 08:30:16'),
(25, 4, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-06-23 08:30:16', '2011-06-23 08:30:16'),
(26, 5, 'pc_address', 'truongnm.lifetek@gmail.com', NULL, 'f4fd3fb2d49d510672191779e638268d', '2011-06-23 08:30:20', '2011-07-28 14:56:52'),
(28, 5, 'register_token', '5212a880325344127adabcf9d9832da20', NULL, 'f1a58f7880b50dc9b0620b1614d75604', '2011-06-23 08:30:20', '2011-07-28 14:55:36'),
(29, 5, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-06-23 08:30:24', '2011-06-23 08:30:24'),
(30, 5, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-06-23 08:30:24', '2011-06-23 08:30:24'),
(31, 6, 'pc_address_pre', 'cuongnh.lifetek@gmail.com', NULL, '74c5e98050282b2963c660ace8ad8a6e', '2011-06-23 08:30:31', '2011-06-23 08:30:31'),
(32, 6, 'pc_address_token', '17ff52cd9bac95eab4bc64beb91975df', NULL, '27127533dc228c8a49cabad3af0db4ed', '2011-06-23 08:30:31', '2011-06-23 08:30:31'),
(33, 6, 'register_token', '650e07612bc11577c978b446c0deb51cc', NULL, 'c9c3d96d9caa44acdccb9eda32851de7', '2011-06-23 08:30:31', '2011-06-23 08:30:31'),
(34, 6, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-06-23 08:30:34', '2011-06-23 08:30:34'),
(35, 6, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-06-23 08:30:34', '2011-06-23 08:30:34'),
(36, 7, 'pc_address_pre', 'gomugomu36p76885@gmail.com', NULL, '75d65a41104a7211563fd978356cc504', '2011-06-23 08:30:37', '2011-06-23 08:30:37'),
(37, 7, 'pc_address_token', '752104c58fcefb322a21488ddb36abdb', NULL, '23abd25d7a9267c6be1730f1aa147616', '2011-06-23 08:30:37', '2011-06-23 08:30:37'),
(38, 7, 'register_token', '743106f49e513c94170941a7c22cabb75', NULL, 'e37ed71d4308a8e44e08254328a04bc7', '2011-06-23 08:30:37', '2011-06-23 08:30:37'),
(39, 7, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-06-23 08:30:40', '2011-06-23 08:30:40'),
(40, 7, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-06-23 08:30:40', '2011-06-23 08:30:40'),
(44, 9, 'pc_address', 'gomugomu36p76885@gmail.com', NULL, '4841cc2f1eba8bb6c531a88e37d9eb8e', '2011-06-26 11:24:11', '2011-06-26 11:32:33'),
(46, 9, 'register_token', '937e63ecac9a9e0f486e882182e81152a', NULL, '7620b220b540ae4e4ed2ecb29ad6b606', '2011-06-26 11:24:11', '2011-06-26 11:24:11'),
(47, 9, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-06-26 11:24:17', '2011-06-26 11:24:17'),
(48, 9, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-06-26 11:24:17', '2011-06-26 11:24:17'),
(49, 9, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(50, 9, 'secret_answer', 'ab86a1e1ef70dff97959067b723c5c24', NULL, '7b5887b81eb08b4c6cba5826e174306f', '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(51, 9, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(52, 9, 'password', '42ccdb5794e68eaefd8162a397f36eb4', NULL, '934ceb1f15559bcc83e74f2ad87e3680', '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(53, 9, 'mail_address_hash', 'lbcssomuz7wg', NULL, '9e4bd8aa0b8c00a56b75eccabc351bbe', '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(54, 9, 'lastLogin', '', '2012-01-17 14:03:17', '83f893f513b36f24c7bbdf4839c518b0', '2011-06-26 11:32:37', '2012-01-17 14:03:17'),
(55, 9, 'op_ashiato_count', '5', NULL, '7b01a5695c5ccf776b1a7df4d7e33e85', '2011-06-26 11:34:49', '2011-08-27 11:49:26'),
(56, 3, 'remember_key', '8f72b6adaee2b97f25fef4fe7a7c790fba76a3c717238b09e0fa94f74fdc959f', NULL, '8329f03ba8bae3b675e3ecf40353cfea', '2011-07-01 19:55:33', '2012-01-17 11:14:34'),
(57, 1, 'op_ashiato_count', '22', NULL, 'd8fe4f310ef442b5f28d2266b2b6dce8', '2011-07-06 06:37:45', '2011-10-03 12:51:04'),
(58, 3, 'op_ashiato_count', '60', NULL, 'b2fe0012385895ba72c0f87047082edb', '2011-07-06 06:38:38', '2012-02-01 15:17:35'),
(59, 10, 'pc_address_pre', 'phucf8@gmail.com', NULL, '9c7adfec5a6261f4eb39acac4066af46', '2011-07-12 08:44:34', '2011-07-12 08:44:34'),
(60, 10, 'pc_address_token', '5d882482f74a0f771eeb38367223df23', NULL, '52527378955049774a14ad352997505c', '2011-07-12 08:44:34', '2011-07-12 08:44:34'),
(61, 10, 'register_token', '107c7584436bc430016c0f7fbce59cabfd', NULL, 'ff73786825651f9c5913af31e7c8cfd0', '2011-07-12 08:44:34', '2011-07-12 08:44:34'),
(62, 10, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-07-12 08:44:40', '2011-07-12 08:44:40'),
(63, 10, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-07-12 08:44:40', '2011-07-12 08:44:40'),
(64, 11, 'pc_address', 'thuclh.lifetek@gmail.com', NULL, '6fb1b84ce1fa6b151a2b0a66384eb50a', '2011-07-17 17:26:36', '2011-08-20 12:07:37'),
(66, 11, 'register_token', '112607106557d552e7eb38b466d96ee531', NULL, 'b16b96c5c1dffe57b62133f14911089b', '2011-07-17 17:26:36', '2011-08-20 12:04:45'),
(67, 12, 'pc_address_pre', 'truongnm.lifetek@gmail.com', NULL, 'e9249acb71d8d4b0a40e8cd1c95e93a6', '2011-07-23 11:47:34', '2011-07-23 11:47:34'),
(68, 12, 'pc_address_token', 'd3a03dd6f9215f67973eb10e9c46e8e3', NULL, 'a84ea90032923ca21de627c565f2028d', '2011-07-23 11:47:34', '2011-07-23 11:47:34'),
(69, 12, 'register_token', '12668f413ad88da749cc5b62afa573fdc8', NULL, 'e97ef15dd9979a446537cf68eb18900e', '2011-07-23 11:47:34', '2011-07-23 11:47:34'),
(70, 12, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-07-23 11:47:39', '2011-07-23 11:47:39'),
(71, 12, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-07-23 11:47:39', '2011-07-23 11:47:39'),
(72, 13, 'pc_address_pre', 'thuclh.lifetek@gmail.com', NULL, '5e028642dcd0d60f2e65cf537a4c7147', '2011-07-23 11:51:24', '2011-07-23 11:51:24'),
(73, 13, 'pc_address_token', 'ef71fe41c80cb848b42defbc388df9f5', NULL, 'be9f4101baed298c88a0450607b705c3', '2011-07-23 11:51:24', '2011-07-23 11:51:24'),
(74, 13, 'register_token', '137bbac3dcbd41d5c0c130ce99461c020c', NULL, '55b4307240084c3ed35876fafd76c674', '2011-07-23 11:51:24', '2011-07-23 11:51:24'),
(75, 13, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-07-23 11:51:27', '2011-07-23 11:51:27'),
(76, 13, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-07-23 11:51:27', '2011-07-23 11:51:27'),
(77, 14, 'pc_address', 'le_huy_thuc@yahoo.com.vn', NULL, '170eb32fa9e946c092673dbda55044b8', '2011-07-27 14:22:20', '2011-07-28 13:59:53'),
(78, 14, 'register_token', '14a614f0812663370a4319c020e79823c0', NULL, 'eb8fa01b5df4ae6b8dcc18b0d350f5c9', '2011-07-27 14:22:20', '2011-07-28 13:57:49'),
(79, 14, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-07-27 14:22:20', '2011-07-27 14:22:20'),
(80, 14, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2011-07-28 13:59:53', '2011-07-28 13:59:53'),
(81, 14, 'secret_answer', 'a8339eefe19b8590607f24cbff55364e', NULL, '38929a954f106d0db288cd2d42153cb2', '2011-07-28 13:59:53', '2011-07-28 13:59:53'),
(82, 14, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-07-28 13:59:53', '2011-07-28 13:59:53'),
(83, 14, 'password', '3d217ef7dcca205e4bc1a08281d669d2', NULL, 'c507ac2c0399311b4a89914482e53ce2', '2011-07-28 13:59:53', '2011-07-28 13:59:53'),
(84, 14, 'mail_address_hash', 'snsqnteg9alq', NULL, '044c6780cfa4dfc5c06d06d4b3bc2061', '2011-07-28 13:59:54', '2011-07-28 13:59:54'),
(85, 14, 'lastLogin', '', '2011-07-28 14:08:00', '83f893f513b36f24c7bbdf4839c518b0', '2011-07-28 13:59:58', '2011-07-28 14:08:00'),
(86, 14, 'op_ashiato_count', '8', NULL, '0abc8c53f6a28ff644d9a7b92709d743', '2011-07-28 14:03:02', '2012-02-01 15:16:25'),
(87, 5, 'secret_question', '2', NULL, 'd5e3f8b918e9126e0b45a72b6416a34f', '2011-07-28 14:56:52', '2011-07-28 14:56:52'),
(88, 5, 'secret_answer', 'be83ab3ecd0db773eb2dc1b0a17836a1', NULL, '1eb5f06d931f3249f366478a7bf54002', '2011-07-28 14:56:52', '2011-07-28 14:56:52'),
(89, 5, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-07-28 14:56:52', '2011-07-28 14:56:52'),
(90, 5, 'password', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'f057cb652c27afd34a37734be5fdd493', '2011-07-28 14:56:52', '2011-07-28 14:56:52'),
(91, 5, 'mail_address_hash', 'haz3uioaoset', NULL, '8cbf0cf6fab551a030845c4748a6caf4', '2011-07-28 14:56:52', '2011-07-28 14:56:52'),
(92, 5, 'lastLogin', '', '2011-08-27 11:50:22', '83f893f513b36f24c7bbdf4839c518b0', '2011-07-28 14:56:56', '2011-08-27 11:50:22'),
(93, 5, 'op_ashiato_count', '7', NULL, '6ecff272a02093a4b67d157a5acff442', '2011-07-28 18:19:11', '2011-09-26 15:50:14'),
(94, 15, 'pc_address', 'hanh_nguyen_197@yahoo.com', NULL, '69aa1e2db36f1c6e210f198175c80063', '2011-07-30 12:02:27', '2011-07-30 12:04:22'),
(95, 15, 'register_token', '1590f46074e779a40dcf230d120eacf43f', NULL, 'af7bb9e393a0de8ee796ee68eee5ae5a', '2011-07-30 12:02:27', '2011-07-30 12:02:27'),
(96, 15, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-07-30 12:02:27', '2011-07-30 12:02:27'),
(97, 15, 'secret_question', '2', NULL, 'd5e3f8b918e9126e0b45a72b6416a34f', '2011-07-30 12:04:22', '2011-07-30 12:04:22'),
(98, 15, 'secret_answer', '9e4845f71fe81a4bd448145b0883fa9f', NULL, '151a045d86ef1c00607e4a26450c629e', '2011-07-30 12:04:22', '2011-07-30 12:04:22'),
(99, 15, 'age_public_flag', '4', NULL, 'b8e2dd4e6a58594ceac6f132fbf5a4de', '2011-07-30 12:04:22', '2011-07-30 12:04:22'),
(100, 15, 'password', '1adbb3178591fd5bb0c248518f39bf6d', NULL, '01ab71afe32a52977d6c803ce20d4577', '2011-07-30 12:04:22', '2011-07-30 12:04:22'),
(101, 15, 'mail_address_hash', '43slrsvnqv8c', NULL, '134c00bbc016f2fb9fc667c334680611', '2011-07-30 12:04:22', '2011-07-30 12:04:22'),
(102, 15, 'lastLogin', '', '2011-08-07 18:41:46', '83f893f513b36f24c7bbdf4839c518b0', '2011-07-30 12:04:26', '2011-08-07 18:41:46'),
(103, 16, 'pc_address', 'phucF8@gmail.com', NULL, '07ee5a57e31fd1f43893ffdbba6a6ff5', '2011-07-30 12:23:36', '2011-07-30 12:26:15'),
(104, 16, 'register_token', '16ad08bf5d9aa2c2c469cd0fc7df91a37d', NULL, '6b13a6bbd5ef112a6039fef3f1075cc8', '2011-07-30 12:23:36', '2011-07-30 12:23:36'),
(105, 16, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-07-30 12:23:36', '2011-07-30 12:23:36'),
(106, 16, 'secret_question', '4', NULL, '343b44ab891cbde4e40db25abc7feacf', '2011-07-30 12:26:15', '2011-07-30 12:26:15'),
(107, 16, 'secret_answer', '8baa448be21878ada6ddc4dcf0c5aadd', NULL, '7218b28095badb9b03e3327c708d762a', '2011-07-30 12:26:15', '2011-07-30 12:26:15'),
(108, 16, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-07-30 12:26:15', '2011-07-30 12:26:15'),
(109, 16, 'password', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'f057cb652c27afd34a37734be5fdd493', '2011-07-30 12:26:15', '2011-07-30 12:26:15'),
(110, 16, 'mail_address_hash', 'edx6kt5tsgbc', NULL, '4cda9d9d3a7e824f289b440a8848a9be', '2011-07-30 12:26:15', '2011-07-30 12:26:15'),
(111, 16, 'lastLogin', '', '2011-07-30 12:27:15', '83f893f513b36f24c7bbdf4839c518b0', '2011-07-30 12:26:19', '2011-07-30 12:27:15'),
(112, 16, 'op_ashiato_count', '6', NULL, '04e673f27df6097aa11b89238b4096ca', '2011-07-31 06:38:00', '2011-10-31 10:20:24'),
(113, 15, 'op_ashiato_count', '9', NULL, '0279fba94a032c695260c8d8f5a5d8ac', '2011-08-01 19:26:26', '2012-02-02 09:48:50'),
(114, 17, 'pc_address', 'Hoavokhuyet.thao@gmail.com', NULL, 'c207e6819e5bba523532a6756554f393', '2011-08-16 15:23:08', '2011-08-16 15:25:14'),
(115, 17, 'register_token', '171a6c5d81e5ce6e3bf02e9ae283c7b86e', NULL, 'ea72e77e9a9a8b8c5d4446950ead0863', '2011-08-16 15:23:08', '2011-08-16 15:23:08'),
(116, 17, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-08-16 15:23:08', '2011-08-16 15:23:08'),
(117, 17, 'secret_question', '2', NULL, 'd5e3f8b918e9126e0b45a72b6416a34f', '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(118, 17, 'secret_answer', 'dc47dbedc026bccd5c3f74f2b25df110', NULL, 'a25127d59c84748568c72d16aca3447a', '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(119, 17, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(120, 17, 'password', 'a46e852a8319b3e97aea7ce8fdb7a9e2', NULL, '6b101aad86a9f489390e569b1d0abba4', '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(121, 17, 'mail_address_hash', 'inmttuta92tz', NULL, '7c8ffb6cb7c8d9313297fad53ab6ea1a', '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(122, 17, 'lastLogin', '', '2011-08-27 11:44:50', '83f893f513b36f24c7bbdf4839c518b0', '2011-08-16 15:25:20', '2011-08-27 11:44:50'),
(123, 5, 'remember_key', '', NULL, 'fdc7fbdf631686f3f71e1e49bc5568fa', '2011-08-19 18:30:10', '2011-08-27 11:50:22'),
(124, 11, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-08-20 11:49:53', '2011-08-20 11:49:53'),
(125, 11, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2011-08-20 12:07:37', '2011-08-20 12:07:37'),
(126, 11, 'secret_answer', '8478e2bdb758f8467225ae87ed3750c2', NULL, '8aea58a2ada8a3928737a7f00ad3e284', '2011-08-20 12:07:37', '2011-08-20 12:07:37'),
(127, 11, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-08-20 12:07:37', '2011-08-20 12:07:37'),
(128, 11, 'password', '3d217ef7dcca205e4bc1a08281d669d2', NULL, 'c507ac2c0399311b4a89914482e53ce2', '2011-08-20 12:07:37', '2011-08-20 12:22:01'),
(129, 11, 'mail_address_hash', 'azfkylzqab3b', NULL, 'b1479503146f42d5554e4964116d9b11', '2011-08-20 12:07:37', '2011-08-20 12:07:37'),
(130, 11, 'lastLogin', '', '2011-08-20 12:17:27', '83f893f513b36f24c7bbdf4839c518b0', '2011-08-20 12:07:41', '2011-08-20 12:17:27'),
(132, 11, 'remember_key', '', NULL, 'fdc7fbdf631686f3f71e1e49bc5568fa', '2011-08-20 12:17:20', '2011-08-20 12:17:27'),
(134, 18, 'pc_address', 'nguyenhue244@gmail.com', NULL, '64d41594d3602fac7a9921194abce706', '2011-08-22 14:35:02', '2011-08-22 14:37:45'),
(135, 18, 'register_token', '187afb7346f308df3e48bdad07ac253346', NULL, '892990f99c3fbd3ddc1535727d671a54', '2011-08-22 14:35:02', '2011-08-22 14:35:02'),
(136, 18, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-08-22 14:35:02', '2011-08-22 14:35:02'),
(137, 18, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(138, 18, 'secret_answer', 'a5eaf476c5987a9610e1f4743900e958', NULL, '0a8e70f909b855702d846509d7cee9fe', '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(139, 18, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(140, 18, 'password', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'f057cb652c27afd34a37734be5fdd493', '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(141, 18, 'mail_address_hash', 'u7g9lfg9z3cx', NULL, 'aadd72c2dd688793b9f52f6849f09f1d', '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(142, 18, 'lastLogin', '', '2012-02-18 09:16:17', '83f893f513b36f24c7bbdf4839c518b0', '2011-08-22 14:37:50', '2012-02-18 09:16:17'),
(143, 18, 'remember_key', 'fe8dff14a1f98ea9a49fb241ac3c6756f3144dd788bf460adf68c2b294c2c821', NULL, 'ce95c856c84b49b151b248f248ee56a3', '2011-08-22 14:41:20', '2012-02-17 14:27:04'),
(144, 19, 'pc_address', 'tuent.edu@gmail.com', NULL, 'aec3a1e5fce4bbe4d4a5c74f87729c13', '2011-08-22 20:03:00', '2011-08-27 10:54:54'),
(145, 19, 'register_token', '19623cccf6e7eebf5e784124fea16b112f', NULL, 'edb8a1cec51345c964a060be9489e72b', '2011-08-22 20:03:00', '2011-08-27 10:52:11'),
(146, 19, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-08-22 20:03:00', '2011-08-22 20:03:00'),
(147, 20, 'pc_address', 'damphilong101@gmail.com', NULL, '7543fa4b2ab6509e552b1acd42fd4156', '2011-08-23 09:49:11', '2011-08-23 09:54:33'),
(148, 20, 'register_token', '20f19105993ec4397516b35ea424bf542d', NULL, 'e55710317acff684a177f2e0d21ded38', '2011-08-23 09:49:11', '2011-08-23 09:49:11'),
(149, 20, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-08-23 09:49:11', '2011-08-23 09:49:11'),
(150, 20, 'secret_question', '3', NULL, '14582bd3e0f198cd82a1202de5abe0c0', '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(151, 20, 'secret_answer', '705669621460176849a834a06a28e595', NULL, 'fe59a5709538804436a2f2b954158365', '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(152, 20, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(153, 20, 'password', 'f11eed37d737eb8929d13ab8ff1434e4', NULL, 'f1b2e6e81b2e76b04379ad09705012a6', '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(154, 20, 'mail_address_hash', '6excthza4pcv', NULL, '6f8b606297136e589dba06a42fa0ca20', '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(155, 20, 'lastLogin', '', '2011-09-23 09:19:08', '83f893f513b36f24c7bbdf4839c518b0', '2011-08-23 09:54:37', '2011-09-23 09:19:09'),
(156, 20, 'op_ashiato_count', '18', NULL, '6bfa37103af5fbe0926fad1286712a72', '2011-08-25 21:38:21', '2012-02-05 21:06:35'),
(157, 17, 'op_ashiato_count', '6', NULL, '04e673f27df6097aa11b89238b4096ca', '2011-08-25 21:38:47', '2012-02-06 17:01:37'),
(158, 21, 'pc_address_pre', 'hoavokhuyet.thao@gmail.com', NULL, '8cb4b50e27b16a0c29e48f775dd11fb7', '2011-08-27 10:00:02', '2011-08-27 10:00:02'),
(159, 21, 'pc_address_token', 'f74353aa1a32c3cf51eb02e67e78b2fd', NULL, '96ff5c2e273cb74149d270f13cb95608', '2011-08-27 10:00:02', '2011-08-27 10:43:45'),
(160, 21, 'register_token', '2113363da561ef89d4efdb2bdbbbd6275f', NULL, '700945615b078fc465445ac64f05fa46', '2011-08-27 10:00:02', '2011-08-27 10:43:45'),
(161, 19, 'secret_question', '2', NULL, 'd5e3f8b918e9126e0b45a72b6416a34f', '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(162, 19, 'secret_answer', 'fec61bc217959fa5498d3c043b2be66e', NULL, '680bee4afe904b987e634676166fa942', '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(163, 19, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(164, 19, 'password', 'a788f6d55914857d4b97c1de99cb896b', NULL, '43d4bc6ce508695bd7820ddb991fa26f', '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(165, 19, 'mail_address_hash', 'andlnrqogfia', NULL, '762a5174268aca5b19e4754ceb550a2e', '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(166, 19, 'lastLogin', '', '2011-11-11 16:54:54', '83f893f513b36f24c7bbdf4839c518b0', '2011-08-27 10:55:11', '2011-11-04 08:57:17'),
(167, 20, 'remember_key', '', NULL, 'fdc7fbdf631686f3f71e1e49bc5568fa', '2011-08-27 11:21:41', '2011-08-27 11:41:46'),
(168, 19, 'op_ashiato_count', '8', NULL, '0abc8c53f6a28ff644d9a7b92709d743', '2011-08-27 11:41:12', '2011-11-03 11:01:49'),
(169, 18, 'op_ashiato_count', '10', NULL, '7ce67221cebe49b76675b6bd5051cf94', '2011-08-27 11:43:16', '2012-01-03 11:37:03'),
(170, 11, 'op_ashiato_count', '7', NULL, '6ecff272a02093a4b67d157a5acff442', '2011-08-27 11:49:03', '2012-02-07 17:09:55'),
(171, 1, 'language', 'en', NULL, 'd6943c66c1cf90fbca9fa99c08a911a9', '2011-10-21 11:31:21', '2011-10-21 11:31:21'),
(172, 1, 'time_zone', 'Asia/Bangkok', NULL, '72b8ececd4541a08b413462f9d88efa3', '2011-10-21 11:31:21', '2011-10-21 11:31:21'),
(173, 19, 'remember_key', '', NULL, 'fdc7fbdf631686f3f71e1e49bc5568fa', '2011-11-01 13:51:28', '2011-11-03 11:04:22'),
(174, 22, 'pc_address_pre', 'hoahuongduong_2441988@yahoo.com', NULL, '5e03c445718219c62d333b294989db24', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 22, 'register_token', '227822d263a070ee835b1b80618dbe2c97', NULL, '23327622517d5299694b7e6c853cb136', '0000-00-00 00:00:00', '2011-12-05 16:32:36'),
(176, 22, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 23, 'pc_address', 'huent.lifetek@gmail.com', NULL, '29d0b0b90ee9772cf4e7e157578df9f0', '2011-12-07 11:25:53', '2012-02-10 10:59:43'),
(179, 23, 'register_token', '23765cb8b1ddf157cf4f44b74141362905', NULL, '33b1ed7b31821d288ca8a7e05efd3e56', '2011-12-07 11:25:53', '2012-02-10 10:59:01'),
(180, 24, 'pc_address_pre', 'thuclh@lifemap.vn', NULL, '9b4c07658c4a9178576ed9d7f74a4299', '2012-01-04 11:15:49', '2012-01-04 11:15:49'),
(181, 24, 'pc_address_token', 'e6259f1cf646d4c8d0936ee40548f05e', NULL, '1b898bb8a640fd13d09f81462989fecf', '2012-01-04 11:15:49', '2012-01-04 11:15:49'),
(182, 24, 'register_token', '2463b52a05c1f4fbeee008570ce1ea6f18', NULL, 'dee7fe004a6d79de3177cfebd5316a75', '2012-01-04 11:15:49', '2012-01-05 15:28:14'),
(183, 24, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-01-05 15:28:15', '2012-01-05 15:28:15'),
(184, 25, 'pc_address_pre', 'huent@lifemap.vn', NULL, '27743f91dd0ecc2972757859249174fd', '2012-01-05 15:31:46', '2012-01-05 15:31:46'),
(185, 25, 'register_token', '2581383db8798e43ca6564aa1310861672', NULL, '8446c97044316a17a5dfaec148d86105', '2012-01-05 15:31:46', '2012-01-09 14:19:05'),
(186, 25, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-01-05 15:31:46', '2012-01-05 15:31:46'),
(187, 26, 'pc_address_pre', 'muoidv@lifemap.vn', NULL, 'e31355ab7d39b218c57426e3bd464914', '2012-01-09 14:20:04', '2012-01-09 14:20:04'),
(188, 26, 'register_token', '2684d2a3ab79c80f5f06e9f19f8904af1a', NULL, 'f9e9a44dcc5c011b5961a599fac83ff5', '2012-01-09 14:20:04', '2012-01-09 14:20:04'),
(189, 26, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-01-09 14:20:04', '2012-01-09 14:20:04'),
(190, 9, 'remember_key', 'f2166630dd9b2db545bb7b28019d37bf7dd979a4ef51bf0415de61257e8bec01', NULL, 'fcbf2b9edf45e5deb14742da3be1d1e0', '2012-01-14 08:56:16', '2012-01-14 08:56:16'),
(200, 28, 'pc_address', 'sns@lifemap.vn', NULL, '7c1bc0d85b24680cd110970193ddf77f', '2012-01-31 15:46:47', '2012-01-31 15:47:27'),
(201, 28, 'register_token', '28117d62edc4e55c5719c168bff3286ce6', NULL, '4278da7ce60fa0c91fa12b44f1d3766a', '2012-01-31 15:46:47', '2012-01-31 15:46:47'),
(202, 28, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-01-31 15:46:47', '2012-01-31 15:46:47'),
(203, 28, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2012-01-31 15:47:27', '2012-01-31 15:47:27'),
(204, 28, 'secret_answer', '202cb962ac59075b964b07152d234b70', NULL, '06780e1c7c2668f49bbe9e19a3e96324', '2012-01-31 15:47:27', '2012-01-31 15:47:27'),
(205, 28, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2012-01-31 15:47:27', '2012-01-31 15:47:27'),
(206, 28, 'password', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'f057cb652c27afd34a37734be5fdd493', '2012-01-31 15:47:27', '2012-01-31 15:47:27'),
(207, 28, 'mail_address_hash', 'hkvnc7sfysjr', NULL, '16962b1fa4d227c3c24dbd268c8e1c27', '2012-01-31 15:47:27', '2012-01-31 15:47:27'),
(208, 28, 'lastLogin', '', '2012-01-31 16:00:10', '83f893f513b36f24c7bbdf4839c518b0', '2012-01-31 15:47:32', '2012-01-31 16:00:10'),
(209, 20, 'password_recovery_token', '544ed589e550dd73107216e1bd31d75e', NULL, '0408f1bf923cc6b8652c3d686c94044e', '2012-02-01 18:00:55', '2012-02-01 18:00:55'),
(210, 28, 'op_ashiato_count', '1', NULL, 'a3c6c94fc6ac60da6a8927962cf37cb7', '2012-02-04 11:56:27', '2012-02-04 11:56:27'),
(211, 29, 'pc_address', 'muoi.dvm@gmail.com', NULL, '3bd10d0367eb492699cef20c2d5d9993', '2012-02-09 08:57:27', '2012-02-09 08:58:53'),
(212, 29, 'register_token', '29442f82613e3c28276491e621b38f6495', NULL, '3b271535bab6c6d7c23dec1b64e70b02', '2012-02-09 08:57:27', '2012-02-09 08:57:27'),
(213, 29, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-02-09 08:57:27', '2012-02-09 08:57:27'),
(214, 29, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(215, 29, 'secret_answer', 'a8339eefe19b8590607f24cbff55364e', NULL, '38929a954f106d0db288cd2d42153cb2', '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(216, 29, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(217, 29, 'password', 'ee46673f71e631678846694e11564027', NULL, '8d25f9200e8233b5e9b9425b20ef749a', '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(218, 29, 'mail_address_hash', 'za29bdxcnynf', NULL, '8b66af718c0d242199f9d9b5e5ec06da', '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(219, 29, 'lastLogin', '', '2012-02-10 09:00:02', '83f893f513b36f24c7bbdf4839c518b0', '2012-02-09 08:58:57', '2012-02-10 09:00:02'),
(220, 30, 'pc_address', 'muoidv123@gmail.com', NULL, '421695c52784d1fcfc074b04da037647', '2012-02-09 10:28:42', '2012-02-10 09:11:33'),
(222, 30, 'register_token', '30c26b9f078db5840c7a13ef3ed2c1734c', NULL, 'b81dab1536f6280dab18b3372692d2f4', '2012-02-09 10:28:42', '2012-02-10 09:01:30'),
(223, 30, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-02-09 10:28:46', '2012-02-09 10:28:46'),
(224, 30, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2012-02-09 10:28:46', '2012-02-09 10:28:46'),
(225, 30, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2012-02-10 09:11:33', '2012-02-10 09:11:33'),
(226, 30, 'secret_answer', 'bfb40de2ee069a2be3113946d49d6aa9', NULL, '9cb7ef79c44ccc43ae1e572313c98ebc', '2012-02-10 09:11:33', '2012-02-10 09:11:33'),
(227, 30, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2012-02-10 09:11:33', '2012-02-10 09:11:33'),
(228, 30, 'password', 'ee46673f71e631678846694e11564027', NULL, '8d25f9200e8233b5e9b9425b20ef749a', '2012-02-10 09:11:33', '2012-02-10 09:11:33'),
(229, 30, 'mail_address_hash', 'zk8xegkfsy5o', NULL, '2d70d97d77bedafab77b6d608a669e55', '2012-02-10 09:11:33', '2012-02-10 09:11:33'),
(230, 30, 'lastLogin', '', '2012-02-10 10:01:13', '83f893f513b36f24c7bbdf4839c518b0', '2012-02-10 09:11:38', '2012-02-10 10:01:13'),
(231, 23, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-02-10 10:00:55', '2012-02-10 10:00:55'),
(232, 23, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2012-02-10 10:59:42', '2012-02-10 10:59:42'),
(233, 23, 'secret_answer', '71a6b6f094346a8832df801c8428ea06', NULL, 'c08f2804c967a4d58ab9f275d3a62402', '2012-02-10 10:59:43', '2012-02-10 10:59:43'),
(234, 23, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2012-02-10 10:59:43', '2012-02-10 10:59:43'),
(235, 23, 'password', 'ee46673f71e631678846694e11564027', NULL, '8d25f9200e8233b5e9b9425b20ef749a', '2012-02-10 10:59:43', '2012-02-10 10:59:43'),
(236, 23, 'mail_address_hash', 'dfil77qi18ii', NULL, '13fad06b12606f6219bc0ed172e75fa8', '2012-02-10 10:59:43', '2012-02-10 10:59:43'),
(237, 23, 'lastLogin', '', '2012-02-10 11:04:35', '83f893f513b36f24c7bbdf4839c518b0', '2012-02-10 10:59:46', '2012-02-10 11:04:35'),
(238, 31, 'pc_address', 'hagiang.tm@gmail.com', NULL, '1be7018ca5fb13481780569d03adb780', '2012-02-10 11:04:00', '2012-02-10 11:05:23'),
(239, 31, 'register_token', '310e7e7e518fff88e753c7d8a56e905718', NULL, '55c5498d2d87c8521b462d1a7f703c11', '2012-02-10 11:04:00', '2012-02-10 11:04:00'),
(240, 31, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-02-10 11:04:00', '2012-02-10 11:04:00'),
(241, 31, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(242, 31, 'secret_answer', 'bfe1d745178de1fb76850b047386dd39', NULL, '36f94932b243c9c0925896b21154bc4c', '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(243, 31, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(244, 31, 'password', 'ee46673f71e631678846694e11564027', NULL, '8d25f9200e8233b5e9b9425b20ef749a', '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(245, 31, 'mail_address_hash', 'el9iv5fzc8gk', NULL, '2e9eef3ec04d9c47d3c966532acd1527', '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(246, 31, 'lastLogin', '', '2012-02-10 11:42:27', '83f893f513b36f24c7bbdf4839c518b0', '2012-02-10 11:05:27', '2012-02-10 11:42:27'),
(247, 32, 'pc_address', 'thanhptmc@gmail.com', NULL, 'd669d8c623aef156325201af00b3f6e2', '2012-02-10 11:42:07', '2012-02-10 11:42:56'),
(248, 32, 'register_token', '32ef6e07553a92269efc525796a8704739', NULL, '6ff610ac9919348ea9240899900c8550', '2012-02-10 11:42:07', '2012-02-10 11:42:07'),
(249, 32, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2012-02-10 11:42:07', '2012-02-10 11:42:07'),
(250, 32, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2012-02-10 11:42:56', '2012-02-10 11:42:56'),
(251, 32, 'secret_answer', '88a5f0037e9daa50c90aa0469c79fea9', NULL, '4e6ae797899e6498973984a84e1b8e58', '2012-02-10 11:42:56', '2012-02-10 11:42:56'),
(252, 32, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2012-02-10 11:42:56', '2012-02-10 11:42:56'),
(253, 32, 'password', 'f1250b4084226a8b964ee529d180490a', NULL, 'b1ca327c451972a8b3edc228103682e7', '2012-02-10 11:42:56', '2012-02-10 11:42:56'),
(254, 32, 'mail_address_hash', 'cwseylvm5ydk', NULL, '57776e2d05275ab498eb704a3c33f18f', '2012-02-10 11:42:56', '2012-02-10 11:42:56'),
(255, 32, 'lastLogin', '', '2012-02-10 11:43:00', '83f893f513b36f24c7bbdf4839c518b0', '2012-02-10 11:42:59', '2012-02-10 11:43:00');

-- --------------------------------------------------------

--
-- Table structure for table `member_image`
--

CREATE TABLE IF NOT EXISTS `member_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `file_id` int(11) NOT NULL COMMENT 'Image file id in the ''file'' table',
  `is_primary` tinyint(1) DEFAULT NULL COMMENT 'This is primary',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves images in member profiles' AUTO_INCREMENT=28 ;

--
-- Dumping data for table `member_image`
--

INSERT INTO `member_image` (`id`, `member_id`, `file_id`, `is_primary`, `created_at`, `updated_at`) VALUES
(6, 3, 21, 1, '2011-07-30 12:01:07', '2011-07-31 06:52:36'),
(7, 15, 24, 1, '2011-07-30 12:07:32', '2011-07-30 12:07:32'),
(8, 15, 25, NULL, '2011-07-30 12:09:14', '2011-07-30 12:09:14'),
(9, 3, 34, 0, '2011-07-31 06:51:24', '2011-07-31 06:52:36'),
(10, 1, 37, 1, '2011-08-03 15:44:19', '2011-08-03 15:44:24'),
(12, 5, 49, NULL, '2011-08-19 17:12:44', '2011-08-19 17:12:44'),
(13, 5, 50, NULL, '2011-08-19 17:13:13', '2011-08-19 17:13:13'),
(14, 18, 52, 1, '2011-08-22 14:38:44', '2011-09-23 15:17:32'),
(19, 17, 57, 1, '2011-08-27 11:11:55', '2011-08-27 11:11:55'),
(20, 20, 59, 1, '2011-08-27 11:57:02', '2011-08-27 11:57:02'),
(21, 18, 61, 0, '2011-08-27 11:58:54', '2011-09-23 15:17:32'),
(22, 18, 62, 0, '2011-08-27 12:26:44', '2011-09-17 11:16:41'),
(23, 18, 63, NULL, '2011-09-17 11:16:21', '2011-09-17 11:16:21'),
(24, 18, 64, NULL, '2011-09-23 15:17:13', '2011-09-23 15:17:13'),
(26, 1, 114, NULL, '2011-12-09 14:17:33', '2011-12-09 14:17:33'),
(27, 28, 379, 1, '2012-01-31 15:47:49', '2012-01-31 15:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `member_profile`
--

CREATE TABLE IF NOT EXISTS `member_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `profile_id` int(11) NOT NULL COMMENT 'Profile id',
  `profile_option_id` int(11) DEFAULT NULL COMMENT 'Profile option id',
  `value` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text content for this profile item',
  `value_datetime` datetime DEFAULT NULL COMMENT 'Profile datetime value',
  `public_flag` tinyint(4) DEFAULT NULL COMMENT 'Public flag',
  `tree_key` bigint(20) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lft_INDEX_idx` (`lft`),
  KEY `member_id_idx` (`member_id`),
  KEY `profile_id_idx` (`profile_id`),
  KEY `profile_option_id_idx` (`profile_option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of every member''''s profile' AUTO_INCREMENT=77 ;

--
-- Dumping data for table `member_profile`
--

INSERT INTO `member_profile` (`id`, `member_id`, `profile_id`, `profile_option_id`, `value`, `value_datetime`, `public_flag`, `tree_key`, `lft`, `rgt`, `level`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'Man', NULL, 1, 1, 1, 2, 0, '2011-06-22 08:46:10', '2011-06-22 08:46:11'),
(2, 1, 2, NULL, '1988-04-23', '1988-04-23 00:00:00', 1, 2, 1, 2, 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(3, 1, 3, NULL, 'Cao Bằng', NULL, 1, 3, 1, 2, 0, '2011-06-22 08:46:11', '2011-08-19 11:12:07'),
(4, 1, 4, NULL, 'Cảm ơn bạn!', NULL, 1, 4, 1, 2, 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(5, 3, 1, NULL, 'Man', NULL, 1, 5, 1, 2, 0, '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(6, 3, 2, NULL, '1985-02-23', '1985-02-23 00:00:00', 1, 6, 1, 2, 0, '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(7, 3, 3, NULL, 'Hiroshima', NULL, 1, 7, 1, 2, 0, '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(8, 3, 4, NULL, '', NULL, 1, 8, 1, 2, 0, '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(9, 9, 1, NULL, 'Female', NULL, 1, 9, 1, 2, 0, '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(10, 9, 2, NULL, '1987-03-08', '1987-03-08 00:00:00', 1, 10, 1, 2, 0, '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(11, 9, 3, NULL, 'Fukushima', NULL, 1, 11, 1, 2, 0, '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(12, 9, 4, NULL, 'alo xo mo to go ', NULL, 1, 12, 1, 2, 0, '2011-06-26 11:32:33', '2011-06-26 11:32:33'),
(13, 14, 1, NULL, 'Female', NULL, 1, 13, 1, 2, 0, '2011-07-28 13:59:53', '2011-07-28 13:59:53'),
(14, 14, 2, NULL, '1985-07-28', '1985-07-28 00:00:00', 1, 14, 1, 2, 0, '2011-07-28 13:59:53', '2011-07-28 13:59:53'),
(15, 14, 3, NULL, 'Iwate', NULL, 1, 15, 1, 2, 0, '2011-07-28 13:59:53', '2011-07-28 13:59:53'),
(16, 14, 4, NULL, '', NULL, 1, 16, 1, 2, 0, '2011-07-28 13:59:53', '2011-07-28 13:59:53'),
(17, 5, 1, NULL, 'Man', NULL, 1, 17, 1, 2, 0, '2011-07-28 14:56:51', '2011-08-19 18:16:41'),
(18, 5, 2, NULL, '1999-04-03', '1999-04-03 00:00:00', 1, 18, 1, 2, 0, '2011-07-28 14:56:51', '2011-07-28 14:56:52'),
(19, 5, 3, NULL, 'Lai Châu', NULL, 1, 19, 1, 2, 0, '2011-07-28 14:56:52', '2011-08-19 18:16:41'),
(20, 5, 4, NULL, 'Đã có vợ ', NULL, 1, 20, 1, 2, 0, '2011-07-28 14:56:52', '2011-08-19 18:16:41'),
(21, 15, 1, NULL, 'Man', NULL, 1, 21, 1, 2, 0, '2011-07-30 12:04:21', '2011-07-30 12:04:21'),
(22, 15, 2, NULL, '1987-08-13', '1987-08-13 00:00:00', 1, 22, 1, 2, 0, '2011-07-30 12:04:21', '2011-07-30 12:04:22'),
(23, 15, 3, NULL, 'Hokkaido', NULL, 1, 23, 1, 2, 0, '2011-07-30 12:04:22', '2011-07-30 12:04:22'),
(24, 15, 4, NULL, 'bum bum bum', NULL, 1, 24, 1, 2, 0, '2011-07-30 12:04:22', '2011-07-30 12:04:22'),
(25, 16, 1, NULL, 'Man', NULL, 1, 25, 1, 2, 0, '2011-07-30 12:26:14', '2011-07-30 12:26:15'),
(26, 16, 2, NULL, '1982-01-03', '1982-01-03 00:00:00', 1, 26, 1, 2, 0, '2011-07-30 12:26:15', '2011-07-30 12:26:15'),
(27, 16, 3, NULL, 'Hokkaido', NULL, 1, 27, 1, 2, 0, '2011-07-30 12:26:15', '2011-07-30 12:26:15'),
(28, 16, 4, NULL, '', NULL, 1, 28, 1, 2, 0, '2011-07-30 12:26:15', '2011-07-30 12:26:15'),
(29, 17, 1, NULL, 'Man', NULL, 1, 29, 1, 2, 0, '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(30, 17, 2, NULL, '1989-09-09', '1989-09-09 00:00:00', 1, 30, 1, 2, 0, '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(31, 17, 3, NULL, 'Hokkaido', NULL, 1, 31, 1, 2, 0, '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(32, 17, 4, NULL, '', NULL, 1, 32, 1, 2, 0, '2011-08-16 15:25:14', '2011-08-16 15:25:14'),
(33, 11, 1, NULL, 'Man', NULL, 1, 33, 1, 2, 0, '2011-08-20 12:07:37', '2011-08-20 12:07:37'),
(34, 11, 2, NULL, '1987-02-21', '1987-02-21 00:00:00', 1, 34, 1, 2, 0, '2011-08-20 12:07:37', '2011-08-20 12:07:37'),
(35, 11, 3, NULL, 'Thừa Thiên-Huế', NULL, 1, 35, 1, 2, 0, '2011-08-20 12:07:37', '2011-08-20 12:07:37'),
(36, 11, 4, NULL, 'Hài hước', NULL, 1, 36, 1, 2, 0, '2011-08-20 12:07:37', '2011-08-20 12:07:37'),
(37, 18, 1, NULL, 'Female', NULL, 1, 37, 1, 2, 0, '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(38, 18, 2, NULL, '1988-04-24', '1988-04-24 00:00:00', 1, 38, 1, 2, 0, '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(39, 18, 3, NULL, 'Hà Nội, thủ đô', NULL, 1, 39, 1, 2, 0, '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(40, 18, 4, NULL, '', NULL, 1, 40, 1, 2, 0, '2011-08-22 14:37:45', '2011-08-22 14:37:45'),
(41, 20, 1, NULL, 'Man', NULL, 1, 41, 1, 2, 0, '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(42, 20, 2, NULL, '1989-06-02', '1989-06-02 00:00:00', 1, 42, 1, 2, 0, '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(43, 20, 3, NULL, 'Bắc Giang', NULL, 1, 43, 1, 2, 0, '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(44, 20, 4, NULL, 'Yêu công nghệ, thể thao(bóng đá và đá cầu), AOE, guitar', NULL, 1, 44, 1, 2, 0, '2011-08-23 09:54:33', '2011-08-23 09:54:33'),
(45, 19, 1, NULL, 'Man', NULL, 1, 45, 1, 2, 0, '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(46, 19, 2, NULL, '1989-08-12', '1989-08-12 00:00:00', 1, 46, 1, 2, 0, '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(47, 19, 3, NULL, 'Hải Phòng, thành phố', NULL, 1, 47, 1, 2, 0, '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(48, 19, 4, NULL, '', NULL, 1, 48, 1, 2, 0, '2011-08-27 10:54:54', '2011-08-27 10:54:54'),
(49, 27, 1, NULL, 'Man', NULL, 1, 49, 1, 2, 0, '2012-01-31 15:16:54', '2012-01-31 15:16:54'),
(50, 27, 2, NULL, '1990-01-01', '1990-01-01 00:00:00', 1, 50, 1, 2, 0, '2012-01-31 15:16:54', '2012-01-31 15:16:54'),
(51, 27, 3, NULL, 'Hà Nội, thủ đô', NULL, 1, 51, 1, 2, 0, '2012-01-31 15:16:55', '2012-01-31 15:16:55'),
(52, 27, 4, NULL, 'Map of The Life', NULL, 1, 52, 1, 2, 0, '2012-01-31 15:16:55', '2012-01-31 15:16:55'),
(53, 28, 1, NULL, 'Female', NULL, 1, 53, 1, 2, 0, '2012-01-31 15:47:26', '2012-01-31 15:47:26'),
(54, 28, 2, NULL, '1981-01-01', '1981-01-01 00:00:00', 1, 54, 1, 2, 0, '2012-01-31 15:47:26', '2012-01-31 15:47:26'),
(55, 28, 3, NULL, 'Lai Châu', NULL, 1, 55, 1, 2, 0, '2012-01-31 15:47:27', '2012-01-31 15:47:27'),
(56, 28, 4, NULL, 'fsd', NULL, 1, 56, 1, 2, 0, '2012-01-31 15:47:27', '2012-01-31 15:47:27'),
(57, 29, 1, NULL, 'Man', NULL, 1, 57, 1, 2, 0, '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(58, 29, 2, NULL, '1990-01-14', '1990-01-14 00:00:00', 1, 58, 1, 2, 0, '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(59, 29, 3, NULL, 'Hà Nội, thủ đô', NULL, 1, 59, 1, 2, 0, '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(60, 29, 4, NULL, '', NULL, 1, 60, 1, 2, 0, '2012-02-09 08:58:53', '2012-02-09 08:58:53'),
(61, 30, 1, NULL, 'Man', NULL, 1, 61, 1, 2, 0, '2012-02-10 09:11:32', '2012-02-10 09:11:33'),
(62, 30, 2, NULL, '1954-02-01', '1954-02-01 00:00:00', 1, 62, 1, 2, 0, '2012-02-10 09:11:33', '2012-02-10 09:11:33'),
(63, 30, 3, NULL, 'Lai Châu', NULL, 1, 63, 1, 2, 0, '2012-02-10 09:11:33', '2012-02-10 09:11:33'),
(64, 30, 4, NULL, 'abc', NULL, 1, 64, 1, 2, 0, '2012-02-10 09:11:33', '2012-02-10 09:11:33'),
(65, 23, 1, NULL, 'Female', NULL, 1, 65, 1, 2, 0, '2012-02-10 10:59:42', '2012-02-10 10:59:42'),
(66, 23, 2, NULL, '1959-03-03', '1959-03-03 00:00:00', 1, 66, 1, 2, 0, '2012-02-10 10:59:42', '2012-02-10 10:59:42'),
(67, 23, 3, NULL, 'Lai Châu', NULL, 1, 67, 1, 2, 0, '2012-02-10 10:59:42', '2012-02-10 10:59:42'),
(68, 23, 4, NULL, 'dddddda', NULL, 1, 68, 1, 2, 0, '2012-02-10 10:59:42', '2012-02-10 10:59:42'),
(69, 31, 1, NULL, 'Female', NULL, 1, 69, 1, 2, 0, '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(70, 31, 2, NULL, '1954-04-01', '1954-04-01 00:00:00', 1, 70, 1, 2, 0, '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(71, 31, 3, NULL, 'Lai Châu', NULL, 1, 71, 1, 2, 0, '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(72, 31, 4, NULL, 'eafg', NULL, 1, 72, 1, 2, 0, '2012-02-10 11:05:23', '2012-02-10 11:05:23'),
(73, 32, 1, NULL, 'Female', NULL, 1, 73, 1, 2, 0, '2012-02-10 11:42:56', '2012-02-10 11:42:56'),
(74, 32, 2, NULL, '1957-01-02', '1957-01-02 00:00:00', 1, 74, 1, 2, 0, '2012-02-10 11:42:56', '2012-02-10 11:42:56'),
(75, 32, 3, NULL, 'Lai Châu', NULL, 1, 75, 1, 2, 0, '2012-02-10 11:42:56', '2012-02-10 11:42:56'),
(76, 32, 4, NULL, 'ddddd', NULL, 1, 76, 1, 2, 0, '2012-02-10 11:42:56', '2012-02-10 11:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `member_relationship`
--

CREATE TABLE IF NOT EXISTS `member_relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id_to` int(11) NOT NULL COMMENT 'Target member id',
  `member_id_from` int(11) NOT NULL COMMENT 'Subject member id',
  `is_friend` tinyint(1) DEFAULT NULL COMMENT 'The members are friends',
  `is_friend_pre` tinyint(1) DEFAULT NULL COMMENT 'The members are going to be friends',
  `is_access_block` tinyint(1) DEFAULT NULL COMMENT 'The subject member is blocked the target',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id_to_from_UNIQUE_idx` (`member_id_to`,`member_id_from`),
  UNIQUE KEY `member_id_from_to_UNIQUE_idx` (`member_id_from`,`member_id_to`),
  KEY `member_id_to_idx` (`member_id_to`),
  KEY `member_id_from_idx` (`member_id_from`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves ralationships of each members' AUTO_INCREMENT=57 ;

--
-- Dumping data for table `member_relationship`
--

INSERT INTO `member_relationship` (`id`, `member_id_to`, `member_id_from`, `is_friend`, `is_friend_pre`, `is_access_block`, `created_at`, `updated_at`) VALUES
(5, 9, 1, NULL, 1, NULL, '2011-07-06 06:39:42', '2011-07-06 06:39:42'),
(6, 3, 1, 1, 0, NULL, '2011-07-06 06:40:00', '2011-07-09 11:16:32'),
(7, 1, 3, 1, 0, NULL, '2011-07-09 11:15:16', '2011-07-09 11:16:32'),
(8, 5, 3, 1, 0, NULL, '2011-07-09 11:22:10', '2011-07-09 11:22:10'),
(9, 3, 5, 1, 0, NULL, '2011-07-09 11:22:10', '2011-07-09 11:22:10'),
(10, 11, 1, 1, 0, NULL, '2011-07-17 17:26:42', '2011-07-17 17:26:42'),
(11, 1, 11, 1, 0, NULL, '2011-07-17 17:26:42', '2011-07-17 17:26:42'),
(12, 14, 3, 1, 0, NULL, '2011-07-28 14:06:31', '2011-07-28 14:06:54'),
(13, 3, 14, 1, 0, NULL, '2011-07-28 14:06:54', '2011-07-28 14:06:54'),
(14, 3, 15, 1, 0, NULL, '2011-07-30 12:10:22', '2011-07-30 12:10:39'),
(15, 15, 3, 1, 0, NULL, '2011-07-30 12:10:39', '2011-07-30 12:10:39'),
(16, 16, 3, NULL, 1, NULL, '2011-07-31 06:38:21', '2011-07-31 06:38:21'),
(17, 3, 18, 1, 0, NULL, '2011-08-22 14:40:02', '2011-10-31 17:01:03'),
(18, 20, 1, 1, 0, NULL, '2011-08-25 21:38:33', '2011-08-27 11:22:25'),
(19, 17, 1, 1, 0, NULL, '2011-08-25 21:38:54', '2011-08-27 10:53:32'),
(20, 15, 1, NULL, 1, NULL, '2011-08-25 21:39:38', '2011-08-25 21:39:38'),
(21, 1, 17, 1, 0, NULL, '2011-08-27 10:53:32', '2011-08-27 10:53:32'),
(22, 1, 20, 1, 0, NULL, '2011-08-27 11:22:25', '2011-08-27 11:22:25'),
(23, 19, 20, 1, 0, NULL, '2011-08-27 11:41:28', '2011-08-27 11:42:08'),
(24, 20, 19, 1, 0, NULL, '2011-08-27 11:42:08', '2011-08-27 11:42:08'),
(25, 18, 19, 1, 0, NULL, '2011-08-27 11:43:30', '2011-08-27 11:44:02'),
(26, 19, 18, 1, 0, NULL, '2011-08-27 11:44:02', '2011-08-27 11:44:02'),
(27, 17, 18, NULL, 1, NULL, '2011-08-27 11:44:50', '2011-08-27 11:44:50'),
(28, 20, 18, 1, 0, NULL, '2011-08-27 11:45:43', '2011-08-27 11:53:32'),
(29, 17, 19, NULL, 1, NULL, '2011-08-27 11:46:09', '2011-08-27 11:46:09'),
(30, 16, 18, NULL, 1, NULL, '2011-08-27 11:46:27', '2011-08-27 11:46:27'),
(31, 15, 18, NULL, 1, NULL, '2011-08-27 11:47:08', '2011-08-27 11:47:08'),
(32, 14, 18, NULL, 1, NULL, '2011-08-27 11:47:46', '2011-08-27 11:47:46'),
(33, 14, 19, NULL, 1, NULL, '2011-08-27 11:48:31', '2011-08-27 11:48:31'),
(34, 11, 18, NULL, 1, NULL, '2011-08-27 11:49:10', '2011-08-27 11:49:10'),
(35, 9, 18, NULL, 1, NULL, '2011-08-27 11:49:34', '2011-08-27 11:49:34'),
(36, 5, 18, NULL, 1, NULL, '2011-08-27 11:49:58', '2011-08-27 11:49:58'),
(37, 16, 19, NULL, 1, NULL, '2011-08-27 11:50:30', '2011-08-27 11:50:30'),
(38, 15, 19, NULL, 1, NULL, '2011-08-27 11:51:12', '2011-08-27 11:51:12'),
(39, 11, 19, NULL, 1, NULL, '2011-08-27 11:51:42', '2011-08-27 11:51:42'),
(40, 5, 19, NULL, 1, NULL, '2011-08-27 11:52:20', '2011-08-27 11:52:20'),
(41, 18, 20, 1, 0, NULL, '2011-08-27 11:53:32', '2011-08-27 11:53:32'),
(42, 17, 20, NULL, 1, NULL, '2011-08-27 11:58:06', '2011-08-27 11:58:06'),
(43, 16, 20, NULL, 1, NULL, '2011-08-27 11:58:30', '2011-08-27 11:58:30'),
(44, 14, 20, NULL, 1, NULL, '2011-08-27 11:59:01', '2011-08-27 11:59:01'),
(45, 5, 20, NULL, 1, NULL, '2011-08-27 12:00:09', '2011-08-27 12:00:09'),
(46, 3, 20, 1, 0, NULL, '2011-08-27 12:00:30', '2011-10-31 17:03:42'),
(47, 18, 1, 1, 0, NULL, '2011-08-29 09:58:12', '2011-08-29 14:42:59'),
(48, 1, 18, 1, 0, NULL, '2011-08-29 14:42:59', '2011-08-29 14:42:59'),
(49, 18, 3, 1, 0, NULL, '2011-10-31 17:01:02', '2011-10-31 17:01:03'),
(50, 20, 3, 1, 0, NULL, '2011-10-31 17:03:42', '2011-10-31 17:03:42'),
(51, 19, 3, NULL, 1, NULL, '2011-10-31 17:36:37', '2011-10-31 17:36:37'),
(52, 19, 1, NULL, 1, NULL, '2011-11-03 11:02:40', '2011-11-03 11:02:40'),
(53, 23, 1, 1, 0, NULL, '2011-12-07 11:25:59', '2011-12-07 11:25:59'),
(54, 1, 23, 1, 0, NULL, '2011-12-07 11:25:59', '2011-12-07 11:25:59'),
(55, 24, 1, 1, 0, NULL, '2012-01-04 11:15:56', '2012-01-04 11:15:57'),
(56, 1, 24, 1, 0, NULL, '2012-01-04 11:15:57', '2012-01-04 11:15:57');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `subject` text,
  `body` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_send` tinyint(1) NOT NULL DEFAULT '0',
  `thread_message_id` int(11) DEFAULT '0',
  `return_message_id` int(11) DEFAULT '0',
  `message_type_id` int(11) DEFAULT NULL,
  `foreign_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `message_type_id_idx` (`message_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `member_id`, `subject`, `body`, `is_deleted`, `is_send`, `thread_message_id`, `return_message_id`, `message_type_id`, `foreign_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Friend link request message', 'Hi you, lam quen nha!', 0, 1, 0, 0, 2, 0, '2011-07-06 06:39:42', '2011-07-06 06:39:42'),
(2, 1, 'Friend link request message', 'hi u, lam quen nha!', 0, 1, 0, 0, 2, 0, '2011-07-06 06:40:00', '2011-07-06 06:40:00'),
(3, 3, 'Friend link request message', 'hi u', 0, 1, 0, 0, 2, 0, '2011-07-09 11:15:54', '2011-07-09 11:15:54'),
(4, 3, 'Bạn bèリンク申請メッセージ', 'hi u', 0, 1, 0, 0, 2, 0, '2011-07-28 14:06:31', '2011-07-28 14:06:31'),
(5, 15, 'Bạn bèリンク申請メッセージ', 'ket ban de ', 0, 1, 0, 0, 2, 0, '2011-07-30 12:10:22', '2011-07-30 12:10:22'),
(6, 3, 'Bạn bèリンク申請メッセージ', 'lam ban anh oi :))', 0, 1, 0, 0, 2, 0, '2011-07-31 06:38:21', '2011-07-31 06:38:21'),
(7, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 0, 1, 0, 0, 2, 0, '2011-08-22 14:40:02', '2011-08-22 14:40:02'),
(8, 1, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'kết bạn nào', 0, 1, 0, 0, 2, 0, '2011-08-25 21:38:33', '2011-08-25 21:38:33'),
(9, 1, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'Kết bạn đê', 1, 1, 0, 0, 2, 0, '2011-08-25 21:38:55', '2011-09-19 15:29:11'),
(10, 1, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'Kết bạn nào', 0, 1, 0, 0, 2, 0, '2011-08-25 21:39:38', '2011-09-15 19:35:31'),
(11, 20, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'xyz', 1, 1, 0, 0, 2, 0, '2011-08-27 11:41:28', '2011-09-22 22:08:44'),
(12, 19, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 0, 1, 0, 0, 2, 0, '2011-08-27 11:43:30', '2011-08-27 11:43:30'),
(13, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 1, 1, 0, 0, 2, 0, '2011-08-27 11:44:50', '2011-09-19 13:16:08'),
(14, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 1, 1, 0, 0, 2, 0, '2011-08-27 11:45:43', '2011-09-19 13:15:58'),
(15, 19, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'abc', 0, 1, 0, 0, 2, 0, '2011-08-27 11:46:09', '2011-08-27 11:46:09'),
(16, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 0, 1, 0, 0, 2, 0, '2011-08-27 11:46:27', '2011-08-27 11:46:27'),
(17, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 0, 1, 0, 0, 2, 0, '2011-08-27 11:47:08', '2011-08-27 11:47:08'),
(18, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 0, 1, 0, 0, 2, 0, '2011-08-27 11:47:46', '2011-08-27 11:47:46'),
(19, 19, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'chấp nhận đi anh :P', 0, 1, 0, 0, 2, 0, '2011-08-27 11:48:31', '2011-08-27 11:48:31'),
(20, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 0, 1, 0, 0, 2, 0, '2011-08-27 11:49:10', '2011-08-27 11:49:10'),
(21, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 0, 1, 0, 0, 2, 0, '2011-08-27 11:49:34', '2011-08-27 11:49:34'),
(22, 18, 'Tin nhắn đường dẫn yêu cầu Bạn bè', '', 0, 1, 0, 0, 2, 0, '2011-08-27 11:49:58', '2011-08-27 11:49:58'),
(23, 19, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'abc', 0, 1, 0, 0, 2, 0, '2011-08-27 11:50:30', '2011-08-27 11:50:30'),
(24, 19, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'ABC', 0, 1, 0, 0, 2, 0, '2011-08-27 11:51:13', '2011-08-27 11:51:13'),
(25, 19, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'abc', 0, 1, 0, 0, 2, 0, '2011-08-27 11:51:42', '2011-08-27 11:51:42'),
(26, 19, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'abc', 0, 1, 0, 0, 2, 0, '2011-08-27 11:52:20', '2011-08-27 11:52:20'),
(27, 20, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'ABC', 1, 1, 0, 0, 2, 0, '2011-08-27 11:58:07', '2011-09-22 22:08:42'),
(28, 20, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'ABC', 1, 1, 0, 0, 2, 0, '2011-08-27 11:58:30', '2011-09-22 22:08:40'),
(29, 20, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'ABC', 1, 1, 0, 0, 2, 0, '2011-08-27 11:59:01', '2011-09-22 22:08:29'),
(30, 20, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'ABC', 1, 1, 0, 0, 2, 0, '2011-08-27 12:00:09', '2011-09-22 22:08:26'),
(31, 20, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'ABC', 1, 1, 0, 0, 2, 0, '2011-08-27 12:00:30', '2011-09-22 22:08:15'),
(32, 1, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'hello, nice to miss you', 1, 1, 0, 0, 2, 0, '2011-08-29 09:58:12', '2011-09-19 15:29:00'),
(33, 1, 'kkkkk', 'hhhhhhhhhhhhhhhhhh', 0, 0, 0, 0, 1, 0, '2011-08-30 21:18:31', '2011-09-15 20:14:42'),
(34, 18, 'dfgdsffgsd', 'hgjhkjhkj', 1, 0, 0, 0, 1, 0, '2011-08-31 21:19:28', '2011-09-15 16:53:40'),
(35, 18, 'Họp nhóm', 'Xây dựng dự án bản đồ cuộc sống lifemap', 1, 0, 0, 0, 1, 0, '2011-09-05 09:19:14', '2011-09-15 16:32:34'),
(36, 18, 'sửa giao diện', 'lifemap', 1, 0, 0, 0, 1, 0, '2011-09-06 15:27:05', '2011-09-15 17:57:20'),
(37, 18, 'jgskldjflgk', 'jvlksjdfgklsjglkf', 1, 1, 0, 0, 1, 0, '2011-09-06 15:34:49', '2011-09-15 16:33:24'),
(38, 18, 'tusday', 'thu 3', 0, 1, 0, 0, 1, 0, '2011-09-06 15:56:22', '2011-09-06 15:56:22'),
(39, 18, 'how are you', 'we do not live just for ourseleve', 0, 1, 0, 0, 1, 0, '2011-09-13 14:51:42', '2011-09-13 14:51:42'),
(40, 1, 'thursday 15/09/2011', 'sdfgsdfgsdfgsdf', 1, 1, 0, 0, 1, 0, '2011-09-15 17:03:37', '2011-09-15 19:38:00'),
(41, 18, 'sdfgsdfgsdf', 'gsdfgdfgsdfgsdf', 1, 0, 0, 0, 1, 0, '2011-09-15 17:55:58', '2011-09-15 17:56:48'),
(42, 18, 'hrthỷt', 'gseyẻtỷe', 1, 0, 0, 0, 1, 0, '2011-09-15 18:04:10', '2011-09-15 18:05:08'),
(43, 18, 'grtiyuioiyy', 'ftỵtyuityủity', 1, 0, 0, 0, 1, 0, '2011-09-15 18:08:12', '2011-09-15 18:08:23'),
(44, 18, 'ghdgd', 'dfghhdfghdfghdf', 1, 0, 0, 0, 1, 0, '2011-09-15 18:09:45', '2011-09-15 18:10:00'),
(45, 1, 'gsdgdfg', 'dhdfghdfghfghdfg', 1, 1, 0, 0, 1, 0, '2011-09-15 19:19:47', '2011-09-15 19:20:13'),
(46, 1, 'kgkdfjgslkdfj', 'jgslkfdjglskdjfglk', 1, 0, 0, 0, 1, 0, '2011-09-15 19:46:13', '2011-09-15 19:46:54'),
(47, 1, 'gsdfgsdf', 'gfsdfgsdf', 0, 0, 0, 0, 1, 0, '2011-09-15 21:57:44', '2011-09-15 21:59:06'),
(48, 18, 'hrthgrtỷ', 'gsẻtrêtrtew', 0, 1, 0, 0, 1, 0, '2011-09-19 10:09:18', '2011-09-19 10:09:18'),
(49, 18, 'hdfghdfg', 'hghdfhrtydrytýe', 0, 1, 0, 0, 1, 0, '2011-09-19 10:10:59', '2011-09-19 10:10:59'),
(50, 18, 'gsdgdfgsd', 'sdgsdfgsdfgsdfg', 0, 1, 0, 0, 1, 0, '2011-09-19 11:11:40', '2011-09-19 11:11:40'),
(51, 18, 'sfgsdfgs', 'gsfgsdfgsdgdsfd', 0, 1, 0, 0, 1, 0, '2011-09-19 11:13:20', '2011-09-19 11:13:20'),
(52, 18, 'gsdfgsdfg', 'hsdhgdfhrtỷe', 0, 1, 0, 0, 1, 0, '2011-09-19 11:23:35', '2011-09-19 11:23:35'),
(53, 18, 'jsklgjskldfj', 'ủeủtyiuuyigạlkgjsdlkfgjks', 1, 1, 0, 0, 1, 0, '2011-09-19 11:27:05', '2011-09-19 13:14:38'),
(54, 18, 'hihihihihi', 'jgskdjfg;skdf;gs', 1, 1, 0, 0, 1, 0, '2011-09-19 11:32:58', '2011-09-19 13:14:25'),
(55, 18, '222222222', 'fjsljgalksjdfkláđklfjalksđjflkád', 1, 1, 0, 0, 1, 0, '2011-09-19 11:33:49', '2011-09-19 12:52:18'),
(56, 18, 'ok', 'ok', 1, 1, 0, 0, 1, 0, '2011-09-19 12:31:40', '2011-09-19 12:52:05'),
(57, 18, 'i do not know', 'i hope that it is true', 1, 1, 0, 0, 1, 0, '2011-09-19 12:39:51', '2011-09-19 12:51:50'),
(58, 18, 'fsgs', 'sfádgdsfhsgdhdf', 1, 1, 0, 0, 1, 0, '2011-09-19 12:43:02', '2011-09-19 12:48:38'),
(59, 18, 'bbbbbbbbbbbbb', 'ggggggggggggggggg', 1, 1, 0, 0, 1, 0, '2011-09-19 12:44:11', '2011-09-19 12:48:18'),
(60, 18, 'sgskljglkdjlk', 'gklsjdfkgljsdklfjgk', 0, 1, 0, 0, 1, 0, '2011-09-19 13:15:06', '2011-09-19 13:15:06'),
(61, 18, 'dflksdjglk', 'gklsjdfklgjslkdf', 0, 1, 0, 0, 1, 0, '2011-09-19 15:07:09', '2011-09-19 15:07:09'),
(62, 18, 'jgslkjfgksldj', 'sẹgkdsfjglks', 0, 1, 0, 0, 1, 0, '2011-09-19 15:07:35', '2011-09-19 15:07:35'),
(63, 18, 'fsglkfgl;', 'sg;lskd;gsd', 0, 1, 0, 0, 1, 0, '2011-09-19 15:08:01', '2011-09-19 15:08:01'),
(64, 18, 'gsjfgkls', 'jgksjdfklsd', 0, 1, 0, 0, 1, 0, '2011-09-19 15:08:31', '2011-09-19 15:08:31'),
(65, 18, 'gskldfjglk', 'hlksjhlkdf', 0, 1, 0, 0, 1, 0, '2011-09-19 15:08:56', '2011-09-19 15:08:56'),
(66, 18, 'gslkjfsglk', 'glskdfglsdf', 0, 1, 0, 0, 1, 0, '2011-09-19 15:09:41', '2011-09-19 15:09:41'),
(67, 18, 'gsdfgsdf', 'gsdgdhsd', 1, 0, 0, 0, 1, 0, '2011-09-19 15:11:22', '2011-09-22 21:56:26'),
(68, 18, '13681368', 'fshglsdj', 1, 0, 0, 0, 1, 0, '2011-09-19 15:16:57', '2011-09-22 21:56:16'),
(69, 1, 'jfgskjsdlkfgjkl', 'gjksdjfglksdfjglks', 0, 1, 0, 0, 1, 0, '2011-09-19 16:12:20', '2011-09-19 16:12:20'),
(70, 1, 'ggsđfgdsf', 'hdfghdfghd', 0, 1, 0, 0, 1, 0, '2011-09-19 16:28:08', '2011-09-19 16:28:08'),
(71, 1, 'ggsđfgdsf', 'hdfghdfghd', 0, 1, 0, 0, 1, 0, '2011-09-19 16:31:18', '2011-09-19 16:31:18'),
(72, 1, 'skdjfgslk', 'gklsdfjkglsd', 0, 1, 0, 0, 1, 0, '2011-09-19 16:37:15', '2011-09-19 16:37:15'),
(73, 1, 'gjsdfjgslkdfj', 'gjskdfjgksf', 0, 1, 0, 0, 1, 0, '2011-09-19 16:37:41', '2011-09-19 16:37:41'),
(74, 1, 'gjsdfjgslkdfj', 'gjskdfjgksf', 0, 1, 0, 0, 1, 0, '2011-09-19 16:40:04', '2011-09-19 16:40:04'),
(75, 1, 'gjsdfjgslkdfj', 'gjskdfjgksf', 0, 1, 0, 0, 1, 0, '2011-09-19 16:47:53', '2011-09-19 16:47:53'),
(76, 1, 'uuuuuuuuuuuuuu', 'hhhhhhhhhhhhhhhh', 1, 1, 0, 0, 1, 0, '2011-09-19 16:48:40', '2011-09-19 16:48:54'),
(77, 1, 'haaaaaaaaaaaaaaaaa', 'hhuuuuuuuuuuuuuuuuuuu', 0, 1, 0, 0, 1, 0, '2011-09-19 16:51:26', '2011-09-19 16:51:26'),
(78, 1, 'haaaaaaaaaaaaaaaaa', 'hhuuuuuuuuuuuuuuuuuuu', 0, 1, 0, 0, 1, 0, '2011-09-19 16:52:49', '2011-09-19 16:52:50'),
(79, 1, 'ppppppppppp', 'kkkkkkkkkkkkkk', 0, 1, 0, 0, 1, 0, '2011-09-19 16:59:01', '2011-09-19 16:59:01'),
(80, 1, 'pôppôppo', 'gskfdjglksdf', 0, 1, 0, 0, 1, 0, '2011-09-19 17:05:08', '2011-09-19 17:05:08'),
(81, 1, 'pôppôppo', 'gskfdjglksdf', 0, 1, 0, 0, 1, 0, '2011-09-19 17:06:11', '2011-09-19 17:06:11'),
(82, 1, 'pôppôppo', 'gskfdjglksdf', 0, 1, 0, 0, 1, 0, '2011-09-19 17:06:20', '2011-09-19 17:06:20'),
(83, 1, 'pôppôppo', 'gskfdjglksdf', 1, 1, 0, 0, 1, 0, '2011-09-19 17:06:30', '2011-09-19 17:11:59'),
(84, 1, 'pôppôppo', 'gskfdjglksdf', 1, 1, 0, 0, 1, 0, '2011-09-19 17:07:27', '2011-09-19 17:11:45'),
(85, 1, 'gsfdfadsdfádfa', 'gdsfgsdfgsdf', 0, 1, 0, 0, 1, 0, '2011-09-19 18:33:26', '2011-09-19 18:33:26'),
(86, 18, 'fkjálkdfjlk', 'ádflkjalkdsfa', 0, 1, 0, 0, 1, 0, '2011-09-20 14:53:27', '2011-09-20 14:53:27'),
(87, 18, 'sgđfhdf', 'gsdfgsdfsd', 0, 1, 0, 0, 1, 0, '2011-09-20 14:55:16', '2011-09-20 14:55:16'),
(88, 18, 'kkkkkkkkkkkk', 'tttttttttttttttttttttt', 0, 1, 0, 0, 1, 0, '2011-09-20 14:55:52', '2011-09-20 14:55:52'),
(89, 18, 'kkkkkkkkkkkk', 'tttttttttttttttttttttt', 0, 1, 0, 0, 1, 0, '2011-09-20 14:55:53', '2011-09-20 14:55:53'),
(90, 18, 'jjjjjjjjjjjjjjjjj', 'yyyyyyyyyyyyyyyyy', 0, 1, 0, 0, 1, 0, '2011-09-20 14:58:24', '2011-09-20 14:58:24'),
(91, 18, 'jjjjjjjjjjjjjjjjj', 'yyyyyyyyyyyyyyyyy', 1, 1, 0, 0, 1, 0, '2011-09-20 14:58:45', '2011-10-03 11:57:45'),
(92, 18, 'jjjjjjjjjjjjjjjjj', 'yyyyyyyyyyyyyyyyy', 0, 1, 0, 0, 1, 0, '2011-09-20 14:58:45', '2011-09-20 14:58:45'),
(93, 18, '222222222222', 'wonderful', 0, 1, 0, 0, 1, 0, '2011-10-03 12:35:51', '2011-10-03 12:35:51'),
(94, 18, '222222222222', 'wonderful', 0, 1, 0, 0, 1, 0, '2011-10-03 12:36:20', '2011-10-03 12:36:20'),
(95, 18, '22222222222', '3333333333333333', 0, 1, 0, 0, 1, 0, '2011-10-03 12:37:54', '2011-10-03 12:37:54'),
(96, 18, 'baby', 'baby', 0, 1, 0, 0, 1, 0, '2011-10-03 12:38:54', '2011-10-03 12:38:54'),
(97, 18, 'baby', 'baby', 0, 1, 0, 0, 1, 0, '2011-10-03 12:41:12', '2011-10-03 12:41:12'),
(98, 18, 'baby', 'baby', 0, 1, 0, 0, 1, 0, '2011-10-03 12:41:12', '2011-10-03 12:41:12'),
(99, 1, 'suggest', 'thanh cong', 0, 1, 0, 0, 1, 0, '2011-10-17 15:52:46', '2011-10-17 15:52:46'),
(100, 1, 'phphphphph', 'msmsms', 0, 1, 0, 0, 1, 0, '2011-10-17 15:55:26', '2011-10-17 15:55:26'),
(101, 1, ';;;;;;;;;;;;;;;;;;', '111111111111111111', 0, 1, 0, 0, 1, 0, '2011-10-17 15:58:04', '2011-10-17 15:58:04'),
(102, 1, '33333333333', '444444444444444', 0, 1, 0, 0, 1, 0, '2011-10-17 15:58:58', '2011-10-17 15:58:58'),
(103, 1, 'qqqqqqqqqqqqqqqqq', 'ssssssssssssssss', 0, 1, 0, 0, 1, 0, '2011-10-17 16:02:32', '2011-10-17 16:02:32'),
(104, 1, 'gasfasdfasd', 'gasfgdsfgsdf', 0, 1, 0, 0, 1, 0, '2011-10-17 16:51:09', '2011-10-17 16:51:09'),
(105, 1, 'gsdfgsdf', 'gsdfsdfgs', 0, 1, 0, 0, 1, 0, '2011-10-17 17:28:57', '2011-10-17 17:28:57'),
(106, 1, 'gsdfgsdf', 'gsdfsdfgs', 0, 1, 0, 0, 1, 0, '2011-10-17 17:28:58', '2011-10-17 17:28:58'),
(107, 1, 'yyyyyyyyyyyyyy', 'kkkkkkkkkkkkkkk', 0, 1, 0, 0, 1, 0, '2011-10-17 17:31:09', '2011-10-17 17:31:09'),
(108, 1, 'yyyyyyyyyyyyyy', 'kkkkkkkkkkkkkkk', 0, 1, 0, 0, 1, 0, '2011-10-17 17:31:09', '2011-10-17 17:31:09'),
(109, 1, 'gggggggggggg', 'gggggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-17 17:32:32', '2011-10-17 17:32:32'),
(110, 1, 'gggggggggggg', 'gggggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-17 17:32:32', '2011-10-17 17:32:32'),
(111, 1, ';;;;;;;;;;;', ';;;;;;;;;;;;;', 0, 1, 0, 0, 1, 0, '2011-10-17 17:42:32', '2011-10-17 17:42:32'),
(112, 1, 'rrrrrrrrrrrr', 'eeeeeeeeeeeeee', 0, 1, 0, 0, 1, 0, '2011-10-17 17:44:31', '2011-10-17 17:44:31'),
(113, 1, 'rrrrrrrrrrrr', 'eeeeeeeeeeeeee', 0, 1, 0, 0, 1, 0, '2011-10-17 17:44:31', '2011-10-17 17:44:31'),
(114, 1, 'ttttttttttttttttttttttttttttt', 'ttttttttttttttttttttttttttttttt', 0, 1, 0, 0, 1, 0, '2011-10-17 18:18:05', '2011-10-17 18:18:05'),
(115, 1, 'ttttttttttt', 'kkkkkkkkkkkkk', 0, 1, 0, 0, 1, 0, '2011-10-17 18:23:41', '2011-10-17 18:23:41'),
(116, 1, 'ttttttttttt', 'kkkkkkkkkkkkk', 0, 1, 0, 0, 1, 0, '2011-10-17 18:23:41', '2011-10-17 18:23:41'),
(117, 1, 'fgggggggggggggg', 'ttttttttt', 0, 1, 0, 0, 1, 0, '2011-10-17 18:24:56', '2011-10-17 18:24:56'),
(118, 1, 'fgggggggggggggg', 'ttttttttt', 0, 1, 0, 0, 1, 0, '2011-10-17 18:24:57', '2011-10-17 18:24:57'),
(119, 1, 'rrrrrrrrrr', 'eeeeeeeeee', 0, 1, 0, 0, 1, 0, '2011-10-17 18:29:32', '2011-10-17 18:29:32'),
(120, 1, 'rrrrrrrrrr', 'eeeeeeeeee', 0, 1, 0, 0, 1, 0, '2011-10-17 18:29:32', '2011-10-17 18:29:32'),
(121, 1, 'tttttttttt', 'tttttttttttttt', 0, 1, 0, 0, 1, 0, '2011-10-17 18:30:51', '2011-10-17 18:30:51'),
(122, 1, 'tttttttttt', 'tttttttttttttt', 0, 1, 0, 0, 1, 0, '2011-10-17 18:30:52', '2011-10-17 18:30:52'),
(123, 1, 'ttttttttttt', 'sdfdffsdf', 0, 1, 0, 0, 1, 0, '2011-10-18 09:43:28', '2011-10-18 09:43:28'),
(124, 1, 'ttttttttttt', 'sdfdffsdf', 0, 1, 0, 0, 1, 0, '2011-10-18 09:43:28', '2011-10-18 09:43:28'),
(125, 1, 'ttttttttttt', 'sdfdffsdf', 0, 1, 0, 0, 1, 0, '2011-10-18 09:47:43', '2011-10-18 09:47:44'),
(126, 1, 'ttttttttttt', 'sdfdffsdf', 0, 1, 0, 0, 1, 0, '2011-10-18 09:47:44', '2011-10-18 09:47:44'),
(127, 1, 'sfdfsddfsdfádfádf', 'fádfadsfádf', 0, 1, 0, 0, 1, 0, '2011-10-18 09:49:21', '2011-10-18 09:49:21'),
(128, 1, 'sfdfsddfsdfádfádf', 'fádfadsfádf', 0, 1, 0, 0, 1, 0, '2011-10-18 09:49:21', '2011-10-18 09:49:21'),
(129, 1, 'sfdfsddfsdfádfádf', 'fádfadsfádf', 0, 1, 0, 0, 1, 0, '2011-10-18 10:07:26', '2011-10-18 10:07:26'),
(130, 1, 'sfdfsddfsdfádfádf', 'fádfadsfádf', 0, 1, 0, 0, 1, 0, '2011-10-18 10:07:27', '2011-10-18 10:07:27'),
(131, 1, 'hhhhhhhhhhhh', 'ttttttttttttttttttttttt', 0, 1, 0, 0, 1, 0, '2011-10-18 10:08:05', '2011-10-18 10:08:05'),
(132, 1, 'hhhhhhhhhhhh', 'ttttttttttttttttttttttt', 0, 1, 0, 0, 1, 0, '2011-10-18 10:08:05', '2011-10-18 10:08:05'),
(133, 1, 'fsdfsda', 'sdfsdfád', 0, 1, 0, 0, 1, 0, '2011-10-18 10:16:03', '2011-10-18 10:16:03'),
(134, 1, 'hfdghdfghdf', 'hdfgdfgsdf', 0, 1, 0, 0, 1, 0, '2011-10-19 12:33:43', '2011-10-19 12:33:43'),
(135, 1, 'hfdghdfghdf', 'hdfgdfgsdf', 0, 1, 0, 0, 1, 0, '2011-10-19 12:33:43', '2011-10-19 12:33:44'),
(136, 1, 'hfdghdfghdf', 'hdfgdfgsdf', 0, 0, 0, 0, 1, 0, '2011-10-19 12:33:57', '2011-10-19 12:33:57'),
(137, 1, 'hfdghdfghdf', 'hdfgdfgsdf', 0, 0, 0, 0, 1, 0, '2011-10-19 12:33:57', '2011-10-19 12:33:57'),
(138, 1, 'gsdfgsdfgsd', 'gsdfgsdfgsd', 0, 1, 0, 0, 1, 0, '2011-10-20 12:00:10', '2011-10-20 12:00:10'),
(139, 1, 'gsdfgsdfgsd', 'gsdfgsdfgsd', 0, 1, 0, 0, 1, 0, '2011-10-20 12:00:10', '2011-10-20 12:00:10'),
(140, 1, 'hhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhhhhhhh', 0, 1, 0, 0, 1, 0, '2011-10-20 12:01:08', '2011-10-20 12:01:08'),
(141, 1, 'hhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhhhhhhh', 0, 1, 0, 0, 1, 0, '2011-10-20 12:01:08', '2011-10-20 12:01:08'),
(142, 1, 'sfdgsdfgsdf', 'gsdfgsdfgsdf', 0, 1, 0, 0, 1, 0, '2011-10-22 15:41:58', '2011-10-22 15:41:59'),
(143, 1, 'tttttttttttt', 'tttttttttttttttttttt', 0, 1, 0, 0, 1, 0, '2011-10-22 16:16:27', '2011-10-22 16:16:27'),
(144, 1, 'ggggggggggg', 'ggggggggggggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-22 16:21:28', '2011-10-22 16:21:28'),
(145, 1, 'ggggggggggg', 'ggggggggggggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-22 16:21:28', '2011-10-22 16:21:29'),
(146, 1, 'gggggggggggggg', 'gfdgsfs', 0, 1, 0, 0, 1, 0, '2011-10-22 17:26:12', '2011-10-22 17:26:12'),
(147, 1, 'ggggggggggg', 'gggggggggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-24 15:12:53', '2011-10-24 15:12:53'),
(148, 1, 'gggggggggggggg', 'gggggggggggggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-24 15:24:58', '2011-10-24 15:24:58'),
(149, 1, 'gggggggggggggg', 'gggggggggggggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-24 15:24:58', '2011-10-24 15:24:58'),
(150, 1, 'hhhhhhhhh', 'gggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-24 15:54:57', '2011-10-24 15:54:57'),
(151, 1, 'hhhhhhhhh', 'gggggggggggg', 0, 1, 0, 0, 1, 0, '2011-10-24 15:54:57', '2011-10-24 15:54:57'),
(152, 1, 'fffffffffffffff', 'fffffffffffffffffff', 1, 1, 0, 0, 1, 0, '2011-10-24 18:50:31', '2011-10-25 11:39:18'),
(153, 1, 'fffffffffffffff', 'fffffffffffffffffff', 1, 1, 0, 0, 1, 0, '2011-10-24 18:50:31', '2011-10-25 11:39:33'),
(154, 1, 'o', 'ok', 1, 1, 0, 0, 1, 0, '2011-10-25 11:37:57', '2011-10-25 11:38:31'),
(155, 1, 'o', 'ok', 1, 1, 0, 0, 1, 0, '2011-10-25 11:37:58', '2011-10-25 11:38:21'),
(156, 1, 'ok', 'ok', 0, 1, 0, 0, 1, 0, '2011-10-25 11:47:43', '2011-10-25 11:47:43'),
(157, 1, 'ok', 'ok', 0, 1, 0, 0, 1, 0, '2011-10-25 11:47:43', '2011-10-25 11:47:43'),
(158, 1, 'hhhhhhhhhhhh', 'hhhhhhhhhhhhhhh', 0, 1, 0, 0, 1, 0, '2011-10-26 12:21:31', '2011-10-26 12:21:31'),
(159, 1, 'ok', 'ok', 1, 1, 0, 0, 1, 0, '2011-10-26 12:50:18', '2011-10-27 09:52:41'),
(160, 1, 'ok', 'ok', 1, 1, 0, 0, 1, 0, '2011-10-26 12:50:18', '2011-10-27 09:52:53'),
(161, 1, 'ok', 'ok', 0, 0, 0, 0, 1, 0, '2011-10-27 09:50:50', '2011-10-27 09:50:50'),
(162, 1, 'ok', 'ok', 0, 0, 0, 0, 1, 0, '2011-10-27 09:51:33', '2011-10-27 09:51:33'),
(163, 1, 'ok', 'ok', 0, 0, 0, 0, 1, 0, '2011-10-27 09:54:13', '2011-10-27 09:54:14'),
(164, 1, 'ok', 'ok', 1, 0, 0, 0, 1, 0, '2011-10-27 09:55:42', '2011-10-27 09:59:31'),
(165, 1, 'ok', 'ok', 1, 0, 0, 0, 1, 0, '2011-10-27 09:59:04', '2011-10-27 09:59:18'),
(166, 1, 'tài liệu css', 'thực hành theo hướng dẫn', 0, 0, 0, 0, 1, 0, '2011-10-27 10:00:10', '2011-10-27 10:00:10'),
(167, 1, 'sửa giao diện', 'ok', 0, 1, 0, 0, 1, 0, '2011-10-31 11:53:55', '2011-10-31 11:53:55'),
(168, 3, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'mời bạn tham gia vào lifemap với chúng tôi để khám phá những tiện ích hấp dẫn', 0, 1, 0, 0, 2, 0, '2011-10-31 17:36:38', '2011-10-31 17:36:38'),
(169, 19, 'dflfhalkshdl', 'fjklạdlfkạdskdl', 1, 1, 0, 0, 1, 0, '2011-11-01 14:32:39', '2011-11-01 14:32:54'),
(170, 19, 'dfgsdfg', 'gsdfgsdfs', 0, 0, 0, 0, 1, 0, '2011-11-01 14:33:24', '2011-11-01 14:33:24'),
(171, 1, 'dfad', 'fadsfadsfa', 0, 1, 0, 0, 1, 0, '2011-11-02 11:41:10', '2011-11-02 11:41:11'),
(172, 1, 'fshgghdfg', 'dghdgfhdfg', 0, 1, 0, 0, 1, 0, '2011-11-02 11:45:48', '2011-11-02 11:45:48'),
(173, 1, 'ghsgfhdfg', 'jsgfhdfhdf', 0, 1, 0, 0, 1, 0, '2011-11-02 11:47:44', '2011-11-02 11:47:44'),
(174, 1, 'dgfhdfghdfg', 'hdgfhgfhdf', 0, 1, 0, 0, 1, 0, '2011-11-02 11:58:22', '2011-11-02 11:58:22'),
(175, 1, 'ghdfhdf', 'fgsdfgdfdhfg', 0, 1, 0, 0, 1, 0, '2011-11-02 14:36:26', '2011-11-02 14:36:26'),
(176, 1, 'dfhflasdjflk', 'sjfglsjfklgjsdlk', 0, 1, 0, 0, 1, 0, '2011-11-02 14:42:28', '2011-11-02 14:42:28'),
(177, 1, 'hdfghdfg', 'jkhgjkhjkghj', 0, 1, 0, 0, 1, 0, '2011-11-02 14:45:33', '2011-11-02 14:45:33'),
(178, 1, 'fhfjfty', 'ktyujrtyur', 0, 1, 0, 0, 1, 0, '2011-11-02 14:48:21', '2011-11-02 14:48:21'),
(179, 1, 'kyuityui', 'yukjtyuryt', 0, 1, 0, 0, 1, 0, '2011-11-02 14:49:21', '2011-11-02 14:49:21'),
(180, 1, 'hdgfhdgfh', 'hdgghdfgsdf', 0, 1, 0, 0, 1, 0, '2011-11-02 15:03:55', '2011-11-02 15:03:55'),
(181, 1, 'sdghdfhfg', 'hdghdfghdfghd', 0, 1, 0, 0, 1, 0, '2011-11-02 15:06:14', '2011-11-02 15:06:14'),
(182, 1, 'hjdfhjdfg', 'jdfghdfghd', 0, 1, 0, 0, 1, 0, '2011-11-02 15:12:10', '2011-11-02 15:12:10'),
(183, 1, 'hjdfhjdfg', 'jdfghdfghd', 0, 1, 0, 0, 1, 0, '2011-11-02 15:13:48', '2011-11-02 15:13:48'),
(184, 1, 'hjdfhjdfg', 'jdfghdfghd', 0, 1, 0, 0, 1, 0, '2011-11-02 15:14:01', '2011-11-02 15:14:01'),
(185, 1, 'hjdfhjdfg', 'jdfghdfghd', 0, 1, 0, 0, 1, 0, '2011-11-02 15:15:08', '2011-11-02 15:15:09'),
(186, 1, 'ghrthyer', 'hertyertye', 0, 1, 0, 0, 1, 0, '2011-11-02 15:17:00', '2011-11-02 15:17:00'),
(187, 1, 'gfhertdyerr', 'yetyeter', 0, 1, 0, 0, 1, 0, '2011-11-02 15:19:12', '2011-11-02 15:19:12'),
(188, 1, 'hfgjhfgjf', 'jfgjgfhjfgh', 0, 1, 0, 0, 1, 0, '2011-11-02 15:20:52', '2011-11-02 15:20:53'),
(189, 1, 'gsfgs', 'gsdfgsdf', 0, 1, 0, 0, 1, 0, '2011-11-02 15:24:45', '2011-11-02 15:24:45'),
(190, 1, 'hdfgjfgjd', 'jdfghfg', 0, 1, 0, 0, 1, 0, '2011-11-02 15:32:07', '2011-11-02 15:32:07'),
(191, 1, 'gádgsdfgs', 'hgsadfgsdf', 0, 1, 0, 0, 1, 0, '2011-11-02 15:38:33', '2011-11-02 15:38:33'),
(192, 1, 'ghsdhsdf', 'hsdffhsdfgs', 0, 1, 0, 0, 1, 0, '2011-11-02 16:18:43', '2011-11-02 16:18:43'),
(193, 1, 'sdgfsdgs', 'gsafgasdga', 0, 1, 0, 0, 1, 0, '2011-11-02 17:39:01', '2011-11-02 17:39:01'),
(194, 1, 'hsdhsdf', 'hsdfghsdf', 0, 1, 0, 0, 1, 0, '2011-11-03 10:30:52', '2011-11-03 10:30:52'),
(195, 1, 'Tin nhắn đường dẫn yêu cầu Bạn bè', 'Chào mừng bạn tham gia vào lifemap với chúng tôi', 0, 1, 0, 0, 2, 0, '2011-11-03 11:02:41', '2011-11-03 11:02:41'),
(196, 1, 'fdsgdfgs', 'gasfdgsdfs', 0, 1, 0, 0, 1, 0, '2011-11-04 09:09:04', '2011-11-04 09:09:04'),
(197, 1, 'ghgjhgjh', 'hgfhgfgh', 0, 1, 0, 0, 1, 0, '2011-12-29 21:24:36', '2011-12-29 21:24:36'),
(198, 1, 'ghgjhgjh', 'hgfhgfgh', 0, 1, 0, 0, 1, 0, '2011-12-29 21:24:36', '2011-12-29 21:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `message_file`
--

CREATE TABLE IF NOT EXISTS `message_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_id_idx` (`message_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `message_file`
--


-- --------------------------------------------------------

--
-- Table structure for table `message_send_list`
--

CREATE TABLE IF NOT EXISTS `message_send_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `message_id_idx` (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `message_send_list`
--

INSERT INTO `message_send_list` (`id`, `member_id`, `message_id`, `is_read`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 9, 1, 1, 0, '2011-07-06 06:39:42', '2011-07-06 06:39:42'),
(2, 3, 2, 1, 0, '2011-07-06 06:40:00', '2011-09-16 09:40:42'),
(3, 1, 3, 1, 1, '2011-07-09 11:15:54', '2011-10-13 13:15:18'),
(4, 14, 4, 1, 0, '2011-07-28 14:06:31', '2011-07-28 14:06:31'),
(5, 3, 5, 1, 0, '2011-07-30 12:10:22', '2011-07-30 12:10:22'),
(6, 16, 6, 1, 0, '2011-07-31 06:38:21', '2011-07-31 06:38:21'),
(7, 3, 7, 1, 0, '2011-08-22 14:40:02', '2011-08-22 14:40:02'),
(8, 20, 8, 1, 0, '2011-08-25 21:38:33', '2011-08-25 21:38:33'),
(9, 17, 9, 1, 0, '2011-08-25 21:38:55', '2011-08-25 21:38:55'),
(10, 15, 10, 1, 0, '2011-08-25 21:39:38', '2011-08-25 21:39:38'),
(11, 19, 11, 1, 0, '2011-08-27 11:41:28', '2011-08-27 11:41:28'),
(12, 18, 12, 1, 0, '2011-08-27 11:43:30', '2011-09-15 18:47:59'),
(13, 17, 13, 1, 0, '2011-08-27 11:44:50', '2011-08-27 11:44:50'),
(14, 20, 14, 1, 0, '2011-08-27 11:45:43', '2011-08-27 11:45:43'),
(15, 17, 15, 1, 0, '2011-08-27 11:46:09', '2011-08-27 11:46:09'),
(16, 16, 16, 1, 0, '2011-08-27 11:46:27', '2011-08-27 11:46:27'),
(17, 15, 17, 1, 0, '2011-08-27 11:47:08', '2011-08-27 11:47:08'),
(18, 14, 18, 1, 0, '2011-08-27 11:47:46', '2011-08-27 11:47:46'),
(19, 14, 19, 1, 0, '2011-08-27 11:48:31', '2011-08-27 11:48:31'),
(20, 11, 20, 1, 0, '2011-08-27 11:49:10', '2011-08-27 11:49:10'),
(21, 9, 21, 1, 0, '2011-08-27 11:49:34', '2011-08-27 11:49:34'),
(22, 5, 22, 1, 0, '2011-08-27 11:49:58', '2011-08-27 11:49:58'),
(23, 16, 23, 1, 0, '2011-08-27 11:50:30', '2011-08-27 11:50:30'),
(24, 15, 24, 1, 0, '2011-08-27 11:51:13', '2011-08-27 11:51:13'),
(25, 11, 25, 1, 0, '2011-08-27 11:51:42', '2011-08-27 11:51:42'),
(26, 5, 26, 1, 0, '2011-08-27 11:52:20', '2011-08-27 11:52:20'),
(27, 17, 27, 1, 0, '2011-08-27 11:58:07', '2011-08-27 11:58:07'),
(28, 16, 28, 1, 0, '2011-08-27 11:58:30', '2011-08-27 11:58:30'),
(29, 14, 29, 1, 0, '2011-08-27 11:59:01', '2011-08-27 11:59:01'),
(30, 5, 30, 1, 0, '2011-08-27 12:00:09', '2011-08-27 12:00:09'),
(31, 3, 31, 1, 0, '2011-08-27 12:00:30', '2011-08-27 12:00:30'),
(32, 18, 32, 1, 1, '2011-08-29 09:58:12', '2011-09-15 16:28:06'),
(33, 14, 33, 0, 1, '2011-08-30 21:18:31', '2011-08-30 21:18:31'),
(34, 1, 34, 0, 1, '2011-08-31 21:19:28', '2011-08-31 21:19:28'),
(35, 1, 35, 1, 0, '2011-09-05 09:19:14', '2011-09-14 10:06:43'),
(36, 1, 36, 1, 0, '2011-09-06 15:27:05', '2011-09-14 10:06:26'),
(37, 1, 37, 1, 0, '2011-09-06 15:34:49', '2011-09-14 11:53:58'),
(38, 1, 38, 1, 0, '2011-09-06 15:56:22', '2011-09-15 21:15:04'),
(39, 1, 39, 1, 0, '2011-09-13 14:51:42', '2011-09-15 21:59:25'),
(40, 18, 40, 1, 0, '2011-09-15 17:03:37', '2011-09-15 18:44:43'),
(41, 1, 41, 0, 0, '2011-09-15 17:55:58', '2011-09-15 17:55:58'),
(42, 1, 42, 0, 0, '2011-09-15 18:04:10', '2011-09-15 18:04:10'),
(43, 1, 43, 0, 0, '2011-09-15 18:08:12', '2011-09-15 18:08:12'),
(44, 1, 44, 0, 0, '2011-09-15 18:09:45', '2011-09-15 18:09:45'),
(45, 18, 45, 1, 0, '2011-09-15 19:19:47', '2011-09-19 14:59:09'),
(46, 18, 46, 0, 0, '2011-09-15 19:46:13', '2011-09-15 19:46:13'),
(47, 18, 47, 0, 0, '2011-09-15 21:57:44', '2011-09-15 21:57:44'),
(48, 5, 48, 0, 0, '2011-09-19 10:09:18', '2011-09-19 10:09:18'),
(49, 15, 49, 0, 0, '2011-09-19 10:10:59', '2011-09-19 10:10:59'),
(50, 1, 50, 0, 0, '2011-09-19 11:11:40', '2011-09-19 11:11:40'),
(51, 1, 51, 0, 0, '2011-09-19 11:13:20', '2011-09-19 11:13:20'),
(52, 1, 52, 0, 0, '2011-09-19 11:23:35', '2011-09-19 11:23:35'),
(53, 1, 53, 0, 0, '2011-09-19 11:27:05', '2011-09-19 11:27:05'),
(54, 19, 54, 0, 0, '2011-09-19 11:32:58', '2011-09-19 11:32:58'),
(55, 20, 55, 1, 0, '2011-09-19 11:33:49', '2011-09-22 22:39:34'),
(56, 1, 56, 0, 0, '2011-09-19 12:31:40', '2011-09-19 12:31:40'),
(57, 1, 57, 0, 0, '2011-09-19 12:39:51', '2011-09-19 12:39:51'),
(58, 1, 58, 0, 0, '2011-09-19 12:43:02', '2011-09-19 12:43:02'),
(59, 1, 59, 0, 0, '2011-09-19 12:44:11', '2011-09-19 12:44:11'),
(60, 1, 60, 0, 0, '2011-09-19 13:15:06', '2011-09-19 13:15:06'),
(61, 1, 61, 0, 0, '2011-09-19 15:07:09', '2011-09-19 15:07:09'),
(62, 1, 62, 0, 0, '2011-09-19 15:07:35', '2011-09-19 15:07:35'),
(63, 20, 63, 1, 0, '2011-09-19 15:08:01', '2011-09-22 22:39:17'),
(64, 19, 64, 0, 0, '2011-09-19 15:08:31', '2011-09-19 15:08:31'),
(65, 19, 65, 0, 0, '2011-09-19 15:08:56', '2011-09-19 15:08:56'),
(66, 20, 66, 1, 0, '2011-09-19 15:09:41', '2011-09-22 22:39:01'),
(67, 20, 67, 0, 0, '2011-09-19 15:11:22', '2011-09-19 15:11:22'),
(68, 1, 68, 0, 0, '2011-09-19 15:16:57', '2011-09-19 15:16:57'),
(69, 18, 69, 0, 0, '2011-09-19 16:12:20', '2011-09-19 16:12:20'),
(70, 18, 70, 0, 0, '2011-09-19 16:28:08', '2011-09-19 16:28:08'),
(71, 18, 71, 0, 0, '2011-09-19 16:31:18', '2011-09-19 16:31:18'),
(72, 20, 72, 1, 0, '2011-09-19 16:37:15', '2011-09-22 22:38:47'),
(73, 18, 73, 0, 0, '2011-09-19 16:37:41', '2011-09-19 16:37:41'),
(74, 18, 74, 0, 0, '2011-09-19 16:40:04', '2011-09-19 16:40:04'),
(75, 18, 75, 0, 0, '2011-09-19 16:47:53', '2011-09-19 16:47:53'),
(76, 18, 76, 0, 0, '2011-09-19 16:48:40', '2011-09-19 16:48:40'),
(77, 18, 77, 0, 0, '2011-09-19 16:51:26', '2011-09-19 16:51:26'),
(78, 18, 78, 0, 0, '2011-09-19 16:52:49', '2011-09-19 16:52:49'),
(79, 18, 79, 0, 0, '2011-09-19 16:59:01', '2011-09-19 16:59:01'),
(80, 18, 80, 0, 0, '2011-09-19 17:05:08', '2011-09-19 17:05:08'),
(81, 18, 81, 0, 0, '2011-09-19 17:06:11', '2011-09-19 17:06:11'),
(82, 18, 82, 0, 0, '2011-09-19 17:06:20', '2011-09-19 17:06:20'),
(83, 18, 83, 0, 0, '2011-09-19 17:06:30', '2011-09-19 17:06:30'),
(84, 18, 84, 0, 0, '2011-09-19 17:07:27', '2011-09-19 17:07:27'),
(85, 18, 85, 0, 0, '2011-09-19 18:33:26', '2011-09-19 18:33:26'),
(86, 1, 86, 0, 0, '2011-09-20 14:53:27', '2011-09-20 14:53:27'),
(87, 1, 87, 0, 0, '2011-09-20 14:55:16', '2011-09-20 14:55:16'),
(88, 1, 88, 0, 0, '2011-09-20 14:55:52', '2011-09-20 14:55:52'),
(89, 19, 89, 0, 0, '2011-09-20 14:55:53', '2011-09-20 14:55:53'),
(90, 1, 90, 0, 0, '2011-09-20 14:58:24', '2011-09-20 14:58:24'),
(91, 1, 91, 0, 0, '2011-09-20 14:58:45', '2011-09-20 14:58:45'),
(92, 19, 92, 0, 0, '2011-09-20 14:58:45', '2011-09-20 14:58:45'),
(93, 1, 93, 0, 0, '2011-10-03 12:35:51', '2011-10-03 12:35:51'),
(94, 1, 94, 1, 0, '2011-10-03 12:36:20', '2011-11-03 10:32:59'),
(95, 1, 95, 0, 1, '2011-10-03 12:37:54', '2011-10-21 09:32:21'),
(96, 1, 96, 0, 1, '2011-10-03 12:38:54', '2011-10-13 14:24:55'),
(97, 1, 97, 0, 1, '2011-10-03 12:41:12', '2011-10-13 14:24:40'),
(98, 19, 98, 0, 0, '2011-10-03 12:41:12', '2011-10-03 12:41:12'),
(99, 3, 99, 0, 0, '2011-10-17 15:52:46', '2011-10-17 15:52:46'),
(100, 3, 100, 0, 0, '2011-10-17 15:55:26', '2011-10-17 15:55:26'),
(101, 3, 101, 0, 0, '2011-10-17 15:58:04', '2011-10-17 15:58:04'),
(102, 3, 102, 0, 0, '2011-10-17 15:58:58', '2011-10-17 15:58:58'),
(103, 3, 103, 0, 0, '2011-10-17 16:02:32', '2011-10-17 16:02:32'),
(104, 3, 104, 0, 0, '2011-10-17 16:51:09', '2011-10-17 16:51:09'),
(105, 3, 105, 0, 0, '2011-10-17 17:28:57', '2011-10-17 17:28:57'),
(106, 18, 106, 0, 0, '2011-10-17 17:28:58', '2011-10-17 17:28:58'),
(107, 3, 107, 0, 0, '2011-10-17 17:31:09', '2011-10-17 17:31:09'),
(108, 15, 108, 0, 0, '2011-10-17 17:31:09', '2011-10-17 17:31:09'),
(109, 3, 109, 0, 0, '2011-10-17 17:32:32', '2011-10-17 17:32:32'),
(110, 15, 110, 0, 0, '2011-10-17 17:32:32', '2011-10-17 17:32:32'),
(111, 3, 111, 0, 0, '2011-10-17 17:42:32', '2011-10-17 17:42:32'),
(112, 3, 112, 0, 0, '2011-10-17 17:44:31', '2011-10-17 17:44:31'),
(113, 15, 113, 0, 0, '2011-10-17 17:44:31', '2011-10-17 17:44:31'),
(114, 3, 114, 0, 0, '2011-10-17 18:18:05', '2011-10-17 18:18:05'),
(115, 3, 115, 0, 0, '2011-10-17 18:23:41', '2011-10-17 18:23:41'),
(116, 15, 116, 0, 0, '2011-10-17 18:23:41', '2011-10-17 18:23:41'),
(117, 3, 117, 0, 0, '2011-10-17 18:24:56', '2011-10-17 18:24:56'),
(118, 18, 118, 0, 0, '2011-10-17 18:24:57', '2011-10-17 18:24:57'),
(119, 3, 119, 0, 0, '2011-10-17 18:29:32', '2011-10-17 18:29:32'),
(120, 18, 120, 0, 0, '2011-10-17 18:29:32', '2011-10-17 18:29:32'),
(121, 3, 121, 0, 0, '2011-10-17 18:30:51', '2011-10-17 18:30:51'),
(122, 18, 122, 0, 0, '2011-10-17 18:30:52', '2011-10-17 18:30:52'),
(123, 3, 123, 0, 0, '2011-10-18 09:43:28', '2011-10-18 09:43:28'),
(124, 18, 124, 0, 0, '2011-10-18 09:43:28', '2011-10-18 09:43:28'),
(125, 3, 125, 0, 0, '2011-10-18 09:47:43', '2011-10-18 09:47:43'),
(126, 18, 126, 0, 0, '2011-10-18 09:47:44', '2011-10-18 09:47:44'),
(127, 3, 127, 0, 0, '2011-10-18 09:49:21', '2011-10-18 09:49:21'),
(128, 18, 128, 0, 0, '2011-10-18 09:49:21', '2011-10-18 09:49:21'),
(129, 3, 129, 0, 0, '2011-10-18 10:07:26', '2011-10-18 10:07:26'),
(130, 18, 130, 0, 0, '2011-10-18 10:07:27', '2011-10-18 10:07:27'),
(131, 3, 131, 0, 0, '2011-10-18 10:08:05', '2011-10-18 10:08:05'),
(132, 18, 132, 0, 0, '2011-10-18 10:08:05', '2011-10-18 10:08:05'),
(133, 3, 133, 0, 0, '2011-10-18 10:16:03', '2011-10-18 10:16:03'),
(134, 3, 134, 0, 0, '2011-10-19 12:33:43', '2011-10-19 12:33:43'),
(135, 18, 135, 0, 0, '2011-10-19 12:33:43', '2011-10-19 12:33:43'),
(136, 3, 136, 0, 0, '2011-10-19 12:33:57', '2011-10-19 12:33:57'),
(137, 18, 137, 0, 0, '2011-10-19 12:33:57', '2011-10-19 12:33:57'),
(138, 3, 138, 0, 0, '2011-10-20 12:00:10', '2011-10-20 12:00:10'),
(139, 18, 139, 0, 0, '2011-10-20 12:00:10', '2011-10-20 12:00:10'),
(140, 3, 140, 0, 0, '2011-10-20 12:01:08', '2011-10-20 12:01:08'),
(141, 18, 141, 0, 0, '2011-10-20 12:01:08', '2011-10-20 12:01:08'),
(142, 3, 142, 0, 0, '2011-10-22 15:41:59', '2011-10-22 15:41:59'),
(143, 3, 143, 0, 0, '2011-10-22 16:16:27', '2011-10-22 16:16:27'),
(144, 3, 144, 0, 0, '2011-10-22 16:21:28', '2011-10-22 16:21:28'),
(145, 18, 145, 0, 0, '2011-10-22 16:21:29', '2011-10-22 16:21:29'),
(146, 18, 146, 0, 0, '2011-10-22 17:26:12', '2011-10-22 17:26:12'),
(147, 3, 147, 0, 0, '2011-10-24 15:12:53', '2011-10-24 15:12:53'),
(148, 3, 148, 0, 0, '2011-10-24 15:24:58', '2011-10-24 15:24:58'),
(149, 3, 149, 0, 0, '2011-10-24 15:24:58', '2011-10-24 15:24:58'),
(150, 3, 150, 0, 0, '2011-10-24 15:54:57', '2011-10-24 15:54:57'),
(151, 18, 151, 0, 0, '2011-10-24 15:54:57', '2011-10-24 15:54:57'),
(152, 3, 152, 0, 0, '2011-10-24 18:50:31', '2011-10-24 18:50:31'),
(153, 18, 153, 0, 0, '2011-10-24 18:50:31', '2011-10-24 18:50:31'),
(154, 3, 154, 0, 0, '2011-10-25 11:37:57', '2011-10-25 11:37:57'),
(155, 18, 155, 0, 0, '2011-10-25 11:37:58', '2011-10-25 11:37:58'),
(156, 18, 156, 0, 0, '2011-10-25 11:47:43', '2011-10-25 11:47:43'),
(157, 3, 157, 0, 0, '2011-10-25 11:47:43', '2011-10-25 11:47:43'),
(158, 18, 158, 0, 0, '2011-10-26 12:21:31', '2011-10-26 12:21:31'),
(159, 17, 159, 0, 0, '2011-10-26 12:50:18', '2011-10-26 12:50:18'),
(160, 3, 160, 0, 0, '2011-10-26 12:50:18', '2011-10-26 12:50:18'),
(161, 3, 161, 0, 0, '2011-10-27 09:50:50', '2011-10-27 09:50:50'),
(162, 3, 162, 0, 0, '2011-10-27 09:51:33', '2011-10-27 09:51:33'),
(163, 3, 163, 0, 0, '2011-10-27 09:54:13', '2011-10-27 09:54:13'),
(164, 3, 164, 0, 0, '2011-10-27 09:55:42', '2011-10-27 09:55:42'),
(165, 3, 165, 0, 0, '2011-10-27 09:59:04', '2011-10-27 09:59:04'),
(166, 3, 166, 0, 0, '2011-10-27 10:00:10', '2011-10-27 10:00:10'),
(167, 18, 167, 1, 0, '2011-10-31 11:53:55', '2011-10-31 15:09:11'),
(168, 19, 168, 1, 0, '2011-10-31 17:36:38', '2011-10-31 17:36:38'),
(169, 18, 169, 0, 0, '2011-11-01 14:32:39', '2011-11-01 14:32:39'),
(170, 18, 170, 0, 0, '2011-11-01 14:33:24', '2011-11-01 14:33:24'),
(171, 18, 171, 0, 0, '2011-11-02 11:41:11', '2011-11-02 11:41:11'),
(172, 18, 172, 0, 0, '2011-11-02 11:45:48', '2011-11-02 11:45:48'),
(173, 18, 173, 0, 0, '2011-11-02 11:47:44', '2011-11-02 11:47:44'),
(174, 18, 174, 0, 0, '2011-11-02 11:58:22', '2011-11-02 11:58:22'),
(175, 18, 175, 0, 0, '2011-11-02 14:36:26', '2011-11-02 14:36:26'),
(176, 18, 176, 0, 0, '2011-11-02 14:42:28', '2011-11-02 14:42:28'),
(177, 18, 177, 0, 0, '2011-11-02 14:45:33', '2011-11-02 14:45:33'),
(178, 18, 178, 0, 0, '2011-11-02 14:48:21', '2011-11-02 14:48:21'),
(179, 18, 179, 0, 0, '2011-11-02 14:49:21', '2011-11-02 14:49:21'),
(180, 18, 180, 0, 0, '2011-11-02 15:03:55', '2011-11-02 15:03:55'),
(181, 18, 181, 0, 0, '2011-11-02 15:06:14', '2011-11-02 15:06:14'),
(182, 18, 182, 0, 0, '2011-11-02 15:12:10', '2011-11-02 15:12:10'),
(183, 18, 183, 0, 0, '2011-11-02 15:13:48', '2011-11-02 15:13:48'),
(184, 18, 184, 0, 0, '2011-11-02 15:14:01', '2011-11-02 15:14:01'),
(185, 18, 185, 0, 0, '2011-11-02 15:15:08', '2011-11-02 15:15:08'),
(186, 18, 186, 0, 0, '2011-11-02 15:17:00', '2011-11-02 15:17:00'),
(187, 18, 187, 0, 0, '2011-11-02 15:19:12', '2011-11-02 15:19:12'),
(188, 18, 188, 0, 0, '2011-11-02 15:20:53', '2011-11-02 15:20:53'),
(189, 18, 189, 0, 0, '2011-11-02 15:24:45', '2011-11-02 15:24:45'),
(190, 18, 190, 0, 0, '2011-11-02 15:32:07', '2011-11-02 15:32:07'),
(191, 18, 191, 0, 0, '2011-11-02 15:38:33', '2011-11-02 15:38:33'),
(192, 18, 192, 0, 0, '2011-11-02 16:18:43', '2011-11-02 16:18:43'),
(193, 18, 193, 0, 0, '2011-11-02 17:39:01', '2011-11-02 17:39:01'),
(194, 18, 194, 0, 0, '2011-11-03 10:30:52', '2011-11-03 10:30:52'),
(195, 19, 195, 1, 0, '2011-11-03 11:02:41', '2011-11-03 11:02:41'),
(196, 18, 196, 0, 0, '2011-11-04 09:09:04', '2011-11-04 09:09:04'),
(197, 18, 197, 0, 0, '2011-12-29 21:24:36', '2011-12-29 21:24:36'),
(198, 17, 198, 0, 0, '2011-12-29 21:24:36', '2011-12-29 21:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `message_type`
--

CREATE TABLE IF NOT EXISTS `message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` text NOT NULL,
  `foreign_table` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `message_type`
--

INSERT INTO `message_type` (`id`, `type_name`, `foreign_table`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'message', NULL, 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(2, 'friend_link', NULL, 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(3, 'community_message', 'community', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(4, 'community_taking_over', 'community', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(5, 'community_joining_request', 'community_member', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `message_type_translation`
--

CREATE TABLE IF NOT EXISTS `message_type_translation` (
  `id` int(11) NOT NULL DEFAULT '0',
  `body` text,
  `subject` text,
  `caption` text NOT NULL,
  `info` text,
  `lang` char(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message_type_translation`
--

INSERT INTO `message_type_translation` (`id`, `body`, `subject`, `caption`, `info`, `lang`) VALUES
(1, NULL, NULL, '通常のメッセージ', NULL, 'ja_JP'),
(2, NULL, NULL, 'フレンド申請', NULL, 'ja_JP'),
(3, NULL, NULL, 'コミュニティ一括メッセージ', NULL, 'ja_JP'),
(4, NULL, NULL, 'コミュニティ管理者交代メッセージ', NULL, 'ja_JP'),
(5, NULL, NULL, 'コミュニティ参加申請メッセージ', NULL, 'ja_JP');

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE IF NOT EXISTS `navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Navigation type',
  `uri` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Linked page''s URI',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_sort_order_INDEX_idx` (`type`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of navigation items' AUTO_INCREMENT=82 ;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`id`, `type`, `uri`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'secure_global', '@homepage', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(2, 'secure_global', 'pos/home', 10, '2011-06-22 08:46:11', '2011-12-29 17:09:42'),
(3, 'secure_global', '@rent_house', 20, '2011-06-22 08:46:11', '2011-12-05 14:24:31'),
(7, 'default', '@homepage', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(8, 'default', '@friend_list', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(11, 'friend', '@member_profile', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(12, 'friend', '@friend_list', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(13, 'community', '@community_home', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(14, 'community', '@community_join', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(15, 'community', '@community_quit', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(16, 'mobile_home_side', '@member_invite', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(17, 'mobile_home', '@friend_list', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(18, 'mobile_home', '@community_joinlist', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(19, 'mobile_home_center', '@member_profile_mine', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(20, 'backend_side', 'member/index', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(21, 'backend_side', 'monitoring/index', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(23, 'backend_side', 'sns/config', 40, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(24, 'backend_side', '@mail_config', 35, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(26, 'backend_side', 'navigation/index', 60, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(27, 'backend_side', 'profile/list', 70, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(29, 'backend_side', 'admin/index', 90, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(31, 'default', '@album_list_mine', 15, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(34, 'mobile_home', 'ashiato/list', 12, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(36, 'community', 'communityTopic/listCommunity', 5, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(37, 'community', 'communityEvent/listCommunity', 6, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(40, 'default', 'diary/listMember', 15, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(41, 'friend', 'diary/listMember', 15, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(42, 'mobile_home_side', '@diary_new', 15, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(43, 'mobile_home_side', '@diary_list', 16, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(45, 'friend', 'favorite/add', 21, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(46, 'mobile_home_side', 'favorite/list', 25, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(47, 'friend', '@obj_member_introfriend', 21, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(48, 'default', 'message/index', 11, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(49, 'friend', 'message/sendToFriend', 22, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(50, 'mobile_home_side', 'message/index', 20, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(52, 'friend', '@application_list', 25, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(53, 'secure_global', '@member_index', 23, '2011-06-22 08:46:11', '2011-12-29 17:09:36'),
(54, 'mobile_home_side', '@ranking', 23, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(56, 'insecure_global', '@homepage', 20, '2011-07-11 23:39:22', '2011-07-11 23:39:22'),
(57, 'insecure_global', 'pos/home', 30, '2011-07-11 23:39:37', '2011-12-29 17:09:26'),
(58, 'insecure_global', '@rent_house', 40, '2011-07-11 23:40:07', '2011-12-05 14:07:20'),
(63, 'default', '@member_invite', 50, '2011-07-13 23:56:41', '2011-07-13 23:56:41'),
(64, 'insecure_login_global', '@member_logout', 10, '2011-07-16 15:23:19', '2011-07-16 15:23:19'),
(65, 'insecure_login_global', '@member_logout', 20, '2011-07-16 15:23:46', '2011-07-16 15:23:46'),
(66, 'default', '@community_search', 60, '2011-07-16 15:47:59', '2011-07-16 15:47:59'),
(67, 'default', '@member_search', 70, '2011-07-16 15:49:17', '2011-07-16 15:49:17'),
(68, 'insecure_global', '@member_index', 50, '2011-07-17 14:57:08', '2011-12-29 17:08:40'),
(69, 'secure_login_global', 'diary/new', 40, '2011-08-03 03:54:38', '2011-08-03 03:54:38'),
(70, 'secure_login_global', 'album/new', 50, '2011-08-03 03:56:15', '2011-08-03 03:56:15'),
(71, 'secure_login_global', 'community/edit', 60, '2011-08-03 04:14:26', '2011-08-03 04:14:26'),
(72, 'secure_login_global', '@member_invite', 70, '2011-08-03 04:39:57', '2011-08-03 04:39:57'),
(73, 'secure_dashboard_global', '@dashboard_main', 10, '2011-06-22 08:46:11', '2012-01-11 09:05:42'),
(74, 'insecure_dashboard_global', '@dashboard_main', 10, '2011-06-22 08:46:11', '2012-01-11 09:06:06'),
(75, 'secure_dashboard_global', '@dashboard_pos', 20, '2012-01-04 10:17:57', '2012-01-06 17:06:13'),
(76, 'insecure_dashboard_global', '@dashboard_pos', 20, '2012-01-04 10:18:10', '2012-01-06 17:06:15'),
(77, 'insecure_dashboard_global', '@dashboard_rentHouse', 30, '2012-01-04 10:19:26', '2012-01-10 11:27:23'),
(78, 'secure_dashboard_global', '@dashboard_rentHouse', 30, '2012-01-04 10:19:41', '2012-01-10 11:27:03'),
(79, 'secure_dashboard_global', '@dashboard_member', 40, '2012-01-04 10:20:15', '2012-01-11 18:01:23'),
(80, 'insecure_dashboard_global', '@dashboard_member', 40, '2012-01-04 10:20:30', '2012-01-11 18:04:52'),
(81, 'backend_side', 'pos/list', 100, '2012-01-06 17:53:21', '2012-01-06 17:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_translation`
--

CREATE TABLE IF NOT EXISTS `navigation_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `caption` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `navigation_translation`
--

INSERT INTO `navigation_translation` (`id`, `caption`, `lang`) VALUES
(1, 'Main Page', 'en'),
(1, 'Trang chủ', 'ja_JP'),
(1, 'Trang chủ', 'vi_VN'),
(2, 'My Home', 'en'),
(2, 'Trang cá nhân', 'ja_JP'),
(2, 'Địa điểm', 'vi_VN'),
(3, 'My Map', 'en'),
(3, 'Bản đồ', 'ja_JP'),
(3, 'Nhà cho thuê', 'vi_VN'),
(7, 'Home', 'en'),
(7, 'Trang cá nhân', 'ja_JP'),
(7, 'Trang cá nhân', 'vi_VN'),
(8, 'My Friends', 'en'),
(8, 'Bạn bè', 'ja_JP'),
(8, 'Bạn bè', 'vi_VN'),
(11, 'Home', 'en'),
(11, 'ホーム', 'ja_JP'),
(11, 'Thông tin', 'vi_VN'),
(12, 'Friends', 'en'),
(12, 'フレンドリスト', 'ja_JP'),
(12, 'Bạn bè', 'vi_VN'),
(13, 'Community Top', 'en'),
(13, 'コミュニティトップ', 'ja_JP'),
(13, 'Trang chính', 'vi_VN'),
(14, 'Join Community', 'en'),
(14, 'コミュニティに参加', 'ja_JP'),
(14, 'Tham gia', 'vi_VN'),
(15, 'Leave Community', 'en'),
(15, 'コミュニティを退会', 'ja_JP'),
(15, 'Rời nhóm', 'vi_VN'),
(16, 'Invite', 'en'),
(16, '[i:140]友人を誘う', 'ja_JP'),
(17, 'My Friends', 'en'),
(17, '[i:140]ﾏｲﾌﾚﾝﾄﾞ', 'ja_JP'),
(18, 'Communities', 'en'),
(18, '[i:155]参加ｺﾐｭﾆﾃｨ', 'ja_JP'),
(19, 'Profile', 'en'),
(19, '[i:140]ﾌﾟﾛﾌｨｰﾙ', 'ja_JP'),
(20, 'Members', 'en'),
(20, 'メンバー管理', 'ja_JP'),
(21, 'Media', 'en'),
(21, '画像・書き込み管理', 'ja_JP'),
(23, 'SNS', 'en'),
(23, 'SNS設定', 'ja_JP'),
(24, 'Email', 'en'),
(24, 'メール設定', 'ja_JP'),
(26, 'Navigations', 'en'),
(26, 'ナビゲーション設定', 'ja_JP'),
(27, 'Profile', 'en'),
(27, 'プロフィール項目設定', 'ja_JP'),
(29, 'Administration settings', 'en'),
(29, '管理画面設定', 'ja_JP'),
(31, 'Album', 'en'),
(31, 'Album ảnh', 'ja_JP'),
(31, 'Album ảnh', 'vi_VN'),
(34, 'Footprint', 'en'),
(34, '[i:91]あしあと', 'ja_JP'),
(36, 'Topics', 'en'),
(36, 'トピックリスト', 'ja_JP'),
(36, 'Chủ đề', 'vi_VN'),
(37, 'Events', 'en'),
(37, 'イベントリスト', 'ja_JP'),
(37, 'Sự kiện', 'vi_VN'),
(40, 'Diary', 'en'),
(40, 'Nhật ký', 'ja_JP'),
(40, 'Nhật ký', 'vi_VN'),
(41, 'Diary', 'en'),
(41, '日記', 'ja_JP'),
(41, 'Nhật ký', 'vi_VN'),
(42, 'Post a Diary', 'en'),
(42, '日記を書く', 'ja_JP'),
(43, 'Recently Posted Diaries', 'en'),
(43, '最新日記', 'ja_JP'),
(45, 'Add to favorite', 'en'),
(45, 'お気に入りに追加', 'ja_JP'),
(45, 'Sở thích', 'vi_VN'),
(46, 'Favorite', 'en'),
(46, 'お気に入り', 'ja_JP'),
(47, 'Write introductory', 'en'),
(47, '紹介文を書く', 'ja_JP'),
(47, 'Thông tin giới thiệu', 'vi_VN'),
(48, 'Message', 'en'),
(48, 'Tin nhắn', 'ja_JP'),
(48, 'Tin nhắn', 'vi_VN'),
(49, 'Send Message', 'en'),
(49, 'メッセージを送る', 'ja_JP'),
(49, 'Gửi tin nhắn', 'vi_VN'),
(50, 'Message', 'en'),
(50, 'ﾒｯｾｰｼﾞ', 'ja_JP'),
(52, 'Apps', 'en'),
(52, 'アプリ', 'ja_JP'),
(52, 'Ứng dụng', 'vi_VN'),
(53, 'My Apps', 'en'),
(53, 'Ứng dụng', 'ja_JP'),
(53, 'Trang cá nhân', 'vi_VN'),
(54, 'Rankingﾞ', 'en'),
(54, '[i:191]ﾗﾝｷﾝｸﾞ', 'ja_JP'),
(56, 'Main Page', 'en'),
(56, 'Trang chủ', 'ja_JP'),
(56, 'Trang chủ', 'vi_VN'),
(57, 'My Home', 'en'),
(57, 'Trang cá nhân', 'ja_JP'),
(57, 'Địa điểm', 'vi_VN'),
(58, 'My Map', 'en'),
(58, 'Bản đồ', 'ja_JP'),
(58, 'Nhà cho thuê', 'vi_VN'),
(63, 'Invite', 'en'),
(63, 'Mời bạn bè', 'ja_JP'),
(63, 'Mời bạn bè', 'vi_VN'),
(64, 'Login', 'en'),
(64, 'Đăng nhập', 'ja_JP'),
(64, 'Đăng nhập', 'vi_VN'),
(65, 'Register', 'en'),
(65, 'Đăng ký', 'ja_JP'),
(65, 'Đăng ký', 'vi_VN'),
(66, 'Community', 'en'),
(66, 'Hội nhóm', 'ja_JP'),
(66, 'Hội nhóm', 'vi_VN'),
(67, 'Member', 'en'),
(67, 'Thành viên', 'ja_JP'),
(67, 'Thành viên', 'vi_VN'),
(68, 'My Apps', 'en'),
(68, 'Ứng dụng', 'ja_JP'),
(68, 'Trang cá nhân', 'vi_VN'),
(69, 'Add diary', 'en'),
(69, 'Viết nhật ký', 'vi_VN'),
(70, 'Create album', 'en'),
(70, 'Tạo album ảnh', 'vi_VN'),
(71, 'Create community', 'en'),
(71, 'Tạo hội nhóm', 'vi_VN'),
(72, 'Invite member', 'en'),
(72, 'Mời bạn bè', 'vi_VN'),
(73, 'dashboard main', 'en'),
(73, 'Bản tin chính', 'vi_VN'),
(74, 'dashboard main', 'en'),
(74, 'Bản tin chính', 'vi_VN'),
(75, 'dashboard position', 'en'),
(75, 'Địa điểm', 'vi_VN'),
(76, 'dashboard position', 'en'),
(76, 'Địa điểm', 'vi_VN'),
(77, 'dashboard rent house', 'en'),
(77, 'Nhà cho thuê', 'vi_VN'),
(78, 'dashboard rent house', 'en'),
(78, 'Nhà cho thuê', 'vi_VN'),
(79, 'dashboard member', 'en'),
(79, 'Thành viên', 'vi_VN'),
(80, 'dashboard member', 'en'),
(80, 'Thành viên', 'vi_VN'),
(81, 'Pos List', 'en'),
(81, 'Danh sách địa điểm', 'vi_VN');

-- --------------------------------------------------------

--
-- Table structure for table `notification_mail`
--

CREATE TABLE IF NOT EXISTS `notification_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Notification Identifier Name',
  `renderer` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'twig' COMMENT 'Notification Template Renderer',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Notification Enabled',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`),
  KEY `is_enabled_INDEX_idx` (`is_enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configuration of notification mail' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `notification_mail`
--


-- --------------------------------------------------------

--
-- Table structure for table `notification_mail_translation`
--

CREATE TABLE IF NOT EXISTS `notification_mail_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Notification Title',
  `template` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Notification Template',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification_mail_translation`
--


-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Consumer name',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Consumer description',
  `key_string` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Token for this consumer',
  `secret` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Password for this consumer',
  `file_id` int(11) DEFAULT NULL COMMENT 'Image file id of this consumer',
  `using_apis` longtext COLLATE utf8_unicode_ci COMMENT 'API list that this consumer uses',
  `member_id` int(11) DEFAULT NULL COMMENT 'Member id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_secret_UNIQUE_idx` (`key_string`,`secret`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of OAuth Consumer' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oauth_consumer`
--


-- --------------------------------------------------------

--
-- Table structure for table `openid_trust_log`
--

CREATE TABLE IF NOT EXISTS `openid_trust_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) DEFAULT NULL COMMENT 'Member id',
  `uri` text COLLATE utf8_unicode_ci COMMENT 'URI for RP',
  `uri_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hashed URI for RP',
  `is_permanent` tinyint(1) DEFAULT NULL COMMENT 'A permanent flag',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uri_key_INDEX_idx` (`uri_key`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves logs of trusted OpenID RP' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `openid_trust_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `o_auth_admin_token`
--

CREATE TABLE IF NOT EXISTS `o_auth_admin_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `oauth_consumer_id` int(11) NOT NULL COMMENT 'OAuth Consumer id',
  `key_string` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Key string of this token',
  `secret` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Secret string of this token',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'request' COMMENT 'Token type',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Activation flag',
  `callback_url` text COLLATE utf8_unicode_ci COMMENT 'Callback url',
  `verifier` text COLLATE utf8_unicode_ci COMMENT 'Token verifier',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_secret_UNIQUE_idx` (`key_string`,`secret`),
  KEY `oauth_consumer_id_idx` (`oauth_consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves administration tokens of OAuth' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `o_auth_admin_token`
--


-- --------------------------------------------------------

--
-- Table structure for table `o_auth_member_token`
--

CREATE TABLE IF NOT EXISTS `o_auth_member_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `oauth_consumer_id` int(11) NOT NULL COMMENT 'OAuth Consumer id',
  `key_string` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Key string of this token',
  `secret` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Secret string of this token',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'request' COMMENT 'Token type',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Activation flag',
  `callback_url` text COLLATE utf8_unicode_ci COMMENT 'Callback url',
  `verifier` text COLLATE utf8_unicode_ci COMMENT 'Token verifier',
  `member_id` int(11) DEFAULT NULL COMMENT 'Member id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_secret_UNIQUE_idx` (`key_string`,`secret`),
  KEY `oauth_consumer_id_idx` (`oauth_consumer_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves memebr tokens of OAuth' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `o_auth_member_token`
--


-- --------------------------------------------------------

--
-- Table structure for table `plugin`
--

CREATE TABLE IF NOT EXISTS `plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Nickname',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Notification Enabled',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`),
  KEY `is_enabled_INDEX_idx` (`is_enabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of plugins' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `plugin`
--

INSERT INTO `plugin` (`id`, `name`, `is_enabled`, `created_at`, `updated_at`) VALUES
(1, 'opSkinBasicPlugin', 1, '2011-07-11 18:04:43', '2011-07-11 18:07:23'),
(2, 'opSkinClassicPlugin', 0, '2011-07-11 18:04:43', '2011-07-11 18:07:23');

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE IF NOT EXISTS `pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'title is of pos',
  `description` text COLLATE utf8_unicode_ci COMMENT 'desc is of pos',
  `address` text COLLATE utf8_unicode_ci COMMENT 'address is of pos',
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tel is of pos',
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'website is of pos',
  `lat` double(18,15) DEFAULT NULL COMMENT 'latitude theo google map',
  `lng` double(18,15) DEFAULT NULL COMMENT 'longitude theo google map',
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tags is of pos',
  `file_id` int(11) DEFAULT NULL COMMENT 'File id',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `ower_id` int(11) DEFAULT NULL COMMENT 'id is of location',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_public` int(1) NOT NULL DEFAULT '1' COMMENT 'Public Flag',
  `editer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'danh sach member_id duoc phep edit pos,moi member_id cach nhau bang dau phay ',
  `pos_category_id` int(11) DEFAULT NULL COMMENT 'id identifies category',
  `pos_sub_category_id` int(11) DEFAULT NULL COMMENT 'id identifies sub_category',
  `type` int(1) DEFAULT '1' COMMENT 'Địa điểm thường/ địa điểm đặc biệt',
  `meta` text COLLATE utf8_unicode_ci COMMENT 'Chứa các thông tin về title, description, address, tel, website của địa điểm',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT 'Xóa : = 1',
  `rank` int(11) DEFAULT '0' COMMENT 'Xếp hạng địa điểm',
  PRIMARY KEY (`id`),
  KEY `file_id_idx` (`file_id`),
  KEY `ower_id_idx` (`ower_id`),
  KEY `pos_category_id_idx` (`pos_category_id`),
  KEY `pos_sub_category_id_idx` (`pos_sub_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1411 ;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(9, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.100000381469723, 105.940002441406250, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL, 1, 'Bia hoi Hieu Beo So 187 duong Xa Dan, quan Dong Da nha hang bia hoi chat luong tuyet hao 0973956705 biahoihieubeo.com.vn nha hang, quan bia, nhau nhet, hieu beo', 0, 0),
(10, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.110000610351562, 105.940002441406250, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL, 1, 'Bia hoi Ha Bao So 187 duong Xa Dan, quan Dong Da nha hang bia hoi chat luong tuyet hao 0973956705 biahoihieubeo.com.vn nha hang, quan bia, nhau nhet, hieu beo', 0, 0),
(26, 'Sieu thi Metro', 'Sieu thi tien nghi, mat hang da dang', ' ', ' ', ' ', 21.040000915527344, 105.790000915527360, ' ', NULL, 18, NULL, '2011-11-25 11:04:40', '2011-11-25 11:04:40', 1, NULL, NULL, NULL, 1, 'Sieu thi Metro   Sieu thi tien nghi, mat hang da dang      ', 0, 0),
(27, 'Hua', 'My university', ' ', ' ', ' ', 21.040000915527344, 105.879997253417970, ' ', NULL, 18, NULL, '2011-11-25 11:06:18', '2011-11-25 11:06:18', 1, NULL, NULL, NULL, 1, 'Hua   My university      ', 0, 0),
(28, 'Nhà thuốc Bảo An', 'Nhà thuốc tây nổi tiếng', ' ', ' ', ' ', 21.010000228881832, 105.830001831054690, ' ', 86, 3, NULL, '2011-11-25 11:08:48', '2011-11-25 11:09:46', 1, NULL, NULL, NULL, 1, 'Nhà thuốc Bảo An   Nhà thuốc tây nổi tiếng      ', 0, 0),
(35, 'Cho thuê phòng trọ giá rẻ tiện nghi - Bến xe Nam Thăng Long', 'Cho thue phong tang 6 Chung cu Dinh Cong, Dien tich 66m2. Nha 2 dau hoi thoang mat. Gia thue 6tr/thang \r\n', 'Gần bến xe Nam Thăng Long - Hà Nôi', ' ', ' ', 21.040000915527344, 105.779998779296880, ',Nội dung tag ...,gfhsdhgdfhdf,hflakhdklfhálkdffádffád,fdsgsdfgsdf,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,N', NULL, 1, 1, '2011-11-30 16:18:37', '2011-12-15 10:41:12', 1, '18', 1, 2, 0, 'Cho thuê phòng trọ giá rẻ tiện nghi - Bến xe Nam Thăng Long Gần bến xe Nam Thăng Long - Hà Nôi Cho thue phong tang 6 Chung cu Dinh Cong, Dien tich 66m2. Nha 2 dau hoi thoang mat. Gia thue 6tr/thang \r\n     ,Nội dung tag ...,gfhsdhgdfhdf,hflakhdklfhálkdffádffád,fdsgsdfgsdf,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,N', 0, 0),
(36, 'Cho thuê biệt thự', 'Biệt thư 3 tầng với 200m2, đầy đủ tiện nghi', 'Cầu giấy, Hà Nội', ' ', ' ', 21.010000228881832, 105.779998779296880, ' ', 85, 1, 18, '2011-12-16 10:59:05', '2011-12-16 10:59:11', 1, '1', 1, 3, 0, 'Cho thuê biệt thự Cầu giấy, Hà Nội Biệt thư 3 tầng với 200m2, đầy đủ tiện nghi      ', 0, 0),
(37, 'Cho thuê phòng trọ giá rẻ, khép kín, dưới 2 triệu gần bến xe Nam Thăng Long', 'Nhà ở chung với chủ, an ninh tốt, giá điện 2000/1 số, nước 50k/1 người', 'Số nhà 379, Xuân Đỉnh', '0973956705', ' ', 21.020000457763672, 105.849998474121110, ' ', NULL, 1, NULL, '2011-12-20 10:13:13', '2011-12-20 10:13:13', 1, NULL, 1, 2, 0, 'Cho thuê phòng trọ giá rẻ, khép kín, dưới 2 triệu gần bến xe Nam Thăng Long Số nhà 379, Xuân Đỉnh Nhà ở chung với chủ, an ninh tốt, giá điện 2000/1 số, nước 50k/1 người 0973956705    ', 0, 0),
(38, 'Cho thuê căn hộ gia đình tại Khương Thượng', 'Nhà tháng mát, đầy đủ tiện nghi', 'Khương Thượng, Hà Nội', '0975956705', ' ', 21.020000457763672, 105.800003051757810, ' ', NULL, 1, NULL, '2011-12-20 11:56:20', '2011-12-20 11:56:20', 1, NULL, 1, 2, 0, 'Cho thuê căn hộ gia đình tại Khương Thượng Khương Thượng, Hà Nội Nhà tháng mát, đầy đủ tiện nghi 0975956705    ', 0, 0),
(40, 'Nhà trọ giá rẻ', '', 'Ba Đình hà nội', '', ' ', 21.020000457763672, 105.849998474121110, ' ', NULL, 1, NULL, '2011-12-21 15:33:49', '2011-12-21 15:33:49', 1, NULL, 1, 2, 0, 'Nhà trọ giá rẻ Ba Đình hà nội      ', 0, 0),
(41, 'Cho thuê phòng trọ', '', 'Dịch vọng, cầu giấy, hà nội', '', ' ', 21.030000686645510, 105.790000915527360, ' ', NULL, 1, NULL, '2011-12-21 15:36:35', '2011-12-21 15:36:35', 1, NULL, 1, 3, 0, 'Cho thuê phòng trọ Dịch vọng, cầu giấy, hà nội      ', 0, 0),
(43, 'Cho thuê phòng trọ', '', 'Từ Liêm - Hà Nội', '', ' ', 21.069999694824220, 105.830001831054690, ' ', NULL, 1, NULL, '2011-12-21 16:07:24', '2011-12-21 16:07:24', 1, NULL, 1, 2, 0, 'Cho thuê phòng trọ Từ Liêm - Hà Nội      ', 0, 0),
(45, 'Cho thuê biệt thự', '', 'Nguyễn Thái Học Hà nội', '', ' ', 21.030000686645510, 105.839996337890620, ' ', NULL, 1, NULL, '2011-12-21 16:11:45', '2011-12-21 16:11:45', 1, NULL, 1, 3, 0, 'Cho thuê biệt thự Nguyễn Thái Học Hà nội      ', 0, 0),
(47, 'Cho thuê biệt thự', '', 'Giảng Võ - Hà Nội', '', ' ', 21.030000686645510, 105.819999694824200, ' ', NULL, 1, NULL, '2011-12-21 16:20:08', '2011-12-21 16:20:08', 1, NULL, 1, 3, 0, 'Cho thuê biệt thự Giảng Võ - Hà Nội      ', 0, 0),
(49, 'Cho thuê biệt thự', '', 'Cầu giấy - Hà nội', '', ' ', 21.030000686645510, 105.800003051757810, ' ', NULL, 1, NULL, '2011-12-21 16:24:00', '2011-12-21 16:24:00', 1, NULL, 1, 3, 0, 'Cho thuê biệt thự Cầu giấy - Hà nội      ', 0, 0),
(50, 'Cho thuê nhà trọ', '', 'Quán Thánh - Hà nội', '', ' ', 21.040000915527344, 105.839996337890620, ' ', NULL, 1, NULL, '2011-12-21 16:28:15', '2011-12-21 16:28:15', 1, NULL, 1, 2, 0, 'Cho thuê nhà trọ Quán Thánh - Hà nội      ', 0, 0),
(83, 'Cho thuê phòng trọ', '', 'Thành Công - Hà Nội', '', ' ', 21.020000457763672, 105.819999694824200, ' ', NULL, 1, NULL, '2011-12-22 10:08:01', '2011-12-22 10:08:01', 1, NULL, 1, 2, 0, 'Cho thuê phòng trọ Thành Công - Hà Nội      ', 0, 0),
(84, 'Cho thuê phòng trọ', '', 'Hà Đình - Hà Nội', '', ' ', 20.989999771118168, 105.809997558593750, ' ', NULL, 1, NULL, '2011-12-22 10:22:39', '2011-12-22 10:22:39', 1, NULL, 1, 2, 0, 'Cho thuê phòng trọ Hà Đình - Hà Nội      ', 0, 0),
(87, 'Cho thuê căn hộ ba tầng', '', 'Khu tập thể Vĩnh Hồ - Hà Nội', '', ' ', 21.010000228881832, 105.819999694824200, ' ', NULL, 1, NULL, '2011-12-22 10:27:13', '2011-12-22 10:27:13', 1, NULL, 1, 3, 0, 'Cho thuê căn hộ ba tầng Khu tập thể Vĩnh Hồ - Hà Nội      ', 0, 0),
(88, 'Cho thuê biệt thự', '', 'Trung Hòa - Nhân Chính - Hà Nội', '', ' ', 21.010000228881832, 105.800003051757810, ' ', NULL, 1, NULL, '2011-12-22 10:49:58', '2011-12-22 10:49:58', 1, NULL, 1, 3, 0, 'Cho thuê biệt thự Trung Hòa - Nhân Chính - Hà Nội      ', 0, 0),
(91, 'Cho thuê phòng trọ', '', 'Láng Hạ - Thái Thịnh', '', ' ', 21.020000457763672, 105.809997558593750, ' ', NULL, 1, NULL, '2011-12-22 10:52:34', '2011-12-22 10:52:34', 1, NULL, 1, 2, 0, 'Cho thuê phòng trọ Láng Hạ - Thái Thịnh      ', 0, 0),
(105, 'Cho thuê phòng trọ giá rẻ', '', 'Hàng Bài Hà Nội', '', ' ', 21.020000457763672, 105.849998474121110, ' ', NULL, 1, NULL, '2011-12-27 14:50:41', '2011-12-27 14:50:41', 1, NULL, 1, 2, 0, 'Cho thuê phòng trọ giá rẻ Hàng Bài Hà Nội      ', 0, 0),
(107, 'Cho thuê phòng trọ', '', 'Láng Hạ - Hà Nội', '', ' ', 21.020000457763672, 105.809997558593750, ' ', NULL, 1, NULL, '2011-12-27 14:51:33', '2011-12-27 14:51:33', 1, NULL, 1, 2, 0, 'Cho thuê phòng trọ Láng Hạ - Hà Nội      ', 0, 0),
(130, 'Cho thuê phòng trọ', '', 'Trung Hòa - Nhân Chính', '', ' ', 21.010000228881832, 105.809997558593750, ' ', NULL, 1, NULL, '2011-12-28 09:04:28', '2011-12-28 09:04:28', 1, NULL, 1, 2, 0, 'Cho thuê phòng trọ Trung Hòa - Nhân Chính      ', 0, 0),
(137, 'Đại Lý Chè Thái Nguyên Lan Hải', ' ', '130, Kim Hoa, Q.Đống Đa,Việt Nam', '(04) 3572 6504', ' ', 21.010383999999995, 105.838466000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:19', '2012-01-14 16:30:19', 1, NULL, 136, NULL, 1, 'Đại Lý Chè Thái Nguyên Lan Hải 130, Kim Hoa, Q.Đống Đa,Việt Nam   (04) 3572 6504   Thực Phẩm , Trà, Cafe', 0, 0),
(138, 'Chung cafe', ' ', '163 Kim Hoa, Đống Đa,Hà Nội, Việt Nam', '(04) 3999 8068', ' ', 21.010943999999995, 105.837693000000000, 'Giải trí', NULL, 1, NULL, '2012-01-14 16:30:19', '2012-01-14 16:30:19', 1, NULL, 136, NULL, 1, 'Chung cafe 163 Kim Hoa, Đống Đa,Hà Nội, Việt Nam   (04) 3999 8068   Giải trí', 0, 0),
(139, 'Cà Phê Capucino', ' ', '9A, Đào Duy Anh, Q.Đống Đa,Việt Nam', '(04) 3577 0423', ' ', 21.009461999999996, 105.837795000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:19', '2012-01-14 16:30:19', 1, NULL, 136, NULL, 1, 'Cà Phê Capucino 9A, Đào Duy Anh, Q.Đống Đa,Việt Nam   (04) 3577 0423   Giải Trí , Café', 0, 0),
(140, 'Cafe Mê Trang Mc', ' ', '274, Xã Đàn, Q.Đống Đa,Việt Nam', '(04) 3995 4677', ' ', 21.012786999999996, 105.835644000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:19', '2012-01-14 16:30:19', 1, NULL, 136, NULL, 1, 'Cafe Mê Trang Mc 274, Xã Đàn, Q.Đống Đa,Việt Nam   (04) 3995 4677   Giải Trí , Café', 0, 0),
(141, 'New Style Cafe', ' ', '198 Xã Đàn, Phương Liên, Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.011429000000000, 105.837249000000000, '', 191, 1, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20', 1, NULL, 136, NULL, 1, 'New Style Cafe 198 Xã Đàn, Phương Liên, Đống Đa,Hà Nội, Việt Nam       ', 0, 0),
(142, 'New Style Cafe', ' ', '198 Xã Đàn, Phương Liên, Đống Đa,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.011429000000000, 105.837249000000000, '', NULL, 1, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20', 1, NULL, 136, NULL, 1, 'New Style Cafe 198 Xã Đàn, Phương Liên, Đống Đa,thủ đô Hà Nội, Việt Nam       ', 0, 0),
(143, 'Cà Phê Đăng', ' ', '83, Kim Hoa, Q.Đống Đa,Việt Nam', '(04) 3572 5957', ' ', 21.009516999999995, 105.839587000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20', 1, NULL, 136, NULL, 1, 'Cà Phê Đăng 83, Kim Hoa, Q.Đống Đa,Việt Nam   (04) 3572 5957   Giải Trí , Café', 0, 0),
(144, 'Cà Phê Bóng Đá', ' ', '57, Kim Hoa, Q.Đống Đa,Việt Nam', '(04) 6656 9152', ' ', 21.009060999999996, 105.840032000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20', 1, NULL, 136, NULL, 1, 'Cà Phê Bóng Đá 57, Kim Hoa, Q.Đống Đa,Việt Nam   (04) 6656 9152   Giải Trí , Café', 0, 0),
(145, 'Cà Phê Trung Nguyên', ' ', '57, Kim Hoa, Q.Đống Đa,Việt Nam', '091235 6189', ' ', 21.009060999999996, 105.840032000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 57, Kim Hoa, Q.Đống Đa,Việt Nam   091235 6189   Giải Trí , Café', 0, 0),
(146, 'Quán cafe căng tin bệnh viện Bạch Mai', ' ', 'Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.001562000000000, 105.839048000000000, '', 192, 1, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20', 1, NULL, 136, NULL, 1, 'Quán cafe căng tin bệnh viện Bạch Mai Đống Đa,Hà Nội, Việt Nam       ', 0, 0),
(147, 'Hương Trà Quán', ' ', '37 Đặng Văn Ngữ, Đống Đa,Hà Nội, Việt Nam', '098982 6866', ' ', 21.008649999999996, 105.831824000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20', 1, NULL, 136, NULL, 1, 'Hương Trà Quán 37 Đặng Văn Ngữ, Đống Đa,Hà Nội, Việt Nam   098982 6866   Quán cà phê', 0, 0),
(148, 'BXL cafe', ' ', 'Ngõ 46C Phạm Ngọc Thạch, Dong Da Ha Noi Viet Nam,Vietnam', ' ', ' ', 21.009782999999995, 105.833359000000000, '', 193, 1, NULL, '2012-01-14 16:30:20', '2012-01-14 16:30:20', 1, NULL, 136, NULL, 1, 'BXL cafe Ngõ 46C Phạm Ngọc Thạch, Dong Da Ha Noi Viet Nam,Vietnam       ', 0, 0),
(149, 'tra chanh', ' ', 'Phố Đặng Văn Ngữ, Trung Tự, Đống Đa,Hà Nội, Vietnam', ' ', ' ', 21.010589000000000, 105.832947000000000, '', 194, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'tra chanh Phố Đặng Văn Ngữ, Trung Tự, Đống Đa,Hà Nội, Vietnam       ', 0, 0),
(150, 'Cà Phê Hồng Xiêm', ' ', '248, Xã Đàn, Q.Đống Đa,Việt Nam', '(04) 3994 5951', ' ', 21.012402000000000, 105.836057000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Cà Phê Hồng Xiêm 248, Xã Đàn, Q.Đống Đa,Việt Nam   (04) 3994 5951   Giải Trí , Café', 0, 0),
(151, 'Cafe Spirit', ' ', '256, Xã Đàn, Q.Đống Đa,Việt Nam', ' ', ' ', 21.012551999999996, 105.835869000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Cafe Spirit 256, Xã Đàn, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(152, '365', ' ', 'Ngõ Chợ Khâm Thiên, Hà Nội,Ha Tay, Việt Nam', ' ', ' ', 21.015567999999995, 105.837672000000000, '', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, '365 Ngõ Chợ Khâm Thiên, Hà Nội,Ha Tay, Việt Nam       ', 0, 0),
(153, 'Cafe Mộc', ' ', 'Trần Đại Nghĩa, Hai Ba Trung district,Hanoi, Vietnam', ' ', ' ', 21.006302000000000, 105.845496000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Cafe Mộc Trần Đại Nghĩa, Hai Ba Trung district,Hanoi, Vietnam       Quán cà phê', 0, 0),
(154, 'I-fresh', ' ', '198 Ngõ Xã Đàn 2, Nam Đồng, Đống Đa,Hanoi, Vietnam', '(04) 3563 9017', ' ', 21.012844999999995, 105.832256000000000, 'Quán cà phê', 195, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'I-fresh 198 Ngõ Xã Đàn 2, Nam Đồng, Đống Đa,Hanoi, Vietnam   (04) 3563 9017   Quán cà phê', 0, 0),
(155, '365', ' ', 'Ngõ Chợ Khâm Thiên, Đống Đa,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.015567999999995, 105.837672000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, '365 Ngõ Chợ Khâm Thiên, Đống Đa,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(156, 'Cà Phê The Big 1', ' ', '2, Hoa Lư, Q.Hai Bà Trưng,Việt Nam', '(04) 3974 6337', ' ', 21.011485000000000, 105.848228999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Cà Phê The Big 1 2, Hoa Lư, Q.Hai Bà Trưng,Việt Nam   (04) 3974 6337   Giải Trí , Café', 0, 0),
(157, 'Cà Phê Mộc', ' ', '39, Lương Đình Của, Q.Đống Đa,Việt Nam', ' ', ' ', 21.007919999999995, 105.834442000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Cà Phê Mộc 39, Lương Đình Của, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(158, 'Cafe Tit', ' ', 'Kim Liên, Đống Đa,Hanoi, Vietnam', ' ', ' ', 21.009052000000000, 105.835674000000000, '', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Cafe Tit Kim Liên, Đống Đa,Hanoi, Vietnam       ', 0, 0),
(159, 'BXL cafe', ' ', 'Ngõ 46C Phạm Ngọc Thạch, Dong Da Ha Noi Viet Nam,Vietnam', ' ', ' ', 21.009782999999995, 105.833359000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'BXL cafe Ngõ 46C Phạm Ngọc Thạch, Dong Da Ha Noi Viet Nam,Vietnam       Quán cà phê', 0, 0),
(160, 'Công Ty Tnhh Minh Nam', ' ', '109 B1 Phạm Ngọc Thạch - Đống Đa,Việt Nam', '(04) 3942 4201', ' ', 21.006316000000000, 105.831366000000000, 'Mua Sắm , Thời Trang Nam, Nữ', 196, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Minh Nam 109 B1 Phạm Ngọc Thạch - Đống Đa,Việt Nam   (04) 3942 4201   Mua Sắm , Thời Trang Nam, Nữ', 0, 0),
(161, 'Quán Kem Uplus', ' ', 'số 4 Ngõ 11 - Lương Đình Của, Kim Liên, Đống Đa,Hà Nội, Việt Nam', '097426 0461', ' ', 21.006346000000000, 105.835766000000000, 'Kem', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Quán Kem Uplus số 4 Ngõ 11 - Lương Đình Của, Kim Liên, Đống Đa,Hà Nội, Việt Nam   097426 0461   Kem', 0, 0),
(162, 'Cafe - Smoothies', ' ', '259 Xa Dan Street, Dong Da District,Vietnam', '(04) 3573 7591', ' ', 21.007610000000000, 105.841288000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'Cafe - Smoothies 259 Xa Dan Street, Dong Da District,Vietnam   (04) 3573 7591   Cafe & Bistro', 0, 0),
(163, 'tra chanh', ' ', 'Phố Đặng Văn Ngữ, Trung Tự, Đống Đa,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.010589000000000, 105.832947000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:21', '2012-01-14 16:30:21', 1, NULL, 136, NULL, 1, 'tra chanh Phố Đặng Văn Ngữ, Trung Tự, Đống Đa,thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(164, 'FUNCAFÉ', ' ', '91 Đặng Văn Ngữ, Đống Đa,Hà Nội, Vietnam', '094491 4994', ' ', 21.011033999999995, 105.830665000000000, '', 197, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'FUNCAFÉ 91 Đặng Văn Ngữ, Đống Đa,Hà Nội, Vietnam   094491 4994   ', 0, 0),
(165, 'Helio Vietnam Specialty Coffee', ' ', '142 Le Duan, Dong Da District,Hà Nội, Vietnam', '091356 6001', ' ', 21.018522000000000, 105.841348000000000, '', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Helio Vietnam Specialty Coffee 142 Le Duan, Dong Da District,Hà Nội, Vietnam   091356 6001   ', 0, 0),
(166, 'Cà Phê Phong Cách Bắc Kỳ', ' ', '111, Đặng Văn Ngữ, Q.Đống Đa,Việt Nam', '(04) 3572 9454', ' ', 21.012381999999995, 105.832758000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cà Phê Phong Cách Bắc Kỳ 111, Đặng Văn Ngữ, Q.Đống Đa,Việt Nam   (04) 3572 9454   Giải Trí , Café', 0, 0),
(167, 'Góc Cafe', ' ', '111(Ktt D1), Đặng Văn Ngữ, Q.Đống Đa,120 D1 Đặng Văn Ngữ, Đống Đa, Hà Nội, Việt Nam', '(04) 3572 9961', ' ', 21.010956000000000, 105.830897000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Góc Cafe 111(Ktt D1), Đặng Văn Ngữ, Q.Đống Đa,120 D1 Đặng Văn Ngữ, Đống Đa, Hà Nội, Việt Nam   (04) 3572 9961   Giải Trí , Café', 0, 0),
(168, 'Cà Phê Shift', ' ', '334A, Xã Đàn, Q.Đống Đa,Việt Nam', ' ', ' ', 21.013594000000000, 105.834727000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cà Phê Shift 334A, Xã Đàn, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(169, 'Quán cà phê bóng đá BiBi', ' ', '2C5 Lương Đình Của, Kim Liên, Đống Đa,Hà Nội, Vietnam', '097474 7246', ' ', 21.005602000000000, 105.835285000000000, '', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Quán cà phê bóng đá BiBi 2C5 Lương Đình Của, Kim Liên, Đống Đa,Hà Nội, Vietnam   097474 7246   ', 0, 0),
(170, 'REN Coffee', ' ', '103 Xã Đàn 2, Đê La Thành, Quận Đống Đa,Việt Nam', '(04) 6657 8217', ' ', 21.015031000000000, 105.834196000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'REN Coffee 103 Xã Đàn 2, Đê La Thành, Quận Đống Đa,Việt Nam   (04) 6657 8217   Cafe & Bistro', 0, 0),
(171, 'Kultour', ' ', 'số 27, quận Hai Bà Trưng,Hà Nội, Vietnam', ' ', ' ', 21.006447000000000, 105.845610000000000, '', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Kultour số 27, quận Hai Bà Trưng,Hà Nội, Vietnam       ', 0, 0),
(172, 'Cà Phê New Style', ' ', '115, Đại Cồ Việt, Q.Hai Bà Trưng,Việt Nam', '(04) 3868 0658', ' ', 21.007494000000000, 105.842838000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cà Phê New Style 115, Đại Cồ Việt, Q.Hai Bà Trưng,Việt Nam   (04) 3868 0658   Giải Trí , Café', 0, 0),
(173, 'Cafe Mai', ' ', '52 Nguyễn Du, Hoan Kiem,Hanoi, Vietnam', ' ', ' ', 21.019131999999995, 105.848057000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cafe Mai 52 Nguyễn Du, Hoan Kiem,Hanoi, Vietnam       Quán cà phê', 0, 0),
(174, 'Cafe Taoviet - Cơ sở chính', ' ', 'ngõ Bà Triệu, Hai Bà Trưng,Hà Nội, Vietnam', '0123459 6789', ' ', 21.012637000000000, 105.848851000000010, 'Iphoneservices Vietnam', 198, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cafe Taoviet - Cơ sở chính ngõ Bà Triệu, Hai Bà Trưng,Hà Nội, Vietnam   0123459 6789   Iphoneservices Vietnam', 0, 0),
(175, 'Cà Phê Trung Nguyên', ' ', '5, Thể Giao, Q.Hai Bà Trưng,Việt Nam', '(04) 3974 0898', ' ', 21.014949999999995, 105.848008999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 5, Thể Giao, Q.Hai Bà Trưng,Việt Nam   (04) 3974 0898   Giải Trí , Café', 0, 0),
(176, 'Quán Cà Phê Cây Si', ' ', '101C4, Lương Đình Của, Q.Đống Đa,Việt Nam', ' ', ' ', 21.007919999999995, 105.834442000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Cây Si 101C4, Lương Đình Của, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(177, 'Cà Phê Huyền Trang', ' ', '47, Lương Đình Của, Q.Đống Đa,Việt Nam', ' ', ' ', 21.007919999999995, 105.834442000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cà Phê Huyền Trang 47, Lương Đình Của, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(178, 'Bopbi Cafe Fast Food', ' ', '12, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam', '(04) 3628 8838', ' ', 21.002155999999996, 105.844951000000010, 'Cafe & Bistro', 199, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Bopbi Cafe Fast Food 12, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam   (04) 3628 8838   Cafe & Bistro', 0, 0),
(179, 'Cafe 98A', ' ', '98A Lương Định Của, Đống Đa,Việt Nam', '(04) 3576 3940', ' ', 21.006837999999995, 105.835161000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cafe 98A 98A Lương Định Của, Đống Đa,Việt Nam   (04) 3576 3940   Cafe & Bistro', 0, 0),
(180, 'Cà Phê Nice', ' ', '26, Nguyễn Đình Chiểu, Q.Hai Bà Trưng,Việt Nam', '(04) 3822 9172', ' ', 21.014320000000000, 105.847161000000000, 'Giải Trí , Café', 200, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cà Phê Nice 26, Nguyễn Đình Chiểu, Q.Hai Bà Trưng,Việt Nam   (04) 3822 9172   Giải Trí , Café', 0, 0),
(181, 'Cafe BV Bach Mai', ' ', 'Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.001902999999995, 105.840104000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:22', '2012-01-14 16:30:22', 1, NULL, 136, NULL, 1, 'Cafe BV Bach Mai Đống Đa,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(182, 'Cafe Trang Cafe-Trang', ' ', 'Ngõ 55, Hai Bà Trưng,Hà Nội, Vietnam', ' ', ' ', 21.012260999999995, 105.847021000000000, '', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe Trang Cafe-Trang Ngõ 55, Hai Bà Trưng,Hà Nội, Vietnam       ', 0, 0),
(183, 'Faceboook Cafe', ' ', 'Số 1/ Ngõ 103, Đống Đa,Hà Nội, Vietnam', ' ', ' ', 21.006727999999995, 105.832136000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Faceboook Cafe Số 1/ Ngõ 103, Đống Đa,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(184, 'Cà Phê Lộc Vừng', ' ', '119 (Ktt D1), Đặng Văn Ngữ, Q.Đống Đa,Việt Nam', '(04) 3573 6136', ' ', 21.012381999999995, 105.832758000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Lộc Vừng 119 (Ktt D1), Đặng Văn Ngữ, Q.Đống Đa,Việt Nam   (04) 3573 6136   Giải Trí , Café', 0, 0),
(185, 'Quán Kem Uplus', ' ', 'số 4 Ngõ 11 - Lương Đình Của, Kim Liên, Đống Đa,thủ đô Hà Nội, Việt Nam', '097426 0461', ' ', 21.006346000000000, 105.835766000000000, 'Kem', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Quán Kem Uplus số 4 Ngõ 11 - Lương Đình Của, Kim Liên, Đống Đa,thủ đô Hà Nội, Việt Nam   097426 0461   Kem', 0, 0),
(186, 'Cà Phê Paloma', ' ', '191, Bà Triệu, Q.Hai Bà Trưng,Việt Nam', '(04) 2220 0253', ' ', 21.011825999999996, 105.849318000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Paloma 191, Bà Triệu, Q.Hai Bà Trưng,Việt Nam   (04) 2220 0253   Giải Trí , Café', 0, 0),
(187, 'Ngõ 1A Tôn Thất Tùng', ' ', 'Tôn Thất Tùng, Trung Tự, Dong Da,Hanoi, Vietnam', ' ', ' ', 21.003993999999995, 105.831385000000000, '', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Ngõ 1A Tôn Thất Tùng Tôn Thất Tùng, Trung Tự, Dong Da,Hanoi, Vietnam       ', 0, 0),
(188, 'Kultour', ' ', 'số 27, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.006447000000000, 105.845610000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Kultour số 27, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(189, 'Cà Phê 107', ' ', '107, Đặng Văn Ngữ, Q.Đống Đa,Việt Nam', '(04) 3852 5889', ' ', 21.011986000000000, 105.832318000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê 107 107, Đặng Văn Ngữ, Q.Đống Đa,Việt Nam   (04) 3852 5889   Giải Trí , Café', 0, 0),
(190, 'Quán Media Coffee', ' ', '39, Trần Hữu Tước, Q.Đống Đa,Việt Nam', '(04) 3938 0411', ' ', 21.015331000000000, 105.830172000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Quán Media Coffee 39, Trần Hữu Tước, Q.Đống Đa,Việt Nam   (04) 3938 0411   Giải Trí , Café', 0, 0),
(191, 'Viet Art Cafe', ' ', 'Yết Kiêu, quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.022067000000000, 105.843046000000020, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Viet Art Cafe Yết Kiêu, quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(192, 'Cafe Hồng', ' ', '474 Xã Đàn, Thổ Quan, Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.016622999999996, 105.831959000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe Hồng 474 Xã Đàn, Thổ Quan, Đống Đa,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(193, 'Cafe 25 Đoàn Trần Nghiệp', ' ', 'Lê Đại Hành, Hanoi,Vietnam', ' ', ' ', 21.011676000000000, 105.848132000000000, '', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe 25 Đoàn Trần Nghiệp Lê Đại Hành, Hanoi,Vietnam       ', 0, 0),
(194, 'Cà Phê Amour', ' ', '61, Nguyễn Du, Q.Hai Bà Trưng,Việt Nam', '(04) 3942 9095', ' ', 21.019867999999995, 105.844066000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Amour 61, Nguyễn Du, Q.Hai Bà Trưng,Việt Nam   (04) 3942 9095   Giải Trí , Café', 0, 0),
(195, 'Cà Phê Mai', ' ', '75, Trần Nhân Tông, Q.Hai Bà Trưng,Việt Nam', '(04) 3976 0855', ' ', 21.017264000000000, 105.842500000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Mai 75, Trần Nhân Tông, Q.Hai Bà Trưng,Việt Nam   (04) 3976 0855   Giải Trí , Café', 0, 0),
(196, 'nhím', ' ', 'Trần Hữu Tước, Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.013632999999995, 105.830080999999990, '', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'nhím Trần Hữu Tước, Đống Đa,Hà Nội, Việt Nam       ', 0, 0),
(197, 'Quán cà phê bóng đá BiBi', ' ', '2C5 Lương Đình Của, Kim Liên, Đống Đa,thủ đô Hà Nội, Vietnam', '097474 7246', ' ', 21.005602000000000, 105.835285000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Quán cà phê bóng đá BiBi 2C5 Lương Đình Của, Kim Liên, Đống Đa,thủ đô Hà Nội, Vietnam   097474 7246   Quán cà phê', 0, 0),
(198, 'Cà Phê La Braserie', ' ', '84, Trần Nhân Tông, Q.Hai Bà Trưng,Việt Nam', '(04) 3822 3535', ' ', 21.017583999999996, 105.841652000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê La Braserie 84, Trần Nhân Tông, Q.Hai Bà Trưng,Việt Nam   (04) 3822 3535   Giải Trí , Café', 0, 0),
(199, 'nhím', ' ', 'Trần Hữu Tước, Đống Đa,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.013632999999995, 105.830080999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'nhím Trần Hữu Tước, Đống Đa,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(200, 'Cafe 25 Đoàn Trần Nghiệp', ' ', 'Lê Đại Hành, Hà Nội,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.011676000000000, 105.848132000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe 25 Đoàn Trần Nghiệp Lê Đại Hành, Hà Nội,thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(201, 'Cửa Hàng Bánh Ngọt - Cafe - Đố Ăn Nhanh', ' ', '14, Trần Bình Trọng, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 1776', ' ', 21.021070000000000, 105.845009999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cửa Hàng Bánh Ngọt - Cafe - Đố Ăn Nhanh 14, Trần Bình Trọng, Q.Hoàn Kiếm,Việt Nam   (04) 3942 1776   Cafe & Bistro', 0, 0),
(202, 'Cafe Mắm', ' ', '8A Nguyễn Thượng Hiền, quận Hai Bà Trưng,Hà Nội, Vietnam', ' ', ' ', 21.019006999999995, 105.843616000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe Mắm 8A Nguyễn Thượng Hiền, quận Hai Bà Trưng,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(203, 'Cafe HD', ' ', 'Đội Cung, quận Hai Bà Trưng,Hà Nội, Vietnam', ' ', ' ', 21.009564000000000, 105.848788000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe HD Đội Cung, quận Hai Bà Trưng,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(204, 'Cafe AA', ' ', '102D1 Đặng Văn Ngữ, Đống Đa,Việt Nam', '(04) 3572 9920', ' ', 21.011346000000000, 105.831289000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe AA 102D1 Đặng Văn Ngữ, Đống Đa,Việt Nam   (04) 3572 9920   Cafe & Bistro', 0, 0),
(205, 'Cửa Hàng Thảo Trà', ' ', 'Đặng Văn Ngữ, Dong Da,Hanoi, Vietnam', '(04) 2245 5837', ' ', 21.009862999999996, 105.831105999999990, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cửa Hàng Thảo Trà Đặng Văn Ngữ, Dong Da,Hanoi, Vietnam   (04) 2245 5837   Thực Phẩm , Trà, Cafe', 0, 0),
(206, 'Cafe 68', ' ', '255 Xã Đàn, Đống Đa,Việt Nam', '(04) 3991 2636', ' ', 21.013940999999996, 105.831851000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe 68 255 Xã Đàn, Đống Đa,Việt Nam   (04) 3991 2636   Cafe & Bistro', 0, 0),
(207, 'Cafe', ' ', '432 Trần Khát Chân, Hai Bà Trưng,Việt Nam', '(04) 3978 0957', ' ', 21.008593999999995, 105.851624000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cafe 432 Trần Khát Chân, Hai Bà Trưng,Việt Nam   (04) 3978 0957   Cafe & Bistro', 0, 0),
(208, 'Cà Phê Billiards Nguyệt Ánh', ' ', '26, Chùa Vua, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.009872999999995, 105.854173000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Billiards Nguyệt Ánh 26, Chùa Vua, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(209, 'Cà Phê Bích Sơn', ' ', '2B, Thịnh Yên, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 7431', ' ', 21.009823000000000, 105.851725999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Bích Sơn 2B, Thịnh Yên, Q.Hai Bà Trưng,Việt Nam   (04) 3821 7431   Giải Trí , Café', 0, 0),
(210, 'Cà Phê Giải Khát Hà Anh', ' ', '44, Hương Viên, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 1395', ' ', 21.011455000000000, 105.856587000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Giải Khát Hà Anh 44, Hương Viên, Q.Hai Bà Trưng,Việt Nam   (04) 3971 1395   Giải Trí , Café', 0, 0),
(211, 'Ca Phê Impress', ' ', '55, Lê Ngọc Hân, Q.Hai Bà Trưng,Việt Nam', '(04) 2215 3609', ' ', 21.015471000000000, 105.855524000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Ca Phê Impress 55, Lê Ngọc Hân, Q.Hai Bà Trưng,Việt Nam   (04) 2215 3609   Giải Trí , Café', 0, 0),
(212, 'Cà Phê Amore', ' ', '84, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam', '(04) 2214 9596', ' ', 21.013178000000000, 105.851276000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Amore 84, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam   (04) 2214 9596   Giải Trí , Café', 0, 0),
(213, 'Cà Phê 129', ' ', '129, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 6342', ' ', 21.011876000000000, 105.851200999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê 129 129, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam   (04) 3821 6342   Giải Trí , Café', 0, 0),
(214, 'Anh Hong Coffee', ' ', '434 Tran Khat Chan Street, Hai Ba Trung Dístrict,Vietnam', '(04) 3976 2002', ' ', 21.008832000000000, 105.854184000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Anh Hong Coffee 434 Tran Khat Chan Street, Hai Ba Trung Dístrict,Vietnam   (04) 3976 2002   Cafe & Bistro', 0, 0),
(215, 'Cà Phê Nhạc H & H', ' ', '11A, Hương Viên, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 1689', ' ', 21.012757000000000, 105.856823000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Nhạc H & H 11A, Hương Viên, Q.Hai Bà Trưng,Việt Nam   (04) 3821 1689   Giải Trí , Café', 0, 0),
(216, 'Tadioto Bar', ' ', '113 Triệu Việt Vương, quận Hai Bà Trưng,Hà Nội, Vietnam', ' ', ' ', 21.012115999999995, 105.850513999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Tadioto Bar 113 Triệu Việt Vương, quận Hai Bà Trưng,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(217, 'Coffee teen Hac Giay', ' ', '25 Hương Viên, Hai Bà Trưng,Hanoi, Vietnam', '093228 0189', ' ', 21.012346999999995, 105.856922000000000, 'Quán cà phê', 201, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Coffee teen Hac Giay 25 Hương Viên, Hai Bà Trưng,Hanoi, Vietnam   093228 0189   Quán cà phê', 0, 0),
(218, 'Cà Phê Happy', ' ', '4, Đoàn Trần Nghiệp, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 6819', ' ', 21.011666000000000, 105.851844000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê Happy 4, Đoàn Trần Nghiệp, Q.Hai Bà Trưng,Việt Nam   (04) 3821 6819   Giải Trí , Café', 0, 0),
(219, 'Hapro Bốn Mùa', ' ', '353, Phố Huế, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.008815999999996, 105.851641000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Hapro Bốn Mùa 353, Phố Huế, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(220, 'Cà Phê My', ' ', '145, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 6046', ' ', 21.012896999999995, 105.850654000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Cà Phê My 145, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   (04) 3821 6046   Giải Trí , Café', 0, 0),
(221, 'Karaoke Family', ' ', '178, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 3945 4293', ' ', 21.012432000000000, 105.850643000000000, 'Giải Trí , Café', 202, 1, NULL, '2012-01-14 16:30:23', '2012-01-14 16:30:23', 1, NULL, 136, NULL, 1, 'Karaoke Family 178, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   (04) 3945 4293   Giải Trí , Café', 0, 0),
(222, 'Cà Phê Friendly', ' ', '491, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam', '(04) 6278 5922', ' ', 21.008571000000000, 105.852612000000000, 'Giải Trí , Café', 203, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Friendly 491, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam   (04) 6278 5922   Giải Trí , Café', 0, 0),
(223, 'Cà Phê Nhớ', ' ', '28, Nguyễn Công Trứ, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 2881', ' ', 21.014379999999996, 105.857477000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Nhớ 28, Nguyễn Công Trứ, Q.Hai Bà Trưng,Việt Nam   (04) 3821 2881   Giải Trí , Café', 0, 0),
(224, 'Cà Phê Ôtô', ' ', '26, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam', '(04) 3944 6199', ' ', 21.015101000000000, 105.850777000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Ôtô 26, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam   (04) 3944 6199   Giải Trí , Café', 0, 0),
(225, 'Cà Phê Tùng Ngọc', ' ', '59, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 0358', ' ', 21.011295000000000, 105.860610000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Tùng Ngọc 59, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam   (04) 3971 0358   Giải Trí , Café', 0, 0),
(226, 'Salem Book Cafe', ' ', '29 Tô Hiến Thành, Hai Ba Trung district,Hanoi, Vietnam', ' ', ' ', 21.013297999999995, 105.850073999999990, '', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Salem Book Cafe 29 Tô Hiến Thành, Hai Ba Trung district,Hanoi, Vietnam       ', 0, 0),
(227, 'Coffee Shop', ' ', '432 Tran Khat Chan Street, Hai Ba Trung District,Vietnam', '(04) 3978 0957', ' ', 21.008842000000000, 105.854485000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Coffee Shop 432 Tran Khat Chan Street, Hai Ba Trung District,Vietnam   (04) 3978 0957   Cafe & Bistro', 0, 0),
(228, 'Tổng Công Ty Chè Việt Nam', ' ', '92, Võ Thị Sáu, Q.Hai Bà Trưng,Việt Nam', '(04) 3622 6990', ' ', 21.003923000000000, 105.855160000000000, 'Thực Phẩm , Trà, Cafe', 204, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Tổng Công Ty Chè Việt Nam 92, Võ Thị Sáu, Q.Hai Bà Trưng,Việt Nam   (04) 3622 6990   Thực Phẩm , Trà, Cafe', 0, 0),
(229, 'Loc Coffee', ' ', '45E Mai Hac De Street, Hai Ba Trung Dístrict,Vietnam', '(04) 3993 9116', ' ', 21.011175999999995, 105.851030000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Loc Coffee 45E Mai Hac De Street, Hai Ba Trung Dístrict,Vietnam   (04) 3993 9116   Cafe & Bistro', 0, 0),
(230, 'Cà Phê Thiên Lộc', ' ', '113, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '090320 5668', ' ', 21.013968999999996, 105.850696000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Thiên Lộc 113, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   090320 5668   Giải Trí , Café', 0, 0),
(231, 'Cafe Cộng', ' ', '152D Triệu Việt Vương Q. Hai Bà Trưng,Việt Nam', '(04) 2545 3212', ' ', 21.013788999999996, 105.850632000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cafe Cộng 152D Triệu Việt Vương Q. Hai Bà Trưng,Việt Nam   (04) 2545 3212   Cafe & Bistro', 0, 0),
(232, 'Cà Phê Tiến Hoa', ' ', '155, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam', '(04) 3978 1246', ' ', 21.010128000000000, 105.851024000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Tiến Hoa 155, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam   (04) 3978 1246   Giải Trí , Café', 0, 0),
(233, 'Salem Book Cafe', ' ', '29 Tô Hiến Thành, Hai Bà Trưng,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.013297999999995, 105.850073999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Salem Book Cafe 29 Tô Hiến Thành, Hai Bà Trưng,thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(234, 'Cafe 22', ' ', '22 Nguyễn Công Trứ, Hai Bà Trưng,Việt Nam', '(04) 3821 2062', ' ', 21.013594000000000, 105.851985000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cafe 22 22 Nguyễn Công Trứ, Hai Bà Trưng,Việt Nam   (04) 3821 2062   Cafe & Bistro', 0, 0),
(235, 'Công Ty Xnk Cà Phê 1 Hà Nội', ' ', '57, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 3472', ' ', 21.014769999999995, 105.858636000000000, 'Sản Xuất, Buôn  Bán , Xuất Nhập Khẩu', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Công Ty Xnk Cà Phê 1 Hà Nội 57, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam   (04) 3971 3472   Sản Xuất, Buôn  Bán , Xuất Nhập Khẩu', 0, 0),
(236, 'Cà Phê Anh Đào', ' ', '46, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam', '(04) 3972 7492', ' ', 21.015706999999995, 105.858196000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Anh Đào 46, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam   (04) 3972 7492   Giải Trí , Café', 0, 0),
(237, 'La Felicita cafe', ' ', '46 Cảm Hội, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam', '(04) 8582 0686', ' ', 21.010694000000000, 105.860063000000010, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'La Felicita cafe 46 Cảm Hội, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam   (04) 8582 0686   Quán cà phê', 0, 0),
(238, 'Cà Phê Romantic', ' ', '348, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 2526', ' ', 21.009316999999996, 105.858191000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Romantic 348, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam   (04) 3971 2526   Giải Trí , Café', 0, 0),
(239, 'Cà Phe Gải Khát', ' ', '7, Nguyễn Công Trứ, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.014284000000000, 105.856737000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phe Gải Khát 7, Nguyễn Công Trứ, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(240, 'Cafe - Breakfast', ' ', '96 Mai Hac De Street, Hai Ba Trung District,Vietnam', '093454 1972', ' ', 21.012506999999996, 105.850996999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cafe - Breakfast 96 Mai Hac De Street, Hai Ba Trung District,Vietnam   093454 1972   Cafe & Bistro', 0, 0),
(241, 'Coffee BlackBerry', ' ', '28 Đại Cồ Việt, Q.Hai Bà Trưng,Việt Nam', '098831 2266', ' ', 21.008823000000000, 105.851445000000000, 'Mua sắm , Điện thoại di động', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Coffee BlackBerry 28 Đại Cồ Việt, Q.Hai Bà Trưng,Việt Nam   098831 2266   Mua sắm , Điện thoại di động', 0, 0),
(242, 'Cafe 129', ' ', '129 Mai Hắc Đế, Hai Bà Trưng,Việt Nam', '(04) 3821 6342', ' ', 21.012654999999995, 105.850980000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cafe 129 129 Mai Hắc Đế, Hai Bà Trưng,Việt Nam   (04) 3821 6342   Cafe & Bistro', 0, 0),
(243, 'Cà Phê Green And White', ' ', '299, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.009046000000000, 105.858265999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Green And White 299, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(244, 'Cà Phê Đức', ' ', '2, Yec Xanh, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 4099', ' ', 21.013468000000000, 105.859536999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Đức 2, Yec Xanh, Q.Hai Bà Trưng,Việt Nam   (04) 3971 4099   Giải Trí , Café', 0, 0),
(245, 'Cafe Karaoke Jaguarudi', ' ', '21, Lê Văn Hưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3942 4488', ' ', 21.017845000000000, 105.854151000000000, 'Giải Trí , Karaoke', 205, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cafe Karaoke Jaguarudi 21, Lê Văn Hưu, Q.Hai Bà Trưng,Việt Nam   (04) 3942 4488   Giải Trí , Karaoke', 0, 0),
(246, 'Cà Phê Fastfood', ' ', '1A Tăng Bạt Hổ,Việt Nam', '(04) 3976 3466', ' ', 21.018004999999995, 105.858732000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Fastfood 1A Tăng Bạt Hổ,Việt Nam   (04) 3976 3466   Giải Trí , Café', 0, 0),
(247, 'Cà Phê Mirage', ' ', '42, Lê Đại Hành, Q.Hai Bà Trưng,Việt Nam', '(04) 3974 6384', ' ', 21.011115000000000, 105.848792000000000, 'Giải Trí , Café', 206, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Mirage 42, Lê Đại Hành, Q.Hai Bà Trưng,Việt Nam   (04) 3974 6384   Giải Trí , Café', 0, 0),
(248, 'Cà Phê Hà Nội Life', ' ', '127, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 3943 8890', ' ', 21.013487999999995, 105.850696000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Hà Nội Life 127, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   (04) 3943 8890   Giải Trí , Café', 0, 0),
(249, 'Bar Cafe', ' ', '54 Triệu Việt Vương, Hai Bà Trưng,Việt Nam', '(04) 3945 4077', ' ', 21.015740000000000, 105.850347000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Bar Cafe 54 Triệu Việt Vương, Hai Bà Trưng,Việt Nam   (04) 3945 4077   Cafe & Bistro', 0, 0),
(250, 'Cà Phê Đông Dương', ' ', '147, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.012837000000000, 105.850654000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Đông Dương 147, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(251, 'Cà Phê Phố Hoa', ' ', '121, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 3976 0491', ' ', 21.013708999999995, 105.850686000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Phố Hoa 121, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   (04) 3976 0491   Giải Trí , Café', 0, 0);
INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(252, 'Cà Phê 149', ' ', '149, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 2215 0852', ' ', 21.012777000000000, 105.850654000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê 149 149, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   (04) 2215 0852   Giải Trí , Café', 0, 0),
(253, 'Cafe Chi', ' ', '168, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 3974 3365', ' ', 21.012857000000000, 105.850664000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cafe Chi 168, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   (04) 3974 3365   Giải Trí , Café', 0, 0),
(254, 'Cà Phê 168A', ' ', '168A, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.012857000000000, 105.850664000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê 168A 168A, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(255, 'Quang Huy Cafe', ' ', '270 Bà Triệu, Hai Bà Trưng,Hà Nội, Việt Nam', '(04) 3974 4409', ' ', 21.013203000000000, 105.849122000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Quang Huy Cafe 270 Bà Triệu, Hai Bà Trưng,Hà Nội, Việt Nam   (04) 3974 4409   Quán cà phê', 0, 0),
(256, 'Cà Phê Mô Ka', ' ', '45A, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.010864000000000, 105.849978000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Mô Ka 45A, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(257, 'Cà Phê Gia Cảnh', ' ', '62, Hòa Mã, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 0854', ' ', 21.015301000000000, 105.854269000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:24', '2012-01-14 16:30:24', 1, NULL, 136, NULL, 1, 'Cà Phê Gia Cảnh 62, Hòa Mã, Q.Hai Bà Trưng,Việt Nam   (04) 3971 0854   Giải Trí , Café', 0, 0),
(258, 'Cafe - Smoothies', ' ', '16 Hoa Ma Street, Hai Ba Trung District,Vietnam', '(04) 3976 5307', ' ', 21.015312000000000, 105.855086000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cafe - Smoothies 16 Hoa Ma Street, Hai Ba Trung District,Vietnam   (04) 3976 5307   Cafe & Bistro', 0, 0),
(259, 'Delight', ' ', '34 Hang Chuoi, Hai Ba Trung district,Hanoi, Vietnam', '(04) 6682 0545', ' ', 21.016428000000000, 105.857461000000000, '', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Delight 34 Hang Chuoi, Hai Ba Trung district,Hanoi, Vietnam   (04) 6682 0545   ', 0, 0),
(260, 'Cà Phê Tài', ' ', '127, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 3976 0483', ' ', 21.013487999999995, 105.850696000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Tài 127, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   (04) 3976 0483   Giải Trí , Café', 0, 0),
(261, 'Nhà Hàng Cà Phê Điện Ảnh', ' ', '88 (Lầu 1), Lò Đúc, Q.Hai Bà Trưng,Việt Nam', '(04) 3976 2988', ' ', 21.014759999999995, 105.857268000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Nhà Hàng Cà Phê Điện Ảnh 88 (Lầu 1), Lò Đúc, Q.Hai Bà Trưng,Việt Nam   (04) 3976 2988   Giải Trí , Café', 0, 0),
(262, 'Cà Phê Thắng', ' ', '95, Lò Đúc, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.014845000000000, 105.857225000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Thắng 95, Lò Đúc, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(263, 'Cà Phê Kin', ' ', '50A, Hòa Mã, Q.Hai Bà Trưng,Việt Nam', '(04) 3943 7605', ' ', 21.015491000000000, 105.855680000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Kin 50A, Hòa Mã, Q.Hai Bà Trưng,Việt Nam   (04) 3943 7605   Giải Trí , Café', 0, 0),
(264, 'Cafe mobile 112', ' ', '112 Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 5803', ' ', 21.013240000000000, 105.850491000000000, 'Mua sắm , Điện thoại di động', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cafe mobile 112 112 Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam   (04) 3821 5803   Mua sắm , Điện thoại di động', 0, 0),
(265, '56 Cafe', ' ', '56 Hoa Ma Street, Hai Ba Trung District,Vietnam', '(04) 3971 1474', ' ', 21.015530999999996, 105.853958000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, '56 Cafe 56 Hoa Ma Street, Hai Ba Trung District,Vietnam   (04) 3971 1474   Cafe & Bistro', 0, 0),
(266, 'Ohayo Cafe', ' ', '51(2-3 Floor), Phan Chu Trinh, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 5960', ' ', 21.019456999999996, 105.855600000000000, 'Ẩm Thực , Nhật Bản', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Ohayo Cafe 51(2-3 Floor), Phan Chu Trinh, Q.Hoàn Kiếm,Việt Nam   (04) 3824 5960   Ẩm Thực , Nhật Bản', 0, 0),
(267, 'Tho Coffee', ' ', '117 Trieu Viet Vuong Street, Hai Ba Trung District,Vietnam', '(04) 6292 9597', ' ', 21.013871999999996, 105.850616000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Tho Coffee 117 Trieu Viet Vuong Street, Hai Ba Trung District,Vietnam   (04) 6292 9597   Cafe & Bistro', 0, 0),
(268, 'Cà Phê Life', ' ', '45, Lê Ngọc Hân, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.015787000000000, 105.855541000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Life 45, Lê Ngọc Hân, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(269, '35 Cafe', ' ', '35 Thai Phien Street, Hai Ba Trung District,Vietnam', '(04) 3974 2844', ' ', 21.010743999999995, 105.849581000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, '35 Cafe 35 Thai Phien Street, Hai Ba Trung District,Vietnam   (04) 3974 2844   Cafe & Bistro', 0, 0),
(270, 'Cà Phê Gloria Jean', ' ', '191, Bà Triệu, Q.Hai Bà Trưng,Việt Nam', '(04) 2222 5353', ' ', 21.011825999999996, 105.849318000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Gloria Jean 191, Bà Triệu, Q.Hai Bà Trưng,Việt Nam   (04) 2222 5353   Giải Trí , Café', 0, 0),
(271, 'Cà Phê New Star', ' ', '122, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.013418000000000, 105.850106000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê New Star 122, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(272, 'Cà Phê Trầm', ' ', '54, Trung Liệt, Q.Đống Đa,Việt Nam', '(04) 3851 3248', ' ', 21.012115999999995, 105.821384999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Trầm 54, Trung Liệt, Q.Đống Đa,Việt Nam   (04) 3851 3248   Giải Trí , Café', 0, 0),
(273, 'Mộc Xuân Trà', ' ', '1/178 Đường Thái Hà, Đống Đa,Hà Nội, Vietnam', '(04) 3538 0368', ' ', 21.013432999999996, 105.819899000000000, 'Café , Royal tea , cà phê , trà cung đình', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Mộc Xuân Trà 1/178 Đường Thái Hà, Đống Đa,Hà Nội, Vietnam   (04) 3538 0368   Café , Royal tea , cà phê , trà cung đình', 0, 0),
(274, 'Quán Cafe Sun Way', ' ', '7, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3537 3465', ' ', 21.010684000000000, 105.822501000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cafe Sun Way 7, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3537 3465   Giải Trí , Café', 0, 0),
(275, 'Quán Cafe A Ly', ' ', '63, Thái Thịnh, Q.Đống Đa,Việt Nam', '(04) 3562 0852', ' ', 21.008951000000000, 105.819980000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cafe A Ly 63, Thái Thịnh, Q.Đống Đa,Việt Nam   (04) 3562 0852   Giải Trí , Café', 0, 0),
(276, 'Chao Café', ' ', 'Thái Hà, Trung Liệt, Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.010100999999995, 105.823152999999990, '', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Chao Café Thái Hà, Trung Liệt, Đống Đa,Hà Nội, Việt Nam       ', 0, 0),
(277, 'Cà Phê Trang', ' ', '53, Đặng Tiến Đông, Q.Đống Đa,Việt Nam', '(04) 3537 3044', ' ', 21.011365000000000, 105.824475000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Trang 53, Đặng Tiến Đông, Q.Đống Đa,Việt Nam   (04) 3537 3044   Giải Trí , Café', 0, 0),
(278, 'Cà Phê Nhớ', ' ', '4, Đặng Tiến Đông, Q.Đống Đa,Việt Nam', '(04) 3537 5684', ' ', 21.011645000000000, 105.824406000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Nhớ 4, Đặng Tiến Đông, Q.Đống Đa,Việt Nam   (04) 3537 5684   Giải Trí , Café', 0, 0),
(279, 'Holyland Cafe', ' ', '193, Quan Dong Da, Đống Đa,Hà Nội, Vietnam', '091268 5698', ' ', 21.014489999999995, 105.821111000000000, '', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Holyland Cafe 193, Quan Dong Da, Đống Đa,Hà Nội, Vietnam   091268 5698   ', 0, 0),
(280, 'Cà Phê Huyền', ' ', '3, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3857 1719', ' ', 21.009747999999995, 105.823681000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Huyền 3, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3857 1719   Giải Trí , Café', 0, 0),
(281, 'Công Ty Cp Tm & Đầu Tư Tam Anh', ' ', '112, Trung Liệt, Q.Đống Đa,Việt Nam', '(04) 3791 4201', ' ', 21.010679000000000, 105.820071000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Công Ty Cp Tm & Đầu Tư Tam Anh 112, Trung Liệt, Q.Đống Đa,Việt Nam   (04) 3791 4201   Thực Phẩm , Trà, Cafe', 0, 0),
(282, 'Cà Phê 127', ' ', '127, Đặng Tiến Đông, Q.Đống Đa,Việt Nam', ' ', ' ', 21.012536999999995, 105.823413000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê 127 127, Đặng Tiến Đông, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(283, 'Cà Phê Phúc', ' ', '97, Thái Thịnh, Q.Đống Đa,Việt Nam', '(04) 3853 9179', ' ', 21.010473999999995, 105.818725000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Phúc 97, Thái Thịnh, Q.Đống Đa,Việt Nam   (04) 3853 9179   Giải Trí , Café', 0, 0),
(284, 'Cà Phê 97', ' ', '97, Trung Liệt, Q.Đống Đa,Việt Nam', '(04) 3857 4533', ' ', 21.011986000000000, 105.821289000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê 97 97, Trung Liệt, Q.Đống Đa,Việt Nam   (04) 3857 4533   Giải Trí , Café', 0, 0),
(285, 'Hương Café', ' ', '58, Trung Liệt, Q.Đống Đa,Việt Nam', '090440 3456', ' ', 21.012001000000000, 105.821251000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Hương Café 58, Trung Liệt, Q.Đống Đa,Việt Nam   090440 3456   Giải Trí , Café', 0, 0),
(286, 'Holyland Cafe', ' ', '193, Hà Nội,thủ đô Hà Nội, Việt Nam', '091268 5698', ' ', 21.014489999999995, 105.821111000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Holyland Cafe 193, Hà Nội,thủ đô Hà Nội, Việt Nam   091268 5698   Quán cà phê', 0, 0),
(287, 'Trà Thiên Sơn', ' ', 'Trung Liệt, Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.011575000000000, 105.820624000000000, '', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Trà Thiên Sơn Trung Liệt, Đống Đa,Hà Nội, Việt Nam       ', 0, 0),
(288, 'Cửa Hàng Trung Hiếu', ' ', '20, Thái Thịnh, Q.Đống Đa,Việt Nam', '(04) 3537 6368', ' ', 21.006426999999995, 105.822060999999990, 'Thiết Bị, Máy Móc , Thiết Bị Ngành Ảnh', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cửa Hàng Trung Hiếu 20, Thái Thịnh, Q.Đống Đa,Việt Nam   (04) 3537 6368   Thiết Bị, Máy Móc , Thiết Bị Ngành Ảnh', 0, 0),
(289, 'Duc Tri Cafe (Đức Trí Cafe)', ' ', 'D101 Thai Ha Street, Dong Da District (D101, Ngõ Thái Hà, Quận Đống Đa),Việt Nam', '(04) 3514 0880', ' ', 21.013268000000000, 105.820033999999990, 'Tiệm internet', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Duc Tri Cafe (Đức Trí Cafe) D101 Thai Ha Street, Dong Da District (D101, Ngõ Thái Hà, Quận Đống Đa),Việt Nam   (04) 3514 0880   Tiệm internet', 0, 0),
(290, 'Moon Cafe', ' ', 'Quang Trung, Đống Đa,thủ đô Hà Nội, Việt Nam', '090790 9068', ' ', 21.009667000000000, 105.827321000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Moon Cafe Quang Trung, Đống Đa,thủ đô Hà Nội, Việt Nam   090790 9068   Quán cà phê', 0, 0),
(291, 'New City Cafe Hanoi', ' ', '420 La Thanh Street, Dong Da Distric,Hà Nội, Vietnam', '090411 1323', ' ', 21.022451000000000, 105.823327000000000, 'Breakfast', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'New City Cafe Hanoi 420 La Thanh Street, Dong Da Distric,Hà Nội, Vietnam   090411 1323   Breakfast', 0, 0),
(292, 'CAFE LONG LIFE', ' ', '108F3 Thái Hà Q. Đống Đa,Việt Nam', '090328 7999', ' ', 21.013048000000000, 105.820270000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'CAFE LONG LIFE 108F3 Thái Hà Q. Đống Đa,Việt Nam   090328 7999   Cafe & Bistro', 0, 0),
(293, 'Cà Phê Trung Nguyên', ' ', '17 Ngõ 131, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3537 1343', ' ', 21.013127999999995, 105.819980000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 17 Ngõ 131, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3537 1343   Giải Trí , Café', 0, 0),
(294, 'Cà Phê Cây Doi', ' ', '112D, Thái Thịnh, Q.Đống Đa,Việt Nam', '(04) 3562 1091', ' ', 21.009302000000000, 105.819680000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Cây Doi 112D, Thái Thịnh, Q.Đống Đa,Việt Nam   (04) 3562 1091   Giải Trí , Café', 0, 0),
(295, 'Cà Phê Holy Land Rock', ' ', '193, Đặng Tiến Đông, Q.Đống Đa,Việt Nam', ' ', ' ', 21.014640000000000, 105.821675000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Holy Land Rock 193, Đặng Tiến Đông, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(296, 'Cà Phê 16', ' ', '96A, Thái Thịnh, Q.Đống Đa,Việt Nam', ' ', ' ', 21.007850000000000, 105.820865000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê 16 96A, Thái Thịnh, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(297, 'Quán Cà Phê Liên', ' ', '86, Trần Quang Diệu, Q.Đống Đa,Việt Nam', ' ', ' ', 21.014779999999995, 105.824196000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Liên 86, Trần Quang Diệu, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(298, 'Quán Cafe Nhật Linh', ' ', '107-G2, Thái Thịnh, Q.Đống Đa,Việt Nam', '(04) 3857 2587', ' ', 21.010113000000000, 105.819014000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cafe Nhật Linh 107-G2, Thái Thịnh, Q.Đống Đa,Việt Nam   (04) 3857 2587   Giải Trí , Café', 0, 0),
(299, 'Cà Phê Lang Biang', ' ', '103 (Khu Tt E6), Thái Thịnh, Q.Đống Đa,Việt Nam', ' ', ' ', 21.010187999999996, 105.818961000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Lang Biang 103 (Khu Tt E6), Thái Thịnh, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(300, 'Cafe Phương Anh', ' ', '58, Thái Thịnh, Q.Đống Đa,Việt Nam', ' ', ' ', 21.007052999999996, 105.821525000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cafe Phương Anh 58, Thái Thịnh, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(301, 'Quán Cà Phê Internet', ' ', '34, Hồ Đắc Di, Q.Đống Đa,Việt Nam', '(04) 3857 0044', ' ', 21.013508000000000, 105.827072000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Internet 34, Hồ Đắc Di, Q.Đống Đa,Việt Nam   (04) 3857 0044   Giải Trí , Café', 0, 0),
(302, 'Quán Bon Jour Cafe', ' ', '30, Thái Thịnh, Q.Đống Đa,Việt Nam', ' ', ' ', 21.006678000000000, 105.821895000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Bon Jour Cafe 30, Thái Thịnh, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(303, 'Quán đảo', ' ', 'Quan Dong Da, Đống Đa,Hà Nội, Vietnam', ' ', ' ', 21.016867999999995, 105.820923000000010, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán đảo Quan Dong Da, Đống Đa,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(304, 'Mozqrt Cafe', ' ', '41A, Trần Quang Diệu, Q.Đống Đa,Việt Nam', '(04) 6291 6651', ' ', 21.015611000000000, 105.824695000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Mozqrt Cafe 41A, Trần Quang Diệu, Q.Đống Đa,Việt Nam   (04) 6291 6651   Giải Trí , Café', 0, 0),
(305, 'Cà Phê 119', ' ', '119, Thái Thịnh, Q.Đống Đa,Việt Nam', ' ', ' ', 21.011755999999995, 105.817700000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê 119 119, Thái Thịnh, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(306, 'Café Hầm', ' ', 'Thái Thịnh, Ngã Tư Sở, Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.006385000000000, 105.821935000000010, '', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Café Hầm Thái Thịnh, Ngã Tư Sở, Đống Đa,Hà Nội, Việt Nam       ', 0, 0),
(307, 'Quán Cafe Ngọc Tú', ' ', '180B, Nguyễn Lương Bằng, Q.Đống Đa,Việt Nam', '(04) 3511 3716', ' ', 21.014930000000000, 105.827887000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cafe Ngọc Tú 180B, Nguyễn Lương Bằng, Q.Đống Đa,Việt Nam   (04) 3511 3716   Giải Trí , Café', 0, 0),
(308, 'Quán Cafe Hà Anh', ' ', '178A, Nguyễn Lương Bằng, Q.Đống Đa,Việt Nam', '(04) 3511 0080', ' ', 21.014930000000000, 105.827887000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cafe Hà Anh 178A, Nguyễn Lương Bằng, Q.Đống Đa,Việt Nam   (04) 3511 0080   Giải Trí , Café', 0, 0),
(309, 'Cà Phê 19', ' ', '9, Huỳnh Thúc Kháng, Q.Đống Đa,Việt Nam', '(04) 3773 2023', ' ', 21.017113999999996, 105.814169999999990, 'Giải Trí , Café', 207, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê 19 9, Huỳnh Thúc Kháng, Q.Đống Đa,Việt Nam   (04) 3773 2023   Giải Trí , Café', 0, 0),
(310, 'Moon Cafe', ' ', 'Quang Trung, Đống Đa,Hanoi, Vietnam', '090790 9068', ' ', 21.009664000000000, 105.827324000000000, '', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Moon Cafe Quang Trung, Đống Đa,Hanoi, Vietnam   090790 9068   ', 0, 0),
(311, 'Lolly Books Cafe', ' ', '18/131 Thai Ha, Dong Da,Hanoi, Vietnam', '(04) 6276 8545', ' ', 21.012556000000000, 105.818585000000000, '', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Lolly Books Cafe 18/131 Thai Ha, Dong Da,Hanoi, Vietnam   (04) 6276 8545   ', 0, 0),
(312, 'Cà Phê New Space', ' ', '65, Hồ Đắc Di, Q.Đống Đa,Việt Nam', ' ', ' ', 21.012006000000000, 105.829968000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê New Space 65, Hồ Đắc Di, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(313, 'Công Ty Tnhh Nestle Việt Nam', ' ', '22, Láng Hạ, Q.Đống Đa,Việt Nam', '(04) 3776 1643', ' ', 21.015782000000000, 105.814433000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Nestle Việt Nam 22, Láng Hạ, Q.Đống Đa,Việt Nam   (04) 3776 1643   Thực Phẩm , Trà, Cafe', 0, 0),
(314, 'Cà Phê Bar Nam Đồng', ' ', '17, Hồ Đắc Di, Q.Đống Đa,Việt Nam', '(04) 3537 0105', ' ', 21.011620000000000, 105.830687000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Bar Nam Đồng 17, Hồ Đắc Di, Q.Đống Đa,Việt Nam   (04) 3537 0105   Giải Trí , Café', 0, 0),
(315, 'Cà Phê Da Da', ' ', '111, Láng Hạ, Q.Đống Đa,Việt Nam', '(04) 3853 3615', ' ', 21.012125999999995, 105.812287000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Da Da 111, Láng Hạ, Q.Đống Đa,Việt Nam   (04) 3853 3615   Giải Trí , Café', 0, 0),
(316, 'Quán Cà Phê 2A', ' ', '12, Hoàng Cầu, Q.Đống Đa,Việt Nam', '(04) 6276 2127', ' ', 21.019947999999996, 105.825504999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cà Phê 2A 12, Hoàng Cầu, Q.Đống Đa,Việt Nam   (04) 6276 2127   Giải Trí , Café', 0, 0),
(317, 'Tzo Cafe', ' ', 'Đống Đa,Hanoi, Vietnam', ' ', ' ', 21.010446000000000, 105.831355000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Tzo Cafe Đống Đa,Hanoi, Vietnam       Quán cà phê', 0, 0),
(318, 'Ca Phe Binh cong', ' ', 'Tôn Thất Tùng, Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.004774999999995, 105.830601999999980, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Ca Phe Binh cong Tôn Thất Tùng, Đống Đa,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(319, 'Cà Phê Nhà Sàn', ' ', '8, Chùa Bộc, Q.Đống Đa,Việt Nam', ' ', ' ', 21.006868000000000, 105.829893000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Nhà Sàn 8, Chùa Bộc, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(320, 'Long Life Coffee', ' ', '108F3 Thai Ha Street, Dong Da District,Vietnam', '090328 7999', ' ', 21.014635999999996, 105.818456000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Long Life Coffee 108F3 Thai Ha Street, Dong Da District,Vietnam   090328 7999   Cafe & Bistro', 0, 0),
(321, 'Cà Phê Internet', ' ', '41, Nguyễn Ngọc Nại, Q.Thanh Xuân,Việt Nam', '(04) 3563 0315', ' ', 21.000026999999996, 105.823332999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Internet 41, Nguyễn Ngọc Nại, Q.Thanh Xuân,Việt Nam   (04) 3563 0315   Giải Trí , Café', 0, 0),
(322, 'Quán Cafe Nam Long', ' ', '171, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3514 5565', ' ', 21.015732000000000, 105.816300000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cafe Nam Long 171, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3514 5565   Giải Trí , Café', 0, 0),
(323, 'Quán Cà Phê 15 Wifi', ' ', '15, Hoàng Cầu, Q.Đống Đa,Việt Nam', ' ', ' ', 21.018816000000000, 105.825012000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cà Phê 15 Wifi 15, Hoàng Cầu, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(324, 'Bar Cafe Phương Thu', ' ', '216, Đường Láng, Q.Đống Đa,Việt Nam', ' ', ' ', 21.004750000000000, 105.817786000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Bar Cafe Phương Thu 216, Đường Láng, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(325, 'Cafe Hằng', ' ', '732, Bạch Đằng, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.012477000000000, 105.866736000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cafe Hằng 732, Bạch Đằng, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(326, 'Cafe', ' ', '172 Lạc Trung, Hai Bà Trưng,Việt Nam', '(04) 3821 1085', ' ', 21.002991999999995, 105.864193000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cafe 172 Lạc Trung, Hai Bà Trưng,Việt Nam   (04) 3821 1085   Cafe & Bistro', 0, 0),
(327, 'New Coffee', ' ', '59, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', '094803 3633', ' ', 21.002972000000000, 105.866779000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'New Coffee 59, Lạc Trung, Q.Hai Bà Trưng,Việt Nam   094803 3633   Giải Trí , Café', 0, 0),
(328, 'Quán Cafe Trung Nguyên', ' ', '5, Nguyễn Huy Tự, Q.Hai Bà Trưng,Việt Nam', '(04) 3972 3178', ' ', 21.013949000000000, 105.862841999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Quán Cafe Trung Nguyên 5, Nguyễn Huy Tự, Q.Hai Bà Trưng,Việt Nam   (04) 3972 3178   Giải Trí , Café', 0, 0),
(329, 'Anh Đào cafe', ' ', '340 Lạc Trung, Hai Bà Trưng,Việt Nam', '(04) 3821 9109', ' ', 21.003091999999995, 105.868657000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Anh Đào cafe 340 Lạc Trung, Hai Bà Trưng,Việt Nam   (04) 3821 9109   Cafe & Bistro', 0, 0),
(330, 'Cà Phê Việt Style', ' ', '300, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.002972000000000, 105.867830000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Việt Style 300, Lạc Trung, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(331, 'Cà Phê Thái', ' ', '298, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', '(04) 3987 1554', ' ', 21.002977000000000, 105.867820000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Thái 298, Lạc Trung, Q.Hai Bà Trưng,Việt Nam   (04) 3987 1554   Giải Trí , Café', 0, 0),
(332, 'Cửa Hàng Lương Thực Trà Tư', ' ', '815, Bạch Đằng, Q.Hai Bà Trưng,Việt Nam', '(04) 3984 3165', ' ', 21.017614999999996, 105.864730000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cửa Hàng Lương Thực Trà Tư 815, Bạch Đằng, Q.Hai Bà Trưng,Việt Nam   (04) 3984 3165   Thực Phẩm , Trà, Cafe', 0, 0),
(333, 'Cà Phê Fast Food', ' ', '260, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.002977000000000, 105.867294000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Fast Food 260, Lạc Trung, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(334, 'Cà Phê Trung Nguyên', ' ', '240, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.002972000000000, 105.867037000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 240, Lạc Trung, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(335, 'Cà Phê Honey', ' ', '254, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam', '(04) 2243 1460', ' ', 21.009142000000000, 105.861113999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Honey 254, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam   (04) 2243 1460   Giải Trí , Café', 0, 0),
(336, 'ATA Coffee', ' ', '37A Cam Hoi Street, Hai Ba Trung District,Vietnam', '(04) 3971 9594', ' ', 21.011505000000000, 105.861104000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'ATA Coffee 37A Cam Hoi Street, Hai Ba Trung District,Vietnam   (04) 3971 9594   Cafe & Bistro', 0, 0),
(337, 'Cà Phê Chi Chi', ' ', '214, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.002972000000000, 105.866649999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Chi Chi 214, Lạc Trung, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(338, 'Cà Phê Nhít', ' ', '1A, Nguyễn Cao, Q.Hai Bà Trưng,Việt Nam', '(04) 3972 6756', ' ', 21.013097999999996, 105.861254000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cà Phê Nhít 1A, Nguyễn Cao, Q.Hai Bà Trưng,Việt Nam   (04) 3972 6756   Giải Trí , Café', 0, 0),
(339, 'Cafe 132', ' ', '132 Lac Trung Street, Hai Ba Trung District,Vietnam', '(04) 3987 4478', ' ', 21.002994999999995, 105.865671000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cafe 132 132 Lac Trung Street, Hai Ba Trung District,Vietnam   (04) 3987 4478   Cafe & Bistro', 0, 0),
(340, 'Cafe Fastfood Tomo', ' ', '43, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.011524999999995, 105.860406000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:25', '2012-01-14 16:30:25', 1, NULL, 136, NULL, 1, 'Cafe Fastfood Tomo 43, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(341, 'Quán Cafe 30', ' ', '30, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 0261', ' ', 21.011534999999995, 105.860428000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Quán Cafe 30 30, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam   (04) 3821 0261   Giải Trí , Café', 0, 0),
(342, 'Quán Cafe Trà Diamah', ' ', '37A, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 9549', ' ', 21.011555000000000, 105.860374000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Quán Cafe Trà Diamah 37A, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam   (04) 3971 9549   Giải Trí , Café', 0, 0),
(343, 'Quán Cà Phê Anh Em', ' ', '35C, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 6329', ' ', 21.011565000000000, 105.860363000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Anh Em 35C, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam   (04) 3971 6329   Giải Trí , Café', 0, 0),
(344, 'Quán Cafe Đức Anh', ' ', '35D, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam', '(04) 3917 8957', ' ', 21.011565000000000, 105.860363000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Quán Cafe Đức Anh 35D, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam   (04) 3917 8957   Giải Trí , Café', 0, 0),
(345, 'Quán Cafe Khánh', ' ', '31A, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 3330', ' ', 21.011585000000000, 105.860342000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Quán Cafe Khánh 31A, Cẩm Hội, Q.Hai Bà Trưng,Việt Nam   (04) 3971 3330   Giải Trí , Café', 0, 0),
(346, 'Quán Cafe Chéng', ' ', '7, Trần Thánh Tông, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 4970', ' ', 21.014188999999995, 105.860105999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Quán Cafe Chéng 7, Trần Thánh Tông, Q.Hai Bà Trưng,Việt Nam   (04) 3971 4970   Giải Trí , Café', 0, 0),
(347, 'Cà Phê Baileys', ' ', '156, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 7668', ' ', 21.002967000000000, 105.864982000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Baileys 156, Lạc Trung, Q.Hai Bà Trưng,Việt Nam   (04) 3971 7668   Giải Trí , Café', 0, 0),
(348, 'Cà Phê Tomorrow', ' ', '144, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 2474', ' ', 21.002972000000000, 105.864966000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Tomorrow 144, Lạc Trung, Q.Hai Bà Trưng,Việt Nam   (04) 3821 2474   Giải Trí , Café', 0, 0),
(349, 'Cà Phê Thư Quán', ' ', '254, Lạc Trung, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.002991999999995, 105.864601000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Thư Quán 254, Lạc Trung, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(350, 'Công Ty Kd Tm Tổng Hợp Nam Sơn', ' ', '46, Tăng Bạt Hổ, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 6171', ' ', 21.014690000000000, 105.859289999999990, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Công Ty Kd Tm Tổng Hợp Nam Sơn 46, Tăng Bạt Hổ, Q.Hai Bà Trưng,Việt Nam   (04) 3971 6171   Thực Phẩm , Trà, Cafe', 0, 0),
(351, 'Cà Phê Sắc Màu', ' ', '9, Trần Thánh Tông, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.013508000000000, 105.860244999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Sắc Màu 9, Trần Thánh Tông, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(352, 'Cà phê Tiến Đạt', ' ', '157 Kim Ngưu, Hai Bà Trưng,Việt Nam', '(04) 3987 0477', ' ', 21.006197000000000, 105.861168000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà phê Tiến Đạt 157 Kim Ngưu, Hai Bà Trưng,Việt Nam   (04) 3987 0477   Cafe & Bistro', 0, 0),
(353, 'Cửa Hàng Chè Việt', ' ', '139, Lò Đúc, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.011289999999995, 105.859660000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cửa Hàng Chè Việt 139, Lò Đúc, Q.Hai Bà Trưng,Việt Nam       Thực Phẩm , Trà, Cafe', 0, 0),
(354, 'Chi Nhánh Cty Cổ Phần VINA CAFE Biên Hoà', ' ', '780 Minh Khai Vĩnh Tuy,Hà Nội, Việt Nam', '(04) 3987 6260', ' ', 21.000367000000000, 105.870759000000000, '', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Chi Nhánh Cty Cổ Phần VINA CAFE Biên Hoà 780 Minh Khai Vĩnh Tuy,Hà Nội, Việt Nam   (04) 3987 6260   ', 0, 0),
(355, 'Chi Nhánh Cty Cổ Phần VINA CAFE Biên Hoà', ' ', '780 Minh Khai Vĩnh Tuy,Hà Nội, Việt Nam', '(04) 3987 6259', ' ', 21.000367000000000, 105.870759000000000, '', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Chi Nhánh Cty Cổ Phần VINA CAFE Biên Hoà 780 Minh Khai Vĩnh Tuy,Hà Nội, Việt Nam   (04) 3987 6259   ', 0, 0),
(356, 'Bảo Như', ' ', '340 Minh Khai, Hai Bà Trưng,Việt Nam', '(04) 3633 9569', ' ', 21.000367000000000, 105.870759000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Bảo Như 340 Minh Khai, Hai Bà Trưng,Việt Nam   (04) 3633 9569   Cafe & Bistro', 0, 0),
(357, 'Siêu Thị Trà Teamart', ' ', '46, Tăng Bạt Hổ, Q.Hai Bà Trưng,Việt Nam', '(04) 3622 6991', ' ', 21.014690000000000, 105.859289999999990, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Siêu Thị Trà Teamart 46, Tăng Bạt Hổ, Q.Hai Bà Trưng,Việt Nam   (04) 3622 6991   Thực Phẩm , Trà, Cafe', 0, 0),
(358, 'Cà Phê 60', ' ', '60, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam', '(04) 3972 0767', ' ', 21.014569999999996, 105.858721999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê 60 60, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam   (04) 3972 0767   Giải Trí , Café', 0, 0),
(359, 'Cà Phê Thanh Hằng', ' ', '12, Nguyễn Công Trứ, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 0910', ' ', 21.014569999999996, 105.858721999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Thanh Hằng 12, Nguyễn Công Trứ, Q.Hai Bà Trưng,Việt Nam   (04) 3971 0910   Giải Trí , Café', 0, 0),
(360, 'Cà Phê Thảo', ' ', '66, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam', '(04) 3972 3117', ' ', 21.014669999999995, 105.858679000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Thảo 66, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam   (04) 3972 3117   Giải Trí , Café', 0, 0),
(361, 'Cà Phê 38', ' ', '38, Tăng Bạt Hổ, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.015841999999996, 105.858915000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê 38 38, Tăng Bạt Hổ, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(362, 'Cafe 58', ' ', '58 Hàng Chuối, Hai Bà Trưng,Việt Nam', '(04) 6296 6312', ' ', 21.014630000000000, 105.858470000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe 58 58 Hàng Chuối, Hai Bà Trưng,Việt Nam   (04) 6296 6312   Cafe & Bistro', 0, 0),
(363, 'Cafe 45', ' ', '45 Hàng Chuối, Hai Bà Trưng,Việt Nam', '(04) 6295 9375', ' ', 21.014630000000000, 105.858470000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe 45 45 Hàng Chuối, Hai Bà Trưng,Việt Nam   (04) 6295 9375   Cafe & Bistro', 0, 0),
(364, 'Cafe 332', ' ', '332 Lạc Trung, Hai Bà Trưng,Việt Nam', '(04) 3987 1554', ' ', 21.002994999999995, 105.865671000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe 332 332 Lạc Trung, Hai Bà Trưng,Việt Nam   (04) 3987 1554   Cafe & Bistro', 0, 0),
(365, 'Cafe 132', ' ', '132 Lạc Trung, Hai Bà Trưng,Việt Nam', '(04) 3987 4478', ' ', 21.002994999999995, 105.865671000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe 132 132 Lạc Trung, Hai Bà Trưng,Việt Nam   (04) 3987 4478   Cafe & Bistro', 0, 0),
(366, 'Cafe 72', ' ', '72 Lạc Trung, Hai Bà Trưng,Việt Nam', '(04) 3971 7668', ' ', 21.002973999999995, 105.864829000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe 72 72 Lạc Trung, Hai Bà Trưng,Việt Nam   (04) 3971 7668   Cafe & Bistro', 0, 0),
(367, 'ATA Cafe, giải khát, trà Dilmah', ' ', '37A Cảm Hội, Hai Bà Trưng,Việt Nam', '(04) 3971 9594', ' ', 21.010760999999995, 105.860144000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'ATA Cafe, giải khát, trà Dilmah 37A Cảm Hội, Hai Bà Trưng,Việt Nam   (04) 3971 9594   Cafe & Bistro', 0, 0),
(368, 'La Felicita cafe', ' ', '46 Cảm Hội, Hai Bà Trưng,Hanoi, Vietnam', '(04) 8582 0686', ' ', 21.010694000000000, 105.860063000000010, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'La Felicita cafe 46 Cảm Hội, Hai Bà Trưng,Hanoi, Vietnam   (04) 8582 0686   Quán cà phê', 0, 0),
(369, 'Tien Dat Coffee', ' ', '157 Kim Nguu Street, Hai Ba Trung District,Vietnam', '(04) 3987 0477', ' ', 21.005936999999996, 105.861297000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Tien Dat Coffee 157 Kim Nguu Street, Hai Ba Trung District,Vietnam   (04) 3987 0477   Cafe & Bistro', 0, 0),
(370, 'Cửa hàng Kem Snowball', ' ', '20 Nguyễn Thị Định, Thanh Xuân,Hà Nội, Vietnam', ' ', ' ', 21.006547999999995, 105.806038000000020, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cửa hàng Kem Snowball 20 Nguyễn Thị Định, Thanh Xuân,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(371, 'Logo Oto Fun', ' ', 'Nguyễn Thị Định,Hà Nội, Vietnam', ' ', ' ', 21.012452000000000, 105.803672000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Logo Oto Fun Nguyễn Thị Định,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(372, 'Cafe Cao', ' ', '141, Hoàng Ngân, Q.Cầu Giấy,Việt Nam', '(04) 3556 8510', ' ', 21.010113000000000, 105.804842000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe Cao 141, Hoàng Ngân, Q.Cầu Giấy,Việt Nam   (04) 3556 8510   Giải Trí , Café', 0, 0),
(373, 'Cafe Bach Hop', ' ', 'Nguyễn Thị Định,Việt Nam', ' ', ' ', 21.010815999999995, 105.804767000000000, '', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe Bach Hop Nguyễn Thị Định,Việt Nam       ', 0, 0),
(374, 'Công Ty Xline98 (Cafe Mr.Big)', ' ', '128, Nguyễn Chí Thanh, Q.Ba Đình,Việt Nam', '(04) 6296 8885', ' ', 21.015882000000000, 105.805405000000000, 'Nội Thất , Thiết Kế, Trang Trí', 208, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Công Ty Xline98 (Cafe Mr.Big) 128, Nguyễn Chí Thanh, Q.Ba Đình,Việt Nam   (04) 6296 8885   Nội Thất , Thiết Kế, Trang Trí', 0, 0),
(375, 'Galaxy Cafe', ' ', 'Trung Hoa, Cau Giay District,Hanoi, Vietnam', ' ', ' ', 21.014370000000000, 105.801977000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Galaxy Cafe Trung Hoa, Cau Giay District,Hanoi, Vietnam       Quán cà phê', 0, 0),
(376, 'My Way Cafe', ' ', '24T2 Hoàng Đạo Thúy, Thanh Xuân,Hà Nội, Việt Nam', '(04) 2221 2256', ' ', 21.007341000000000, 105.803020000000000, 'Nhà hàng', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'My Way Cafe 24T2 Hoàng Đạo Thúy, Thanh Xuân,Hà Nội, Việt Nam   (04) 2221 2256   Nhà hàng', 0, 0),
(377, 'Cà Phê Verona', ' ', '22A, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 3784 0590', ' ', 21.014009000000000, 105.803404000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Verona 22A, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 3784 0590   Giải Trí , Café', 0, 0),
(378, 'Cafe My Friend', ' ', '83 Nguyễn Thị Định, Cầu Giấy, Hà Nội,83 Nguyễn Thị Định, Việt Nam', ' ', ' ', 21.012104999999995, 105.804172000000000, '', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe My Friend 83 Nguyễn Thị Định, Cầu Giấy, Hà Nội,83 Nguyễn Thị Định, Việt Nam       ', 0, 0),
(379, 'QUÁN CÀ PHÊ GIẤY', ' ', '5 ngõ 45 Hào Nam Q. Đống Đa,Việt Nam', '091600 5123', ' ', 21.011310999999996, 105.803667000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'QUÁN CÀ PHÊ GIẤY 5 ngõ 45 Hào Nam Q. Đống Đa,Việt Nam   091600 5123   Cafe & Bistro', 0, 0),
(380, 'Echo', ' ', '16-107 Nguyễn Chí Thanh, Dong Da,Hanoi, Vietnam', '(04) 2212 2253', ' ', 21.015511000000000, 105.805507000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Echo 16-107 Nguyễn Chí Thanh, Dong Da,Hanoi, Vietnam   (04) 2212 2253   Quán cà phê', 0, 0),
(381, 'Deli Coffee', ' ', '105/111 Lang Ha Street, Dong Da District,Vietnam', '(04) 3562 4341', ' ', 21.011565000000000, 105.811075000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Deli Coffee 105/111 Lang Ha Street, Dong Da District,Vietnam   (04) 3562 4341   Cafe & Bistro', 0, 0),
(382, 'Q Cafe', ' ', 'Tầng 1 Tòa nhà 17T11, Nguyễn Thị Định, Cầu Giấy, Hà Nội,17T11 Nguyễn Thị Định, Hà Nội, Việt Nam', ' ', ' ', 21.011958000000000, 105.803871000000000, '', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Q Cafe Tầng 1 Tòa nhà 17T11, Nguyễn Thị Định, Cầu Giấy, Hà Nội,17T11 Nguyễn Thị Định, Hà Nội, Việt Nam       ', 0, 0),
(383, 'Cà Phê Trung Nguyên', ' ', '83, Nguyễn Ngọc Vũ, Q.Cầu Giấy,Việt Nam', '098395 2686', ' ', 21.010083000000000, 105.811064000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 83, Nguyễn Ngọc Vũ, Q.Cầu Giấy,Việt Nam   098395 2686   Giải Trí , Café', 0, 0),
(384, 'Cafe BDS', ' ', 'Nhân Chính, Thanh Xuân,Hà Nội, Việt Nam', ' ', ' ', 21.007363999999995, 105.803517000000000, '', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe BDS Nhân Chính, Thanh Xuân,Hà Nội, Việt Nam       ', 0, 0),
(385, 'Cà Phê Nhật Anh', ' ', '5, Nguyễn Khang, Q.Cầu Giấy,Việt Nam', '(04) 3783 1220', ' ', 21.015196000000000, 105.804561999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Nhật Anh 5, Nguyễn Khang, Q.Cầu Giấy,Việt Nam   (04) 3783 1220   Giải Trí , Café', 0, 0),
(386, 'Cà Phê Hồng', ' ', '71, Nguyên Hồng, Q.Đống Đa,Việt Nam', '(04) 3514 7355', ' ', 21.016473000000000, 105.811054000000000, 'Cafe & Bistro', 209, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Hồng 71, Nguyên Hồng, Q.Đống Đa,Việt Nam   (04) 3514 7355   Cafe & Bistro', 0, 0),
(387, 'Cafe BDS', ' ', 'Nhân Chính, Thanh Xuân,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.007363999999995, 105.803517000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe BDS Nhân Chính, Thanh Xuân,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(388, 'Cà Phê Ống', ' ', '43, Huỳnh Thúc Kháng, Q.Đống Đa,Việt Nam', '(04) 3773 6245', ' ', 21.018675999999996, 105.810968000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê Ống 43, Huỳnh Thúc Kháng, Q.Đống Đa,Việt Nam   (04) 3773 6245   Giải Trí , Café', 0, 0),
(389, 'Cafe - Cơm văn phòng - Các món tự chọn', ' ', '10 Nguyễn Thị Định, Thanh Xuân,Việt Nam', '(04) 2247 4555', ' ', 21.007434000000000, 105.805379000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cafe - Cơm văn phòng - Các món tự chọn 10 Nguyễn Thị Định, Thanh Xuân,Việt Nam   (04) 2247 4555   Cafe & Bistro', 0, 0),
(390, 'Cà Phê New Window', ' ', '76, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam', '(04) 3775 3083', ' ', 21.017564000000000, 105.806923000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:26', '2012-01-14 16:30:26', 1, NULL, 136, NULL, 1, 'Cà Phê New Window 76, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam   (04) 3775 3083   Giải Trí , Café', 0, 0);
INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(391, 'Nhà Hàng Cafe Baci', ' ', '15 Huỳnh Thúc Kháng, Đống Đa,Việt Nam', '(04) 6295 3795', ' ', 21.018559000000000, 105.810801000000000, 'Cafe & Bistro', 210, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Nhà Hàng Cafe Baci 15 Huỳnh Thúc Kháng, Đống Đa,Việt Nam   (04) 6295 3795   Cafe & Bistro', 0, 0),
(392, 'Kim Cafe', ' ', 'Hanoi,Vietnam', ' ', ' ', 21.011751000000000, 105.801301000000000, '', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Kim Cafe Hanoi,Vietnam       ', 0, 0),
(393, 'Mimosa Cafe', ' ', 'Hoàng Đạo Thúy, Thanh Xuân,Hà Nội, Việt Nam', ' ', ' ', 21.006162000000000, 105.803548999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Mimosa Cafe Hoàng Đạo Thúy, Thanh Xuân,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(394, 'Cà Phê Phố', ' ', '32-B9, Vũ Ngọc Phan, Q.Đống Đa,Việt Nam', ' ', ' ', 21.014178999999995, 105.811054000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Cà Phê Phố 32-B9, Vũ Ngọc Phan, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(395, 'Bobbi Cafe', ' ', '105 - A4 Nguyên Hồng, Đống Đa,Việt Nam', '(04) 3773 7288', ' ', 21.015114000000000, 105.809272999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Bobbi Cafe 105 - A4 Nguyên Hồng, Đống Đa,Việt Nam   (04) 3773 7288   Cafe & Bistro', 0, 0),
(396, 'Bar - Café Fast Food Karaoke', ' ', '12, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', ' ', ' ', 21.014410000000000, 105.803833000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Bar - Café Fast Food Karaoke 12, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam       Giải Trí , Bar', 0, 0),
(397, 'Cafe Hoa', ' ', '31 Ngõ 61, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 2246 6615', ' ', 21.013207999999995, 105.802867000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Cafe Hoa 31 Ngõ 61, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 2246 6615   Giải Trí , Café', 0, 0),
(398, 'Cafe Fasfood Alozo', ' ', '105/111, Láng Hạ, Q.Đống Đa,Việt Nam', '(04) 3562 5604', ' ', 21.012397000000000, 105.812164000000000, 'Ẩm Thực , Cơm', 211, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Cafe Fasfood Alozo 105/111, Láng Hạ, Q.Đống Đa,Việt Nam   (04) 3562 5604   Ẩm Thực , Cơm', 0, 0),
(399, 'Nhà Hàng Cafe Queen', ' ', '12, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 3783 1359', ' ', 21.014804999999996, 105.804107000000000, 'Ẩm Thực , Nhà Hàng', 212, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Nhà Hàng Cafe Queen 12, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 3783 1359   Ẩm Thực , Nhà Hàng', 0, 0),
(400, 'Cafe Ánh Dương', ' ', '42 Trần Duy Hưng, Quận Cầu Giấy,Việt Nam', '(04) 3784 6982', ' ', 21.015083000000000, 105.804383000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Cafe Ánh Dương 42 Trần Duy Hưng, Quận Cầu Giấy,Việt Nam   (04) 3784 6982   Cafe & Bistro', 0, 0),
(401, 'Bao Tung Coffee', ' ', '50 Truc Khe Street, Dong Da District,Vietnam', '(04) 6275 3262', ' ', 21.015612000000000, 105.809310000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Bao Tung Coffee 50 Truc Khe Street, Dong Da District,Vietnam   (04) 6275 3262   Cafe & Bistro', 0, 0),
(402, 'Felice Coffee', ' ', '21/62 Nguyen Hong Street, Dong Da District,Vietnam', '098398 1611', ' ', 21.015650999999995, 105.809559000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Felice Coffee 21/62 Nguyen Hong Street, Dong Da District,Vietnam   098398 1611   Cafe & Bistro', 0, 0),
(403, 'Cà Phê Quang Hà', ' ', '130, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam', '(04) 3775 1294', ' ', 21.015912000000000, 105.805473999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Cà Phê Quang Hà 130, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam   (04) 3775 1294   Giải Trí , Café', 0, 0),
(404, 'Cà Phê Phố Nhỏ', ' ', '35, Nguyễn Khang, Q.Cầu Giấy,Việt Nam', ' ', ' ', 21.015702000000000, 105.804080000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Cà Phê Phố Nhỏ 35, Nguyễn Khang, Q.Cầu Giấy,Việt Nam       Giải Trí , Café', 0, 0),
(405, 'Cà Phê Hạ Trắng', ' ', '23, Nguyễn Khang, Q.Cầu Giấy,Việt Nam', '(04) 3556 8155', ' ', 21.015501000000000, 105.804273000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:27', '2012-01-14 16:30:27', 1, NULL, 136, NULL, 1, 'Cà Phê Hạ Trắng 23, Nguyễn Khang, Q.Cầu Giấy,Việt Nam   (04) 3556 8155   Giải Trí , Café', 0, 0),
(406, 'Cafe Nhac Trinh', ' ', '101 Trung Kính, Cau Giay District,Hanoi, Vietnam', ' ', ' ', 21.013708999999995, 105.797310000000000, 'Quán cà phê', 213, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cafe Nhac Trinh 101 Trung Kính, Cau Giay District,Hanoi, Vietnam       Quán cà phê', 0, 0),
(407, 'Cà Phê Hoàng Lan', ' ', '40, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 3784 3602', ' ', 21.012471999999995, 105.801666000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Hoàng Lan 40, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 3784 3602   Giải Trí , Café', 0, 0),
(408, 'Cà Phê Anoma', ' ', '36, Trung Hòa, Q.Cầu Giấy,Việt Nam', '(04) 3784 4764', ' ', 21.014033999999995, 105.802400999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Anoma 36, Trung Hòa, Q.Cầu Giấy,Việt Nam   (04) 3784 4764   Giải Trí , Café', 0, 0),
(409, 'Hong Coffee', ' ', '81 Lang Ha Street Street. Dong Da Dístrict,Vietnam', '(04) 3514 7355', ' ', 21.011406000000000, 105.811555000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Hong Coffee 81 Lang Ha Street Street. Dong Da Dístrict,Vietnam   (04) 3514 7355   Cafe & Bistro', 0, 0),
(410, 'Cà Phê Mai Anh', ' ', '65, Nguyên Hồng, Q.Đống Đa,Việt Nam', '(04) 3776 3343', ' ', 21.016853000000000, 105.811268000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Mai Anh 65, Nguyên Hồng, Q.Đống Đa,Việt Nam   (04) 3776 3343   Giải Trí , Café', 0, 0),
(411, 'Cà Phê Chi', ' ', '45, Nguyễn Khang, Q.Cầu Giấy,Việt Nam', ' ', ' ', 21.015872000000000, 105.803919000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Chi 45, Nguyễn Khang, Q.Cầu Giấy,Việt Nam       Giải Trí , Café', 0, 0),
(412, 'Cà Phê Phố Nhỏ', ' ', '155, Pháo Đài Láng, Q.Đống Đa,Việt Nam', '(04) 3927 0562', ' ', 21.018395999999996, 105.804116999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Phố Nhỏ 155, Pháo Đài Láng, Q.Đống Đa,Việt Nam   (04) 3927 0562   Giải Trí , Café', 0, 0),
(413, 'Galaxy Cafe', ' ', 'Trung Hòa, Cầu Giấy,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.014370000000000, 105.801977000000000, '', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Galaxy Cafe Trung Hòa, Cầu Giấy,thủ đô Hà Nội, Việt Nam       ', 0, 0),
(414, 'Cafe Nhà Hàng Tre Tràm', ' ', '134, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 6282 0049', ' ', 21.010323000000000, 105.799118000000000, 'Ẩm Thực , Nhà Hàng', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cafe Nhà Hàng Tre Tràm 134, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 6282 0049   Ẩm Thực , Nhà Hàng', 0, 0),
(415, 'Cà Phê Trung Nguyên', ' ', '52, Quan Nhân, Q.Thanh Xuân,Việt Nam', '(04) 3558 0645', ' ', 21.007579000000000, 105.812631000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 52, Quan Nhân, Q.Thanh Xuân,Việt Nam   (04) 3558 0645   Giải Trí , Café', 0, 0),
(416, 'Cafe - Buffet', ' ', '10 Nguyen Thi Dinh Street, Thanh Xuan District,Vietnam', '(04) 2247 4555', ' ', 21.006929000000000, 105.805732999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cafe - Buffet 10 Nguyen Thi Dinh Street, Thanh Xuan District,Vietnam   (04) 2247 4555   Cafe & Bistro', 0, 0),
(417, 'Cafe - Bar Citylife', ' ', '20, Huỳnh Thúc Kháng, Q.Đống Đa,Việt Nam', '(04) 6295 1422', ' ', 21.019597999999995, 105.809283000000010, 'Giải Trí , Bar', 214, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cafe - Bar Citylife 20, Huỳnh Thúc Kháng, Q.Đống Đa,Việt Nam   (04) 6295 1422   Giải Trí , Bar', 0, 0),
(418, 'Cafe Papa', ' ', '2/111, Láng Hạ, Q.Đống Đa,Việt Nam', '(04) 3853 3615', ' ', 21.012025999999995, 105.811960000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cafe Papa 2/111, Láng Hạ, Q.Đống Đa,Việt Nam   (04) 3853 3615   Giải Trí , Café', 0, 0),
(419, 'Cà Phê Ánh Nguyệt', ' ', '497, Nguyễn Khang, Q.Cầu Giấy,Việt Nam', '(04) 3767 2985', ' ', 21.016172000000000, 105.803629000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Ánh Nguyệt 497, Nguyễn Khang, Q.Cầu Giấy,Việt Nam   (04) 3767 2985   Giải Trí , Café', 0, 0),
(420, 'Osin Cafe', ' ', '145 Ngõ Thái Thịnh 1, Đống Đa,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.008350000000000, 105.815092999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Osin Cafe 145 Ngõ Thái Thịnh 1, Đống Đa,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(421, 'Windows Cafe', ' ', 'Quan Thanh Xuan, Đống Đa,Hà Nội, Vietnam', ' ', ' ', 21.017282999999995, 105.806272999999990, '', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Windows Cafe Quan Thanh Xuan, Đống Đa,Hà Nội, Vietnam       ', 0, 0),
(422, 'Moon Garden', ' ', 'Nhân Chính, Thanh Xuân,thủ đô Hà Nội, Việt Nam', '(04) 3555 8543', ' ', 21.006782999999995, 105.814363000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Moon Garden Nhân Chính, Thanh Xuân,thủ đô Hà Nội, Việt Nam   (04) 3555 8543   Quán cà phê', 0, 0),
(423, 'Windows Cafe', ' ', 'Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.017282999999995, 105.806272999999990, 'Nhà hàng', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Windows Cafe Hà Nội,thủ đô Hà Nội, Việt Nam       Nhà hàng', 0, 0),
(424, 'London Coffee', ' ', '91 Nguyễn Chí Thanh, Đống Đa,Hà Nội, Việt Nam', '(04) 6276 9096', ' ', 21.020329000000000, 105.808811000000000, '', 215, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'London Coffee 91 Nguyễn Chí Thanh, Đống Đa,Hà Nội, Việt Nam   (04) 6276 9096   ', 0, 0),
(425, 'Cà Phê Trang', ' ', '109, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 3554 3726', ' ', 21.010874000000000, 105.800335000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Trang 109, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 3554 3726   Giải Trí , Café', 0, 0),
(426, 'Cafe Đắng', ' ', '59A Huỳnh Thúc Kháng, Đống Đa,Hà Nội, Vietnam', ' ', ' ', 21.019447000000000, 105.808656000000000, '', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cafe Đắng 59A Huỳnh Thúc Kháng, Đống Đa,Hà Nội, Vietnam       ', 0, 0),
(427, 'Bảo Tùng - Cafe, cơm văn phòng', ' ', '50 Trúc Khê, Đống Đa,Việt Nam', '(04) 6275 3262', ' ', 21.015612000000000, 105.809310000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Bảo Tùng - Cafe, cơm văn phòng 50 Trúc Khê, Đống Đa,Việt Nam   (04) 6275 3262   Cafe & Bistro', 0, 0),
(428, 'Bít tết BigBen', ' ', '6 Hoàng Ngọc Phách, Đống Đa,Việt Nam', '(04) 3776 4855', ' ', 21.015065000000000, 105.813300000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Bít tết BigBen 6 Hoàng Ngọc Phách, Đống Đa,Việt Nam   (04) 3776 4855   Cafe & Bistro', 0, 0),
(429, '3B Cafe', ' ', 'Lê Văn Lương, Thanh Xuân,Hà Nội, Việt Nam', ' ', ' ', 21.003688000000000, 105.802009000000000, '', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, '3B Cafe Lê Văn Lương, Thanh Xuân,Hà Nội, Việt Nam       ', 0, 0),
(430, 'Alex Cafe', ' ', '11 Lot 2 11B Trung Yen Street, Cau Giay District,Vietnam', '091554 0888', ' ', 21.015743000000000, 105.801763000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Alex Cafe 11 Lot 2 11B Trung Yen Street, Cau Giay District,Vietnam   091554 0888   Cafe & Bistro', 0, 0),
(431, 'Anh Duong Coffee Shop', ' ', '42 Tran Duy Hung Street, Cau Giay District,Vietnam', '(04) 3784 6982', ' ', 21.014410000000000, 105.803146000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Anh Duong Coffee Shop 42 Tran Duy Hung Street, Cau Giay District,Vietnam   (04) 3784 6982   Cafe & Bistro', 0, 0),
(432, 'Cà Phê Bằng Lăng', ' ', '77, Nguyễn Khang, Q.Cầu Giấy,Việt Nam', ' ', ' ', 21.016978999999996, 105.803007000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê Bằng Lăng 77, Nguyễn Khang, Q.Cầu Giấy,Việt Nam       Giải Trí , Café', 0, 0),
(433, '3B Cafe', ' ', 'Lê Văn Lương, Thanh Xuân,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.003688000000000, 105.802009000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, '3B Cafe Lê Văn Lương, Thanh Xuân,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(434, 'Java Garden Coffee', ' ', 'Số 2 Ngõ 18 Huỳnh Thúc Kháng, Đống Đa,thủ đô Hà Nội, Việt Nam', '091552 8118', ' ', 21.019787999999995, 105.809712000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Java Garden Coffee Số 2 Ngõ 18 Huỳnh Thúc Kháng, Đống Đa,thủ đô Hà Nội, Việt Nam   091552 8118   Quán cà phê', 0, 0),
(435, 'ALIÔSA', ' ', '3 lô 1B Trung Yên 1, Cầu Giấy,Việt Nam', '(04) 3783 3205', ' ', 21.015805000000000, 105.801329000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'ALIÔSA 3 lô 1B Trung Yên 1, Cầu Giấy,Việt Nam   (04) 3783 3205   Cafe & Bistro', 0, 0),
(436, 'Cà Phê - Bar Life Way', ' ', '47, Nguyên Hồng, Q.Đống Đa,Việt Nam', ' ', ' ', 21.017413999999995, 105.811590000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-14 16:30:28', '2012-01-14 16:30:28', 1, NULL, 136, NULL, 1, 'Cà Phê - Bar Life Way 47, Nguyên Hồng, Q.Đống Đa,Việt Nam       Giải Trí , Bar', 0, 0),
(437, 'Cửa Hàng Cà Phê Trung Nguyên', ' ', '349, Hai Bà Trưng, P.8, Q.3,Việt Nam', '(08) 3824 2350', ' ', 10.789761000000000, 106.689509000000000, 'Giải Trí , Café', 216, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cửa Hàng Cà Phê Trung Nguyên 349, Hai Bà Trưng, P.8, Q.3,Việt Nam   (08) 3824 2350   Giải Trí , Café', 0, 0),
(438, 'HC - Big C', ' ', 'quận Cầu Giấy,Hanoi, Vietnam', ' ', ' ', 21.007172000000000, 105.792935000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'HC - Big C quận Cầu Giấy,Hanoi, Vietnam       Quán cà phê', 0, 0),
(439, 'X3 Koffee', ' ', '128 Trung Yên 1, quận Cầu Giấy,Hà Nội, Vietnam', '093463 2223', ' ', 21.014524999999995, 105.795958000000000, '', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'X3 Koffee 128 Trung Yên 1, quận Cầu Giấy,Hà Nội, Vietnam   093463 2223   ', 0, 0),
(440, 'X3 Koffee', ' ', '128 Trung Yên 1, Cầu Giấy,thủ đô Hà Nội, Vietnam', '093463 2223', ' ', 21.014524999999995, 105.795958000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'X3 Koffee 128 Trung Yên 1, Cầu Giấy,thủ đô Hà Nội, Vietnam   093463 2223   Quán cà phê', 0, 0),
(441, 'Cafe Bi-A Hoa Lư', ' ', '266, Trung Kính, Q.Cầu Giấy,Việt Nam', '(04) 3784 9193', ' ', 21.017113999999996, 105.794080000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cafe Bi-A Hoa Lư 266, Trung Kính, Q.Cầu Giấy,Việt Nam   (04) 3784 9193   Giải Trí , Café', 0, 0),
(442, 'Z cafe', ' ', 'Trung Yên 1, quận Cầu Giấy,Hà Nội, Vietnam', ' ', ' ', 21.014530000000000, 105.796323000000000, '', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Z cafe Trung Yên 1, quận Cầu Giấy,Hà Nội, Vietnam       ', 0, 0),
(443, 'Aliosa Coffee Shop', ' ', 'Lot 1B 3 1 Trung Yen Street, Cau Giay District,Vietnam', '(04) 3783 3205', ' ', 21.014455999999996, 105.796012000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Aliosa Coffee Shop Lot 1B 3 1 Trung Yen Street, Cau Giay District,Vietnam   (04) 3783 3205   Cafe & Bistro', 0, 0),
(444, 'Z cafe', ' ', 'Trung Yên 1, Cầu Giấy,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.014530000000000, 105.796323000000000, 'Nhà hàng', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Z cafe Trung Yên 1, Cầu Giấy,thủ đô Hà Nội, Vietnam       Nhà hàng', 0, 0),
(445, 'Cafe Nhac Trinh', ' ', '101 Trung Kính, Cầu Giấy,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.013708999999995, 105.797310000000000, '', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cafe Nhac Trinh 101 Trung Kính, Cầu Giấy,thủ đô Hà Nội, Vietnam       ', 0, 0),
(446, 'Cà Phê Quán Chờ', ' ', '130, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 3783 1029', ' ', 21.010404000000000, 105.799375000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cà Phê Quán Chờ 130, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 3783 1029   Giải Trí , Café', 0, 0),
(447, 'Kim Cafe', ' ', 'thủ đô Hà Nội,Việt Nam', ' ', ' ', 21.011751000000000, 105.801301000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Kim Cafe thủ đô Hà Nội,Việt Nam       Quán cà phê', 0, 0),
(448, 'Cà Phê Gmg', ' ', '128, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 3783 3968', ' ', 21.010553999999996, 105.799552000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cà Phê Gmg 128, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 3783 3968   Giải Trí , Café', 0, 0),
(449, 'Cà Phê Bờm', ' ', '229, Trung Kính, Q.Cầu Giấy,Việt Nam', ' ', ' ', 21.019687999999995, 105.792536000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cà Phê Bờm 229, Trung Kính, Q.Cầu Giấy,Việt Nam       Giải Trí , Café', 0, 0),
(450, 'Quán cà phê Gió Lộng', ' ', 'Cầu Giấy,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.020434000000000, 105.785513999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Quán cà phê Gió Lộng Cầu Giấy,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(451, 'Quán cà phê Gió Lộng', ' ', 'quận Cầu Giấy,Hà Nội, Việt Nam', ' ', ' ', 21.020434000000000, 105.785513999999990, '', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Quán cà phê Gió Lộng quận Cầu Giấy,Hà Nội, Việt Nam       ', 0, 0),
(452, 'Aroma Cafe', ' ', 'Hoàng Minh Giám, Thanh Xuân,Hà Nội, Việt Nam', ' ', ' ', 21.002745999999995, 105.800008000000000, '', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Aroma Cafe Hoàng Minh Giám, Thanh Xuân,Hà Nội, Việt Nam       ', 0, 0),
(453, 'Cafe Trang Nhung', ' ', '34 Ngõ 61, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', '(04) 3556 6926', ' ', 21.011835999999995, 105.801344000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cafe Trang Nhung 34 Ngõ 61, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam   (04) 3556 6926   Giải Trí , Café', 0, 0),
(454, 'Aroma Cafe', ' ', 'Hoàng Minh Giám, Thanh Xuân,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.002745999999995, 105.800008000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Aroma Cafe Hoàng Minh Giám, Thanh Xuân,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(455, 'Cafe Allex', ' ', '11 lô 11B Trung Yên 2, Cầu Giấy,Việt Nam', '091554 0888', ' ', 21.015805000000000, 105.801329000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cafe Allex 11 lô 11B Trung Yên 2, Cầu Giấy,Việt Nam   091554 0888   Cafe & Bistro', 0, 0),
(456, 'Green Cafe', ' ', 'Trung Yên 3, Quan Cau Giay,Hà Nội, Việt Nam', '0128241 6898', ' ', 21.015858999999995, 105.801983000000000, '', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Green Cafe Trung Yên 3, Quan Cau Giay,Hà Nội, Việt Nam   0128241 6898   ', 0, 0),
(457, 'Bar - Cafe Trung Anh', ' ', '197, Khuất Duy Tiến, Q.Thanh Xuân,Việt Nam', '(04) 3553 1856', ' ', 21.000388000000000, 105.796055000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Bar - Cafe Trung Anh 197, Khuất Duy Tiến, Q.Thanh Xuân,Việt Nam   (04) 3553 1856   Giải Trí , Café', 0, 0),
(458, 'Highland Coffee', ' ', 'Tu Liem, Từ Liêm,Hà Nội, Vietnam', ' ', ' ', 21.014585000000000, 105.776699000000010, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Highland Coffee Tu Liem, Từ Liêm,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(459, 'Cellini Cafe', ' ', 'G Fl, The Garden Shopping Center, Me Tri,Từ Liêm, Hà Nội, Việt Nam', '091607 2610', ' ', 21.014329000000000, 105.777236000000000, '', 217, 1, NULL, '2012-01-14 16:30:53', '2012-01-14 16:30:53', 1, NULL, 136, NULL, 1, 'Cellini Cafe G Fl, The Garden Shopping Center, Me Tri,Từ Liêm, Hà Nội, Việt Nam   091607 2610   ', 0, 0),
(460, 'Cafe 86', ' ', '86 le quang dao- phu do- me tri- tu liem- ha noi Lê Đức Thọ, Phú Đô, Từ Liêm,Hà Nội, Việt Nam', '0129293 2129', ' ', 21.014211000000000, 105.768966000000000, '', 218, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Cafe 86 86 le quang dao- phu do- me tri- tu liem- ha noi Lê Đức Thọ, Phú Đô, Từ Liêm,Hà Nội, Việt Nam   0129293 2129   ', 0, 0),
(461, 'Cafe 86', ' ', '86 le quang dao- phu do- me tri- tu liem- ha noi Lê Đức Thọ, Phú Đô, Hà Nội,thủ đô Hà Nội, Việt Nam', '0129293 2129', ' ', 21.014211000000000, 105.768966000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Cafe 86 86 le quang dao- phu do- me tri- tu liem- ha noi Lê Đức Thọ, Phú Đô, Hà Nội,thủ đô Hà Nội, Việt Nam   0129293 2129   Quán cà phê', 0, 0),
(462, 'Hạt Vừng - Cafe & Cơm văn phòng', ' ', 'Từ Liêm,Hanoi, Vietnam', ' ', ' ', 21.018456000000000, 105.780132999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Hạt Vừng - Cafe & Cơm văn phòng Từ Liêm,Hanoi, Vietnam       Quán cà phê', 0, 0),
(463, 'Green Hua Cafe''', ' ', 'Trâu Quỳ, Gia Lâm,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.006689000000000, 105.933132000000000, 'Nhà hàng', NULL, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Green Hua Cafe'' Trâu Quỳ, Gia Lâm,thủ đô Hà Nội, Việt Nam       Nhà hàng', 0, 0),
(464, 'Cafe'' Mai', ' ', 'Trâu Quỳ, Gia Lâm,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.004825000000000, 105.937240000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Cafe'' Mai Trâu Quỳ, Gia Lâm,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(465, 'Green Hua Cafe''', ' ', 'tt. Trâu Quỳ, Gia Lâm,Hà Nội, Việt Nam', ' ', ' ', 21.006715000000000, 105.933127000000000, '', NULL, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Green Hua Cafe'' tt. Trâu Quỳ, Gia Lâm,Hà Nội, Việt Nam       ', 0, 0),
(466, 'Cafe Vườn', ' ', 'Hà Nội,Việt Nam', ' ', ' ', 21.002762000000000, 105.936479000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Cafe Vườn Hà Nội,Việt Nam       Quán cà phê', 0, 0),
(467, 'Cafe'' Mai', ' ', 'tt. Trâu Quỳ, Gia Lâm,Hà Nội, Việt Nam', ' ', ' ', 21.004809000000000, 105.937251000000000, '', NULL, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Cafe'' Mai tt. Trâu Quỳ, Gia Lâm,Hà Nội, Việt Nam       ', 0, 0),
(468, 'Cafe', ' ', '81 Hai Bà Trưng, Hoàn Kiếm,Việt Nam', '(04) 3942 9637', ' ', 21.027360999999996, 105.842318000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Cafe 81 Hai Bà Trưng, Hoàn Kiếm,Việt Nam   (04) 3942 9637   Cafe & Bistro', 0, 0),
(469, 'Brother''s Cafe', ' ', '26, Quan Hoan Kiem, Ba Đình,Hà Nội, Vietnam', '(04) 733 3866', ' ', 21.029173000000000, 105.841103000000000, 'Nhà hàng', 219, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'Brother''s Cafe 26, Quan Hoan Kiem, Ba Đình,Hà Nội, Vietnam   (04) 733 3866   Nhà hàng', 0, 0),
(470, 'HC - Pacific Place', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.024878000000000, 105.843347000000010, 'Quán cà phê', 220, 1, NULL, '2012-01-14 16:30:54', '2012-01-14 16:30:54', 1, NULL, 136, NULL, 1, 'HC - Pacific Place quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(471, 'Ha Noi Cafe', ' ', 'Đống Đa,Hà Nội, Việt Nam', ' ', ' ', 21.028161000000000, 105.838849000000000, '', 221, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Ha Noi Cafe Đống Đa,Hà Nội, Việt Nam       ', 0, 0),
(472, 'Cà Phê Windows', ' ', '1A, Quốc Tử Giám, Q.Đống Đa,Việt Nam', '(04) 3732 6108', ' ', 21.025932000000000, 105.838412000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Cà Phê Windows 1A, Quốc Tử Giám, Q.Đống Đa,Việt Nam   (04) 3732 6108   Giải Trí , Café', 0, 0),
(473, 'Cà Phê Phương Ly', ' ', '8, Quốc Tử Giám, Q.Đống Đa,Việt Nam', '(04) 3823 7644', ' ', 21.026001999999995, 105.838230000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Cà Phê Phương Ly 8, Quốc Tử Giám, Q.Đống Đa,Việt Nam   (04) 3823 7644   Giải Trí , Café', 0, 0),
(474, 'Cà Phê Smile', ' ', '5, Văn Miếu, Q.Đống Đa,Việt Nam', '(04) 3843 8850', ' ', 21.029876999999995, 105.837125000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Cà Phê Smile 5, Văn Miếu, Q.Đống Đa,Việt Nam   (04) 3843 8850   Giải Trí , Café', 0, 0),
(475, 'Puku Cafe', ' ', '16 Tống Duy Tân, Hoàn Kiếm,Hà Nội, Việt Nam', '(04) 3928 5244', ' ', 21.029396999999996, 105.843460000000000, 'Nhà hàng', 222, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Puku Cafe 16 Tống Duy Tân, Hoàn Kiếm,Hà Nội, Việt Nam   (04) 3928 5244   Nhà hàng', 0, 0),
(476, 'Cà Phê 65', ' ', '65, Ngô Sỹ Liên, Q.Đống Đa,Việt Nam', '(04) 3732 2097', ' ', 21.026197000000000, 105.838519000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Cà Phê 65 65, Ngô Sỹ Liên, Q.Đống Đa,Việt Nam   (04) 3732 2097   Giải Trí , Café', 0, 0),
(477, 'Nhà Hàng - Cà Phê Maxx', ' ', '91 Trần Hưng Đạo, Hai Bà Trưng,Việt Nam', '(04) 3828 7431', ' ', 21.027360999999996, 105.842318000000000, 'Cafe & Bistro', 223, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Nhà Hàng - Cà Phê Maxx 91 Trần Hưng Đạo, Hai Bà Trưng,Việt Nam   (04) 3828 7431   Cafe & Bistro', 0, 0),
(478, 'Intello Book', ' ', '59, Văn Miếu, Q.Đống Đa,Việt Nam', '(04) 3747 1999', ' ', 21.027553999999995, 105.836180000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Intello Book 59, Văn Miếu, Q.Đống Đa,Việt Nam   (04) 3747 1999   Giải Trí , Café', 0, 0),
(479, 'Nhà Hàng Brother''S Cà Phê', ' ', '26, Nguyễn Thái Học, Q.Ba Đình,Việt Nam', '(04) 3733 3866', ' ', 21.029026000000000, 105.841191000000010, 'Cafe & Bistro', 224, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Nhà Hàng Brother''S Cà Phê 26, Nguyễn Thái Học, Q.Ba Đình,Việt Nam   (04) 3733 3866   Cafe & Bistro', 0, 0),
(480, 'Bz Cafe', ' ', '91, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 8912', ' ', 21.025856999999995, 105.842060000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:55', '2012-01-14 16:30:55', 1, NULL, 136, NULL, 1, 'Bz Cafe 91, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam   (04) 3942 8912   Giải Trí , Café', 0, 0),
(481, 'Viện Goethe', ' ', '56, Nguyễn Thái Học, Q.Ba Đình,Việt Nam', '(04) 3734 2251', ' ', 21.029942999999996, 105.837940000000000, 'Cơ Quan , Trung Tâm Nghiên Cứu', 225, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Viện Goethe 56, Nguyễn Thái Học, Q.Ba Đình,Việt Nam   (04) 3734 2251   Cơ Quan , Trung Tâm Nghiên Cứu', 0, 0),
(482, 'Eden Cafe', ' ', '77 Trần Hưng Đạo, quận Hoàn Kiếm,Hà Nội, Vietnam', '(04) 2216 5262', ' ', 21.022081000000000, 105.847305999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Eden Cafe 77 Trần Hưng Đạo, quận Hoàn Kiếm,Hà Nội, Vietnam   (04) 2216 5262   Quán cà phê', 0, 0),
(483, 'Cafe Karaoke Jaguarudi', ' ', '35, Nguyễn Khuyến, Q.Đống Đa,Việt Nam', '(04) 3843 2000', ' ', 21.027880000000000, 105.840247000000000, 'Giải Trí , Karaoke', 226, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cafe Karaoke Jaguarudi 35, Nguyễn Khuyến, Q.Đống Đa,Việt Nam   (04) 3843 2000   Giải Trí , Karaoke', 0, 0),
(484, 'Hot Life Cafe', ' ', 'Quán Sứ, quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.024201000000000, 105.845020000000000, 'Quán cà phê', 227, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Hot Life Cafe Quán Sứ, quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(485, 'Cà Phê Đồng Quê', ' ', '91A, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 0622', ' ', 21.025807000000000, 105.842038000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê Đồng Quê 91A, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam   (04) 3942 0622   Giải Trí , Café', 0, 0),
(486, 'Cà Phê Nguyễn Khuyến', ' ', '89, Nguyễn Khuyến, Q.Đống Đa,Việt Nam', '(04) 3843 5996', ' ', 21.028455999999995, 105.838171000000000, 'Giải Trí , Bida', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê Nguyễn Khuyến 89, Nguyễn Khuyến, Q.Đống Đa,Việt Nam   (04) 3843 5996   Giải Trí , Bida', 0, 0),
(487, 'Cà Phê Ngày Xưa', ' ', '46, Lê Duẩn, Q.Đống Đa,Việt Nam', '(04) 2215 3355', ' ', 21.028490000000000, 105.841824000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê Ngày Xưa 46, Lê Duẩn, Q.Đống Đa,Việt Nam   (04) 2215 3355   Giải Trí , Café', 0, 0),
(488, 'Align Cafe', ' ', '10A Khúc Hạo, Ba Đình,Hà Nội, Việt Nam', ' ', ' ', 21.031794999999995, 105.837049000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Align Cafe 10A Khúc Hạo, Ba Đình,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(489, 'Cà Phê Cuba', ' ', '46, Lê Duẩn, Q.Đống Đa,Việt Nam', ' ', ' ', 21.028260000000000, 105.841700000000000, 'Giải Trí , Café', 228, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê Cuba 46, Lê Duẩn, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(490, 'Quán Cà Phê Western', ' ', '28A Điện Biên Phủ Điện Biên,Hà Nội, Việt Nam', '(04) 2246 2829', ' ', 21.030066000000000, 105.841721999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Western 28A Điện Biên Phủ Điện Biên,Hà Nội, Việt Nam   (04) 2246 2829   Giải Trí , Café', 0, 0),
(491, 'Cà Phê New Window', ' ', '59, Hai Bà Trưng, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 9186', ' ', 21.026948000000000, 105.843529999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê New Window 59, Hai Bà Trưng, Q.Hoàn Kiếm,Việt Nam   (04) 3942 9186   Giải Trí , Café', 0, 0),
(492, 'Cà Phê Neo', ' ', '48, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam', '(04) 3822 3962', ' ', 21.024394999999995, 105.843160000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê Neo 48, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam   (04) 3822 3962   Giải Trí , Café', 0, 0),
(493, 'Cà Phê Lâm', ' ', '56, Quốc Tử Giám, Q.Đống Đa,Việt Nam', '(04) 3733 3424', ' ', 21.026727999999995, 105.836851000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê Lâm 56, Quốc Tử Giám, Q.Đống Đa,Việt Nam   (04) 3733 3424   Giải Trí , Café', 0, 0),
(494, 'Cafe Trang', ' ', '47 Ngô Tất Tố, Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam', ' ', ' ', 21.027967000000000, 105.836288000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cafe Trang 47 Ngô Tất Tố, Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(495, 'Cà Phê Napoli', ' ', '16, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 2491', ' ', 21.026498000000000, 105.843873000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê Napoli 16, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam   (04) 3942 2491   Giải Trí , Café', 0, 0),
(496, 'Cà Phê Tuyết', ' ', '41, Quốc Tử Giám, Q.Đống Đa,Việt Nam', '(04) 3823 7453', ' ', 21.026803000000000, 105.836705999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:56', '2012-01-14 16:30:56', 1, NULL, 136, NULL, 1, 'Cà Phê Tuyết 41, Quốc Tử Giám, Q.Đống Đa,Việt Nam   (04) 3823 7453   Giải Trí , Café', 0, 0),
(497, 'Moca Cafe', ' ', 'Nhà Chung, Hanoi,ハノイ, Vietnam', '(04) 3825 6334', ' ', 21.029070999999995, 105.849667000000010, 'Quán cà phê', 229, 1, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57', 1, NULL, 136, NULL, 1, 'Moca Cafe Nhà Chung, Hanoi,ハノイ, Vietnam   (04) 3825 6334   Quán cà phê', 0, 0),
(498, 'Cà Phê - Giải Khát', ' ', '67, Nguyễn Khuyến, Q.Đống Đa,Việt Nam', '(04) 3747 2177', ' ', 21.028160000000000, 105.839420000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57', 1, NULL, 136, NULL, 1, 'Cà Phê - Giải Khát 67, Nguyễn Khuyến, Q.Đống Đa,Việt Nam   (04) 3747 2177   Giải Trí , Café', 0, 0),
(499, 'Cà Phê Tâm', ' ', '92, Nguyễn Khuyến, Q.Đống Đa,Việt Nam', '(04) 3733 1111', ' ', 21.028220000000000, 105.839195000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57', 1, NULL, 136, NULL, 1, 'Cà Phê Tâm 92, Nguyễn Khuyến, Q.Đống Đa,Việt Nam   (04) 3733 1111   Giải Trí , Café', 0, 0),
(500, 'Khách sạn Hà Nội Wing', ' ', '23 Hàng Nón, Hoàn Kiếm,Hà Nội, Việt Nam', '(04) 3923 0719', ' ', 21.032342000000000, 105.848452000000000, 'Khách sạn', 230, 1, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57', 1, NULL, 136, NULL, 1, 'Khách sạn Hà Nội Wing 23 Hàng Nón, Hoàn Kiếm,Hà Nội, Việt Nam   (04) 3923 0719   Khách sạn', 0, 0),
(501, 'Quán Cà Phê Giải Khát', ' ', '87, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 2071', ' ', 21.025736999999996, 105.842478000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Giải Khát 87, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam   (04) 3942 2071   Giải Trí , Café', 0, 0),
(502, 'Quán Kangaroo Cafe', ' ', '18 Bao Khanh, Hoàn Kiếm,Hanoi, Vietnam', '(04) 3828 9931', ' ', 21.030163000000000, 105.850407000000000, 'Nhà hàng', 231, 1, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57', 1, NULL, 136, NULL, 1, 'Quán Kangaroo Cafe 18 Bao Khanh, Hoàn Kiếm,Hanoi, Vietnam   (04) 3828 9931   Nhà hàng', 0, 0),
(503, 'Emotion Cafe', ' ', '52 Lý Thường Kiệt, Quận Hoàn Kiếm,Việt Nam', '(04) 3934 1066', ' ', 21.025931000000000, 105.841790000000000, 'Nhà hàng', NULL, 1, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57', 1, NULL, 136, NULL, 1, 'Emotion Cafe 52 Lý Thường Kiệt, Quận Hoàn Kiếm,Việt Nam   (04) 3934 1066   Nhà hàng', 0, 0),
(504, 'Cafe 90', ' ', '90B Lý Thường Kiệt, Hoàn Kiếm,Việt Nam', '(04) 3942 3141', ' ', 21.025931000000000, 105.841790000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:57', '2012-01-14 16:30:57', 1, NULL, 136, NULL, 1, 'Cafe 90 90B Lý Thường Kiệt, Hoàn Kiếm,Việt Nam   (04) 3942 3141   Cafe & Bistro', 0, 0),
(505, 'Cà Phê Mauntain', ' ', '21, Phủ Doãn, Q.Hoàn Kiếm,Việt Nam', '(04) 3943 7227', ' ', 21.029442000000000, 105.847977000000000, 'Giải Trí , Café', 232, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Mauntain 21, Phủ Doãn, Q.Hoàn Kiếm,Việt Nam   (04) 3943 7227   Giải Trí , Café', 0, 0),
(506, 'Quán Cà Phê Giải Khát', ' ', '35, Ngô Tất Tố, Q.Đống Đa,Việt Nam', ' ', ' ', 21.027794000000000, 105.836812999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Giải Khát 35, Ngô Tất Tố, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(507, 'Cà Phê Hương', ' ', '69, Nguyễn Thái Học, Q.Đống Đa,Việt Nam', '(04) 3843 2188', ' ', 21.029302000000000, 105.839977999999990, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Hương 69, Nguyễn Thái Học, Q.Đống Đa,Việt Nam   (04) 3843 2188   Thực Phẩm , Trà, Cafe', 0, 0),
(508, '18 Cafe', ' ', 'Kiot 18 Nguyen Khuyen Street, Dong Da District,Vietnam', '(04) 3843 2320', ' ', 21.028469999999995, 105.837650000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, '18 Cafe Kiot 18 Nguyen Khuyen Street, Dong Da District,Vietnam   (04) 3843 2320   Cafe & Bistro', 0, 0),
(509, 'Climax Café & Restaurant', ' ', '91 Tran Hung Dao Street, Hai Ba Trung District,Vietnam', '(04) 6297 7066', ' ', 21.024124000000000, 105.842264000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Climax Café & Restaurant 91 Tran Hung Dao Street, Hai Ba Trung District,Vietnam   (04) 6297 7066   Cafe & Bistro', 0, 0),
(510, 'Cà phê Chim Xanh', ' ', 'Quan Ba Dinh, Ba Đình,Hà Nội, Vietnam', ' ', ' ', 21.031921000000000, 105.837029000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà phê Chim Xanh Quan Ba Dinh, Ba Đình,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(511, 'Cà Phê Hoàng Minh', ' ', '53, Nam Ngư, Q.Hoàn Kiếm,Việt Nam', '(04) 3822 0053', ' ', 21.026488000000000, 105.842114000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Hoàng Minh 53, Nam Ngư, Q.Hoàn Kiếm,Việt Nam   (04) 3822 0053   Giải Trí , Café', 0, 0),
(512, 'Kem Hòa bình', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.029109999999996, 105.844451000000000, '', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Kem Hòa bình quận Hoàn Kiếm,Hà Nội, Việt Nam       ', 0, 0),
(513, 'Jackson Tea & Coffee', ' ', '67C, Hai Bà Trưng, Q.Hoàn Kiếm,Việt Nam', '(04) 3825 0216', ' ', 21.026987999999996, 105.843862000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Jackson Tea & Coffee 67C, Hai Bà Trưng, Q.Hoàn Kiếm,Việt Nam   (04) 3825 0216   Giải Trí , Café', 0, 0),
(514, 'Cafe sáng tạo Trung Nguyên', ' ', '36, Ba Đình,Hà Nội, Vietnam', ' ', ' ', 21.034993000000000, 105.837137000000000, 'Quán cà phê', 233, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cafe sáng tạo Trung Nguyên 36, Ba Đình,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(515, 'Cà Phê 79', ' ', '79, Hai Bà Trưng, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 5354', ' ', 21.027294000000000, 105.842929000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê 79 79, Hai Bà Trưng, Q.Hoàn Kiếm,Việt Nam   (04) 3942 5354   Giải Trí , Café', 0, 0),
(516, 'Cà phê H3Q', ' ', '9 Đình Ngang, Hoàn Kiếm,Việt Nam', '(04) 3934 2059', ' ', 21.028372000000000, 105.842365000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà phê H3Q 9 Đình Ngang, Hoàn Kiếm,Việt Nam   (04) 3934 2059   Cafe & Bistro', 0, 0),
(517, 'Cà Phê Thu Hà', ' ', '16, Cao Bá Quát, Q.Ba Đình,Việt Nam', '(04) 3843 2718', ' ', 21.029868000000000, 105.840408000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Thu Hà 16, Cao Bá Quát, Q.Ba Đình,Việt Nam   (04) 3843 2718   Giải Trí , Café', 0, 0),
(518, 'The Hanoi Social Club', ' ', 'Hội Vũ, Hoàn Kiếm,Hà Nội, Vietnam', '(04) 3938 2117', ' ', 21.029181000000000, 105.846093000000000, '', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'The Hanoi Social Club Hội Vũ, Hoàn Kiếm,Hà Nội, Vietnam   (04) 3938 2117   ', 0, 0),
(519, 'Cafe 48', ' ', '48 Trần Hưng Đạo, Hoàn Kiếm,Việt Nam', '(04) 3934 8141', ' ', 21.023973999999995, 105.842215000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cafe 48 48 Trần Hưng Đạo, Hoàn Kiếm,Việt Nam   (04) 3934 8141   Cafe & Bistro', 0, 0),
(520, 'Cà Phê Phố Cũ', ' ', '30, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.025116000000000, 105.843401000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Phố Cũ 30, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(521, 'Cà Phê Thu', ' ', '102A, Trần Hưng Đạo, Q.Hoàn Kiếm,Việt Nam', '091555 5328', ' ', 21.023838999999995, 105.842591000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Thu 102A, Trần Hưng Đạo, Q.Hoàn Kiếm,Việt Nam   091555 5328   Giải Trí , Café', 0, 0),
(522, 'Cafe Adam', ' ', '38 Phan Bội Châu - Q. Hoàn Kiếm,Việt Nam', '(04) 3942 8667', ' ', 21.023816000000000, 105.842771000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cafe Adam 38 Phan Bội Châu - Q. Hoàn Kiếm,Việt Nam   (04) 3942 8667   Cafe & Bistro', 0, 0),
(523, 'Cà Phê Hà My', ' ', '9, Đình Ngang, Q.Hoàn Kiếm,Việt Nam', '(04) 3934 9212', ' ', 21.028179999999995, 105.842639000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Hà My 9, Đình Ngang, Q.Hoàn Kiếm,Việt Nam   (04) 3934 9212   Giải Trí , Café', 0, 0),
(524, 'Cà Phê Spring', ' ', '49, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.024664999999995, 105.843251000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Spring 49, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(525, 'Cà Phê Fast Food Leaf', ' ', '38, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.024705000000000, 105.843272000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Fast Food Leaf 38, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(526, 'Cà Phê Kim Anh', ' ', '16, Cao Bá Quát, Q.Ba Đình,Việt Nam', '(04) 3843 3165', ' ', 21.029848000000000, 105.840449999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Kim Anh 16, Cao Bá Quát, Q.Ba Đình,Việt Nam   (04) 3843 3165   Giải Trí , Café', 0, 0),
(527, 'Cà Phê Hồng', ' ', '66, Trần Hưng Đạo, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 6536', ' ', 21.022061000000000, 105.848883000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Hồng 66, Trần Hưng Đạo, Q.Hoàn Kiếm,Việt Nam   (04) 3942 6536   Giải Trí , Café', 0, 0),
(528, 'Cà Phê Hi - Life', ' ', '16, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.026498000000000, 105.843873000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Hi - Life 16, Phan Bội Châu, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(529, 'Index Cafe', ' ', 'Quận Hoàn Kiếm, quận Hoàn Kiếm,Hanoi, Vietnam', ' ', ' ', 21.021467000000000, 105.843237999999990, '', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Index Cafe Quận Hoàn Kiếm, quận Hoàn Kiếm,Hanoi, Vietnam       ', 0, 0),
(530, 'Cà Phê Mm Mix', ' ', '9, Trần Phú, Q.Ba Đình,Việt Nam', '(04) 2216 1368', ' ', 21.030213000000000, 105.843605000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Mm Mix 9, Trần Phú, Q.Ba Đình,Việt Nam   (04) 2216 1368   Giải Trí , Café', 0, 0),
(531, 'Cà Phê Mt', ' ', '66, Nguyễn Thái Học, Q.Ba Đình,Việt Nam', ' ', ' ', 21.030142999999995, 105.837232000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Mt 66, Nguyễn Thái Học, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(532, 'Hanoi House Cafe', ' ', '47 Lý Quốc Sư, Hoàn Kiếm,Hà Nội, Việt Nam', '093696 5669', ' ', 21.029152000000000, 105.849579000000000, '', 234, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Hanoi House Cafe 47 Lý Quốc Sư, Hoàn Kiếm,Hà Nội, Việt Nam   093696 5669   ', 0, 0),
(533, 'Kem Hòa bình', ' ', 'Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.029109999999996, 105.844451000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Kem Hòa bình Hà Nội,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0);
INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(534, 'lê tuấn', ' ', 'Quan Dong Da, Đống Đa,Hà Nội, Vietnam', ' ', ' ', 21.020226000000000, 105.836105999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'lê tuấn Quan Dong Da, Đống Đa,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(535, 'Cà Phê Khánh Vân', ' ', '101 Phương Liệt, Thanh Xuân,Việt Nam', '(04) 3869 3122', ' ', 20.996911999999995, 105.838547000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Khánh Vân 101 Phương Liệt, Thanh Xuân,Việt Nam   (04) 3869 3122   Cafe & Bistro', 0, 0),
(536, 'Công Ty Tnhh Tm & Dv Đại Gia', ' ', 'Ngõ 109, Trường Chinh, Q.Thanh Xuân,Việt Nam', '(04) 3868 8380', ' ', 20.998750000000000, 105.837125000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Tm & Dv Đại Gia Ngõ 109, Trường Chinh, Q.Thanh Xuân,Việt Nam   (04) 3868 8380   Thực Phẩm , Trà, Cafe', 0, 0),
(537, 'Cà Phê Vọng Ca', ' ', '105, Phố Vọng, Q.Hai Bà Trưng,Việt Nam', '(04) 3869 5224', ' ', 20.997909000000000, 105.842623000000000, 'Giải Trí , Café', 235, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Cà Phê Vọng Ca 105, Phố Vọng, Q.Hai Bà Trưng,Việt Nam   (04) 3869 5224   Giải Trí , Café', 0, 0),
(538, 'Khanh Van Coffee', ' ', '101 Phuong Liet Street, Thanh Xuan Dístrict,Vietnam', '(04) 3869 3122', ' ', 20.997593999999996, 105.838971000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:58', '2012-01-14 16:30:58', 1, NULL, 136, NULL, 1, 'Khanh Van Coffee 101 Phuong Liet Street, Thanh Xuan Dístrict,Vietnam   (04) 3869 3122   Cafe & Bistro', 0, 0),
(539, 'Coffee Shop', ' ', '387 Giai Phong Street, Thanh Xuan District,Vietnam', '(04) 3869 1204', ' ', 20.996893000000000, 105.841267000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Coffee Shop 387 Giai Phong Street, Thanh Xuan District,Vietnam   (04) 3869 1204   Cafe & Bistro', 0, 0),
(540, 'Cà Phê Hương Linh', ' ', '6-8, Phố Vọng, Q.Đống Đa,Việt Nam', '(04) 3903 0919', ' ', 20.999756999999995, 105.841877000000000, 'Giải Trí , Café', 236, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê Hương Linh 6-8, Phố Vọng, Q.Đống Đa,Việt Nam   (04) 3903 0919   Giải Trí , Café', 0, 0),
(541, 'Cafe Giấy', ' ', '389, Giải Phóng, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.995049000000000, 105.841502000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cafe Giấy 389, Giải Phóng, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(542, 'Công Ty Tnhh Tm Cn Hùng Cường', ' ', '22 Ngõ 259/9, Phố Vọng, Q.Hai Bà Trưng,Việt Nam', '(04) 3628 3422', ' ', 20.995028999999995, 105.842875000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Tm Cn Hùng Cường 22 Ngõ 259/9, Phố Vọng, Q.Hai Bà Trưng,Việt Nam   (04) 3628 3422   Thực Phẩm , Trà, Cafe', 0, 0),
(543, 'Cafe Phúc Ban Mê', ' ', '148, Phố Vọng, Q.Thanh Xuân,Việt Nam', '(04) 3628 2146', ' ', 20.995809999999995, 105.843057999999980, 'Giải Trí , Café', 237, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cafe Phúc Ban Mê 148, Phố Vọng, Q.Thanh Xuân,Việt Nam   (04) 3628 2146   Giải Trí , Café', 0, 0),
(544, 'Cà Phê Free Wifi', ' ', '93, Phố Vọng, Q.Hai Bà Trưng,Việt Nam', '(04) 6292 7693', ' ', 20.998745000000000, 105.842273999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê Free Wifi 93, Phố Vọng, Q.Hai Bà Trưng,Việt Nam   (04) 6292 7693   Giải Trí , Café', 0, 0),
(545, 'Cà Phê New', ' ', '108B, Trường Chinh, Q.Đống Đa,Việt Nam', '(04) 2217 7858', ' ', 20.998864999999995, 105.836679000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê New 108B, Trường Chinh, Q.Đống Đa,Việt Nam   (04) 2217 7858   Giải Trí , Café', 0, 0),
(546, 'Cà Phê Nhân', ' ', '419, Giải Phóng, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.993836999999996, 105.841502000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê Nhân 419, Giải Phóng, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(547, 'Anh & Anh Coffee', ' ', '110 Pho Vong Street, Thanh Xuan Dístrict,Vietnam', '(04) 3869 8244', ' ', 20.996400999999995, 105.842779000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Anh & Anh Coffee 110 Pho Vong Street, Thanh Xuan Dístrict,Vietnam   (04) 3869 8244   Cafe & Bistro', 0, 0),
(548, 'Cafe 82', ' ', '82 Phố Vọng, Đống Đa,Việt Nam', '(04) 3869 8110', ' ', 20.998231000000000, 105.842291000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cafe 82 82 Phố Vọng, Đống Đa,Việt Nam   (04) 3869 8110   Cafe & Bistro', 0, 0),
(549, 'Cafe & Billards Club', ' ', '145, Phố Vọng, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 20.997482999999995, 105.842789000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cafe & Billards Club 145, Phố Vọng, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(550, 'CAFE LONG HẢI', ' ', '105 Phố Vọng Q. Hai Bà Trưng,Việt Nam', '091433 6123', ' ', 20.997643000000000, 105.842713999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'CAFE LONG HẢI 105 Phố Vọng Q. Hai Bà Trưng,Việt Nam   091433 6123   Cafe & Bistro', 0, 0),
(551, 'Quán Cafe - Tẩm Quất', ' ', '387, Giải Phóng, Q.Thanh Xuân,Việt Nam', '(04) 3869 1204', ' ', 20.995239000000000, 105.841502000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Quán Cafe - Tẩm Quất 387, Giải Phóng, Q.Thanh Xuân,Việt Nam   (04) 3869 1204   Giải Trí , Café', 0, 0),
(552, 'Cà Phê Sắc Màu', ' ', '138, Phố Vọng, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.996666999999995, 105.843004000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê Sắc Màu 138, Phố Vọng, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(553, 'Cà Phê Bia Giải Khát', ' ', '284, Phố Vọng, Q.Thanh Xuân,Việt Nam', '(04) 2216 3236', ' ', 20.993742000000000, 105.842108000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê Bia Giải Khát 284, Phố Vọng, Q.Thanh Xuân,Việt Nam   (04) 2216 3236   Cafe & Bistro', 0, 0),
(554, 'Quán cafe căng tin bệnh viện Bạch Mai', ' ', 'Đống Đa,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.001562000000000, 105.839048000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Quán cafe căng tin bệnh viện Bạch Mai Đống Đa,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(555, 'Cà Phê Rainy (Mai Anh Vũ)', ' ', '31, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam', '093334 8866', ' ', 20.998670000000000, 105.845756000000000, 'Giải Trí , Café', 238, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê Rainy (Mai Anh Vũ) 31, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam   093334 8866   Giải Trí , Café', 0, 0),
(556, 'BDS Coffee', ' ', '93 Pho Vong Street, Hai Ba Trung Dístrict,Vietnam', '(04) 2292 7593', ' ', 20.999267000000000, 105.841996999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'BDS Coffee 93 Pho Vong Street, Hai Ba Trung Dístrict,Vietnam   (04) 2292 7593   Cafe & Bistro', 0, 0),
(557, 'Cà Phê Melody', ' ', '18, Phố Vọng, Q.Đống Đa,Việt Nam', '(04) 3628 8659', ' ', 20.999355999999995, 105.842028000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê Melody 18, Phố Vọng, Q.Đống Đa,Việt Nam   (04) 3628 8659   Giải Trí , Café', 0, 0),
(558, 'Cà Phê Sen', ' ', '11, Phố Vọng, Q.Hai Bà Trưng,Việt Nam', '(04) 3869 1636', ' ', 21.000238000000000, 105.841705999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:30:59', '2012-01-14 16:30:59', 1, NULL, 136, NULL, 1, 'Cà Phê Sen 11, Phố Vọng, Q.Hai Bà Trưng,Việt Nam   (04) 3869 1636   Giải Trí , Café', 0, 0),
(559, 'June Cafe', ' ', 'Pho Vong, Dong Tam,Hai Ba Trung, Hà Nội, Vietnam', '091272 1987', ' ', 20.996338999999995, 105.842818000000000, '', 239, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'June Cafe Pho Vong, Dong Tam,Hai Ba Trung, Hà Nội, Vietnam   091272 1987   ', 0, 0),
(560, 'Cà Phê Anh Anh', ' ', '110, Phố Vọng, Q.Thanh Xuân,Việt Nam', '(04) 3869 8244', ' ', 20.997152000000000, 105.842843000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Anh Anh 110, Phố Vọng, Q.Thanh Xuân,Việt Nam   (04) 3869 8244   Cafe & Bistro', 0, 0),
(561, 'Cà Phê Texas', ' ', '160, Nguyễn An Ninh, Q.Hoàng Mai,Việt Nam', ' ', ' ', 20.993236000000000, 105.843508000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Texas 160, Nguyễn An Ninh, Q.Hoàng Mai,Việt Nam       Giải Trí , Café', 0, 0),
(562, 'Long Hai Coffee', ' ', '105 Pho Vong Street, Hai Ba Trung District,Vietnam', '091433 6123', ' ', 20.997810000000000, 105.842660999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Long Hai Coffee 105 Pho Vong Street, Hai Ba Trung District,Vietnam   091433 6123   Cafe & Bistro', 0, 0),
(563, 'Cà Phê Cây Bàng', ' ', '25, Phan Đình Giót, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.990981999999995, 105.839269999999980, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Cây Bàng 25, Phan Đình Giót, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(564, '82 Cafe', ' ', '82 Vong Street, Dong Da Street,Vietnam', '(04) 3869 8110', ' ', 20.998244000000000, 105.842500000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, '82 Cafe 82 Vong Street, Dong Da Street,Vietnam   (04) 3869 8110   Cafe & Bistro', 0, 0),
(565, '263 Cafe', ' ', '263 Vong Street, Hai Ba Trung District,Vietnam', '(04) 3869 5224', ' ', 20.993407000000000, 105.841803000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, '263 Cafe 263 Vong Street, Hai Ba Trung District,Vietnam   (04) 3869 5224   Cafe & Bistro', 0, 0),
(566, 'Bar - Cafe Fastofood Glass', ' ', '340, Phan Đình Giót, Q.Thanh Xuân,Việt Nam', '(04) 2210 6287', ' ', 20.990962000000000, 105.840665000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Bar - Cafe Fastofood Glass 340, Phan Đình Giót, Q.Thanh Xuân,Việt Nam   (04) 2210 6287   Giải Trí , Bar', 0, 0),
(567, 'Aloha Cafe', ' ', '150 Lê Thanh Nghị, Hai Bà Trưng,Việt Nam', '(04) 3628 1387', ' ', 21.001788999999995, 105.841631000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Aloha Cafe 150 Lê Thanh Nghị, Hai Bà Trưng,Việt Nam   (04) 3628 1387   Cafe & Bistro', 0, 0),
(568, 'Cà Phê 166 Trường Chinh', ' ', '166, Trường Chinh, Q.Đống Đa,Việt Nam', '(04) 3852 2107', ' ', 21.000328000000000, 105.830398000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê 166 Trường Chinh 166, Trường Chinh, Q.Đống Đa,Việt Nam   (04) 3852 2107   Giải Trí , Café', 0, 0),
(569, 'Cà Phê Sơn', ' ', '85B, Lương Đình Của, Q.Đống Đa,Việt Nam', '(04) 3576 4728', ' ', 21.001895000000000, 105.836293000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Sơn 85B, Lương Đình Của, Q.Đống Đa,Việt Nam   (04) 3576 4728   Giải Trí , Café', 0, 0),
(570, 'Cafe 107', ' ', '107 Le Thanh Nghi Street, Hai Ba Trung District,Vietnam', '(04) 3869 4938', ' ', 21.001856000000000, 105.841631000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe 107 107 Le Thanh Nghi Street, Hai Ba Trung District,Vietnam   (04) 3869 4938   Cafe & Bistro', 0, 0),
(571, 'Cửa Hàng Duyên Duyên', ' ', '161, Đại La, Q.Hai Bà Trưng,Việt Nam', '091339 3921', ' ', 20.996521000000000, 105.845492999999990, 'Thực Phẩm , Trà, Cafe', 240, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cửa Hàng Duyên Duyên 161, Đại La, Q.Hai Bà Trưng,Việt Nam   091339 3921   Thực Phẩm , Trà, Cafe', 0, 0),
(572, 'Quán Vọng Xưa', ' ', '8, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 20.995840000000000, 105.845606000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Quán Vọng Xưa 8, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(573, 'Cafe', ' ', '197 Định Công, Hoàng Mai,Việt Nam', '(04) 3855 0854', ' ', 20.992712999999995, 105.850681999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe 197 Định Công, Hoàng Mai,Việt Nam   (04) 3855 0854   Cafe & Bistro', 0, 0),
(574, 'Cafe', ' ', '157 Định Công, Hoàng Mai,Việt Nam', '094987 5252', ' ', 20.992712999999995, 105.850681999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe 157 Định Công, Hoàng Mai,Việt Nam   094987 5252   Cafe & Bistro', 0, 0),
(575, 'Cafe Bệnh viện Bạch Mai', ' ', 'Phương Mai, Đống Đa,Hanoi, Vietnam', ' ', ' ', 21.002621999999995, 105.839116000000000, '', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe Bệnh viện Bạch Mai Phương Mai, Đống Đa,Hanoi, Vietnam       ', 0, 0),
(576, 'Nhà Nghỉ Số 75', ' ', '75, Đại La, Q.Hai Bà Trưng,Việt Nam', '(04) 3628 4258', ' ', 20.996120999999995, 105.847681999999990, 'Khách Sạn , Nhà Khách, Nhà Nghỉ', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Nhà Nghỉ Số 75 75, Đại La, Q.Hai Bà Trưng,Việt Nam   (04) 3628 4258   Khách Sạn , Nhà Khách, Nhà Nghỉ', 0, 0),
(577, 'Cà Phê 17', ' ', '17, Giáp Bát, Q.Hoàng Mai,Việt Nam', '(04) 3664 6207', ' ', 20.989570000000000, 105.841212000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê 17 17, Giáp Bát, Q.Hoàng Mai,Việt Nam   (04) 3664 6207   Giải Trí , Café', 0, 0),
(578, 'Cà Phê Quán Vườn', ' ', '66, Đại La, Q.Hai Bà Trưng,Việt Nam', '(04) 3628 8233', ' ', 20.996181000000000, 105.847316999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Quán Vườn 66, Đại La, Q.Hai Bà Trưng,Việt Nam   (04) 3628 8233   Giải Trí , Café', 0, 0),
(579, 'Cafe Long', ' ', 'CT8 Trần Điền, Định Công, Hanoi (Ha Noi),thủ đô Hà Nội, Việt Nam', '(04) 6285 2005', ' ', 20.990704000000000, 105.830859000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe Long CT8 Trần Điền, Định Công, Hanoi (Ha Noi),thủ đô Hà Nội, Việt Nam   (04) 6285 2005   Quán cà phê', 0, 0),
(580, 'Cà Phê Nhật Nam', ' ', '22, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam', '(04) 3904 9653', ' ', 21.001279000000000, 105.845241000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Nhật Nam 22, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam   (04) 3904 9653   Giải Trí , Café', 0, 0),
(581, 'Cafe 263', ' ', '263 Phố Vọng, Hai Bà Trưng,Việt Nam', '(04) 3869 5224', ' ', 20.992832000000000, 105.841314000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe 263 263 Phố Vọng, Hai Bà Trưng,Việt Nam   (04) 3869 5224   Cafe & Bistro', 0, 0),
(582, 'Cream Coffee', ' ', '322B Le Trong Tan Street, Thanh Xuan Dístrict,Vietnam', '(04) 3565 2354', ' ', 20.989274999999996, 105.834335000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cream Coffee 322B Le Trong Tan Street, Thanh Xuan Dístrict,Vietnam   (04) 3565 2354   Cafe & Bistro', 0, 0),
(583, 'Cửa Hàng Chè Sạch Tân Cương Thái Nguyên', ' ', '84, Nguyễn An Ninh, Q.Hoàng Mai,Việt Nam', '(04) 3864 4399', ' ', 20.990190999999996, 105.845396000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cửa Hàng Chè Sạch Tân Cương Thái Nguyên 84, Nguyễn An Ninh, Q.Hoàng Mai,Việt Nam   (04) 3864 4399   Thực Phẩm , Trà, Cafe', 0, 0),
(584, 'Cà Phê Trung Nguyên', ' ', '53, Nguyễn Viết Xuân, Q.Thanh Xuân,Việt Nam', '(04) 3858 6569', ' ', 20.998443999999996, 105.827640000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 53, Nguyễn Viết Xuân, Q.Thanh Xuân,Việt Nam   (04) 3858 6569   Giải Trí , Café', 0, 0),
(585, 'Gốm coffee', ' ', 'Đống Đa,thủ đô Hà Nội, Việt Nam', '(04) 2244 2666', ' ', 21.004549000000000, 105.831621000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Gốm coffee Đống Đa,thủ đô Hà Nội, Việt Nam   (04) 2244 2666   Quán cà phê', 0, 0),
(586, 'Cà Phê Hương Trà', ' ', '134, Lê Thanh Nghị, Q.Hai Bà Trưng,Việt Nam', '(04) 3869 7860', ' ', 21.001870000000000, 105.846459000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Hương Trà 134, Lê Thanh Nghị, Q.Hai Bà Trưng,Việt Nam   (04) 3869 7860   Giải Trí , Café', 0, 0),
(587, 'Bopbi Coffee', ' ', '12 Tran Dai Nghia Street, Hai Ba Trung Dístrict,Vietnam', '(04) 3628 8838', ' ', 20.997304000000000, 105.845923000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Bopbi Coffee 12 Tran Dai Nghia Street, Hai Ba Trung Dístrict,Vietnam   (04) 3628 8838   Cafe & Bistro', 0, 0),
(588, 'Cafe Bờm', ' ', 'Tạ Quang Bửu, Hai Ba Trung district,Hanoi, Vietnam', ' ', ' ', 21.001919999999995, 105.849479000000000, '', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe Bờm Tạ Quang Bửu, Hai Ba Trung district,Hanoi, Vietnam       ', 0, 0),
(589, 'Cà Phê Trung Nguyên', ' ', '107, Lê Thanh Nghị, Q.Hai Bà Trưng,Việt Nam', '(04) 3869 4993', ' ', 21.001790000000000, 105.843680000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 107, Lê Thanh Nghị, Q.Hai Bà Trưng,Việt Nam   (04) 3869 4993   Giải Trí , Café', 0, 0),
(590, 'Cafe Bờm', ' ', 'Tạ Quang Bửu, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.001919999999995, 105.849479000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe Bờm Tạ Quang Bửu, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(591, 'Bắc Kỳ Coffee', ' ', '131, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.000578000000000, 105.845343000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Bắc Kỳ Coffee 131, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(592, 'Cà Phê 192', ' ', '192, Trường Chinh, Q.Đống Đa,Việt Nam', ' ', ' ', 21.000588000000000, 105.829561000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cà Phê 192 192, Trường Chinh, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(593, 'Quán Cafe Hoa Đăng', ' ', '44, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.996506000000000, 105.828134000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Quán Cafe Hoa Đăng 44, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(594, 'Quán Cà Phê Sinh Tố Thảo', ' ', 'P103 K10a, Tạ Quang Bửu, Q.Hai Bà Trưng,Việt Nam', '(04) 3868 3478', ' ', 21.000707999999996, 105.850353000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Sinh Tố Thảo P103 K10a, Tạ Quang Bửu, Q.Hai Bà Trưng,Việt Nam   (04) 3868 3478   Giải Trí , Café', 0, 0),
(595, 'Kali Coffee', ' ', 'Trần Đại Nghĩa, Hai Bà Trưng,Hà Nội, Vietnam', '0129282 5570', ' ', 20.999912999999996, 105.845350000000000, 'Office Lunch', 241, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Kali Coffee Trần Đại Nghĩa, Hai Bà Trưng,Hà Nội, Vietnam   0129282 5570   Office Lunch', 0, 0),
(596, 'Cafe Wifi', ' ', '36, Nguyễn Viết Xuân, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.998725000000000, 105.827705000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Cafe Wifi 36, Nguyễn Viết Xuân, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(597, 'Anh Hải', ' ', '197 Nguyễn Ngọc Nại, Thanh Xuân,Việt Nam', '091526 3724', ' ', 20.996424000000000, 105.827252000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:00', '2012-01-14 16:31:00', 1, NULL, 136, NULL, 1, 'Anh Hải 197 Nguyễn Ngọc Nại, Thanh Xuân,Việt Nam   091526 3724   Cafe & Bistro', 0, 0),
(598, 'Cafe 5', ' ', '6 Pho Phan Dinh Thanh, Ba Đình,Hà Nội, Việt Nam', '(04) 3734 4182', ' ', 21.040061999999995, 105.845262000000000, 'Quán cà phê', 242, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Cafe 5 6 Pho Phan Dinh Thanh, Ba Đình,Hà Nội, Việt Nam   (04) 3734 4182   Quán cà phê', 0, 0),
(599, 'Penta Cafe', ' ', '48 Cửa Bắc, Ba Dinh,Hanoi, Vietnam', '(04) 3829 0363', ' ', 21.044091999999996, 105.842883000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Penta Cafe 48 Cửa Bắc, Ba Dinh,Hanoi, Vietnam   (04) 3829 0363   Quán cà phê', 0, 0),
(600, 'Cà Phê Tigôn', ' ', '4, Trấn Vũ, Q.Ba Đình,Việt Nam', '(04) 3823 8115', ' ', 21.043520999999995, 105.841502000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Cà Phê Tigôn 4, Trấn Vũ, Q.Ba Đình,Việt Nam   (04) 3823 8115   Giải Trí , Café', 0, 0),
(601, 'The Ailu Catcafe', ' ', 'Yamaha Motor Vietnam Office,No 6 Thái Phiên, Hai Bà Trưng, Hà Nội, Vietnam', '098918 5481', ' ', 21.042800000000000, 105.835343000000010, 'Cat Lover', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'The Ailu Catcafe Yamaha Motor Vietnam Office,No 6 Thái Phiên, Hai Bà Trưng, Hà Nội, Vietnam   098918 5481   Cat Lover', 0, 0),
(602, 'Highlands Coffee', ' ', '34, Thanh Niên, Q.Tây Hồ,Việt Nam', '(04) 3829 2140', ' ', 21.050190000000000, 105.839560000000000, 'Giải Trí , Café', 243, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Highlands Coffee 34, Thanh Niên, Q.Tây Hồ,Việt Nam   (04) 3829 2140   Giải Trí , Café', 0, 0),
(603, 'Quán Cà Phê Black & White', ' ', '86, Trấn Vũ, Q.Ba Đình,Việt Nam', '(04) 3715 2917', ' ', 21.043351000000000, 105.840118000000000, 'Giải Trí , Café', 244, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Black & White 86, Trấn Vũ, Q.Ba Đình,Việt Nam   (04) 3715 2917   Giải Trí , Café', 0, 0),
(604, 'Cafe Le Balcon', ' ', '54 Quán Thánh, Ba Đình,Hà Nội, Việt Nam', '0164711 8888', ' ', 21.042733999999996, 105.836655000000010, 'Nhà hàng , Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Cafe Le Balcon 54 Quán Thánh, Ba Đình,Hà Nội, Việt Nam   0164711 8888   Nhà hàng , Quán cà phê', 0, 0),
(605, 'Bar cafe điện thoại di động', ' ', '17-19 Đặng Dung, Ba Đình,Việt Nam', '(04) 3734 0734', ' ', 21.040890000000000, 105.841041999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Bar cafe điện thoại di động 17-19 Đặng Dung, Ba Đình,Việt Nam   (04) 3734 0734   Cafe & Bistro', 0, 0),
(606, 'Bar cafe điện thoại di động', ' ', '17-19 Đặng Dung, Q.Ba Đình,Việt Nam', '(04) 3734 0734', ' ', 21.040890000000000, 105.841041999999990, 'Mua sắm , Điện thoại di động', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Bar cafe điện thoại di động 17-19 Đặng Dung, Q.Ba Đình,Việt Nam   (04) 3734 0734   Mua sắm , Điện thoại di động', 0, 0),
(607, 'Cửa Hàng Hồng Đức', ' ', '25, Đặng Dung, Q.Ba Đình,Việt Nam', ' ', ' ', 21.040858000000000, 105.841233999999990, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Cửa Hàng Hồng Đức 25, Đặng Dung, Q.Ba Đình,Việt Nam       Thực Phẩm , Trà, Cafe', 0, 0),
(608, 'Quán Cafe Mùa Thu', ' ', '172, Quán Thánh, Q.Ba Đình,Việt Nam', '(04) 3716 3742', ' ', 21.042809999999996, 105.839753000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Quán Cafe Mùa Thu 172, Quán Thánh, Q.Ba Đình,Việt Nam   (04) 3716 3742   Giải Trí , Café', 0, 0),
(609, 'Cửa Hàng Thanh Huyền', ' ', '113, Quán Thánh, Q.Ba Đình,Việt Nam', '(04) 3823 1119', ' ', 21.042815000000000, 105.838004000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Cửa Hàng Thanh Huyền 113, Quán Thánh, Q.Ba Đình,Việt Nam   (04) 3823 1119   Thực Phẩm , Trà, Cafe', 0, 0),
(610, 'Tiệm Trà Đào Cúc', ' ', '22B, Đặng Dung, Q.Ba Đình,Việt Nam', '(04) 3843 6966', ' ', 21.041819000000000, 105.841405000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Tiệm Trà Đào Cúc 22B, Đặng Dung, Q.Ba Đình,Việt Nam   (04) 3843 6966   Thực Phẩm , Trà, Cafe', 0, 0),
(611, 'Cà Phê Bùi', ' ', '40, Phan Đình Phùng, Q.Ba Đình,Việt Nam', '(04) 3823 1058', ' ', 21.040768000000000, 105.841716000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Cà Phê Bùi 40, Phan Đình Phùng, Q.Ba Đình,Việt Nam   (04) 3823 1058   Giải Trí , Café', 0, 0),
(612, 'Quán Cà Phê Xe Cổ', ' ', '11, Hàng Bún, Q.Ba Đình,Việt Nam', '(04) 3927 3578', ' ', 21.043600999999995, 105.845964999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Xe Cổ 11, Hàng Bún, Q.Ba Đình,Việt Nam   (04) 3927 3578   Giải Trí , Café', 0, 0),
(613, 'Quán Cafe Hin', ' ', '68, Trấn Vũ, Q.Ba Đình,Việt Nam', '(04) 2242 8555', ' ', 21.043400999999996, 105.839548999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Quán Cafe Hin 68, Trấn Vũ, Q.Ba Đình,Việt Nam   (04) 2242 8555   Giải Trí , Café', 0, 0),
(614, 'Quán Cafe Hoàng Tú', ' ', '62, Trấn Vũ, Q.Ba Đình,Việt Nam', '(04) 3716 4611', ' ', 21.043491000000000, 105.839109000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Quán Cafe Hoàng Tú 62, Trấn Vũ, Q.Ba Đình,Việt Nam   (04) 3716 4611   Giải Trí , Café', 0, 0),
(615, 'Cafe 110', ' ', '110 Tran Vu street, Ba Dinh District,Vietnam', '0166926 8067', ' ', 21.043351999999995, 105.839908999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:01', '2012-01-14 16:31:01', 1, NULL, 136, NULL, 1, 'Cafe 110 110 Tran Vu street, Ba Dinh District,Vietnam   0166926 8067   Cafe & Bistro', 0, 0),
(616, 'Phố Cổ', ' ', 'Hàng Gai, quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.034609000000000, 105.848228999999990, 'Quán cà phê', 245, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Phố Cổ Hàng Gai, quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(617, 'Cà Phê 36 Độ', ' ', '36, Hàng Bún, Q.Ba Đình,Việt Nam', '(04) 3716 3678', ' ', 21.042069000000000, 105.845401999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cà Phê 36 Độ 36, Hàng Bún, Q.Ba Đình,Việt Nam   (04) 3716 3678   Giải Trí , Café', 0, 0),
(618, 'Cafe Quất', ' ', 'Ba Đình,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.043227000000000, 105.840882000000000, '', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cafe Quất Ba Đình,thủ đô Hà Nội, Việt Nam       ', 0, 0),
(619, 'Cafe Hoa Sua', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', '(04) 927 2135', ' ', 21.037286000000000, 105.846603000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cafe Hoa Sua quận Hoàn Kiếm,Hà Nội, Việt Nam   (04) 927 2135   Quán cà phê', 0, 0),
(620, 'Cà Phê Amo', ' ', '46, Nguyễn Trường Tộ, Q.Ba Đình,Việt Nam', '(04) 3716 1406', ' ', 21.042940000000000, 105.844136000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cà Phê Amo 46, Nguyễn Trường Tộ, Q.Ba Đình,Việt Nam   (04) 3716 1406   Giải Trí , Café', 0, 0),
(621, 'Hội Quán Bảo Hùng', ' ', '26, Trấn Vũ, Q.Ba Đình,Việt Nam', '(04) 3716 4332', ' ', 21.043911999999995, 105.838106000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Hội Quán Bảo Hùng 26, Trấn Vũ, Q.Ba Đình,Việt Nam   (04) 3716 4332   Cafe & Bistro', 0, 0),
(622, 'Quán Cà Phê Giải Khát', ' ', '98, Cửa Bắc, Q.Ba Đình,Việt Nam', '(04) 3843 3916', ' ', 21.041288000000000, 105.842543000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Giải Khát 98, Cửa Bắc, Q.Ba Đình,Việt Nam   (04) 3843 3916   Cafe & Bistro', 0, 0),
(623, 'Cà Phê Vườn Phố Cổ', ' ', '1 phố Hàng Gai, quận Hoàn Kiếm,Việt Nam', '(04) 3828 5080', ' ', 21.036491999999996, 105.847371000000010, 'Cafe & Bistro', 246, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cà Phê Vườn Phố Cổ 1 phố Hàng Gai, quận Hoàn Kiếm,Việt Nam   (04) 3828 5080   Cafe & Bistro', 0, 0),
(624, 'Coffee Shop', ' ', '72 Tran Vu street, Ba Dinh Dístrict,Vietnam', '(04) 3715 1300', ' ', 21.043911999999995, 105.836728000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Coffee Shop 72 Tran Vu street, Ba Dinh Dístrict,Vietnam   (04) 3715 1300   Cafe & Bistro', 0, 0),
(625, 'Bao Hung Coffee', ' ', '26 Tran Vu street, Ba Dinh District,Vietnam', '(04) 3715 2465', ' ', 21.043952000000000, 105.836769999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Bao Hung Coffee 26 Tran Vu street, Ba Dinh District,Vietnam   (04) 3715 2465   Cafe & Bistro', 0, 0),
(626, 'Bông Bụt Quán', ' ', '75 Nguyễn Trường Tộ, Ba Đình,Việt Nam', '(04) 3716 4852', ' ', 21.043600000000000, 105.841788999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Bông Bụt Quán 75 Nguyễn Trường Tộ, Ba Đình,Việt Nam   (04) 3716 4852   Cafe & Bistro', 0, 0),
(627, 'Cafe & Bar', ' ', '9 Thanh Niên, Ba Đình,Việt Nam', '(04) 7303 9009', ' ', 21.044015999999996, 105.836321000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cafe & Bar 9 Thanh Niên, Ba Đình,Việt Nam   (04) 7303 9009   Cafe & Bistro', 0, 0),
(628, 'Cafe số 9', ' ', '9 Thanh Niên, Quận Tây Hồ,Việt Nam', '0168877 1221', ' ', 21.044015999999996, 105.836321000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cafe số 9 9 Thanh Niên, Quận Tây Hồ,Việt Nam   0168877 1221   Cafe & Bistro', 0, 0),
(629, 'Cafe 110', ' ', '110 Trấn Vũ, Ba Đình,Việt Nam', '0166926 8067', ' ', 21.043351999999995, 105.839908999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cafe 110 110 Trấn Vũ, Ba Đình,Việt Nam   0166926 8067   Cafe & Bistro', 0, 0),
(630, 'Cafe Fastfood Magnolia', ' ', '25 Bát Sứ Q. Hoàn Kiếm,Việt Nam', '(04) 3993 1441', ' ', 21.035012999999996, 105.847497999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cafe Fastfood Magnolia 25 Bát Sứ Q. Hoàn Kiếm,Việt Nam   (04) 3993 1441   Cafe & Bistro', 0, 0),
(631, 'Cafe 46', ' ', '46 Nguyễn Khắc Hiếu, Ba Đình,Việt Nam', '(04) 3829 1353', ' ', 21.044651999999996, 105.841050000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cafe 46 46 Nguyễn Khắc Hiếu, Ba Đình,Việt Nam   (04) 3829 1353   Cafe & Bistro', 0, 0),
(632, 'Quán Café - Fastfood', ' ', '17F, Thụy Khuê, Q.Tây Hồ,Việt Nam', '(04) 6291 9673', ' ', 21.042790000000000, 105.834571000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Quán Café - Fastfood 17F, Thụy Khuê, Q.Tây Hồ,Việt Nam   (04) 6291 9673   Giải Trí , Café', 0, 0),
(633, 'Alo Cà Phê', ' ', '65, Hàng Bún, Q.Ba Đình,Việt Nam', ' ', ' ', 21.040327000000000, 105.844077000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Alo Cà Phê 65, Hàng Bún, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(634, 'Cafe 36 Hàng Bún', ' ', '36 Hàng Bún, Ba Đình,Việt Nam', '(04) 3716 3678', ' ', 21.040326000000000, 105.843752000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cafe 36 Hàng Bún 36 Hàng Bún, Ba Đình,Việt Nam   (04) 3716 3678   Cafe & Bistro', 0, 0),
(635, 'Mobile Phone Bar Coffee', ' ', '17-19 Dang Dung Street, Ba Dinh District,Vietnam', '(04) 3734 0734', ' ', 21.041447999999995, 105.841126000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Mobile Phone Bar Coffee 17-19 Dang Dung Street, Ba Dinh District,Vietnam   (04) 3734 0734   Cafe & Bistro', 0, 0),
(636, 'Cà Phê Hồ Trúc', ' ', '11B, Trúc Bạch, Q.Ba Đình,Việt Nam', '(04) 6270 0799', ' ', 21.048957999999995, 105.839903000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cà Phê Hồ Trúc 11B, Trúc Bạch, Q.Ba Đình,Việt Nam   (04) 6270 0799   Giải Trí , Café', 0, 0),
(637, 'HC - Flag Tower', ' ', 'Ba Đình,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.034120000000000, 105.838008000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'HC - Flag Tower Ba Đình,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(638, 'Phong Thuy CaFe', ' ', '28 Phan Dinh Phung Street, Ba Dinh District,Vietnam', '097772 2789', ' ', 21.039666000000000, 105.845525000000000, 'Cafe & Bistro', 247, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Phong Thuy CaFe 28 Phan Dinh Phung Street, Ba Dinh District,Vietnam   097772 2789   Cafe & Bistro', 0, 0),
(639, 'Cà Phê Cảm Xúc', ' ', '4C, Phan Đình Phùng, Q.Ba Đình,Việt Nam', '(04) 2240 2066', ' ', 21.040047000000000, 105.845429000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cà Phê Cảm Xúc 4C, Phan Đình Phùng, Q.Ba Đình,Việt Nam   (04) 2240 2066   Giải Trí , Café', 0, 0),
(640, 'Cà Phê Số 6', ' ', '6, Phan Đình Phùng, Q.Ba Đình,Việt Nam', '(04) 3734 4182', ' ', 21.040087000000000, 105.845236000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:02', '2012-01-14 16:31:02', 1, NULL, 136, NULL, 1, 'Cà Phê Số 6 6, Phan Đình Phùng, Q.Ba Đình,Việt Nam   (04) 3734 4182   Giải Trí , Café', 0, 0),
(641, 'Cửa Hàng Giới Thiệu Sản Phẩm Vinacafe', ' ', '43, Hàng Thiếc, Q.Hoàn Kiếm,Việt Nam', '(04) 3928 2563', ' ', 21.033037000000000, 105.848089000000000, 'Bưu Chính Viễn Thông , Điện Thoại Di Động', 248, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cửa Hàng Giới Thiệu Sản Phẩm Vinacafe 43, Hàng Thiếc, Q.Hoàn Kiếm,Việt Nam   (04) 3928 2563   Bưu Chính Viễn Thông , Điện Thoại Di Động', 0, 0),
(642, 'Penta Cafe', ' ', '48 Cửa Bắc, Ba Đình,thủ đô Hà Nội, Vietnam', '(04) 3829 0363', ' ', 21.044091999999996, 105.842883000000000, '', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Penta Cafe 48 Cửa Bắc, Ba Đình,thủ đô Hà Nội, Vietnam   (04) 3829 0363   ', 0, 0),
(643, 'Zen Coffeeshop', ' ', '100/128, Thụy Khuê, Q.Tây Hồ,Việt Nam', '(04) 6293 6343', ' ', 21.041488000000000, 105.829325000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Zen Coffeeshop 100/128, Thụy Khuê, Q.Tây Hồ,Việt Nam   (04) 6293 6343   Giải Trí , Café', 0, 0),
(644, 'Cà Phê Internet Song Sinh', ' ', '49B, Bát Đàn, Q.Hoàn Kiếm,Việt Nam', '(04) 3923 1329', ' ', 21.033657999999996, 105.846346000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cà Phê Internet Song Sinh 49B, Bát Đàn, Q.Hoàn Kiếm,Việt Nam   (04) 3923 1329   Giải Trí , Café', 0, 0),
(645, 'Công Ty Tnhh Chè Thái Hòa', ' ', '101, Nguyễn Trường Tộ, Q.Ba Đình,Việt Nam', '(04) 3715 1753', ' ', 21.043046000000000, 105.843916000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Chè Thái Hòa 101, Nguyễn Trường Tộ, Q.Ba Đình,Việt Nam   (04) 3715 1753   Thực Phẩm , Trà, Cafe', 0, 0),
(646, 'Cafe Karaoke Jaguarudi', ' ', '40, Cửa Đông, Q.Hoàn Kiếm,Việt Nam', '(04) 3823 2002', ' ', 21.034818999999995, 105.845225000000000, 'Giải Trí , Karaoke', 249, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cafe Karaoke Jaguarudi 40, Cửa Đông, Q.Hoàn Kiếm,Việt Nam   (04) 3823 2002   Giải Trí , Karaoke', 0, 0),
(647, 'Cà Phê Trung Nguyên', ' ', '8, Cửa Đông, Q.Hoàn Kiếm,Việt Nam', '(04) 3923 0988', ' ', 21.034489000000000, 105.846748000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 8, Cửa Đông, Q.Hoàn Kiếm,Việt Nam   (04) 3923 0988   Giải Trí , Café', 0, 0),
(648, 'Quán Cầu Vồng Dilmah', ' ', '164C, Trấn Vũ, Q.Ba Đình,Việt Nam', '(04) 3823 8512', ' ', 21.046125000000000, 105.840279000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Quán Cầu Vồng Dilmah 164C, Trấn Vũ, Q.Ba Đình,Việt Nam   (04) 3823 8512   Giải Trí , Café', 0, 0),
(649, 'Cafe sáng tạo Trung Nguyên', ' ', '36, Ba Đình,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.034993000000000, 105.837137000000000, '', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cafe sáng tạo Trung Nguyên 36, Ba Đình,thủ đô Hà Nội, Việt Nam       ', 0, 0),
(650, 'Cafe Giảng', ' ', '106 Phố Yên Phụ, Ba Dinh,Hanoi, Vietnam', ' ', ' ', 21.041315999999995, 105.849085000000000, '', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cafe Giảng 106 Phố Yên Phụ, Ba Dinh,Hanoi, Vietnam       ', 0, 0),
(651, 'Jackson Tea & Coffee', ' ', '23, Nguyễn Khắc Hiếu, Q.Ba Đình,Việt Nam', '(04) 2218 0993', ' ', 21.046264999999995, 105.841105000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Jackson Tea & Coffee 23, Nguyễn Khắc Hiếu, Q.Ba Đình,Việt Nam   (04) 2218 0993   Giải Trí , Café', 0, 0),
(652, 'Cafe - Sinh Tố - Hoa Quả', ' ', '49, Cửa Đông, Q.Hoàn Kiếm,Việt Nam', '(04) 3733 3306', ' ', 21.034708999999996, 105.845675000000000, 'Ẩm Thực , Tiệm Bánh', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cafe - Sinh Tố - Hoa Quả 49, Cửa Đông, Q.Hoàn Kiếm,Việt Nam   (04) 3733 3306   Ẩm Thực , Tiệm Bánh', 0, 0),
(653, 'Outside Cà Phê', ' ', '19, Hàng Vải, Q.Hoàn Kiếm,Việt Nam', '(04) 3923 0294', ' ', 21.035440000000000, 105.847843000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Outside Cà Phê 19, Hàng Vải, Q.Hoàn Kiếm,Việt Nam   (04) 3923 0294   Giải Trí , Café', 0, 0),
(654, 'The No.9 Coffee Shop', ' ', '9 Thanh Nien Street, Tay Ho District,Vietnam', '0168877 1221', ' ', 21.044271999999996, 105.836363000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'The No.9 Coffee Shop 9 Thanh Nien Street, Tay Ho District,Vietnam   0168877 1221   Cafe & Bistro', 0, 0),
(655, 'Coffee 110', ' ', '110e Ngọc Hà, Ba Đình,Hà Nội, Việt Nam', ' ', ' ', 21.037403999999995, 105.830961000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Coffee 110 110e Ngọc Hà, Ba Đình,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(656, 'Thư Quán', ' ', '53, Thụy Khuê, Q.Tây Hồ,Việt Nam', '093628 8083', ' ', 21.042128999999996, 105.830687000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Thư Quán 53, Thụy Khuê, Q.Tây Hồ,Việt Nam   093628 8083   Giải Trí , Café', 0, 0),
(657, 'Quán Cafe Hạnh', ' ', '56, Hòe Nhai, Q.Ba Đình,Việt Nam', ' ', ' ', 21.040026999999995, 105.845579000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Quán Cafe Hạnh 56, Hòe Nhai, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(658, 'Cafe 108', ' ', '108A Ngọc Hà, Ba Đình,Việt Nam', '(04) 3901 6216', ' ', 21.037593999999995, 105.831075000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cafe 108 108A Ngọc Hà, Ba Đình,Việt Nam   (04) 3901 6216   Cafe & Bistro', 0, 0),
(659, 'Tre Việt', ' ', 'Kim Dong, Hai Ba Trung district, Hanoi, Vietnam,Vietnam', '(04) 6655 3680', ' ', 20.984390999999995, 105.842489000000000, 'Quán cà phê', 250, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Tre Việt Kim Dong, Hai Ba Trung district, Hanoi, Vietnam,Vietnam   (04) 6655 3680   Quán cà phê', 0, 0),
(660, 'Quán Cafe 43', ' ', '43, Kim Đồng, Q.Hoàng Mai,Việt Nam', '(04) 3664 7304', ' ', 20.983709999999995, 105.842300999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Quán Cafe 43 43, Kim Đồng, Q.Hoàng Mai,Việt Nam   (04) 3664 7304   Giải Trí , Café', 0, 0),
(661, 'Cà Phê - Karaoke Tuyết Nhung', ' ', '127, Định Công, Q.Hoàng Mai,Việt Nam', '(04) 3864 1495', ' ', 20.984161000000000, 105.837543000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cà Phê - Karaoke Tuyết Nhung 127, Định Công, Q.Hoàng Mai,Việt Nam   (04) 3864 1495   Giải Trí , Café', 0, 0),
(662, 'Cà Phê Trung Nguyên 41', ' ', '41, Kim Đồng, Q.Hoàng Mai,Việt Nam', '(04) 2216 3192', ' ', 20.983709999999995, 105.842253000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 41 41, Kim Đồng, Q.Hoàng Mai,Việt Nam   (04) 2216 3192   Giải Trí , Café', 0, 0),
(663, 'New Light Coffee Shop', ' ', 'Lot 6B 27 Dinh Cong Street, Hoang Mai District,Vietnam', '(04) 3640 3071', ' ', 20.984480999999995, 105.838723000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'New Light Coffee Shop Lot 6B 27 Dinh Cong Street, Hoang Mai District,Vietnam   (04) 3640 3071   Cafe & Bistro', 0, 0),
(664, 'Coffee Shop', ' ', '157 Dinh Cong Street, Hoang Mai District,Vietnam', '094987 5252', ' ', 20.983259000000000, 105.835590000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Coffee Shop 157 Dinh Cong Street, Hoang Mai District,Vietnam   094987 5252   Cafe & Bistro', 0, 0),
(665, 'Công Ty Tnhh Ban Mai', ' ', '1111, Giải Phóng, Q.Hoàng Mai,Việt Nam', '(04) 6288 4697', ' ', 20.976036000000000, 105.841233999999990, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:31:03', '2012-01-14 16:31:03', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Ban Mai 1111, Giải Phóng, Q.Hoàng Mai,Việt Nam   (04) 6288 4697   Thực Phẩm , Trà, Cafe', 0, 0),
(666, 'ca phê Hung Dai Kim', ' ', '90a3 Nguyễn Cảnh Dị, Định Công, Hoàng mai,Hanoi, Vietnam', ' ', ' ', 20.977087999999995, 105.835268000000000, '', 251, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'ca phê Hung Dai Kim 90a3 Nguyễn Cảnh Dị, Định Công, Hoàng mai,Hanoi, Vietnam       ', 0, 0),
(667, 'Cà phê Hùng Đại Kim', ' ', '90a3 Nguyễn Cảnh Dị, Định Công, Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam', ' ', ' ', 20.977087999999995, 105.835268000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà phê Hùng Đại Kim 90a3 Nguyễn Cảnh Dị, Định Công, Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(668, 'Cafe New Light', ' ', 'Lô 6B 27 Định Công, Quận Hoàng Mai,Việt Nam', '(04) 3640 3071', ' ', 20.984594000000000, 105.838750000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe New Light Lô 6B 27 Định Công, Quận Hoàng Mai,Việt Nam   (04) 3640 3071   Cafe & Bistro', 0, 0),
(669, 'Coffee Shop', ' ', '212 Dinh Cong Street, Hoang Mai District,Vietnam', '098374 1683', ' ', 20.982037999999996, 105.832577000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Coffee Shop 212 Dinh Cong Street, Hoang Mai District,Vietnam   098374 1683   Cafe & Bistro', 0, 0),
(670, 'Cafe - Giải khát', ' ', '197 Dinh Cong Street, Hoang Mai District,Vietnam', '(04) 3855 0854', ' ', 20.982057000000000, 105.832436000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe - Giải khát 197 Dinh Cong Street, Hoang Mai District,Vietnam   (04) 3855 0854   Cafe & Bistro', 0, 0),
(671, 'Cafe', ' ', '387 Giải Phóng, Thanh Xuân,Việt Nam', '(04) 3869 1204', ' ', 20.983630000000000, 105.841136000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe 387 Giải Phóng, Thanh Xuân,Việt Nam   (04) 3869 1204   Cafe & Bistro', 0, 0),
(672, '203 Cafe', ' ', '203 Dinh Cong Thuong Street, Hoang Mai District,Vietnam', '(04) 3559 4190', ' ', 20.982078000000000, 105.829294000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, '203 Cafe 203 Dinh Cong Thuong Street, Hoang Mai District,Vietnam   (04) 3559 4190   Cafe & Bistro', 0, 0);
INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(673, 'Quán Cafe Quang Anh', ' ', '192, Tân Mai, Q.Hoàng Mai,Việt Nam', '(04) 3864 7106', ' ', 20.981415999999996, 105.850063000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Quán Cafe Quang Anh 192, Tân Mai, Q.Hoàng Mai,Việt Nam   (04) 3864 7106   Giải Trí , Café', 0, 0),
(674, 'Cà Phê Quỳnh Hương', ' ', '152, Tân Mai, Q.Hoàng Mai,Việt Nam', '(04) 3664 0563', ' ', 20.983433999999995, 105.850208000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Quỳnh Hương 152, Tân Mai, Q.Hoàng Mai,Việt Nam   (04) 3664 0563   Giải Trí , Café', 0, 0),
(675, 'Cà Phê Phong Lan', ' ', '31, Nguyễn Đức Cảnh, Q.Hoàng Mai,Việt Nam', '(04) 3662 7316', ' ', 20.987476000000000, 105.848556000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Phong Lan 31, Nguyễn Đức Cảnh, Q.Hoàng Mai,Việt Nam   (04) 3662 7316   Giải Trí , Café', 0, 0),
(676, 'Cà Phê Sao Biển', ' ', '16, Nguyễn Đức Cảnh, Q.Hoàng Mai,Việt Nam', '(04) 3662 3645', ' ', 20.987435999999995, 105.849039000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Sao Biển 16, Nguyễn Đức Cảnh, Q.Hoàng Mai,Việt Nam   (04) 3662 3645   Giải Trí , Café', 0, 0),
(677, 'Cà Phê Huyền Trang', ' ', '18, Nguyễn Đức Cảnh, Q.Hoàng Mai,Việt Nam', '(04) 3662 3102', ' ', 20.987416000000000, 105.849227000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Huyền Trang 18, Nguyễn Đức Cảnh, Q.Hoàng Mai,Việt Nam   (04) 3662 3102   Giải Trí , Café', 0, 0),
(678, 'Bia hơi, Cafe, Giải khát, Kem', ' ', '322B Lê Trọng Tấn, Thanh Xuân,Việt Nam', '(04) 3565 2354', ' ', 20.989912000000000, 105.833940000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Bia hơi, Cafe, Giải khát, Kem 322B Lê Trọng Tấn, Thanh Xuân,Việt Nam   (04) 3565 2354   Cafe & Bistro', 0, 0),
(679, 'Cafe 203', ' ', '203 Định Công Thượng, Hoàng Mai,Việt Nam', '(04) 3559 4190', ' ', 20.982638999999995, 105.827384000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe 203 203 Định Công Thượng, Hoàng Mai,Việt Nam   (04) 3559 4190   Cafe & Bistro', 0, 0),
(680, 'Cà Phê Ánh Nguyệt', ' ', '150, Yên Phụ, Q.Tây Hồ,Việt Nam', '(04) 3823 8197', ' ', 21.056017000000000, 105.835644000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Ánh Nguyệt 150, Yên Phụ, Q.Tây Hồ,Việt Nam   (04) 3823 8197   Giải Trí , Café', 0, 0),
(681, 'Vine Wine Boutique Bar & Cafe', ' ', '1A Xuân Diệu, Tay Ho district,Hanoi, Vietnam', '(04) 3719 8000', ' ', 21.060730000000000, 105.832620999999990, '1A Xuan Dieu', 252, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Vine Wine Boutique Bar & Cafe 1A Xuân Diệu, Tay Ho district,Hanoi, Vietnam   (04) 3719 8000   1A Xuan Dieu', 0, 0),
(682, 'Cafe Hoàng Yến', ' ', '228A, Nghi Tàm, Q.Tây Hồ,Việt Nam', ' ', ' ', 21.055015999999995, 105.837156999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe Hoàng Yến 228A, Nghi Tàm, Q.Tây Hồ,Việt Nam       Giải Trí , Café', 0, 0),
(683, 'Aladin Music Cafe', ' ', 'quận Tây Hồ,Hà Nội, Việt Nam', ' ', ' ', 21.056201000000000, 105.833556000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Aladin Music Cafe quận Tây Hồ,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(684, 'Cafe A', ' ', '107b, quận Tây Hồ,Hà Nội, Vietnam', '097733 7773', ' ', 21.053737000000000, 105.833852000000000, '', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe A 107b, quận Tây Hồ,Hà Nội, Vietnam   097733 7773   ', 0, 0),
(685, 'Cà Phê Sồi', ' ', '75, Yên Phụ, Q.Tây Hồ,Việt Nam', ' ', ' ', 21.053053999999996, 105.837361000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Sồi 75, Yên Phụ, Q.Tây Hồ,Việt Nam       Giải Trí , Café', 0, 0),
(686, 'Cà Phê Lãng Bạc', ' ', '52, Yên Phụ, Q.Tây Hồ,Việt Nam', ' ', ' ', 21.052598000000000, 105.837758000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Lãng Bạc 52, Yên Phụ, Q.Tây Hồ,Việt Nam       Giải Trí , Café', 0, 0),
(687, 'Cafe Nghi Tàm', ' ', '278, Nghi Tàm, Q.Tây Hồ,Việt Nam', '(04) 3716 0156', ' ', 21.057168999999995, 105.835955000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe Nghi Tàm 278, Nghi Tàm, Q.Tây Hồ,Việt Nam   (04) 3716 0156   Giải Trí , Café', 0, 0),
(688, '21 North Club', ' ', '50, quận Tây Hồ,Hà Nội, Vietnam', ' ', ' ', 21.052963999999996, 105.834303000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, '21 North Club 50, quận Tây Hồ,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(689, 'Maidza Hotel', ' ', '52 Phố Yên Phụ, Yên Phụ, Tay Ho district,Hanoi, Vietnam', '098640 8589', ' ', 21.051812000000000, 105.838032000000000, 'Tours', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Maidza Hotel 52 Phố Yên Phụ, Yên Phụ, Tay Ho district,Hanoi, Vietnam   098640 8589   Tours', 0, 0),
(690, 'The Cart', ' ', '8B Ngo 1 Au Co, Tây Hồ,thủ đô Hà Nội, Vietnam', '(04) 3718 6967', ' ', 21.059151000000000, 105.831814000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'The Cart 8B Ngo 1 Au Co, Tây Hồ,thủ đô Hà Nội, Vietnam   (04) 3718 6967   Quán cà phê', 0, 0),
(691, 'Ong Thanh', ' ', 'Tứ Liên, Tay Ho district,Hanoi, Vietnam', ' ', ' ', 21.061107000000000, 105.838281999999990, '', 253, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Ong Thanh Tứ Liên, Tay Ho district,Hanoi, Vietnam       ', 0, 0),
(692, 'Ong Thanh', ' ', 'Tứ Liên, Hanoi,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.061107000000000, 105.838281999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Ong Thanh Tứ Liên, Hanoi,thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(693, 'NamRS Shop - Biker Cafe', ' ', '60 Phó Đức Chính - Quận Tây Hồ,Việt Nam', '090408 2288', ' ', 21.049918999999996, 105.839338000000000, 'Xe máy và ô tô Xe,Thiết bị & Phụ tùng Whsle,& Buôn', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'NamRS Shop - Biker Cafe 60 Phó Đức Chính - Quận Tây Hồ,Việt Nam   090408 2288   Xe máy và ô tô Xe,Thiết bị & Phụ tùng Whsle,& Buôn', 0, 0),
(694, 'Segafredo Cafe Expresso', ' ', 'Xuân Diệu, quận Tây Hồ,Hà Nội, Việt Nam', ' ', ' ', 21.061451999999996, 105.831774000000000, '', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Segafredo Cafe Expresso Xuân Diệu, quận Tây Hồ,Hà Nội, Việt Nam       ', 0, 0),
(695, 'Cafe Grow Rich', ' ', '16, An Dương, Q.Tây Hồ,Việt Nam', '(04) 3823 9988', ' ', 21.050991000000000, 105.840880000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe Grow Rich 16, An Dương, Q.Tây Hồ,Việt Nam   (04) 3823 9988   Giải Trí , Café', 0, 0),
(696, 'Billiards Club', ' ', '57 Yên Phụ, Tây Hồ,Việt Nam', '(04) 3715 3175', ' ', 21.050685999999995, 105.840168000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Billiards Club 57 Yên Phụ, Tây Hồ,Việt Nam   (04) 3715 3175   Cafe & Bistro', 0, 0),
(697, 'Cổ Ngư Quán', ' ', 'Phố Yên Phụ, Yên Phụ, Tây Hồ,Hanoi, Vietnam', ' ', ' ', 21.050542000000000, 105.839282000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cổ Ngư Quán Phố Yên Phụ, Yên Phụ, Tây Hồ,Hanoi, Vietnam       Quán cà phê', 0, 0),
(698, 'Cafe A', ' ', '107b, Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam', '097733 7773', ' ', 21.053737000000000, 105.833852000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe A 107b, Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam   097733 7773   Quán cà phê', 0, 0),
(699, '5Comm cafe', ' ', 'Đường 6, Khu TT F361 An Dương, Yên Phụ, Tay Ho district,Hà Nội, Vietnam', ' ', ' ', 21.049693999999995, 105.843519000000000, '', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, '5Comm cafe Đường 6, Khu TT F361 An Dương, Yên Phụ, Tay Ho district,Hà Nội, Vietnam       ', 0, 0),
(700, '5Comm cafe', ' ', 'Đường 6, Khu TT F361 An Dương, Yên Phụ, Tây Hồ,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.049693999999995, 105.843519000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, '5Comm cafe Đường 6, Khu TT F361 An Dương, Yên Phụ, Tây Hồ,thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(701, 'Cà Phê Tâm Trống', ' ', '32, Âu Cơ, Q.Tây Hồ,Việt Nam', '(04) 3829 1402', ' ', 21.059657000000000, 105.834319000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Tâm Trống 32, Âu Cơ, Q.Tây Hồ,Việt Nam   (04) 3829 1402   Giải Trí , Café', 0, 0),
(702, '172 Cafe', ' ', '172 Yen Phu Street, Tay Ho District,Vietnam', '(04) 3716 0435', ' ', 21.049382999999995, 105.841426000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, '172 Cafe 172 Yen Phu Street, Tay Ho District,Vietnam   (04) 3716 0435   Cafe & Bistro', 0, 0),
(703, 'Cà Phê Linh Trang', ' ', '9, Trúc Bạch, Q.Ba Đình,Việt Nam', '(04) 3716 1007', ' ', 21.048957999999995, 105.839903000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Linh Trang 9, Trúc Bạch, Q.Ba Đình,Việt Nam   (04) 3716 1007   Giải Trí , Café', 0, 0),
(704, 'Segafredo Cafe Expresso', ' ', 'Xuân Diệu, Tây Hồ,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.061461000000000, 105.831759000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Segafredo Cafe Expresso Xuân Diệu, Tây Hồ,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(705, 'Bem - Bem - Bem Coffee', ' ', '111 Truc Bach Street, Ba Dinh District,Vietnam', '(04) 3716 3642', ' ', 21.048317999999995, 105.840997999999980, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Bem - Bem - Bem Coffee 111 Truc Bach Street, Ba Dinh District,Vietnam   (04) 3716 3642   Cafe & Bistro', 0, 0),
(706, 'Cafe Sơn', ' ', '89, Âu Cơ, Q.Tây Hồ,Việt Nam', '(04) 3718 3946', ' ', 21.062045000000000, 105.832533000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe Sơn 89, Âu Cơ, Q.Tây Hồ,Việt Nam   (04) 3718 3946   Giải Trí , Café', 0, 0),
(707, 'Cafe 172 Yên Phụ', ' ', '172 Yên Phụ, Tây Hồ,Việt Nam', '(04) 3716 0435', ' ', 21.049119000000000, 105.841663000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe 172 Yên Phụ 172 Yên Phụ, Tây Hồ,Việt Nam   (04) 3716 0435   Cafe & Bistro', 0, 0),
(708, 'Cà Phê Hương Sắc', ' ', '95, Âu Cơ, Q.Tây Hồ,Việt Nam', '(04) 3719 8022', ' ', 21.062339999999995, 105.832425000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Hương Sắc 95, Âu Cơ, Q.Tây Hồ,Việt Nam   (04) 3719 8022   Giải Trí , Café', 0, 0),
(709, 'Quán Cafe - Cream', ' ', '116, Phó Đức Chính, Q.Ba Đình,Việt Nam', '(04) 3715 1884', ' ', 21.046614999999996, 105.842961000000000, 'Ẩm Thực , Kem Và Sinh Tố', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Quán Cafe - Cream 116, Phó Đức Chính, Q.Ba Đình,Việt Nam   (04) 3715 1884   Ẩm Thực , Kem Và Sinh Tố', 0, 0),
(710, 'Quán Cafe Nhà Hàng Thọ Xương', ' ', '158, Trấn Vũ, Q.Ba Đình,Việt Nam', ' ', ' ', 21.045784000000000, 105.840321999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Quán Cafe Nhà Hàng Thọ Xương 158, Trấn Vũ, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(711, 'Cà Phê Internet Thanh Tùng', ' ', '106, Nghĩa Dũng, Q.Ba Đình,Việt Nam', '(04) 3716 8867', ' ', 21.047561999999996, 105.847660000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Internet Thanh Tùng 106, Nghĩa Dũng, Q.Ba Đình,Việt Nam   (04) 3716 8867   Giải Trí , Café', 0, 0),
(712, 'Cà Phê Vân Anh', ' ', '93, Tân Ấp, Q.Ba Đình,Việt Nam', '(04) 3829 1509', ' ', 21.047446000000000, 105.847810000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cà Phê Vân Anh 93, Tân Ấp, Q.Ba Đình,Việt Nam   (04) 3829 1509   Giải Trí , Café', 0, 0),
(713, '46 Cafe', ' ', '46 Nguyen Khac Hieu, Ba Dinh District,Vietnam', '(04) 3829 1353', ' ', 21.045434000000000, 105.840783000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, '46 Cafe 46 Nguyen Khac Hieu, Ba Dinh District,Vietnam   (04) 3829 1353   Cafe & Bistro', 0, 0),
(714, 'Bem - Bem - Bem Cafe', ' ', '111 Trúc Bạch, Ba Đình,Việt Nam', '(04) 3716 3642', ' ', 21.047657000000000, 105.841556000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Bem - Bem - Bem Cafe 111 Trúc Bạch, Ba Đình,Việt Nam   (04) 3716 3642   Cafe & Bistro', 0, 0),
(715, 'The Cart', ' ', '8B Ngo 1 Au Co, Tây Hồ,Hanoi, Vietnam', '(04) 3718 6967', ' ', 21.059151000000000, 105.831814000000000, '', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'The Cart 8B Ngo 1 Au Co, Tây Hồ,Hanoi, Vietnam   (04) 3718 6967   ', 0, 0),
(716, 'Quán Cafe Pinocenio', ' ', '28, Trấn Vũ, Q.Ba Đình,Việt Nam', '(04) 3716 1907', ' ', 21.043911999999995, 105.838106000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Quán Cafe Pinocenio 28, Trấn Vũ, Q.Ba Đình,Việt Nam   (04) 3716 1907   Giải Trí , Café', 0, 0),
(717, 'Cafe-Hitech', ' ', 'Ban Dao Linh Dam,Hoàng mai, Hà Nội, Vietnam', '090454 0808', ' ', 20.964455000000000, 105.841190000000000, '', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe-Hitech Ban Dao Linh Dam,Hoàng mai, Hà Nội, Vietnam   090454 0808   ', 0, 0),
(718, 'Cafe Trung Nguyen', ' ', 'Hoàng mai,Hà Nội, Việt Nam', ' ', ' ', 20.965644000000000, 105.832720000000000, '', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe Trung Nguyen Hoàng mai,Hà Nội, Việt Nam       ', 0, 0),
(719, 'Cafe Rùa Vàng', ' ', 'Tầng 1, chung cư CT4B Bắc Linh Đàm, Thanh Xuân,Ha Tay, Việt Nam', ' ', ' ', 20.969877000000000, 105.827884000000000, '', NULL, 1, NULL, '2012-01-14 16:31:04', '2012-01-14 16:31:04', 1, NULL, 136, NULL, 1, 'Cafe Rùa Vàng Tầng 1, chung cư CT4B Bắc Linh Đàm, Thanh Xuân,Ha Tay, Việt Nam       ', 0, 0),
(720, 'Cafe Ngon', ' ', '31, Ngọc Hồi, Q.Hoàng Mai,Việt Nam', ' ', ' ', 20.960768000000000, 105.842537000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Cafe Ngon 31, Ngọc Hồi, Q.Hoàng Mai,Việt Nam       Giải Trí , Café', 0, 0),
(721, 'Nắng Vàng', ' ', 'Đặng Xuân Bảng,Hà Nội, Việt Nam', ' ', ' ', 20.971080000000000, 105.829552999999990, '', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Nắng Vàng Đặng Xuân Bảng,Hà Nội, Việt Nam       ', 0, 0),
(722, 'Nắng Vàng', ' ', 'Đặng Xuân Bảng,thủ đô Hà Nội, Việt Nam', ' ', ' ', 20.971080000000000, 105.829552999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Nắng Vàng Đặng Xuân Bảng,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(723, 'Cafe Rùa Vàng', ' ', 'Tầng 1, chung cư CT4B Bắc Linh Đàm, Thanh Xuân,thủ đô Hà Nội, Việt Nam', ' ', ' ', 20.969877000000000, 105.827884000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Cafe Rùa Vàng Tầng 1, chung cư CT4B Bắc Linh Đàm, Thanh Xuân,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(724, 'CAFE MINH', ' ', 'SỐ 8 M3 TT6 BẮC LINH ĐÀM, PHƯỜNG ĐẠI KIM,Hoàng mai, Hà Nội, Việt Nam', '(04) 6675 5411', ' ', 20.969579000000000, 105.829633000000000, '', 254, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'CAFE MINH SỐ 8 M3 TT6 BẮC LINH ĐÀM, PHƯỜNG ĐẠI KIM,Hoàng mai, Hà Nội, Việt Nam   (04) 6675 5411   ', 0, 0),
(725, 'Quán Cafe 89', ' ', '89, Ngọc Hồi, Q.Hoàng Mai,Việt Nam', '(04) 3861 7263', ' ', 20.958299000000000, 105.843079000000000, 'Giải Trí , Café', 255, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Quán Cafe 89 89, Ngọc Hồi, Q.Hoàng Mai,Việt Nam   (04) 3861 7263   Giải Trí , Café', 0, 0),
(726, 'Cà phê Bốn Ngàn', ' ', 'Q. Thanh Xuân,Hà Nội, Việt Nam', ' ', ' ', 20.971188999999995, 105.827233999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Cà phê Bốn Ngàn Q. Thanh Xuân,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(727, 'Cafe Vườn Việt Đức', ' ', '185, Ngọc Hồi, Q.Hoàng Mai,Việt Nam', '(04) 3681 5488', ' ', 20.954841999999996, 105.843782000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Cafe Vườn Việt Đức 185, Ngọc Hồi, Q.Hoàng Mai,Việt Nam   (04) 3681 5488   Giải Trí , Café', 0, 0),
(728, 'Cà Phê 177', ' ', '177, Ngọc Hồi, Q.Hoàng Mai,Việt Nam', '(04) 2245 0762', ' ', 20.955283000000000, 105.843696000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Cà Phê 177 177, Ngọc Hồi, Q.Hoàng Mai,Việt Nam   (04) 2245 0762   Giải Trí , Café', 0, 0),
(729, 'Cafe Nhung', ' ', '285, Ngọc Hồi, Q.Thanh Trì,Việt Nam', '(04) 3861 6372', ' ', 20.948945999999996, 105.844731000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Cafe Nhung 285, Ngọc Hồi, Q.Thanh Trì,Việt Nam   (04) 3861 6372   Giải Trí , Café', 0, 0),
(730, 'Cà Phê - Trà Sữa Trân Châu New Star', ' ', '493, Ngọc Hồi, Q.Thanh Trì,Việt Nam', '(04) 3681 5268', ' ', 20.943244000000000, 105.844597000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Cà Phê - Trà Sữa Trân Châu New Star 493, Ngọc Hồi, Q.Thanh Trì,Việt Nam   (04) 3681 5268   Giải Trí , Café', 0, 0),
(731, 'Cafe Trúc Xanh', ' ', '497, Ngọc Hồi, Q.Thanh Trì,Việt Nam', '(04) 3861 3716', ' ', 20.943163999999996, 105.844576000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Cafe Trúc Xanh 497, Ngọc Hồi, Q.Thanh Trì,Việt Nam   (04) 3861 3716   Giải Trí , Café', 0, 0),
(732, 'Trăm Nhung', ' ', 'Hà Nội,Việt Nam', '(022) 118 183', ' ', 20.874050000000000, 105.837908000000000, '', NULL, 1, NULL, '2012-01-14 16:31:05', '2012-01-14 16:31:05', 1, NULL, 136, NULL, 1, 'Trăm Nhung Hà Nội,Việt Nam   (022) 118 183   ', 0, 0),
(733, 'Tràng Tiền Plaza', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.025245000000000, 105.853332000000000, 'Quán cà phê', 256, 1, NULL, '2012-01-14 16:31:06', '2012-01-14 16:31:06', 1, NULL, 136, NULL, 1, 'Tràng Tiền Plaza quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(734, 'Trung Tâm Thể Dục Thẩm Mỹ Hilton Hanoi Opera Hotel', ' ', '1 Le Thanh Tong St,Hanoi, Vietnam', '(04) 3933 0500', ' ', 21.023268999999996, 105.857834000000000, 'Giải Trí , Café', 257, 1, NULL, '2012-01-14 16:31:06', '2012-01-14 16:31:06', 1, NULL, 136, NULL, 1, 'Trung Tâm Thể Dục Thẩm Mỹ Hilton Hanoi Opera Hotel 1 Le Thanh Tong St,Hanoi, Vietnam   (04) 3933 0500   Giải Trí , Café', 0, 0),
(735, 'Cà Phê Ciao', ' ', '2, Hàng Bài, Q.Hoàn Kiếm,Việt Nam', '(04) 3934 1494', ' ', 21.025486000000000, 105.853486000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:31:06', '2012-01-14 16:31:06', 1, NULL, 136, NULL, 1, 'Cà Phê Ciao 2, Hàng Bài, Q.Hoàn Kiếm,Việt Nam   (04) 3934 1494   Giải Trí , Café', 0, 0),
(736, 'HC - Opera House', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.023923000000000, 105.857587000000010, 'Quán cà phê', 258, 1, NULL, '2012-01-14 16:31:06', '2012-01-14 16:31:06', 1, NULL, 136, NULL, 1, 'HC - Opera House quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(737, 'Cà Phê Zic Zac', ' ', '11, Nguyễn Xí, Q.Hoàn Kiếm,Việt Nam', '(04) 3936 4111', ' ', 21.025656000000000, 105.854720000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:36', '2012-01-14 16:32:36', 1, NULL, 136, NULL, 1, 'Cà Phê Zic Zac 11, Nguyễn Xí, Q.Hoàn Kiếm,Việt Nam   (04) 3936 4111   Giải Trí , Café', 0, 0),
(738, 'Cafe Bảo tàng Cách mạng', ' ', 'Tông Đản, quận Hoàn Kiếm,Hà Nội, Vietnam', ' ', ' ', 21.025504000000000, 105.858134000000000, 'Quán cà phê', 259, 1, NULL, '2012-01-14 16:32:36', '2012-01-14 16:32:36', 1, NULL, 136, NULL, 1, 'Cafe Bảo tàng Cách mạng Tông Đản, quận Hoàn Kiếm,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(739, 'City View', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.032105999999995, 105.851694000000000, 'Quán cà phê', 260, 1, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37', 1, NULL, 136, NULL, 1, 'City View quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(740, 'Cafe Hà Nội', ' ', '11, Lê Phụng Hiểu, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.025817000000000, 105.856662000000010, 'Giải Trí , Café', 261, 1, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37', 1, NULL, 136, NULL, 1, 'Cafe Hà Nội 11, Lê Phụng Hiểu, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(741, 'Cà Phê Bar I - Box', ' ', '32, Lê Thái Tổ, Q.Hoàn Kiếm,Việt Nam', '(04) 3828 8820', ' ', 21.027128999999995, 105.851532999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37', 1, NULL, 136, NULL, 1, 'Cà Phê Bar I - Box 32, Lê Thái Tổ, Q.Hoàn Kiếm,Việt Nam   (04) 3828 8820   Giải Trí , Café', 0, 0),
(742, 'Cà Phê Bar Jojo''s', ' ', '23C, Hai Bà Trưng, Q.Hoàn Kiếm,Việt Nam', '(04) 3938 6555', ' ', 21.023883999999995, 105.854226000000000, 'Giải Trí , Café', 262, 1, NULL, '2012-01-14 16:32:37', '2012-01-14 16:32:37', 1, NULL, 136, NULL, 1, 'Cà Phê Bar Jojo''s 23C, Hai Bà Trưng, Q.Hoàn Kiếm,Việt Nam   (04) 3938 6555   Giải Trí , Café', 0, 0),
(743, 'Cafe Ciao', ' ', 'Hàng Bài, quận Hoàn Kiếm,Hà Nội, Việt Nam', '(04) 3934 1494', ' ', 21.025247000000000, 105.852969000000000, 'Quán cà phê', 263, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Cafe Ciao Hàng Bài, quận Hoàn Kiếm,Hà Nội, Việt Nam   (04) 3934 1494   Quán cà phê', 0, 0),
(744, 'Highland Coffee', ' ', 'Lê Thánh Tông, quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.023893000000000, 105.857488000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Highland Coffee Lê Thánh Tông, quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(745, 'Cà Phê Manneken Pis', ' ', '24, Tông Đản, Q.Hoàn Kiếm,Việt Nam', '(04) 3935 1528', ' ', 21.025466000000000, 105.858271000000000, 'Giải Trí , Café', 264, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Cà Phê Manneken Pis 24, Tông Đản, Q.Hoàn Kiếm,Việt Nam   (04) 3935 1528   Giải Trí , Café', 0, 0),
(746, 'Cầ Phê Âu Lạc', ' ', '57, Lý Thái Tổ, Q.Hoàn Kiếm,Việt Nam', '(04) 3825 7807', ' ', 21.025486000000000, 105.856780000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Cầ Phê Âu Lạc 57, Lý Thái Tổ, Q.Hoàn Kiếm,Việt Nam   (04) 3825 7807   Giải Trí , Café', 0, 0),
(747, 'Cà Phê Dạ Khúc (Serenade)', ' ', '18D, Ngô Quyền, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 2256', ' ', 21.024944999999995, 105.855385000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Cà Phê Dạ Khúc (Serenade) 18D, Ngô Quyền, Q.Hoàn Kiếm,Việt Nam   (04) 3824 2256   Giải Trí , Café', 0, 0),
(748, 'Sinh Cafe', ' ', '5 Lương Văn Can, Hàng Đào, Hoàn Kiếm,Hà Nội, Vietnam', '(04) 3828 7417', ' ', 21.032931999999995, 105.850428000000000, 'Du Lịch , Công Ty Lữ Hành', 265, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Sinh Cafe 5 Lương Văn Can, Hàng Đào, Hoàn Kiếm,Hà Nội, Vietnam   (04) 3828 7417   Du Lịch , Công Ty Lữ Hành', 0, 0),
(749, 'Hai Noi Cafe', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.024570000000000, 105.855931000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Hai Noi Cafe quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(750, 'Chuồn Chuồn Phố', ' ', 'Hàng Bài, quận Hoàn Kiếm,Hà Nội, Việt Nam', '(04) 2219 3773', ' ', 21.021581999999995, 105.852456000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Chuồn Chuồn Phố Hàng Bài, quận Hoàn Kiếm,Hà Nội, Việt Nam   (04) 2219 3773   Quán cà phê', 0, 0),
(751, 'New Way Coffee', ' ', 'No 2B Đặng Thái Thân, Quan Hoan Kiem, quận Hoàn Kiếm,Hà Nội, Vietnam', '(04) 2214 2250', ' ', 21.023313999999996, 105.859213000000000, 'Quán cà phê', 266, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'New Way Coffee No 2B Đặng Thái Thân, Quan Hoan Kiem, quận Hoàn Kiếm,Hà Nội, Vietnam   (04) 2214 2250   Quán cà phê', 0, 0),
(752, 'Exchange cafe', ' ', '2B Ngo Trang Tien, Tràng Tiền, quận Hoàn Kiếm,Hà Nội, Vietnam', ' ', ' ', 21.023909000000000, 105.856608000000000, 'Nhà hàng', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Exchange cafe 2B Ngo Trang Tien, Tràng Tiền, quận Hoàn Kiếm,Hà Nội, Vietnam       Nhà hàng', 0, 0),
(753, 'Bar Cafe Đỗ Quyên', ' ', '4 Tông Đản, Q. Hoàn Kiếm,Việt Nam', '(04) 3824 1507', ' ', 21.025594000000000, 105.857979000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Bar Cafe Đỗ Quyên 4 Tông Đản, Q. Hoàn Kiếm,Việt Nam   (04) 3824 1507   Giải Trí , Bar', 0, 0),
(754, 'Quán Bar - Cafe Cool', ' ', '26, Lý Thái Tổ, Q.Hoàn Kiếm,Việt Nam', '(04) 3926 3933', ' ', 21.029892000000000, 105.855283000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Quán Bar - Cafe Cool 26, Lý Thái Tổ, Q.Hoàn Kiếm,Việt Nam   (04) 3926 3933   Giải Trí , Café', 0, 0),
(755, 'Dak-Linh Café', ' ', 'Hàng Khay, quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.026206999999996, 105.852113000000000, '', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Dak-Linh Café Hàng Khay, quận Hoàn Kiếm,Hà Nội, Việt Nam       ', 0, 0),
(756, 'Dak-Linh Café', ' ', 'Hàng Khay, Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.026206999999996, 105.852113000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'Dak-Linh Café Hàng Khay, Hà Nội,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(757, 'AVALON café Lounge', ' ', '73 Cau Go, quận Hoàn Kiếm,Hà Nội, Vietnam', '(04) 4392 6080', ' ', 21.032136000000000, 105.852172000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:38', '2012-01-14 16:32:38', 1, NULL, 136, NULL, 1, 'AVALON café Lounge 73 Cau Go, quận Hoàn Kiếm,Hà Nội, Vietnam   (04) 4392 6080   Quán cà phê', 0, 0),
(758, 'Cà Phê Xưa & Nay', ' ', '1H, Tông Đản, Q.Hoàn Kiếm,Việt Nam', '(04) 3935 1350', ' ', 21.029040999999996, 105.857145000000000, 'Giải Trí , Café', 267, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Cà Phê Xưa & Nay 1H, Tông Đản, Q.Hoàn Kiếm,Việt Nam   (04) 3935 1350   Giải Trí , Café', 0, 0),
(759, 'Hai Noi Cafe', ' ', 'Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.024570000000000, 105.855931000000000, '', NULL, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Hai Noi Cafe Hà Nội,thủ đô Hà Nội, Việt Nam       ', 0, 0),
(760, 'SWEET CHERRY CAFÉ', ' ', 'No 6 Phan Chu Trinh, Tràng Tiền, Hoàn Kiếm,Hanoi, Vietnam', '090324 2466', ' ', 21.023626000000000, 105.856651000000000, '', NULL, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'SWEET CHERRY CAFÉ No 6 Phan Chu Trinh, Tràng Tiền, Hoàn Kiếm,Hanoi, Vietnam   090324 2466   ', 0, 0),
(761, 'Paradise Cafe', ' ', 'Lý Thường Kiệt, quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.022810000000000, 105.852783000000000, '', NULL, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Paradise Cafe Lý Thường Kiệt, quận Hoàn Kiếm,Hà Nội, Việt Nam       ', 0, 0),
(762, 'Cà Phê 38', ' ', '93 Thợ Nhuộm, Hoàn Kiếm,Việt Nam', '(04) 3933 3698', ' ', 21.021688999999995, 105.850068999999990, 'Cafe & Bistro', 268, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Cà Phê 38 93 Thợ Nhuộm, Hoàn Kiếm,Việt Nam   (04) 3933 3698   Cafe & Bistro', 0, 0),
(763, 'Cà Phê Nhà Hát', ' ', '4, Phan Chu Trinh, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.023834000000000, 105.857102000000000, 'Giải Trí , Café', 269, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Cà Phê Nhà Hát 4, Phan Chu Trinh, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(764, 'Quán Bar - Cà Phê Hoa Lan', ' ', '6, Phạm Sư Mạnh, Q.Hoàn Kiếm,Việt Nam', '(04) 3826 1160', ' ', 21.022711999999995, 105.855417000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Quán Bar - Cà Phê Hoa Lan 6, Phạm Sư Mạnh, Q.Hoàn Kiếm,Việt Nam   (04) 3826 1160   Giải Trí , Café', 0, 0),
(765, 'Minh Minh Cafe', ' ', '32, Lê Thái Tổ, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.027128999999995, 105.851523000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Minh Minh Cafe 32, Lê Thái Tổ, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(766, 'Papa Joes Coffee', ' ', '112, Cầu Gỗ, Q.Hoàn Kiếm,Việt Nam', '(04) 3926 2544', ' ', 21.032291000000000, 105.851784999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Papa Joes Coffee 112, Cầu Gỗ, Q.Hoàn Kiếm,Việt Nam   (04) 3926 2544   Giải Trí , Café', 0, 0),
(767, 'Queen Hotel Hanoi', ' ', '116 Hàng Bạc, Hà Nội,thủ đô Hà Nội, Việt Nam', '(04) 3926 4351', ' ', 21.034106000000000, 105.850908000000000, '', 270, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Queen Hotel Hanoi 116 Hàng Bạc, Hà Nội,thủ đô Hà Nội, Việt Nam   (04) 3926 4351   ', 0, 0),
(768, 'Kem Snowball', ' ', '20 Lý Thái Tổ, quận Hoàn Kiếm,Hà Nội, Vietnam', ' ', ' ', 21.030958999999996, 105.854591000000000, '', NULL, 1, NULL, '2012-01-14 16:32:39', '2012-01-14 16:32:39', 1, NULL, 136, NULL, 1, 'Kem Snowball 20 Lý Thái Tổ, quận Hoàn Kiếm,Hà Nội, Vietnam       ', 0, 0),
(769, 'HC - Ho Guom Plaza', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.032160000000000, 105.851743000000000, 'Quán cà phê', 271, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'HC - Ho Guom Plaza quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(770, 'Paradise Cafe', ' ', 'Lý Thường Kiệt, Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.022810000000000, 105.852783000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'Paradise Cafe Lý Thường Kiệt, Hà Nội,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(771, 'Quán Cafe Maroc Chino', ' ', '108, Hàng Trống, Q.Hoàn Kiếm,Việt Nam', '(04) 6261 1155', ' ', 21.029422000000000, 105.850654000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'Quán Cafe Maroc Chino 108, Hàng Trống, Q.Hoàn Kiếm,Việt Nam   (04) 6261 1155   Giải Trí , Café', 0, 0),
(772, 'Cafe Mocha', ' ', 'Nhà Thờ, quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.029171999999996, 105.850001999999990, '', 272, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'Cafe Mocha Nhà Thờ, quận Hoàn Kiếm,Hà Nội, Việt Nam       ', 0, 0),
(773, 'Cafe Tamarind', ' ', '80, Mã Mây, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.034509000000000, 105.853470000000000, 'Giải Trí , Café', 273, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'Cafe Tamarind 80, Mã Mây, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(774, 'Cà Phê Malibu', ' ', '7, Nguyễn Khắc Cần, Q.Hoàn Kiếm,Việt Nam', '(04) 3826 1757', ' ', 21.023463000000000, 105.855685000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'Cà Phê Malibu 7, Nguyễn Khắc Cần, Q.Hoàn Kiếm,Việt Nam   (04) 3826 1757   Giải Trí , Café', 0, 0),
(775, 'quán cóc', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.029578999999995, 105.853996999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'quán cóc quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(776, 'Cà Phê Tuyết', ' ', '39I, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam', '(04) 3936 3216', ' ', 21.022862000000000, 105.852118000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'Cà Phê Tuyết 39I, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam   (04) 3936 3216   Giải Trí , Café', 0, 0),
(777, 'Exchange cafe', ' ', '2B Ngó Tràng Tiền, Tràng Tiền, Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.023909000000000, 105.856608000000000, '', NULL, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'Exchange cafe 2B Ngó Tràng Tiền, Tràng Tiền, Hà Nội,thủ đô Hà Nội, Việt Nam       ', 0, 0),
(778, '6 On Sixteen', ' ', 'Bao Khanh, Hanoi,ハノイ, Vietnam', ' ', ' ', 21.030013000000000, 105.850288999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, '6 On Sixteen Bao Khanh, Hanoi,ハノイ, Vietnam       Quán cà phê', 0, 0),
(779, 'Công Ty Tnhh Trà & Cà Phê Bắc Bộ', ' ', 'F 111 1 Lê Phụng Hiểu Tràng Tiền,Hà Nội, Việt Nam', '(04) 3936 4786', ' ', 21.026377000000000, 105.859162000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:40', '2012-01-14 16:32:40', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Trà & Cà Phê Bắc Bộ F 111 1 Lê Phụng Hiểu Tràng Tiền,Hà Nội, Việt Nam   (04) 3936 4786   Thực Phẩm , Trà, Cafe', 0, 0),
(780, 'Quán Bar - Cà Phê Tuna', ' ', '30, Hàng Vôi, Q.Hoàn Kiếm,Việt Nam', '090344 7883', ' ', 21.030263000000000, 105.856457999999990, 'Giải Trí , Bar', 274, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Quán Bar - Cà Phê Tuna 30, Hàng Vôi, Q.Hoàn Kiếm,Việt Nam   090344 7883   Giải Trí , Bar', 0, 0),
(781, 'Kiwi Icecream', ' ', 'Lý Thường Kiệt, quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.022758000000000, 105.851946000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Kiwi Icecream Lý Thường Kiệt, quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(782, 'Quoc Khanh Cafe', ' ', '245 Tran Nguyen Han Street,Vietnam', '(031) 385 6872', ' ', 21.029140999999996, 105.856104000000000, 'Bars & Clubs', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Quoc Khanh Cafe 245 Tran Nguyen Han Street,Vietnam   (031) 385 6872   Bars & Clubs', 0, 0),
(783, 'Gojo Coffee', ' ', '23C Hai Ba Trung Street, Hoan Kiem District,Vietnam', '(04) 3938 6555', ' ', 21.024044000000000, 105.854323000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Gojo Coffee 23C Hai Ba Trung Street, Hoan Kiem District,Vietnam   (04) 3938 6555   Cafe & Bistro', 0, 0),
(784, 'SWEET CHERRY CAFÉ', ' ', 'No 6 Phan Chu Trinh, Tràng Tiền, Hà Nội,thủ đô Hà Nội, Việt Nam', '090324 2466', ' ', 21.023626000000000, 105.856651000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'SWEET CHERRY CAFÉ No 6 Phan Chu Trinh, Tràng Tiền, Hà Nội,thủ đô Hà Nội, Việt Nam   090324 2466   Quán cà phê', 0, 0),
(785, 'Joma Cafe', ' ', 'Lý Quốc Sư, Hang Trong ward, Hoan Kiem,Hanoi, Vietnam', ' ', ' ', 21.030138000000000, 105.848846000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Joma Cafe Lý Quốc Sư, Hang Trong ward, Hoan Kiem,Hanoi, Vietnam       Quán cà phê', 0, 0),
(786, 'HC - Tungshing Tower', ' ', 'quận Hoàn Kiếm,Hà Nội, Việt Nam', ' ', ' ', 21.029858999999995, 105.856342000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'HC - Tungshing Tower quận Hoàn Kiếm,Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(787, 'Lâm', ' ', '91 Nguyễn Hữu Huân, Chương Dương Độ, Hà Nội,thủ đô Hà Nội, Vietnam', '(04) 3824 5940', ' ', 21.031704000000000, 105.854558000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Lâm 91 Nguyễn Hữu Huân, Chương Dương Độ, Hà Nội,thủ đô Hà Nội, Vietnam   (04) 3824 5940   Quán cà phê', 0, 0),
(788, 'Cà Phê G18', ' ', '18B, Tông Đản, Q.Hoàn Kiếm,Việt Nam', '(04) 3826 4919', ' ', 21.026136999999995, 105.858056000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê G18 18B, Tông Đản, Q.Hoàn Kiếm,Việt Nam   (04) 3826 4919   Giải Trí , Café', 0, 0),
(789, 'Quán Cà Phê Mầm', ' ', '13B, Tông Đản, Q.Hoàn Kiếm,Việt Nam', '(04) 3934 2009', ' ', 21.027339000000000, 105.857681000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Mầm 13B, Tông Đản, Q.Hoàn Kiếm,Việt Nam   (04) 3934 2009   Giải Trí , Café', 0, 0),
(790, 'Cà Phê Thyme', ' ', '18, Lò Sũ, Q.Hoàn Kiếm,Việt Nam', '(04) 3826 7929', ' ', 21.031264000000000, 105.855728000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Thyme 18, Lò Sũ, Q.Hoàn Kiếm,Việt Nam   (04) 3826 7929   Giải Trí , Café', 0, 0),
(791, 'Cà Phê Julians', ' ', '32, Lê Thái Tổ, Q.Hoàn Kiếm,Việt Nam', '(04) 3825 6123', ' ', 21.027128999999995, 105.851523000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Julians 32, Lê Thái Tổ, Q.Hoàn Kiếm,Việt Nam   (04) 3825 6123   Giải Trí , Café', 0, 0),
(792, '38 Coffee', ' ', '38 Hai Ba Trung Street, Hoan Kiem Dístrict,Vietnam', '(04) 3824 6084', ' ', 21.024576000000000, 105.851480999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, '38 Coffee 38 Hai Ba Trung Street, Hoan Kiem Dístrict,Vietnam   (04) 3824 6084   Cafe & Bistro', 0, 0),
(793, 'Cà Phê 144D', ' ', '144D, Minh Khai, Q.Hai Bà Trưng,Việt Nam', '(04) 3863 7578', ' ', 20.995339000000000, 105.854484000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê 144D 144D, Minh Khai, Q.Hai Bà Trưng,Việt Nam   (04) 3863 7578   Giải Trí , Café', 0, 0),
(794, 'Cà Phê - Karaoke Ngọc Hà', ' ', '109I, Minh Khai, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 20.995208999999996, 105.855782000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê - Karaoke Ngọc Hà 109I, Minh Khai, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(795, 'Cafe', ' ', '212 Định Công, Hoàng Mai,Việt Nam', '098374 1683', ' ', 20.992712999999995, 105.850681999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cafe 212 Định Công, Hoàng Mai,Việt Nam   098374 1683   Cafe & Bistro', 0, 0),
(796, 'Quán Cafe Hải', ' ', '82, Hồng Mai, Q.Hai Bà Trưng,Việt Nam', '(04) 3627 0148', ' ', 20.998494999999995, 105.852435000000000, 'Giải Trí , Café', 275, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Quán Cafe Hải 82, Hồng Mai, Q.Hai Bà Trưng,Việt Nam   (04) 3627 0148   Giải Trí , Café', 0, 0),
(797, 'Cà Phê Trung Nguyên', ' ', '191, Minh Khai, Q.Hai Bà Trưng,Việt Nam', '(04) 3636 7229', ' ', 20.995419999999996, 105.859676999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 191, Minh Khai, Q.Hai Bà Trưng,Việt Nam   (04) 3636 7229   Giải Trí , Café', 0, 0),
(798, 'Cà Phê Nhạc Sao Xanh', ' ', '74, Hoàng Mai, Q.Hoàng Mai,Việt Nam', '(04) 3624 3631', ' ', 20.992719999999995, 105.851195000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Nhạc Sao Xanh 74, Hoàng Mai, Q.Hoàng Mai,Việt Nam   (04) 3624 3631   Giải Trí , Café', 0, 0),
(799, 'Cafe', ' ', '213A Minh Khai, Hai Bà Trưng,Việt Nam', '(04) 3862 9748', ' ', 20.996400999999995, 105.862927000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cafe 213A Minh Khai, Hai Bà Trưng,Việt Nam   (04) 3862 9748   Cafe & Bistro', 0, 0),
(800, 'Quán Cà Phê 25', ' ', '25, Bùi Ngọc Dương, Q.Hai Bà Trưng,Việt Nam', '(04) 3917 5631', ' ', 21.001560000000000, 105.854151000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Quán Cà Phê 25 25, Bùi Ngọc Dương, Q.Hai Bà Trưng,Việt Nam   (04) 3917 5631   Giải Trí , Café', 0, 0),
(801, 'Cafe', ' ', '111E7 Tạ Quang Bửu, Hai Bà Trưng,Việt Nam', '(04) 3868 0887', ' ', 21.002953000000000, 105.848348000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cafe 111E7 Tạ Quang Bửu, Hai Bà Trưng,Việt Nam   (04) 3868 0887   Cafe & Bistro', 0, 0),
(802, 'Dntn Sx Tm Xuân Thắng', ' ', '41 Ngõ 403, Bạch Mai, Q.Hai Bà Trưng,Việt Nam', '(04) 3863 3842', ' ', 20.999386000000000, 105.850611000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Dntn Sx Tm Xuân Thắng 41 Ngõ 403, Bạch Mai, Q.Hai Bà Trưng,Việt Nam   (04) 3863 3842   Thực Phẩm , Trà, Cafe', 0, 0),
(803, 'Cà Phê Điểm Hẹn', ' ', '193C, Minh Khai, Q.Hai Bà Trưng,Việt Nam', '(04) 3862 2848', ' ', 20.995470000000000, 105.859912999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Điểm Hẹn 193C, Minh Khai, Q.Hai Bà Trưng,Việt Nam   (04) 3862 2848   Giải Trí , Café', 0, 0),
(804, 'Công Ty Tnhh Bách Thuận', ' ', '635, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3636 1085', ' ', 20.997373000000000, 105.862606000000010, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Bách Thuận 635, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam   (04) 3636 1085   Thực Phẩm , Trà, Cafe', 0, 0),
(805, 'Cafe - Sinh tố - Kem - Bánh ngọt', ' ', '7 Quỳnh Mai, Hai Bà Trưng,Việt Nam', '098667 8892', ' ', 21.001069000000000, 105.859108000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cafe - Sinh tố - Kem - Bánh ngọt 7 Quỳnh Mai, Hai Bà Trưng,Việt Nam   098667 8892   Cafe & Bistro', 0, 0),
(806, 'Cà Phê Mehico', ' ', '39, Tạ Quang Bửu, Q.Hai Bà Trưng,Việt Nam', '(04) 3868 3810', ' ', 21.000979000000000, 105.849865000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Mehico 39, Tạ Quang Bửu, Q.Hai Bà Trưng,Việt Nam   (04) 3868 3810   Giải Trí , Café', 0, 0),
(807, 'Cafe Trung Nguyên', ' ', '128C, Đại La, Q.Hai Bà Trưng,Việt Nam', '(04) 3869 9051', ' ', 20.996682000000000, 105.845150000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cafe Trung Nguyên 128C, Đại La, Q.Hai Bà Trưng,Việt Nam   (04) 3869 9051   Giải Trí , Café', 0, 0),
(808, 'Coffee Music Billard Trà Quán', ' ', '308, Minh Khai, Q.Hai Bà Trưng,Việt Nam', '(04) 3633 8438', ' ', 20.995979999999996, 105.861747000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Coffee Music Billard Trà Quán 308, Minh Khai, Q.Hai Bà Trưng,Việt Nam   (04) 3633 8438   Giải Trí , Café', 0, 0),
(809, 'Tranh Coffee', ' ', '310A Minh Khai Street, Hai Ba Trung Dístrict,Vietnam', '(04) 3862 1820', ' ', 20.996141000000000, 105.861812000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Tranh Coffee 310A Minh Khai Street, Hai Ba Trung Dístrict,Vietnam   (04) 3862 1820   Cafe & Bistro', 0, 0),
(810, 'Cafe - Giải khát', ' ', '282 Kim Ngưu, Hai Bà Trưng,Việt Nam', '(04) 3862 3663', ' ', 20.996162999999996, 105.861999000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cafe - Giải khát 282 Kim Ngưu, Hai Bà Trưng,Việt Nam   (04) 3862 3663   Cafe & Bistro', 0, 0),
(811, 'Cafe 83', ' ', '105 - C7A Quỳnh Mai, Hai Bà Trưng,Việt Nam', '(04) 3636 6880', ' ', 21.001069000000000, 105.860524000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cafe 83 105 - C7A Quỳnh Mai, Hai Bà Trưng,Việt Nam   (04) 3636 6880   Cafe & Bistro', 0, 0),
(812, 'Cà Phê Kim Cúc', ' ', '633, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3862 2794', ' ', 20.997543000000000, 105.862584000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Kim Cúc 633, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam   (04) 3862 2794   Giải Trí , Café', 0, 0),
(813, 'Cà Phê Thắng', ' ', '102 E3, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3862 3776', ' ', 21.000187000000000, 105.861581000000000, 'Giải Trí , Café', 276, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Thắng 102 E3, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam   (04) 3862 3776   Giải Trí , Café', 0, 0);
INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(814, 'Cà Phê Hương', ' ', '99, Thanh Nhàn, Q.Hai Bà Trưng,Việt Nam', '(04) 3913 9590', ' ', 21.002745999999995, 105.858958000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Hương 99, Thanh Nhàn, Q.Hai Bà Trưng,Việt Nam   (04) 3913 9590   Giải Trí , Café', 0, 0),
(815, 'Trà Thiên Sơn', ' ', 'Thanh Nhàn, Quỳnh Lôi, Hai Bà Trưng,Hà Nội, Vietnam', ' ', ' ', 21.002651000000000, 105.858164000000000, '', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Trà Thiên Sơn Thanh Nhàn, Quỳnh Lôi, Hai Bà Trưng,Hà Nội, Vietnam       ', 0, 0),
(816, 'Cà Phê Fasfood Singa Song', ' ', '9, Tam Trinh, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 20.996220999999995, 105.862809000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Fasfood Singa Song 9, Tam Trinh, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(817, 'Cà Phê Sinh Tố Hoàng Hiệp', ' ', '280, Hoàng Mai, Q.Hoàng Mai,Việt Nam', '(04) 3624 5418', ' ', 20.988623000000000, 105.855610000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Cà Phê Sinh Tố Hoàng Hiệp 280, Hoàng Mai, Q.Hoàng Mai,Việt Nam   (04) 3624 5418   Giải Trí , Café', 0, 0),
(818, 'Hiệp Hội Chè Việt Nam', ' ', '92, Võ Thị Sáu, Q.Hai Bà Trưng,Việt Nam', '(04) 3625 1801', ' ', 21.004114000000000, 105.855149000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:41', '2012-01-14 16:32:41', 1, NULL, 136, NULL, 1, 'Hiệp Hội Chè Việt Nam 92, Võ Thị Sáu, Q.Hai Bà Trưng,Việt Nam   (04) 3625 1801   Thực Phẩm , Trà, Cafe', 0, 0),
(819, 'Cà Phê Ngày Mới', ' ', '254, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.000543000000000, 105.861763000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Ngày Mới 254, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(820, 'Cà Phê Hà My', ' ', '507, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3636 1377', ' ', 20.999642000000000, 105.862337000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Hà My 507, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam   (04) 3636 1377   Giải Trí , Café', 0, 0),
(821, 'Cà Phê Mùa', ' ', '309, Bạch Mai, Q.Hai Bà Trưng,Việt Nam', '(04) 3628 0279', ' ', 21.001398999999996, 105.850889999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Mùa 309, Bạch Mai, Q.Hai Bà Trưng,Việt Nam   (04) 3628 0279   Giải Trí , Café', 0, 0),
(822, 'Ogel Cafe', ' ', '2, Lê Thanh Nghị, Q.Hai Bà Trưng,Việt Nam', '(04) 3627 5868', ' ', 21.003277000000000, 105.850659000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Ogel Cafe 2, Lê Thanh Nghị, Q.Hai Bà Trưng,Việt Nam   (04) 3627 5868   Giải Trí , Café', 0, 0),
(823, 'Bao Nhu Coffee', ' ', '340 Minh Khai Street, Hai Ba Trung District,Vietnam', '(04) 3633 9569', ' ', 20.996527000000000, 105.863239000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Bao Nhu Coffee 340 Minh Khai Street, Hai Ba Trung District,Vietnam   (04) 3633 9569   Cafe & Bistro', 0, 0),
(824, 'Cà Phê Sắc Màu', ' ', '27, Lê Thanh Nghị, Q.Hai Bà Trưng,Việt Nam', '(04) 3623 0850', ' ', 21.003302000000000, 105.849591000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Sắc Màu 27, Lê Thanh Nghị, Q.Hai Bà Trưng,Việt Nam   (04) 3623 0850   Giải Trí , Café', 0, 0),
(825, 'Coffee - Smoothies - Ice Cream - Cakes & Cookies', ' ', '7 Quynh Mai Street, Hai Ba Trung District,Vietnam', '098667 8892', ' ', 21.000909000000000, 105.859313000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Coffee - Smoothies - Ice Cream - Cakes & Cookies 7 Quynh Mai Street, Hai Ba Trung District,Vietnam   098667 8892   Cafe & Bistro', 0, 0),
(826, 'Cà Phê Quang', ' ', '9, Mai Động, Q.Hoàng Mai,Việt Nam', '(04) 3633 8966', ' ', 20.990351000000000, 105.861661000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Quang 9, Mai Động, Q.Hoàng Mai,Việt Nam   (04) 3633 8966   Giải Trí , Café', 0, 0),
(827, 'Cà Phê Tranh', ' ', '310A, Minh Khai, Q.Hai Bà Trưng,Việt Nam', '(04) 3862 1820', ' ', 20.996120999999995, 105.862219000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Tranh 310A, Minh Khai, Q.Hai Bà Trưng,Việt Nam   (04) 3862 1820   Cafe & Bistro', 0, 0),
(828, 'Cà Phê 70', ' ', '70, Mai Động, Q.Hoàng Mai,Việt Nam', '(04) 3633 4880', ' ', 20.989564999999995, 105.861635000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê 70 70, Mai Động, Q.Hoàng Mai,Việt Nam   (04) 3633 4880   Giải Trí , Café', 0, 0),
(829, 'Cà Phê Nhàn', ' ', '44, Võ Thị Sáu, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.005936999999996, 105.855079000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Nhàn 44, Võ Thị Sáu, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Café', 0, 0),
(830, 'Coffee Shop', ' ', '124 Nguyen Duc Canh Street, Hoang Mai Dístrict,Vietnam', '(04) 3662 1803', ' ', 20.987036000000000, 105.851652000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Coffee Shop 124 Nguyen Duc Canh Street, Hoang Mai Dístrict,Vietnam   (04) 3662 1803   Cafe & Bistro', 0, 0),
(831, '83 Cafe', ' ', '105 - C7A Quynh Mai Street, Hai Ba Trung District,Vietnam', '(04) 3636 6880', ' ', 21.001269000000000, 105.860481000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, '83 Cafe 105 - C7A Quynh Mai Street, Hai Ba Trung District,Vietnam   (04) 3636 6880   Cafe & Bistro', 0, 0),
(832, 'Coffee Shop', ' ', '365 Tam Trinh Street, Hoang Mai District,Vietnam', '(04) 3862 8243', ' ', 20.990272000000000, 105.863197000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Coffee Shop 365 Tam Trinh Street, Hoang Mai District,Vietnam   (04) 3862 8243   Cafe & Bistro', 0, 0),
(833, 'Cà Phê Phúc Hồng', ' ', '80, Đê Tô Hoàng, Q.Hai Bà Trưng,Việt Nam', '(04) 3868 1911', ' ', 21.007117999999995, 105.849785000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Phúc Hồng 80, Đê Tô Hoàng, Q.Hai Bà Trưng,Việt Nam   (04) 3868 1911   Giải Trí , Café', 0, 0),
(834, 'Cà Phê Lang', ' ', '29, Lĩnh Nam, Q.Hoàng Mai,Việt Nam', ' ', ' ', 20.990797000000000, 105.864337999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Lang 29, Lĩnh Nam, Q.Hoàng Mai,Việt Nam       Giải Trí , Café', 0, 0),
(835, 'Coffee Shop', ' ', '213A Minh Khai, Hai Ba Trung,Vietnam', '(04) 3862 9748', ' ', 20.996562000000000, 105.863120999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Coffee Shop 213A Minh Khai, Hai Ba Trung,Vietnam   (04) 3862 9748   Cafe & Bistro', 0, 0),
(836, 'Coffee Shop', ' ', '282 Kim Nguu Street, Hai Ba Trung District,Vietnam', '(04) 3862 3663', ' ', 21.001449000000000, 105.861489999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Coffee Shop 282 Kim Nguu Street, Hai Ba Trung District,Vietnam   (04) 3862 3663   Cafe & Bistro', 0, 0),
(837, 'Align Cafe 1', ' ', 'Quan Hoan Kiem, quận Hoàn Kiếm,Hà Nội, Vietnam', '(04) 3923 2436', ' ', 21.036134000000000, 105.852840000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Align Cafe 1 Quan Hoan Kiem, quận Hoàn Kiếm,Hà Nội, Vietnam   (04) 3923 2436   Quán cà phê', 0, 0),
(838, 'trà chanh chợ gạo', ' ', 'Chợ Gạo, Hang Buom ward, Hoan Kiem,Hanoi, Vietnam', ' ', ' ', 21.036652000000000, 105.853347000000000, 'Quán cà phê', 277, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'trà chanh chợ gạo Chợ Gạo, Hang Buom ward, Hoan Kiem,Hanoi, Vietnam       Quán cà phê', 0, 0),
(839, 'Vietnam Travel Cafe', ' ', '101 Mã Mây, Hoàn Kiếm,Hà Nội, Vietnam', '(04) 6775 5002', ' ', 21.034027999999996, 105.853410000000000, '', 278, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Vietnam Travel Cafe 101 Mã Mây, Hoàn Kiếm,Hà Nội, Vietnam   (04) 6775 5002   ', 0, 0),
(840, 'Sinh Cafe Hanoi - Head Office', ' ', '52, Lương Ngọc Quyến, Q.Hoàn Kiếm,Việt Nam', '(04) 3926 1621', ' ', 21.034689000000000, 105.851378000000000, 'Giải Trí , Café', 279, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Sinh Cafe Hanoi - Head Office 52, Lương Ngọc Quyến, Q.Hoàn Kiếm,Việt Nam   (04) 3926 1621   Giải Trí , Café', 0, 0),
(841, 'Cafe De Paris', ' ', '12, Lương Ngọc Quyến, Q.Hoàn Kiếm,Việt Nam', '(04) 3926 1327', ' ', 21.034808999999996, 105.853347000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cafe De Paris 12, Lương Ngọc Quyến, Q.Hoàn Kiếm,Việt Nam   (04) 3926 1327   Giải Trí , Café', 0, 0),
(842, 'Cafe - Trà Chanh', ' ', '8B Chợ Gạo, Hoàn Kiếm,Việt Nam', '0127803 9758', ' ', 21.036749000000000, 105.853433000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cafe - Trà Chanh 8B Chợ Gạo, Hoàn Kiếm,Việt Nam   0127803 9758   Cafe & Bistro', 0, 0),
(843, 'Ohioo Cafe', ' ', '31A Hàng Mắm, quận Hoàn Kiếm,Hà Nội, Việt Nam', '(04) 6670 6066', ' ', 21.033683000000000, 105.853904000000000, '', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Ohioo Cafe 31A Hàng Mắm, quận Hoàn Kiếm,Hà Nội, Việt Nam   (04) 6670 6066   ', 0, 0),
(844, 'Sell Weasel Coffee', ' ', '103 Hang Buom, quận Hoàn Kiếm,Hà Nội, Vietnam', ' ', ' ', 21.035367000000000, 105.850609999999990, '', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Sell Weasel Coffee 103 Hang Buom, quận Hoàn Kiếm,Hà Nội, Vietnam       ', 0, 0),
(845, 'Kangaroo Cafe Tour', ' ', '83, Mã Mây, Q.Hoàn Kiếm,Việt Nam', '(04) 3926 2504', ' ', 21.034448999999995, 105.853400000000000, 'Du Lịch , Công Ty Lữ Hành', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Kangaroo Cafe Tour 83, Mã Mây, Q.Hoàn Kiếm,Việt Nam   (04) 3926 2504   Du Lịch , Công Ty Lữ Hành', 0, 0),
(846, 'Cafe Gốm', ' ', '409, Hồng Hà, Q.Hoàn Kiếm,Việt Nam', '(04) 6290 7021', ' ', 21.037282999999995, 105.853819000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cafe Gốm 409, Hồng Hà, Q.Hoàn Kiếm,Việt Nam   (04) 6290 7021   Giải Trí , Café', 0, 0),
(847, 'Cà Phê Huyền', ' ', '24, Hàng Giầy, Q.Hoàn Kiếm,Việt Nam', '(04) 3923 0357', ' ', 21.035390000000000, 105.851281000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cà Phê Huyền 24, Hàng Giầy, Q.Hoàn Kiếm,Việt Nam   (04) 3923 0357   Giải Trí , Café', 0, 0),
(848, 'năng', ' ', 'Hàng Bạc, quận Hoàn Kiếm,Hà Nội, Vietnam', '(04) 3824 8419', ' ', 21.033902999999995, 105.853716999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'năng Hàng Bạc, quận Hoàn Kiếm,Hà Nội, Vietnam   (04) 3824 8419   Quán cà phê', 0, 0),
(849, 'Cafe - Giải khát', ' ', '2 Hàng Cá, Hoàn Kiếm,Việt Nam', '(04) 3828 3334', ' ', 21.036922000000000, 105.853496999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:42', '2012-01-14 16:32:42', 1, NULL, 136, NULL, 1, 'Cafe - Giải khát 2 Hàng Cá, Hoàn Kiếm,Việt Nam   (04) 3828 3334   Cafe & Bistro', 0, 0),
(850, 'Cafe Deliah', ' ', '75, Mã Mây, Q.Hoàn Kiếm,Việt Nam', '(04) 3926 4710', ' ', 21.034589000000000, 105.853379000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cafe Deliah 75, Mã Mây, Q.Hoàn Kiếm,Việt Nam   (04) 3926 4710   Giải Trí , Café', 0, 0),
(851, 'Cafe Giảng', ' ', '106 Phố Yên Phụ, Ba Đình,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.041315999999995, 105.849085000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cafe Giảng 106 Phố Yên Phụ, Ba Đình,thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(852, 'Coffee Shop', ' ', '2 Hang Ca Street, Hoan Kiem District,Vietnam', '(04) 3828 3334', ' ', 21.036881999999995, 105.852864000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Coffee Shop 2 Hang Ca Street, Hoan Kiem District,Vietnam   (04) 3828 3334   Cafe & Bistro', 0, 0),
(853, 'Cà Phê Culi', ' ', '68, Bát Sứ, Q.Hoàn Kiếm,Việt Nam', '(04) 3926 2241', ' ', 21.033792999999996, 105.847505000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cà Phê Culi 68, Bát Sứ, Q.Hoàn Kiếm,Việt Nam   (04) 3926 2241   Giải Trí , Café', 0, 0),
(854, 'Cửa Hàng Cà Phê Hương Mai', ' ', '103, Hàng Buồm, Q.Hoàn Kiếm,Việt Nam', '(04) 3828 3999', ' ', 21.035580000000000, 105.850477000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cửa Hàng Cà Phê Hương Mai 103, Hàng Buồm, Q.Hoàn Kiếm,Việt Nam   (04) 3828 3999   Thực Phẩm , Trà, Cafe', 0, 0),
(855, 'Cà Phê Dimah M & M', ' ', '14, Nguyễn Trung Trực, Q.Ba Đình,Việt Nam', '(04) 3927 0832', ' ', 21.041067999999996, 105.848540000000000, 'Cafe & Bistro', 280, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cà Phê Dimah M & M 14, Nguyễn Trung Trực, Q.Ba Đình,Việt Nam   (04) 3927 0832   Cafe & Bistro', 0, 0),
(856, 'Cafe Qualitie', ' ', '24, Hàng Chiếu, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.037163000000000, 105.851716000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cafe Qualitie 24, Hàng Chiếu, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(857, 'Nhà Phân Phối Ca Cao Trà Hùng Phát', ' ', '20, Nguyễn Siêu, Q.Hoàn Kiếm,Việt Nam', '(04) 3928 3843', ' ', 21.036591999999995, 105.852263000000010, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Nhà Phân Phối Ca Cao Trà Hùng Phát 20, Nguyễn Siêu, Q.Hoàn Kiếm,Việt Nam   (04) 3928 3843   Thực Phẩm , Trà, Cafe', 0, 0),
(858, 'Cà Phê Sinh Tố Thu Chung', ' ', '44, Hàng Buồm, Q.Hoàn Kiếm,Việt Nam', '(04) 3928 0593', ' ', 21.035781000000000, 105.851930000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cà Phê Sinh Tố Thu Chung 44, Hàng Buồm, Q.Hoàn Kiếm,Việt Nam   (04) 3928 0593   Giải Trí , Café', 0, 0),
(859, 'Thanh Thủy', ' ', '18, Hà Nội,thủ đô Hà Nội, Việt Nam', '(04) 3824 3233', ' ', 21.034756000000000, 105.852059000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Thanh Thủy 18, Hà Nội,thủ đô Hà Nội, Việt Nam   (04) 3824 3233   Quán cà phê', 0, 0),
(860, 'Thanh Thủy', ' ', '18, quận Hoàn Kiếm,Hà Nội, Vietnam', ' ', ' ', 21.034756000000000, 105.852059000000000, '', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Thanh Thủy 18, quận Hoàn Kiếm,Hà Nội, Vietnam       ', 0, 0),
(861, 'Cafe Internet', ' ', '31 Tạ Hiện, Q. Hoàn Kiếm,Việt Nam', '(04) 3926 0220', ' ', 21.034869000000000, 105.852209000000000, 'Thực phẩm và ăn uống , Phòng ăn', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cafe Internet 31 Tạ Hiện, Q. Hoàn Kiếm,Việt Nam   (04) 3926 0220   Thực phẩm và ăn uống , Phòng ăn', 0, 0),
(862, 'Queen Cafe', ' ', '65, Hàng Bạc, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.033863000000000, 105.852735000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Queen Cafe 65, Hàng Bạc, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(863, 'Salute Café', ' ', '14B Nguyen Trung Truc Street, Ba Dinh District,Vietnam', '090404 5333', ' ', 21.041308000000000, 105.848551000000000, 'Cafe & Bistro', 281, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Salute Café 14B Nguyen Trung Truc Street, Ba Dinh District,Vietnam   090404 5333   Cafe & Bistro', 0, 0),
(864, 'Cà phê Salute', ' ', '14B Nguyễn Trung Trực, quận Ba Đình,Việt Nam', '090404 5333', ' ', 21.041308000000000, 105.848551000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cà phê Salute 14B Nguyễn Trung Trực, quận Ba Đình,Việt Nam   090404 5333   Cafe & Bistro', 0, 0),
(865, 'Quán Coffee Gia Khánh', ' ', '105, Hàng Buồm, Q.Hoàn Kiếm,Việt Nam', '097985 2212', ' ', 21.035971000000000, 105.852735000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Quán Coffee Gia Khánh 105, Hàng Buồm, Q.Hoàn Kiếm,Việt Nam   097985 2212   Giải Trí , Café', 0, 0),
(866, 'Sell Weasel Coffee', ' ', '103 Hàng Buồm, Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.035367000000000, 105.850609999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Sell Weasel Coffee 103 Hàng Buồm, Hà Nội,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(867, 'Restaurant & Cafe Bay', ' ', '36, Mã Mây, Q.Hoàn Kiếm,Việt Nam', '(04) 3928 0736', ' ', 21.035589999999996, 105.853507000000010, 'Ẩm Thực , Nhà Hàng', 282, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Restaurant & Cafe Bay 36, Mã Mây, Q.Hoàn Kiếm,Việt Nam   (04) 3928 0736   Ẩm Thực , Nhà Hàng', 0, 0),
(868, 'Cafe Vân', ' ', '23, Hàng Buồm, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.036076000000000, 105.852113000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:43', '2012-01-14 16:32:43', 1, NULL, 136, NULL, 1, 'Cafe Vân 23, Hàng Buồm, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Café', 0, 0),
(869, 'Khách Sạn Hanoi Sinh Cafe', ' ', '85 Thuốc Bắc, Q.Hoàn Kiếm,Việt Nam', '(04) 3923 2735', ' ', 21.034358999999995, 105.848165000000000, 'Khách sạn tại Hà Nội', 283, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Khách Sạn Hanoi Sinh Cafe 85 Thuốc Bắc, Q.Hoàn Kiếm,Việt Nam   (04) 3923 2735   Khách sạn tại Hà Nội', 0, 0),
(870, 'Sinh Cà Phê - Opentour', ' ', '16, Ngõ Hàng Hành, Q.Hoàn Kiếm,Việt Nam', '(04) 3928 8025', ' ', 21.031590000000000, 105.850884000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Sinh Cà Phê - Opentour 16, Ngõ Hàng Hành, Q.Hoàn Kiếm,Việt Nam   (04) 3928 8025   Giải Trí , Café', 0, 0),
(871, 'Cửa Hàng King Caffe', ' ', '44, Lương Ngọc Quyến, Q.Hoàn Kiếm,Việt Nam', '(04) 3828 1762', ' ', 21.034704000000000, 105.851485000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cửa Hàng King Caffe 44, Lương Ngọc Quyến, Q.Hoàn Kiếm,Việt Nam   (04) 3828 1762   Thực Phẩm , Trà, Cafe', 0, 0),
(872, 'Helio Vietnam Specialty Coffee', ' ', '57 Đinh Tiên Hoàng, Hoàn Kiếm,Hà Nội, Việt Nam', '091356 6001', ' ', 21.031524000000000, 105.853110000000020, '', 284, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Helio Vietnam Specialty Coffee 57 Đinh Tiên Hoàng, Hoàn Kiếm,Hà Nội, Việt Nam   091356 6001   ', 0, 0),
(873, 'Cà phê Đinh', ' ', '13 Đinh Tiên Hoàng, Hang Bac ward, Hoan Kiem,Hanoi, Vietnam', ' ', ' ', 21.031970000000000, 105.852188000000000, 'Music Coffee', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cà phê Đinh 13 Đinh Tiên Hoàng, Hang Bac ward, Hoan Kiem,Hanoi, Vietnam       Music Coffee', 0, 0),
(874, 'Coffee Shop', ' ', '26 Hang Ca Street, Hoan Kiem District,Vietnam', '(04) 3824 4072', ' ', 21.036141000000000, 105.848593999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Coffee Shop 26 Hang Ca Street, Hoan Kiem District,Vietnam   (04) 3824 4072   Cafe & Bistro', 0, 0),
(875, 'Kem Snowball', ' ', '20 Lý Thái Tổ, Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.030958999999996, 105.854591000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Kem Snowball 20 Lý Thái Tổ, Hà Nội,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(876, 'Cafe Elegance', ' ', '30, Nguyễn Hữu Huân, Q.Hoàn Kiếm,Việt Nam', '(04) 3825 2233', ' ', 21.034654000000000, 105.854382000000020, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cafe Elegance 30, Nguyễn Hữu Huân, Q.Hoàn Kiếm,Việt Nam   (04) 3825 2233   Giải Trí , Café', 0, 0),
(877, 'Cà Phê Quang Hưng', ' ', '8, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam', '(04) 3932 6336', ' ', 21.034718999999996, 105.855675000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cà Phê Quang Hưng 8, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam   (04) 3932 6336   Giải Trí , Café', 0, 0),
(878, 'Dimah M & M Coffee', ' ', '14 Nguyen Trung Truc Street, Ba Dinh District,Vietnam', '(04) 3927 0832', ' ', 21.041408000000000, 105.848358000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Dimah M & M Coffee 14 Nguyen Trung Truc Street, Ba Dinh District,Vietnam   (04) 3927 0832   Cafe & Bistro', 0, 0),
(879, 'Sink Cafe Travel', ' ', '58, Hàng Bè, Q.Hoàn Kiếm,Việt Nam', '(04) 3926 4145', ' ', 21.032411000000000, 105.854048999999990, 'Du Lịch , Công Ty Lữ Hành', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Sink Cafe Travel 58, Hàng Bè, Q.Hoàn Kiếm,Việt Nam   (04) 3926 4145   Du Lịch , Công Ty Lữ Hành', 0, 0),
(880, 'Cà Phê Phố Cổ', ' ', '14-16, Hàng Bún, Q.Ba Đình,Việt Nam', '(04) 2210 1326', ' ', 21.043040999999995, 105.845804000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cà Phê Phố Cổ 14-16, Hàng Bún, Q.Ba Đình,Việt Nam   (04) 2210 1326   Giải Trí , Café', 0, 0),
(881, 'Cafe - Beverages - Beer', ' ', '36-38 Hang Giay Street, Hoan Kiem District,Vietnam', '(04) 3828 3838', ' ', 21.037634000000000, 105.848970000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cafe - Beverages - Beer 36-38 Hang Giay Street, Hoan Kiem District,Vietnam   (04) 3828 3838   Cafe & Bistro', 0, 0),
(882, 'Cafe Ngoc Lan', ' ', 'Hai Ba Trung district,Hanoi, Vietnam', ' ', ' ', 20.985482999999995, 105.860682000000000, '', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cafe Ngoc Lan Hai Ba Trung district,Hanoi, Vietnam       ', 0, 0),
(883, 'Cafe Ngoc Lan', ' ', 'Hai Bà Trưng,thủ đô Hà Nội, Việt Nam', ' ', ' ', 20.985482999999995, 105.860682000000000, '', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cafe Ngoc Lan Hai Bà Trưng,thủ đô Hà Nội, Việt Nam       ', 0, 0),
(884, 'Bar Cafe Hà Dung', ' ', '385, Tam Trinh, Q.Hoàng Mai,Việt Nam', '(04) 3862 9020', ' ', 20.986464000000000, 105.863764000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Bar Cafe Hà Dung 385, Tam Trinh, Q.Hoàng Mai,Việt Nam   (04) 3862 9020   Giải Trí , Bar', 0, 0),
(885, 'Cà Phê Hồng Anh', ' ', '277, Tam Trinh, Q.Hoàng Mai,Việt Nam', '098684 4383', ' ', 20.988543000000000, 105.863560000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cà Phê Hồng Anh 277, Tam Trinh, Q.Hoàng Mai,Việt Nam   098684 4383   Giải Trí , Café', 0, 0),
(886, 'Cafe - Giải khát', ' ', '365 Tam Trinh, Hoàng Mai,Việt Nam', '(04) 3862 8243', ' ', 20.990010000000000, 105.863142000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cafe - Giải khát 365 Tam Trinh, Hoàng Mai,Việt Nam   (04) 3862 8243   Cafe & Bistro', 0, 0),
(887, 'Cafe OTC', ' ', 'Uy Nỗ, Đông Anh,Hà Nội, Việt Nam', '0167436 2555', ' ', 21.138256999999996, 105.859038000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cafe OTC Uy Nỗ, Đông Anh,Hà Nội, Việt Nam   0167436 2555   Giải trí , Karaoke', 0, 0),
(888, 'Tiger Cafe', ' ', 'Cao Lỗ,Hà Nội, Việt Nam', '093608 2482', ' ', 21.140868000000000, 105.847949000000000, 'Giải trí', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Tiger Cafe Cao Lỗ,Hà Nội, Việt Nam   093608 2482   Giải trí', 0, 0),
(889, 'Cà Phê Aladin', ' ', '144I, Giảng Võ, Q.Ba Đình,Việt Nam', '(04) 3834 4605', ' ', 21.026396999999996, 105.823316000000000, 'Giải Trí , Café', 285, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cà Phê Aladin 144I, Giảng Võ, Q.Ba Đình,Việt Nam   (04) 3834 4605   Giải Trí , Café', 0, 0),
(890, 'Cafe Minto', ' ', 'Quan Ba Dinh, Ba Đình,Hà Nội, Vietnam', '(04) 6328 4740', ' ', 21.027768999999996, 105.823832000000000, 'Nhà hàng', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cafe Minto Quan Ba Dinh, Ba Đình,Hà Nội, Vietnam   (04) 6328 4740   Nhà hàng', 0, 0),
(891, '115-D1 Coffee Trung Nguyen', ' ', 'Trần Huy Liệu, Giảng Võ, Ba Đình,Hanoi, Vietnam', ' ', ' ', 21.027221000000000, 105.822080000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, '115-D1 Coffee Trung Nguyen Trần Huy Liệu, Giảng Võ, Ba Đình,Hanoi, Vietnam       Quán cà phê', 0, 0),
(892, 'Cây Liễu', ' ', 'Quan Ba Dinh, Ba Đình,Hà Nội, Vietnam', ' ', ' ', 21.027267999999996, 105.822019000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cây Liễu Quan Ba Dinh, Ba Đình,Hà Nội, Vietnam       Quán cà phê', 0, 0),
(893, 'Cây Bàng Đổ', ' ', 'Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam', ' ', ' ', 21.027242999999995, 105.821868999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cây Bàng Đổ Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(894, 'Xuc Xac Coffee', ' ', '90 Giang Vo Street, Ba Dinh District,Vietnam', '(04) 3596 4225', ' ', 21.026033000000000, 105.822060999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Xuc Xac Coffee 90 Giang Vo Street, Ba Dinh District,Vietnam   (04) 3596 4225   Cafe & Bistro', 0, 0),
(895, 'HBL Coffee', ' ', '116A5 Giang Vo Street, Ba Dinh District,Vietnam', '(04) 3846 1133', ' ', 21.027048000000000, 105.823767000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'HBL Coffee 116A5 Giang Vo Street, Ba Dinh District,Vietnam   (04) 3846 1133   Cafe & Bistro', 0, 0),
(896, 'Baam Boo', ' ', '101B3 Trần Huy Liệu, Ba Đình,Việt Nam', '(04) 3846 0310', ' ', 21.027128999999995, 105.822372000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Baam Boo 101B3 Trần Huy Liệu, Ba Đình,Việt Nam   (04) 3846 0310   Cafe & Bistro', 0, 0),
(897, 'Muse Cafe', ' ', '104 A5-Giang Vo, Kim Mã street, Ba Dinh district,Hà Nội, Vietnam', '090495 4943', ' ', 21.030453000000000, 105.818724000000000, 'Nhà hàng , Kem', 286, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Muse Cafe 104 A5-Giang Vo, Kim Mã street, Ba Dinh district,Hà Nội, Vietnam   090495 4943   Nhà hàng , Kem', 0, 0),
(898, 'Cây Bàng Đổ', ' ', 'Ba Đình,Hanoi, Vietnam', ' ', ' ', 21.027242999999995, 105.821868999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:44', '2012-01-14 16:32:44', 1, NULL, 136, NULL, 1, 'Cây Bàng Đổ Ba Đình,Hanoi, Vietnam       Quán cà phê', 0, 0),
(899, 'Hot Rock Cafe', ' ', '117A1, Giảng Võ, Q.Đống Đa,Việt Nam', '(04) 3856 0005', ' ', 21.027560000000000, 105.824101000000000, 'Nhà hàng', 287, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Hot Rock Cafe 117A1, Giảng Võ, Q.Đống Đa,Việt Nam   (04) 3856 0005   Nhà hàng', 0, 0),
(900, 'HotRock Cafe Restaurant', ' ', '117 A1 Giang Vo Street, Ba Dinh District,Vietnam', '(04) 3846 3451', ' ', 21.023648999999995, 105.820709000000000, 'Food & Dining , Restaurants', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'HotRock Cafe Restaurant 117 A1 Giang Vo Street, Ba Dinh District,Vietnam   (04) 3846 3451   Food & Dining , Restaurants', 0, 0),
(901, 'Cà Phê Hoa Sữa', ' ', '32B, Hào Nam, Q.Đống Đa,Việt Nam', '(04) 3513 0934', ' ', 21.022592000000000, 105.826868000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Hoa Sữa 32B, Hào Nam, Q.Đống Đa,Việt Nam   (04) 3513 0934   Giải Trí , Café', 0, 0),
(902, 'Coffe Kien Truc', ' ', 'Dong Da,Hanoi, Vietnam', ' ', ' ', 21.025302000000000, 105.826992000000000, '', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Coffe Kien Truc Dong Da,Hanoi, Vietnam       ', 0, 0),
(903, 'Coffe Kien Truc', ' ', 'Đống Đa,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.025302000000000, 105.826992000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Coffe Kien Truc Đống Đa,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(904, 'Cafe', ' ', '6 Giang Văn Minh, Ba Đình,Việt Nam', '(04) 3734 4572', ' ', 21.034431999999995, 105.827167000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cafe 6 Giang Văn Minh, Ba Đình,Việt Nam   (04) 3734 4572   Cafe & Bistro', 0, 0),
(905, 'Cà Phê Lam', ' ', '26, Núi Trúc, Q.Ba Đình,Việt Nam', '(04) 3726 4243', ' ', 21.028160000000000, 105.824636000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Lam 26, Núi Trúc, Q.Ba Đình,Việt Nam   (04) 3726 4243   Giải Trí , Café', 0, 0),
(906, 'Cà Phê Trung Nguyên', ' ', '113, Trần Huy Liệu, Q.Ba Đình,Việt Nam', '(04) 3831 3441', ' ', 21.030653999999995, 105.819926000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Trung Nguyên 113, Trần Huy Liệu, Q.Ba Đình,Việt Nam   (04) 3831 3441   Giải Trí , Café', 0, 0),
(907, 'BOARD CAPHE DICE (Cafe Xúc Xắc)', ' ', '90 Giảng Võ Q. Ba Đình,Việt Nam', '(04) 3596 4225', ' ', 21.025126000000000, 105.821171000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'BOARD CAPHE DICE (Cafe Xúc Xắc) 90 Giảng Võ Q. Ba Đình,Việt Nam   (04) 3596 4225   Cafe & Bistro', 0, 0),
(908, 'Cà Phê X - Men Club', ' ', '408, La Thành, Q.Đống Đa,Việt Nam', ' ', ' ', 21.022732000000000, 105.822555000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê X - Men Club 408, La Thành, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(909, 'Công Ty Tnhh Cảm Xúc', ' ', '89, Giảng Võ, Q.Đống Đa,Việt Nam', '(04) 3736 6704', ' ', 21.029292000000000, 105.827328999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Cảm Xúc 89, Giảng Võ, Q.Đống Đa,Việt Nam   (04) 3736 6704   Giải Trí , Café', 0, 0),
(910, 'Cafe Minto', ' ', 'Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam', '(04) 6328 4740', ' ', 21.027768999999996, 105.823832000000000, '', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cafe Minto Hanoi (Ha Noi),thủ đô Hà Nội, Vietnam   (04) 6328 4740   ', 0, 0),
(911, 'Quán Cafe Black & White', ' ', '271, Kim Mã, Q.Ba Đình,Việt Nam', '(04) 3726 2746', ' ', 21.030974000000000, 105.820715000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Quán Cafe Black & White 271, Kim Mã, Q.Ba Đình,Việt Nam   (04) 3726 2746   Cafe & Bistro', 0, 0),
(912, 'Baam Boo Coffee Shop', ' ', '101B3 Tran Huy Lieu Street, Ba Dinh District,Vietnam', '(04) 3846 0310', ' ', 21.027715000000000, 105.821761000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Baam Boo Coffee Shop 101B3 Tran Huy Lieu Street, Ba Dinh District,Vietnam   (04) 3846 0310   Cafe & Bistro', 0, 0),
(913, 'Cà Phê Thục Linh', ' ', '103, Núi Trúc, Q.Ba Đình,Việt Nam', '(04) 2214 6014', ' ', 21.029582000000000, 105.823305999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Thục Linh 103, Núi Trúc, Q.Ba Đình,Việt Nam   (04) 2214 6014   Giải Trí , Café', 0, 0),
(914, 'Cà Phê Wifi', ' ', '85, Núi Trúc, Q.Ba Đình,Việt Nam', '(04) 3736 7902', ' ', 21.029672000000000, 105.823208999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Wifi 85, Núi Trúc, Q.Ba Đình,Việt Nam   (04) 3736 7902   Giải Trí , Café', 0, 0),
(915, 'Doco Donuts & Coffee', ' ', '299 Giảng Võ - Q. Ba Đình,Việt Nam', '(04) 2260 6264', ' ', 21.023620999999995, 105.819830000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Doco Donuts & Coffee 299 Giảng Võ - Q. Ba Đình,Việt Nam   (04) 2260 6264   Cafe & Bistro', 0, 0),
(916, 'Cafe 283', ' ', '283 Giảng Võ, Đống Đa,Việt Nam', '(04) 3512 1248', ' ', 21.023613999999995, 105.819823000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cafe 283 283 Giảng Võ, Đống Đa,Việt Nam   (04) 3512 1248   Cafe & Bistro', 0, 0),
(917, 'Avatar - Hội Đê Tiên', ' ', 'Trần Huy Liệu, Ba Đình,Hà Nội, Việt Nam', ' ', ' ', 21.030208999999996, 105.819840000000000, '', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Avatar - Hội Đê Tiên Trần Huy Liệu, Ba Đình,Hà Nội, Việt Nam       ', 0, 0),
(918, 'Cafe - Games - Twenty', ' ', '94 Giang Vo Street, Dong Da District,Vietnam', '(04) 3823 5260', ' ', 21.023515000000000, 105.819768000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cafe - Games - Twenty 94 Giang Vo Street, Dong Da District,Vietnam   (04) 3823 5260   Cafe & Bistro', 0, 0),
(919, 'Giay Coffee', ' ', '45 Hao Nam Street, Dong Da District,Vietnam', '091600 5123', ' ', 21.025520000000000, 105.827255000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Giay Coffee 45 Hao Nam Street, Dong Da District,Vietnam   091600 5123   Cafe & Bistro', 0, 0),
(920, 'Che Guevara Cafe', ' ', '66 Hào Nam Q.Đống Đa,Việt Nam', '(04) 2958 6632', ' ', 21.025639000000000, 105.827286000000020, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Che Guevara Cafe 66 Hào Nam Q.Đống Đa,Việt Nam   (04) 2958 6632   Cafe & Bistro', 0, 0),
(921, 'Avatar - Hội Đê Tiên', ' ', 'Trần Huy Liệu, Ba Đình,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.030208999999996, 105.819840000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Avatar - Hội Đê Tiên Trần Huy Liệu, Ba Đình,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(922, 'Amazing Cafe', ' ', '132 Hao Nam Street, Dong Da District,Vietnam', '(04) 3511 6126', ' ', 21.026001999999995, 105.827394000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Amazing Cafe 132 Hao Nam Street, Dong Da District,Vietnam   (04) 3511 6126   Cafe & Bistro', 0, 0),
(923, 'Cà Phê Phố Mới', ' ', '146, Hào Nam, Q.Đống Đa,Việt Nam', '(04) 3511 8682', ' ', 21.025901999999995, 105.827930000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Phố Mới 146, Hào Nam, Q.Đống Đa,Việt Nam   (04) 3511 8682   Giải Trí , Café', 0, 0),
(924, 'Café New City', ' ', '420 La Thanh Street,Vietnam', '(04) 6667 4538', ' ', 21.023783999999996, 105.818273999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Café New City 420 La Thanh Street,Vietnam   (04) 6667 4538   Cafe & Bistro', 0, 0),
(925, 'Cà Phê Bar Ete', ' ', '8A, Giang Văn Minh, Q.Ba Đình,Việt Nam', '(04) 3722 4714', ' ', 21.032076000000000, 105.827243000000010, 'Giải Trí , Café', 288, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Bar Ete 8A, Giang Văn Minh, Q.Ba Đình,Việt Nam   (04) 3722 4714   Giải Trí , Café', 0, 0),
(926, 'Công Ty Tnhh Chè Đại Thành', ' ', '27E Khối 4, Cát Linh, Q.Đống Đa,Việt Nam', '(04) 3823 4348', ' ', 21.029191999999995, 105.829410000000000, 'Nông nghiệp , Sản phẩm Nông nghiệp', 289, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Chè Đại Thành 27E Khối 4, Cát Linh, Q.Đống Đa,Việt Nam   (04) 3823 4348   Nông nghiệp , Sản phẩm Nông nghiệp', 0, 0),
(927, 'I Like...', ' ', '10 ngõ 23 Giang Văn Minh, Ba Đình,Hà Nội, Việt Nam', '091661 6665', ' ', 21.030584000000000, 105.826283000000000, '', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'I Like... 10 ngõ 23 Giang Văn Minh, Ba Đình,Hà Nội, Việt Nam   091661 6665   ', 0, 0),
(928, 'Red Bar Cafe', ' ', '235, Kim Mã, Q.Ba Đình,Việt Nam', '(04) 3843 0663', ' ', 21.031283999999996, 105.822748000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Red Bar Cafe 235, Kim Mã, Q.Ba Đình,Việt Nam   (04) 3843 0663   Giải Trí , Bar', 0, 0),
(929, 'Avatar Cafe', ' ', 'P1 B2 Tran Huy Lieu Street, Ba Dinh District,Vietnam', '(04) 2246 5511', ' ', 21.029517999999996, 105.820688000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Avatar Cafe P1 B2 Tran Huy Lieu Street, Ba Dinh District,Vietnam   (04) 2246 5511   Cafe & Bistro', 0, 0),
(930, 'Cafe Season', ' ', '158, Ngọc Khánh, Q.Ba Đình,Việt Nam', '(04) 2242 5333', ' ', 21.025836999999996, 105.818333000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cafe Season 158, Ngọc Khánh, Q.Ba Đình,Việt Nam   (04) 2242 5333   Giải Trí , Café', 0, 0),
(931, 'Cà Phê Sao Xa', ' ', '35D1, Trần Huy Liệu, Q.Ba Đình,Việt Nam', '(04) 3831 3007', ' ', 21.030403000000000, 105.819969000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Sao Xa 35D1, Trần Huy Liệu, Q.Ba Đình,Việt Nam   (04) 3831 3007   Giải Trí , Café', 0, 0),
(932, 'Cà Phê Mê Trang', ' ', '5, Láng Hạ, Q.Đống Đa,Việt Nam', ' ', ' ', 21.022472000000000, 105.819529000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Mê Trang 5, Láng Hạ, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(933, 'Cà Phê A&T', ' ', '32B, Hào Nam, Q.Đống Đa,Việt Nam', '(04) 3513 2889', ' ', 21.022592000000000, 105.826868000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê A&T 32B, Hào Nam, Q.Đống Đa,Việt Nam   (04) 3513 2889   Giải Trí , Café', 0, 0),
(934, 'Cafe Trần', ' ', '122A6 Trần Huy Liệu, Giảng Võ, Hà Nội,Hà Nội, Vietnam', '093630 7889', ' ', 21.029702000000000, 105.819667000000010, '', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cafe Trần 122A6 Trần Huy Liệu, Giảng Võ, Hà Nội,Hà Nội, Vietnam   093630 7889   ', 0, 0),
(935, 'Cà Phê Hoa Quỳnh', ' ', '114B2, Nguyễn Chí Thanh, Q.Ba Đình,Việt Nam', '(04) 3771 0160', ' ', 21.028334999999995, 105.812464000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:45', '2012-01-14 16:32:45', 1, NULL, 136, NULL, 1, 'Cà Phê Hoa Quỳnh 114B2, Nguyễn Chí Thanh, Q.Ba Đình,Việt Nam   (04) 3771 0160   Giải Trí , Café', 0, 0),
(936, 'Cafe Taoviet - Cơ sở số 2', ' ', '12 Ngọc Khánh, Ba Đình,Hà Nội, Việt Nam', '098450 0959', ' ', 21.030042000000000, 105.817168000000000, 'Iphoneservices Vietnam', 290, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe Taoviet - Cơ sở số 2 12 Ngọc Khánh, Ba Đình,Hà Nội, Việt Nam   098450 0959   Iphoneservices Vietnam', 0, 0),
(937, 'Cà Phê Vườn', ' ', '74, Nguyễn Phúc Lai, Q.Đống Đa,Việt Nam', ' ', ' ', 21.020519000000000, 105.821884000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Vườn 74, Nguyễn Phúc Lai, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(938, 'Cafe 101', ' ', '101B3 Tran Huy Lieu Street, Ba Dinh District,Vietnam', '(04) 3846 0639', ' ', 21.029883000000000, 105.819702000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe 101 101B3 Tran Huy Lieu Street, Ba Dinh District,Vietnam   (04) 3846 0639   Cafe & Bistro', 0, 0),
(939, '26 Cafe', ' ', '26 Lang Ha Street, Dong Da District,Vietnam', '(04) 3776 5323', ' ', 21.022005000000000, 105.819231000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, '26 Cafe 26 Lang Ha Street, Dong Da District,Vietnam   (04) 3776 5323   Cafe & Bistro', 0, 0),
(940, '283 Cafe', ' ', '283 Giang Vo Street, Dong Da District,Vietnam', '(04) 3512 1248', ' ', 21.023613999999995, 105.819823000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, '283 Cafe 283 Giang Vo Street, Dong Da District,Vietnam   (04) 3512 1248   Cafe & Bistro', 0, 0),
(941, 'Cà Phê Nắng Sài Gòn', ' ', '91, Nguyễn Chí Thanh, Q.Ba Đình,Việt Nam', '(04) 6266 3078', ' ', 21.027488999999996, 105.812196000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Nắng Sài Gòn 91, Nguyễn Chí Thanh, Q.Ba Đình,Việt Nam   (04) 6266 3078   Giải Trí , Café', 0, 0),
(942, 'Công Ty Tnhh Hà Trang', ' ', 'đơn vị B1, tầng 4,khách sạn Hà Nội Horizon; 40 Cát Linh,quận Đống Đa,Việt Nam', '(04) 3733 2505', ' ', 21.029252000000000, 105.829099000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Công Ty Tnhh Hà Trang đơn vị B1, tầng 4,khách sạn Hà Nội Horizon; 40 Cát Linh,quận Đống Đa,Việt Nam   (04) 3733 2505   Thực Phẩm , Trà, Cafe', 0, 0),
(943, 'Cafe - Trò chơi - Twenty', ' ', '94 Giảng Võ, Đống Đa,Việt Nam', '(04) 3823 5260', ' ', 21.023515000000000, 105.819768000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe - Trò chơi - Twenty 94 Giảng Võ, Đống Đa,Việt Nam   (04) 3823 5260   Cafe & Bistro', 0, 0),
(944, 'Bar Cafe', ' ', '257 Kim Mã, Ba Đình,Việt Nam', '(04) 3846 0717', ' ', 21.031254000000000, 105.821814000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Bar Cafe 257 Kim Mã, Ba Đình,Việt Nam   (04) 3846 0717   Cafe & Bistro', 0, 0),
(945, 'Cà Phê 76', ' ', '76, Giang Văn Minh, Q.Ba Đình,Việt Nam', '(04) 3722 3395', ' ', 21.029622000000000, 105.827629999999980, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê 76 76, Giang Văn Minh, Q.Ba Đình,Việt Nam   (04) 3722 3395   Giải Trí , Café', 0, 0),
(946, 'Amazing Cafe', ' ', '132 Hào Nam, Đống Đa,Việt Nam', '(04) 3511 6126', ' ', 21.026001999999995, 105.827394000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Amazing Cafe 132 Hào Nam, Đống Đa,Việt Nam   (04) 3511 6126   Cafe & Bistro', 0, 0),
(947, 'Cafe 20', ' ', '20 Ngọc Khánh, Ba Đình,Việt Nam', '(04) 3771 6547', ' ', 21.028447000000000, 105.817560000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe 20 20 Ngọc Khánh, Ba Đình,Việt Nam   (04) 3771 6547   Cafe & Bistro', 0, 0),
(948, 'Cafe My Space', ' ', '9 Thành Công, Ba Dinh,Hanoi, Vietnam', ' ', ' ', 21.022442000000000, 105.815637000000000, '', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe My Space 9 Thành Công, Ba Dinh,Hanoi, Vietnam       ', 0, 0),
(949, 'Cafe My Space', ' ', '9 Thành Công, Ba Đình,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.022442000000000, 105.815637000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe My Space 9 Thành Công, Ba Đình,thủ đô Hà Nội, Vietnam       Quán cà phê', 0, 0),
(950, 'Nhà Hàng Ánh Dương', ' ', '9, Hoàng Cầu, Q.Đống Đa,Việt Nam', '(04) 3513 0371', ' ', 21.020078000000000, 105.825488999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Nhà Hàng Ánh Dương 9, Hoàng Cầu, Q.Đống Đa,Việt Nam   (04) 3513 0371   Giải Trí , Café', 0, 0),
(951, 'Cà Phê 15 Đoàn Thị Điểm', ' ', '15 Đoàn Thị Điểm, Đống Đa,Hà Nội, Việt Nam', '(04) 3823 3501', ' ', 21.026427999999996, 105.832007000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê 15 Đoàn Thị Điểm 15 Đoàn Thị Điểm, Đống Đa,Hà Nội, Việt Nam   (04) 3823 3501   Quán cà phê', 0, 0),
(952, 'Việt Cafe', ' ', '24, Giang Văn Minh, Q.Ba Đình,Việt Nam', '(04) 3734 1503', ' ', 21.032626000000000, 105.827308000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Việt Cafe 24, Giang Văn Minh, Q.Ba Đình,Việt Nam   (04) 3734 1503   Giải Trí , Café', 0, 0),
(953, 'Quán Cafe Hưng Long', ' ', '170, Đội Cấn, Q.Ba Đình,Việt Nam', '(04) 3823 5159', ' ', 21.034358999999995, 105.828552000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cafe Hưng Long 170, Đội Cấn, Q.Ba Đình,Việt Nam   (04) 3823 5159   Giải Trí , Café', 0, 0),
(954, 'Trà Việt', ' ', '164, Đông Các, Q.Đống Đa,Việt Nam', '(04) 3513 3207', ' ', 21.020067999999995, 105.826299000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Trà Việt 164, Đông Các, Q.Đống Đa,Việt Nam   (04) 3513 3207   Thực Phẩm , Trà, Cafe', 0, 0);
INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(955, 'A.M Café', ' ', '20G2 Vạn Phúc,Ba Đình, Hà Nội, Việt Nam', '093660 3033', ' ', 21.033227000000000, 105.818735000000000, 'Nhà hàng , Quán cà phê', 291, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'A.M Café 20G2 Vạn Phúc,Ba Đình, Hà Nội, Việt Nam   093660 3033   Nhà hàng , Quán cà phê', 0, 0),
(956, 'Quán Cà Phê Extension', ' ', '169, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam', '(04) 3565 9833', ' ', 20.997617999999996, 105.823182000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Extension 169, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam   (04) 3565 9833   Giải Trí , Café', 0, 0),
(957, 'Cà Phê 193', ' ', '193, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.997959000000000, 105.822473999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê 193 193, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(958, 'Quán Cafe Hoàng', ' ', '150, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam', '(04) 3926 6149', ' ', 20.996911999999995, 105.824851000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cafe Hoàng 150, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam   (04) 3926 6149   Giải Trí , Café', 0, 0),
(959, 'Quán Cà Phê - Giải Khát 259', ' ', '259, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam', '(04) 3565 1799', ' ', 20.998494999999995, 105.821171000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cà Phê - Giải Khát 259 259, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam   (04) 3565 1799   Giải Trí , Café', 0, 0),
(960, 'Quán Cafe Giải Khát Hello', ' ', '84, Vương Thừa Vũ, Q.Thanh Xuân,Việt Nam', '(04) 3568 0366', ' ', 20.999044999999995, 105.821884000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cafe Giải Khát Hello 84, Vương Thừa Vũ, Q.Thanh Xuân,Việt Nam   (04) 3568 0366   Giải Trí , Café', 0, 0),
(961, 'Quán Cafe Giải Khát Phố Nhớ', ' ', '127, Tô Vĩnh Diện, Q.Thanh Xuân,Việt Nam', '(04) 2241 0270', ' ', 20.998699999999996, 105.820372000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cafe Giải Khát Phố Nhớ 127, Tô Vĩnh Diện, Q.Thanh Xuân,Việt Nam   (04) 2241 0270   Giải Trí , Café', 0, 0),
(962, 'Cà Phê Trinh', ' ', '283, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.998774999999995, 105.820591000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Trinh 283, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(963, 'Quán Cafe Góc Phố', ' ', '86, Tô Vĩnh Diện, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.999400999999995, 105.820903000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cafe Góc Phố 86, Tô Vĩnh Diện, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(964, 'Anh Hai Coffee Shop', ' ', '197 Nguyen Ngoc Nai Street, Thanh Xuan District,Vietnam', '091526 3724', ' ', 20.997743000000000, 105.826492000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Anh Hai Coffee Shop 197 Nguyen Ngoc Nai Street, Thanh Xuan District,Vietnam   091526 3724   Cafe & Bistro', 0, 0),
(965, 'Quán Cafe You & Me', ' ', '54, Vương Thừa Vũ, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.999762000000000, 105.821964999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cafe You & Me 54, Vương Thừa Vũ, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(966, 'Cà Phê 91', ' ', '91, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.996421000000000, 105.827061000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê 91 91, Hoàng Văn Thái, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(967, 'Cà Phê Bóng Đá', ' ', '28, Cù Chính Lan, Q.Thanh Xuân,Việt Nam', '(04) 3565 0435', ' ', 21.000242000000000, 105.823805000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Bóng Đá 28, Cù Chính Lan, Q.Thanh Xuân,Việt Nam   (04) 3565 0435   Giải Trí , Café', 0, 0),
(968, 'Quán Cafe Bt''s', ' ', '3, Tô Vĩnh Diện, Q.Thanh Xuân,Việt Nam', '(04) 3565 2026', ' ', 21.000216999999996, 105.822104000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cafe Bt''s 3, Tô Vĩnh Diện, Q.Thanh Xuân,Việt Nam   (04) 3565 2026   Giải Trí , Café', 0, 0),
(969, 'One One Coffe', ' ', 'Phố Khương Trung Mới, Khương Trung, Thanh Xuân,Hà Nội, Việt Nam', '090621 0915', ' ', 20.998304000000000, 105.817523000000010, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'One One Coffe Phố Khương Trung Mới, Khương Trung, Thanh Xuân,Hà Nội, Việt Nam   090621 0915   Quán cà phê', 0, 0),
(970, 'Quán Cafe Legend', ' ', '25, Vương Thừa Vũ, Q.Thanh Xuân,Việt Nam', ' ', ' ', 21.000643000000000, 105.822362000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cafe Legend 25, Vương Thừa Vũ, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(971, 'Cafe', ' ', '122 Khương Đình, Thanh Xuân,Việt Nam', '(04) 3858 4459', ' ', 20.995450999999996, 105.814316000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe 122 Khương Đình, Thanh Xuân,Việt Nam   (04) 3858 4459   Cafe & Bistro', 0, 0),
(972, 'M''Style Cafe''', ' ', '179 Phố Khương Hạ, Thanh Xuân,Hà Nội, Việt Nam', '096889 333', ' ', 20.997062000000000, 105.816515000000010, 'Quán M''Style Cafe 3 tầng 3 fong cách', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'M''Style Cafe'' 179 Phố Khương Hạ, Thanh Xuân,Hà Nội, Việt Nam   096889 333   Quán M''Style Cafe 3 tầng 3 fong cách', 0, 0),
(973, 'Thế Hệ Mới Cà Phê Bóng Đá Bida', ' ', '145, Khương Trung, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.997627999999995, 105.818430000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Thế Hệ Mới Cà Phê Bóng Đá Bida 145, Khương Trung, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(974, 'Aloha Cafe', ' ', 'Phố Khương Trung, Q. Thanh Xuân,Hà Nội, Việt Nam', ' ', ' ', 21.001256000000000, 105.818592999999990, '', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Aloha Cafe Phố Khương Trung, Q. Thanh Xuân,Hà Nội, Việt Nam       ', 0, 0),
(975, 'Cà Phê Hương', ' ', '5, Cù Chính Lan, Q.Thanh Xuân,Việt Nam', ' ', ' ', 21.001059000000000, 105.824217999999990, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Hương 5, Cù Chính Lan, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(976, 'Aloha Cafe', ' ', 'Khương Trung, Hà Nội,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.001256000000000, 105.818592999999990, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Aloha Cafe Khương Trung, Hà Nội,thủ đô Hà Nội, Việt Nam       Quán cà phê', 0, 0),
(977, '176 Cafe', ' ', '176 Nguyen Ngoc Nai Street, Thanh Xuan District,Vietnam', '(04) 3853 6881', ' ', 20.996541000000000, 105.827072000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, '176 Cafe 176 Nguyen Ngoc Nai Street, Thanh Xuan District,Vietnam   (04) 3853 6881   Cafe & Bistro', 0, 0),
(978, 'Tố Nguyên Café', ' ', '27, Đường Mới Khương Trung, Q.Thanh Xuân,Việt Nam', '(04) 3563 5850', ' ', 20.999155999999996, 105.818328000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Tố Nguyên Café 27, Đường Mới Khương Trung, Q.Thanh Xuân,Việt Nam   (04) 3563 5850   Giải Trí , Café', 0, 0),
(979, 'Dntn Ngọc Sơn', ' ', '99, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam', '(04) 3858 3543', ' ', 21.001099000000000, 105.818059000000000, 'Mua Sắm , Vàng, Bạc, Đá Quí', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Dntn Ngọc Sơn 99, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam   (04) 3858 3543   Mua Sắm , Vàng, Bạc, Đá Quí', 0, 0),
(980, 'Cafe 7G', ' ', '304 Trường Chinh, Đống Đa,Việt Nam', '(04) 3563 3553', ' ', 21.001790000000000, 105.824678000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe 7G 304 Trường Chinh, Đống Đa,Việt Nam   (04) 3563 3553   Cafe & Bistro', 0, 0),
(981, 'Cà Phê Time', ' ', '58, Lê Trọng Tấn, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.999676000000000, 105.828102000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Time 58, Lê Trọng Tấn, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(982, 'Cà Phê Bi-A', ' ', '129L, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam', '(04) 3858 9659', ' ', 20.999946999999995, 105.816246000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Bi-A 129L, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam   (04) 3858 9659   Giải Trí , Café', 0, 0),
(983, 'One One Coffe', ' ', 'Khương Trung Mới, Khương Trung, Thanh Xuân,thủ đô Hà Nội, Việt Nam', '090621 0915', ' ', 20.998304000000000, 105.817523000000010, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'One One Coffe Khương Trung Mới, Khương Trung, Thanh Xuân,thủ đô Hà Nội, Việt Nam   090621 0915   Quán cà phê', 0, 0),
(984, 'Cafe', ' ', '122 Khương Đình, Thanh Xuân,Việt Nam', '(04) 3858 4459', ' ', 20.995521000000000, 105.814166000000010, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe 122 Khương Đình, Thanh Xuân,Việt Nam   (04) 3858 4459   Cafe & Bistro', 0, 0),
(985, 'Cà Phê Sơn', ' ', '129N, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam', '(04) 3858 4120', ' ', 20.999946999999995, 105.816246000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Sơn 129N, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam   (04) 3858 4120   Giải Trí , Café', 0, 0),
(986, 'Cà Phê 246', ' ', '146, Bùi Xương Trạch, Q.Thanh Xuân,Việt Nam', '(04) 3559 3061', ' ', 20.989909999999995, 105.817893000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê 246 146, Bùi Xương Trạch, Q.Thanh Xuân,Việt Nam   (04) 3559 3061   Giải Trí , Café', 0, 0),
(987, 'Cà Phê Thủy', ' ', '568, Trường Chinh, Q.Đống Đa,Việt Nam', ' ', ' ', 21.002680999999995, 105.821203000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Thủy 568, Trường Chinh, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(988, 'Cà Phê Aloha', ' ', '7, Khương Trung, Q.Thanh Xuân,Việt Nam', ' ', ' ', 21.001660000000000, 105.818778000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Aloha 7, Khương Trung, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(989, 'Cà Phê Sắc Màu', ' ', '75C, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam', ' ', ' ', 21.001815000000000, 105.819009000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cà Phê Sắc Màu 75C, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(990, 'Cafe Huân', ' ', '159, Đường Mới Khương Trung, Q.Thanh Xuân,Việt Nam', '091685 6556', ' ', 20.996271000000000, 105.815967000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe Huân 159, Đường Mới Khương Trung, Q.Thanh Xuân,Việt Nam   091685 6556   Giải Trí , Café', 0, 0),
(991, 'Quán Cà Phê Bụi', ' ', '1 Ngõ 326, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam', ' ', ' ', 21.002641000000000, 105.820216000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Bụi 1 Ngõ 326, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam       Giải Trí , Café', 0, 0),
(992, 'Cafe Sắc Màu', ' ', '75 Nguyễn Trãi, Quận Thanh Xuân,Việt Nam', '(04) 3853 1363', ' ', 21.002590999999995, 105.819175000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe Sắc Màu 75 Nguyễn Trãi, Quận Thanh Xuân,Việt Nam   (04) 3853 1363   Cafe & Bistro', 0, 0),
(993, 'Coffee Shop', ' ', '224 Bui Xuong Trach Street, Thanh Xuan Dístrict,Vietnam', '(04) 3855 4663', ' ', 20.991474000000000, 105.817276999999990, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Coffee Shop 224 Bui Xuong Trach Street, Thanh Xuan Dístrict,Vietnam   (04) 3855 4663   Cafe & Bistro', 0, 0),
(994, 'Điểm Hẹn Cà Phê', ' ', '129E, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam', '(04) 3557 7634', ' ', 20.999946999999995, 105.816246000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Điểm Hẹn Cà Phê 129E, Nguyễn Trãi, Q.Thanh Xuân,Việt Nam   (04) 3557 7634   Giải Trí , Café', 0, 0),
(995, 'Cafe 176', ' ', '176 Nguyễn Ngọc Nại, Thanh Xuân,Việt Nam', '(04) 3853 6881', ' ', 20.996424000000000, 105.827252000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:46', '2012-01-14 16:32:46', 1, NULL, 136, NULL, 1, 'Cafe 176 176 Nguyễn Ngọc Nại, Thanh Xuân,Việt Nam   (04) 3853 6881   Cafe & Bistro', 0, 0),
(996, 'Cà Phê Sinh Đôi Quán', ' ', '15A, Cự Lộc, Q.Thanh Xuân,Việt Nam', '(04) 3557 6539', ' ', 21.000157000000000, 105.814347000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cà Phê Sinh Đôi Quán 15A, Cự Lộc, Q.Thanh Xuân,Việt Nam   (04) 3557 6539   Giải Trí , Café', 0, 0),
(997, 'Cà Phê Win Win', ' ', '94, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3563 6629', ' ', 21.003302000000000, 105.819224000000000, 'Giải Trí , Café', 292, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cà Phê Win Win 94, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3563 6629   Giải Trí , Café', 0, 0),
(998, '7G Cafe', ' ', '304 Truong Chinh Street, Dong Da District,Vietnam', '(04) 3563 3553', ' ', 21.001989999999996, 105.824862000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, '7G Cafe 304 Truong Chinh Street, Dong Da District,Vietnam   (04) 3563 3553   Cafe & Bistro', 0, 0),
(999, 'Cafe Tẩm Quất Hoa Sữa', ' ', '64, Tôn Thất Tùng, Q.Đống Đa,Việt Nam', '(04) 6296 6073', ' ', 21.001880000000000, 105.829711000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe Tẩm Quất Hoa Sữa 64, Tôn Thất Tùng, Q.Đống Đa,Việt Nam   (04) 6296 6073   Giải Trí , Café', 0, 0),
(1000, 'Cà Phê Avenue', ' ', '93, Đường Láng, Q.Đống Đa,Việt Nam', ' ', ' ', 21.003723000000000, 105.818660000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cà Phê Avenue 93, Đường Láng, Q.Đống Đa,Việt Nam       Giải Trí , Café', 0, 0),
(1001, 'Ấn Tượng', ' ', '21 Khương Hạ, Thanh Xuân,Việt Nam', '(04) 3559 5458', ' ', 20.992595000000000, 105.814991000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Ấn Tượng 21 Khương Hạ, Thanh Xuân,Việt Nam   (04) 3559 5458   Cafe & Bistro', 0, 0),
(1002, 'Cafe Nhạc T & T', ' ', '7, Vũ Trọng Phụng, Q.Thanh Xuân,Việt Nam', '(04) 3557 7956', ' ', 20.996652000000000, 105.810469000000000, 'Giải Trí , Café', 293, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe Nhạc T & T 7, Vũ Trọng Phụng, Q.Thanh Xuân,Việt Nam   (04) 3557 7956   Giải Trí , Café', 0, 0),
(1003, 'Cà Phê Sữa Tươi - Nước Giải Khát', ' ', '162, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 6291 1952', ' ', 21.004007999999995, 105.818430000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cà Phê Sữa Tươi - Nước Giải Khát 162, Đường Láng, Q.Đống Đa,Việt Nam   (04) 6291 1952   Giải Trí , Café', 0, 0),
(1004, 'Cửa Hàng Tân Toàn', ' ', '7, Cự Lộc, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.999946999999995, 105.814433000000000, 'Thực Phẩm , Trà, Cafe', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cửa Hàng Tân Toàn 7, Cự Lộc, Q.Thanh Xuân,Việt Nam       Thực Phẩm , Trà, Cafe', 0, 0),
(1005, 'Cafe Mon', ' ', 'Số 113, ngõ 1A Tôn Thất Tùng, Quận Đống Đa,Việt Nam', '(04) 2219 8909', ' ', 21.004625000000000, 105.830553000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe Mon Số 113, ngõ 1A Tôn Thất Tùng, Quận Đống Đa,Việt Nam   (04) 2219 8909   Cafe & Bistro', 0, 0),
(1006, 'Cafe 1238', ' ', '1238 Lang Street, Dong Da District,Vietnam', '(04) 3766 2650', ' ', 21.004625000000000, 105.817535000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe 1238 1238 Lang Street, Dong Da District,Vietnam   (04) 3766 2650   Cafe & Bistro', 0, 0),
(1007, 'Cafe 162 Láng', ' ', '162 Đường Láng, Đống Đa,Việt Nam', '(04) 3629 1952', ' ', 21.004632000000000, 105.817529000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe 162 Láng 162 Đường Láng, Đống Đa,Việt Nam   (04) 3629 1952   Cafe & Bistro', 0, 0),
(1008, 'Cafe - Bi A', ' ', '129L Nguyễn Trãi, Thanh Xuân,Việt Nam', '(04) 3858 9659', ' ', 21.000558999999996, 105.816612000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe - Bi A 129L Nguyễn Trãi, Thanh Xuân,Việt Nam   (04) 3858 9659   Cafe & Bistro', 0, 0),
(1009, 'An Tuong Coffee Shop', ' ', '21 Khuong Ha Street, Thanh Xuan District,Vietnam', '(04) 3559 5458', ' ', 20.992735000000000, 105.814905000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'An Tuong Coffee Shop 21 Khuong Ha Street, Thanh Xuan District,Vietnam   (04) 3559 5458   Cafe & Bistro', 0, 0),
(1010, 'Cafe Long', ' ', 'CT8 Trần Điền, Định Công, Hoàng mai,Hà Nội, Việt Nam', '(04) 6285 2005', ' ', 20.990704000000000, 105.830859000000000, '', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe Long CT8 Trần Điền, Định Công, Hoàng mai,Hà Nội, Việt Nam   (04) 6285 2005   ', 0, 0),
(1011, 'Cafe 1238', ' ', '1238 Đường Láng, Đống Đa,Việt Nam', '(04) 3766 2650', ' ', 21.004725000000000, 105.817598000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe 1238 1238 Đường Láng, Đống Đa,Việt Nam   (04) 3766 2650   Cafe & Bistro', 0, 0),
(1012, 'Cafe K''RO', ' ', 'Đường Thuỵ Khuê, Ngọc Hà, Quận Ba Đình, Tay Ho district,Hanoi, Vietnam', '(04) 3728 1226', ' ', 21.043471000000000, 105.823464000000000, '', 294, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Cafe K''RO Đường Thuỵ Khuê, Ngọc Hà, Quận Ba Đình, Tay Ho district,Hanoi, Vietnam   (04) 3728 1226   ', 0, 0),
(1013, 'Igc Coffee Shop', ' ', '128, Thụy Khuê, Q.Tây Hồ,Việt Nam', '(04) 6295 1940', ' ', 21.041989000000000, 105.825859000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:47', '2012-01-14 16:32:47', 1, NULL, 136, NULL, 1, 'Igc Coffee Shop 128, Thụy Khuê, Q.Tây Hồ,Việt Nam   (04) 6295 1940   Giải Trí , Café', 0, 0),
(1014, 'ZEN coffee', ' ', 'Ngọc Hà, Quan Ba Dinh, quận Tây Hồ,Hà Nội, Vietnam', '(04) 293 6343', ' ', 21.043825999999996, 105.821693000000000, 'Quán cà phê', 295, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'ZEN coffee Ngọc Hà, Quan Ba Dinh, quận Tây Hồ,Hà Nội, Vietnam   (04) 293 6343   Quán cà phê', 0, 0),
(1015, 'Sunshine Cafe', ' ', '130 Ven hồ Tây - Thuỵ Khuê, Tây Hồ,thủ đô Hà Nội, Vietnam', ' ', ' ', 21.043075999999996, 105.824175000000010, '', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Sunshine Cafe 130 Ven hồ Tây - Thuỵ Khuê, Tây Hồ,thủ đô Hà Nội, Vietnam       ', 0, 0),
(1016, 'Sunshine Cafe', ' ', '130 Ven hồ Tây - Thuỵ Khuê, Tây Hồ,Hanoi, Vietnam', ' ', ' ', 21.043075999999996, 105.824175000000010, 'Quán cà phê', 296, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Sunshine Cafe 130 Ven hồ Tây - Thuỵ Khuê, Tây Hồ,Hanoi, Vietnam       Quán cà phê', 0, 0),
(1017, 'Quán Cà Phê Hưng Bình', ' ', '142, Hoàng Hoa Thám, Q.Tây Hồ,Việt Nam', '(04) 3843 6758', ' ', 21.042054000000000, 105.820388000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Hưng Bình 142, Hoàng Hoa Thám, Q.Tây Hồ,Việt Nam   (04) 3843 6758   Giải Trí , Café', 0, 0),
(1018, 'Cafe K''RO', ' ', 'Thụy  Khuê, Ngọc Hà, Hà Nội,thủ đô Hà Nội, Việt Nam', '(04) 3728 1226', ' ', 21.043471000000000, 105.823464000000000, 'Quán cà phê', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Cafe K''RO Thụy  Khuê, Ngọc Hà, Hà Nội,thủ đô Hà Nội, Việt Nam   (04) 3728 1226   Quán cà phê', 0, 0),
(1019, 'Cà Phê Anh', ' ', '219, Hoàng Hoa Thám, Q.Ba Đình,Việt Nam', '(04) 3843 5487', ' ', 21.042119000000000, 105.819883000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Cà Phê Anh 219, Hoàng Hoa Thám, Q.Ba Đình,Việt Nam   (04) 3843 5487   Giải Trí , Café', 0, 0),
(1020, 'Cafe', ' ', '89 Đốc Ngữ, Ba Đình,Việt Nam', '098933 1050', ' ', 21.042947999999996, 105.814631000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Cafe 89 Đốc Ngữ, Ba Đình,Việt Nam   098933 1050   Cafe & Bistro', 0, 0),
(1021, 'Quán Big Bang', ' ', '36, Văn Cao, Q.Ba Đình,Việt Nam', ' ', ' ', 21.039065000000000, 105.815710000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Big Bang 36, Văn Cao, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(1022, 'Quán Cà Phê Kua', ' ', '232, Hoàng Hoa Thám, Q.Tây Hồ,Việt Nam', '098320 0314', ' ', 21.042249999999996, 105.818092000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cà Phê Kua 232, Hoàng Hoa Thám, Q.Tây Hồ,Việt Nam   098320 0314   Giải Trí , Café', 0, 0),
(1023, 'Cà Phê Thùy Linh', ' ', '264, Thụy Khuê, Q.Tây Hồ,Việt Nam', '(04) 3728 0349', ' ', 21.043782000000000, 105.816219000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Cà Phê Thùy Linh 264, Thụy Khuê, Q.Tây Hồ,Việt Nam   (04) 3728 0349   Giải Trí , Café', 0, 0),
(1024, 'Cafe 108', ' ', '108A Ngoc Ha Street, Ba Dinh District,Vietnam', '(04) 3901 6216', ' ', 21.039325999999996, 105.828896000000000, 'Cafe & Bistro', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Cafe 108 108A Ngoc Ha Street, Ba Dinh District,Vietnam   (04) 3901 6216   Cafe & Bistro', 0, 0),
(1025, 'Quán Cafe A Chỉ', ' ', '195A, Đội Cấn, Q.Ba Đình,Việt Nam', '(04) 3723 6997', ' ', 21.035000000000000, 105.824851000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe A Chỉ 195A, Đội Cấn, Q.Ba Đình,Việt Nam   (04) 3723 6997   Giải Trí , Café', 0, 0),
(1026, 'Quán Cafe - Trà - Sinh Tố', ' ', '195, Đội Cấn, Q.Ba Đình,Việt Nam', '(04) 3722 4829', ' ', 21.035000000000000, 105.824851000000010, 'Giải Trí , Trà Quán', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe - Trà - Sinh Tố 195, Đội Cấn, Q.Ba Đình,Việt Nam   (04) 3722 4829   Giải Trí , Trà Quán', 0, 0),
(1027, 'Quán Cafe Posaley', ' ', '222, Đội Cấn, Q.Ba Đình,Việt Nam', ' ', ' ', 21.035360000000000, 105.819958000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe Posaley 222, Đội Cấn, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(1028, 'Quán Cafe Hương Phố', ' ', '81, Văn Cao, Q.Ba Đình,Việt Nam', '(04) 3761 8050', ' ', 21.040227000000000, 105.816289000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe Hương Phố 81, Văn Cao, Q.Ba Đình,Việt Nam   (04) 3761 8050   Giải Trí , Café', 0, 0),
(1029, 'Câu Lạc Bộ Bida 8X', ' ', '8/127, Văn Cao, Q.Ba Đình,Việt Nam', '(04) 2213 1397', ' ', 21.037683000000000, 105.815537999999990, 'Giải Trí , Bida', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Câu Lạc Bộ Bida 8X 8/127, Văn Cao, Q.Ba Đình,Việt Nam   (04) 2213 1397   Giải Trí , Bida', 0, 0),
(1030, 'Quán Cafe Trung Nguyên', ' ', '16C, Văn Cao, Q.Ba Đình,Việt Nam', ' ', ' ', 21.041739000000000, 105.816515000000010, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe Trung Nguyên 16C, Văn Cao, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(1031, 'Quán Cafe Giải Khát', ' ', '10, Văn Cao, Q.Ba Đình,Việt Nam', ' ', ' ', 21.041868999999995, 105.816525000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe Giải Khát 10, Văn Cao, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(1032, 'Quán Cafe Hoa', ' ', '28, Văn Cao, Q.Ba Đình,Việt Nam', '(04) 3761 4345', ' ', 21.041148000000000, 105.816343000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe Hoa 28, Văn Cao, Q.Ba Đình,Việt Nam   (04) 3761 4345   Giải Trí , Café', 0, 0),
(1033, 'Quán Cafe Bống', ' ', '83-85, Văn Cao, Q.Ba Đình,Việt Nam', '(04) 6291 8434', ' ', 21.040196999999996, 105.816278000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe Bống 83-85, Văn Cao, Q.Ba Đình,Việt Nam   (04) 6291 8434   Giải Trí , Café', 0, 0),
(1034, 'Cà Phê Hồng', ' ', '76, Thụy Khuê, Q.Tây Hồ,Việt Nam', '(04) 6266 2296', ' ', 21.041729000000000, 105.829840000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Cà Phê Hồng 76, Thụy Khuê, Q.Tây Hồ,Việt Nam   (04) 6266 2296   Giải Trí , Café', 0, 0),
(1035, 'Manh Cafe (Cafe Mạnh)', ' ', '12 Van Cao Street (12 Văn Cao),Việt Nam', '(031) 384 2142', ' ', 21.037904000000000, 105.815570000000000, 'Giải trí , Bar & Câu lạc bộ', 297, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Manh Cafe (Cafe Mạnh) 12 Van Cao Street (12 Văn Cao),Việt Nam   (031) 384 2142   Giải trí , Bar & Câu lạc bộ', 0, 0),
(1036, 'Quán Cafe 153', ' ', '153, Đội Cấn, Q.Ba Đình,Việt Nam', ' ', ' ', 21.034839999999996, 105.826524000000000, 'Giải Trí , Café', NULL, 1, NULL, '2012-01-14 16:32:48', '2012-01-14 16:32:48', 1, NULL, 136, NULL, 1, 'Quán Cafe 153 153, Đội Cấn, Q.Ba Đình,Việt Nam       Giải Trí , Café', 0, 0),
(1037, 'Karaoke I Sing', ' ', '158 Le Duan Street, Dong Da District,Việt Nam', '(04) 2224 5888', ' ', 21.015062000000000, 105.841407000000000, 'Giải trí , Karaoke', 298, 1, NULL, '2012-01-16 13:14:30', '2012-01-16 13:14:30', 1, NULL, 137, NULL, 1, 'Karaoke I Sing 158 Le Duan Street, Dong Da District,Việt Nam   (04) 2224 5888   Giải trí , Karaoke', 0, 0),
(1038, 'Nhà Hàng Karaoke 404', ' ', '404, Xã Đàn, Q.Đống Đa,Việt Nam', '(04) 2348 9999', ' ', 21.015366000000000, 105.833278000000000, 'Giải Trí , Karaoke', 299, 1, NULL, '2012-01-16 13:14:30', '2012-01-16 13:14:30', 1, NULL, 137, NULL, 1, 'Nhà Hàng Karaoke 404 404, Xã Đàn, Q.Đống Đa,Việt Nam   (04) 2348 9999   Giải Trí , Karaoke', 0, 0),
(1039, 'Nhà Hàng Nhật Hồng', ' ', '281 Tôn Đức Thắng, Q.Đống Đa,Việt Nam', '(04) 3851 7767', ' ', 21.019798999999995, 105.830614000000000, 'Nhà hàng', 300, 1, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36', 1, NULL, 137, NULL, 1, 'Nhà Hàng Nhật Hồng 281 Tôn Đức Thắng, Q.Đống Đa,Việt Nam   (04) 3851 7767   Nhà hàng', 0, 0),
(1040, 'Karaoke Grammy', ' ', '333 De La Thanh Street, Dong Da District,Việt Nam', '(04) 3514 6348', ' ', 21.015051000000000, 105.834303000000000, 'Giải trí , Karaoke', 301, 1, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36', 1, NULL, 137, NULL, 1, 'Karaoke Grammy 333 De La Thanh Street, Dong Da District,Việt Nam   (04) 3514 6348   Giải trí , Karaoke', 0, 0),
(1041, 'Karaoke Quán Tôm', ' ', '89, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam', '(04) 3944 7844', ' ', 21.011334999999995, 105.850041999999990, 'Giải Trí , Karaoke', 302, 1, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36', 1, NULL, 137, NULL, 1, 'Karaoke Quán Tôm 89, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam   (04) 3944 7844   Giải Trí , Karaoke', 0, 0),
(1042, 'Karaoke Giai Điệu', ' ', '179, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam', '(04) 3978 4387', ' ', 21.012626999999995, 105.849944999999990, 'Giải Trí , Karaoke', 303, 1, NULL, '2012-01-16 13:14:36', '2012-01-16 13:14:36', 1, NULL, 137, NULL, 1, 'Karaoke Giai Điệu 179, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam   (04) 3978 4387   Giải Trí , Karaoke', 0, 0),
(1043, 'Dn Tư Nhân Minh Hạnh', ' ', '55, Khâm Thiên, Q.Đống Đa,Việt Nam', '(04) 3851 6146', ' ', 21.018977000000000, 105.838734000000000, 'Giải Trí , Karaoke', 304, 1, NULL, '2012-01-16 13:14:42', '2012-01-16 13:14:42', 1, NULL, 137, NULL, 1, 'Dn Tư Nhân Minh Hạnh 55, Khâm Thiên, Q.Đống Đa,Việt Nam   (04) 3851 6146   Giải Trí , Karaoke', 0, 0),
(1044, 'Nice Karaoke (Quán Karaoke Nice)', ' ', '26 Nguyen Dinh Chieu Street, Hai Ba Trung District (26 Nguyễn Đình Chiểu, Quận Hai Bà Trưng),Việt Nam', '(04) 3822 9172', ' ', 21.013287999999996, 105.846426000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:14:42', '2012-01-16 13:14:42', 1, NULL, 137, NULL, 1, 'Nice Karaoke (Quán Karaoke Nice) 26 Nguyen Dinh Chieu Street, Hai Ba Trung District (26 Nguyễn Đình Chiểu, Quận Hai Bà Trưng),Việt Nam   (04) 3822 9172   Giải trí , Karaoke', 0, 0),
(1045, 'Karaoke Victory', ' ', '123, Đê La Thành, Q.Đống Đa,Việt Nam', ' ', ' ', 21.015521000000000, 105.833691000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:14:42', '2012-01-16 13:14:42', 1, NULL, 137, NULL, 1, 'Karaoke Victory 123, Đê La Thành, Q.Đống Đa,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1046, 'Minh Hanh Karaoke (Quán Karaoke Minh Hạnh)', ' ', '55 Kham Thien Street, Dong Da District (55 Khâm Thiên, Quận Đống Đa),Việt Nam', '(04) 3851 6146', ' ', 21.018827000000000, 105.840764000000000, 'Giải trí , Karaoke', 305, 1, NULL, '2012-01-16 13:14:47', '2012-01-16 13:14:47', 1, NULL, 137, NULL, 1, 'Minh Hanh Karaoke (Quán Karaoke Minh Hạnh) 55 Kham Thien Street, Dong Da District (55 Khâm Thiên, Quận Đống Đa),Việt Nam   (04) 3851 6146   Giải trí , Karaoke', 0, 0),
(1047, 'Dntn Dũng Lan', ' ', '39, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam', '(04) 3826 3053', ' ', 21.010819000000000, 105.849978000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:14:47', '2012-01-16 13:14:47', 1, NULL, 137, NULL, 1, 'Dntn Dũng Lan 39, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam   (04) 3826 3053   Giải Trí , Karaoke', 0, 0),
(1048, 'Karaoke Ngọc Trang', ' ', '135, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 8711', ' ', 21.011465000000000, 105.851158000000000, 'Giải Trí , Karaoke', 306, 1, NULL, '2012-01-16 13:14:57', '2012-01-16 13:14:57', 1, NULL, 137, NULL, 1, 'Karaoke Ngọc Trang 135, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam   (04) 3821 8711   Giải Trí , Karaoke', 0, 0),
(1049, 'Karaoke Hà Nội Star', ' ', '83, Đặng Văn Ngữ, Q.Đống Đa,Việt Nam', ' ', ' ', 21.010453999999996, 105.831245000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:14:57', '2012-01-16 13:14:57', 1, NULL, 137, NULL, 1, 'Karaoke Hà Nội Star 83, Đặng Văn Ngữ, Q.Đống Đa,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1050, 'Tra My Karaoke', ' ', '153 Phuong Mai Street, Dong Da District,Vietnam', '(04) 6295 7825', ' ', 21.003056000000000, 105.834601999999990, '', NULL, 1, NULL, '2012-01-16 13:14:57', '2012-01-16 13:14:57', 1, NULL, 137, NULL, 1, 'Tra My Karaoke 153 Phuong Mai Street, Dong Da District,Vietnam   (04) 6295 7825   ', 0, 0),
(1051, 'Karaoke Phương Dung', ' ', '83 TUỆ TĨNH, Q.HAI BÀ TRƯNG,Việt Nam', '(04) 3974 1394', ' ', 21.015277999999995, 105.847468999999990, 'Giải Trí , Karaoke', 307, 1, NULL, '2012-01-16 13:15:07', '2012-01-16 13:15:07', 1, NULL, 137, NULL, 1, 'Karaoke Phương Dung 83 TUỆ TĨNH, Q.HAI BÀ TRƯNG,Việt Nam   (04) 3974 1394   Giải Trí , Karaoke', 0, 0),
(1052, 'Bar - Karaoke Hoa Sữa', ' ', '29, Nguyễn Thuợng Hiền, Q.Hai Bà Trưng,Việt Nam', '(04) 3822 8755', ' ', 21.018840999999995, 105.841670000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:15:07', '2012-01-16 13:15:07', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Hoa Sữa 29, Nguyễn Thuợng Hiền, Q.Hai Bà Trưng,Việt Nam   (04) 3822 8755   Giải Trí , Bar', 0, 0),
(1053, 'Tra My Karaoke', ' ', '153 Phuong Mai Street, Dong Da District,Việt Nam', '(04) 6295 7825', ' ', 21.003056000000000, 105.834601999999990, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:07', '2012-01-16 13:15:07', 1, NULL, 137, NULL, 1, 'Tra My Karaoke 153 Phuong Mai Street, Dong Da District,Việt Nam   (04) 6295 7825   Giải trí , Karaoke', 0, 0),
(1054, 'Nice Karaoke', ' ', '26 Nguyen Dinh Chieu Street, Hai Ba Trung District,Vietnam', '(04) 3822 9172', ' ', 21.016051999999995, 105.847671000000000, '', 308, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, 'Nice Karaoke 26 Nguyen Dinh Chieu Street, Hai Ba Trung District,Vietnam   (04) 3822 9172   ', 0, 0),
(1055, 'Karaoke Chợt Nhớ', ' ', '292, Bà Triệu, Q.Hai Bà Trưng,Việt Nam', '(04) 3566 6108', ' ', 21.012186000000000, 105.849333999999980, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, 'Karaoke Chợt Nhớ 292, Bà Triệu, Q.Hai Bà Trưng,Việt Nam   (04) 3566 6108   Giải Trí , Karaoke', 0, 0),
(1056, 'Karaoke 09', ' ', '10/17 Ton That Tung Street, Dong Da District,Vietnam', '(04) 3574 6491', ' ', 21.004715000000000, 105.831084000000000, '', NULL, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, 'Karaoke 09 10/17 Ton That Tung Street, Dong Da District,Vietnam   (04) 3574 6491   ', 0, 0),
(1057, 'Karaoke Bmv', ' ', '51, Hồ Đắc Di, Q.Đống Đa,Việt Nam', '(04) 3857 1347', ' ', 21.012006000000000, 105.829968000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, 'Karaoke Bmv 51, Hồ Đắc Di, Q.Đống Đa,Việt Nam   (04) 3857 1347   Giải Trí , Karaoke', 0, 0),
(1058, 'BMW 2 Karaoke', ' ', '103 Phuong Mai Street, Dong Da District,Vietnam', '(04) 6292 4109', ' ', 21.003056000000000, 105.834601999999990, '', NULL, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, 'BMW 2 Karaoke 103 Phuong Mai Street, Dong Da District,Vietnam   (04) 6292 4109   ', 0, 0),
(1059, 'Karaoke 09', ' ', '10/17 Ton That Tung Street, Dong Da District,Việt Nam', '(04) 3574 6491', ' ', 21.004715000000000, 105.831084000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, 'Karaoke 09 10/17 Ton That Tung Street, Dong Da District,Việt Nam   (04) 3574 6491   Giải trí , Karaoke', 0, 0),
(1060, 'Karaoke Đức Huy', ' ', '22, Nguyễn Thượng Hiền, Q.Hai Bà Trưng,Việt Nam', '(04) 3822 9111', ' ', 21.018826000000000, 105.842698000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, 'Karaoke Đức Huy 22, Nguyễn Thượng Hiền, Q.Hai Bà Trưng,Việt Nam   (04) 3822 9111   Giải Trí , Karaoke', 0, 0),
(1061, 'Karaoke Window', ' ', '14, Nguyễn Đình Chiểu, Q.Hai Bà Trưng,Việt Nam', '(04) 3976 0077', ' ', 21.014669999999995, 105.847269000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, 'Karaoke Window 14, Nguyễn Đình Chiểu, Q.Hai Bà Trưng,Việt Nam   (04) 3976 0077   Giải Trí , Karaoke', 0, 0),
(1062, '-Khách Sạn Phương Nam\\\\-Văn Phòng', ' ', '1 Chùa Bộc,Hà Nội, Việt Nam', '(04) 3574 2221', ' ', 21.006347000000000, 105.831095000000000, '', NULL, 1, NULL, '2012-01-16 13:15:13', '2012-01-16 13:15:13', 1, NULL, 137, NULL, 1, '-Khách Sạn Phương Nam\\\\-Văn Phòng 1 Chùa Bộc,Hà Nội, Việt Nam   (04) 3574 2221   ', 0, 0),
(1063, 'Karaoke Sunny Royal', ' ', 'Xã Đàn, Đống Đa,Hà Nội, Vietnam', '091210 0000', ' ', 21.012765000000000, 105.835441000000000, 'Giải trí , Karaoke', 309, 1, NULL, '2012-01-16 13:15:14', '2012-01-16 13:15:14', 1, NULL, 137, NULL, 1, 'Karaoke Sunny Royal Xã Đàn, Đống Đa,Hà Nội, Vietnam   091210 0000   Giải trí , Karaoke', 0, 0),
(1064, 'Thien Bao Karaoke', ' ', '11 Chua BOC Street, Quang Trung Ward, Dong Da District,Vietnam', '(04) 3852 2146', ' ', 21.007124000000000, 105.829700000000000, '', NULL, 1, NULL, '2012-01-16 13:15:14', '2012-01-16 13:15:14', 1, NULL, 137, NULL, 1, 'Thien Bao Karaoke 11 Chua BOC Street, Quang Trung Ward, Dong Da District,Vietnam   (04) 3852 2146   ', 0, 0),
(1065, 'KARAOKE BMW 2', ' ', '103 Phương Mai, Q.Đống Đa,Việt Nam', '(04) 6292 4109', ' ', 21.003056000000000, 105.834601999999990, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:14', '2012-01-16 13:15:14', 1, NULL, 137, NULL, 1, 'KARAOKE BMW 2 103 Phương Mai, Q.Đống Đa,Việt Nam   (04) 6292 4109   Giải trí , Karaoke', 0, 0),
(1066, 'Karaoke Obama', ' ', '371 De La Thanh Street, Dong Da District,Vietnam', '(04) 3994 2453', ' ', 21.018587000000000, 105.830382000000010, '', NULL, 1, NULL, '2012-01-16 13:15:14', '2012-01-16 13:15:14', 1, NULL, 137, NULL, 1, 'Karaoke Obama 371 De La Thanh Street, Dong Da District,Vietnam   (04) 3994 2453   ', 0, 0),
(1067, 'Karaoke 123', ' ', '178 Trieu Viet Vuong Street, Hai Ba Trung District,Việt Nam', '(04) 3978 3638', ' ', 21.012086000000000, 105.850654000000000, 'Giải trí , Karaoke', 310, 1, NULL, '2012-01-16 13:15:22', '2012-01-16 13:15:22', 1, NULL, 137, NULL, 1, 'Karaoke 123 178 Trieu Viet Vuong Street, Hai Ba Trung District,Việt Nam   (04) 3978 3638   Giải trí , Karaoke', 0, 0),
(1068, 'Melody Karaoke (Quán Karaoke Giai Điệu)', ' ', '179 Bui Thi Xuan Street, Hai Ba Trung District (179 Bùi Thị Xuân, Quận Hai Bà Trưng),Việt Nam', '(04) 3978 4387', ' ', 21.012046000000000, 105.850031000000000, 'Giải trí , Karaoke', 311, 1, NULL, '2012-01-16 13:15:37', '2012-01-16 13:15:37', 1, NULL, 137, NULL, 1, 'Melody Karaoke (Quán Karaoke Giai Điệu) 179 Bui Thi Xuan Street, Hai Ba Trung District (179 Bùi Thị Xuân, Quận Hai Bà Trưng),Việt Nam   (04) 3978 4387   Giải trí , Karaoke', 0, 0),
(1069, 'Karaoke BMW', ' ', '51 Ho Dac Di Street, Dong Da District,Việt Nam', '(04) 3576 4063', ' ', 21.013358000000000, 105.827160000000000, 'Giải trí , Karaoke', 312, 1, NULL, '2012-01-16 13:15:40', '2012-01-16 13:15:40', 1, NULL, 137, NULL, 1, 'Karaoke BMW 51 Ho Dac Di Street, Dong Da District,Việt Nam   (04) 3576 4063   Giải trí , Karaoke', 0, 0),
(1070, 'Karaoke Mimosa', ' ', '83, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.015170999999995, 105.848046000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:40', '2012-01-16 13:15:40', 1, NULL, 137, NULL, 1, 'Karaoke Mimosa 83, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1071, 'Thien Ha Karaoke', ' ', '114 Mai Hac De Street, Hai Ba Trung District,Vietnam', '(04) 3974 2283', ' ', 21.009302000000000, 105.850868000000000, '', NULL, 1, NULL, '2012-01-16 13:15:40', '2012-01-16 13:15:40', 1, NULL, 137, NULL, 1, 'Thien Ha Karaoke 114 Mai Hac De Street, Hai Ba Trung District,Vietnam   (04) 3974 2283   ', 0, 0),
(1072, 'Thien Ha Karaoke', ' ', '114 Mai Hac De Street, Hai Ba Trung District,Việt Nam', '(04) 3974 2283', ' ', 21.010089000000000, 105.850535000000010, 'Giải trí , Karaoke', 313, 1, NULL, '2012-01-16 13:15:40', '2012-01-16 13:15:40', 1, NULL, 137, NULL, 1, 'Thien Ha Karaoke 114 Mai Hac De Street, Hai Ba Trung District,Việt Nam   (04) 3974 2283   Giải trí , Karaoke', 0, 0),
(1073, 'Karaoke Obama', ' ', '371 De La Thanh Street, Dong Da District,Việt Nam', '(04) 3994 2453', ' ', 21.018587000000000, 105.830382000000010, 'Giải trí , Karaoke', 314, 1, NULL, '2012-01-16 13:15:41', '2012-01-16 13:15:41', 1, NULL, 137, NULL, 1, 'Karaoke Obama 371 De La Thanh Street, Dong Da District,Việt Nam   (04) 3994 2453   Giải trí , Karaoke', 0, 0),
(1074, 'Coco Banana Karaoke (Quán Karaoke Coco Banana)', ' ', '64 Mai Hac De Street, Hai Ba Trung District (64 Mai Hắc Đế, Quận Hai Bà Trưng),Việt Nam', '(04) 2243 5555', ' ', 21.009322000000000, 105.850825000000000, 'Giải trí , Karaoke', 315, 1, NULL, '2012-01-16 13:15:44', '2012-01-16 13:15:44', 1, NULL, 137, NULL, 1, 'Coco Banana Karaoke (Quán Karaoke Coco Banana) 64 Mai Hac De Street, Hai Ba Trung District (64 Mai Hắc Đế, Quận Hai Bà Trưng),Việt Nam   (04) 2243 5555   Giải trí , Karaoke', 0, 0),
(1075, 'Karaoke Gia Đình', ' ', '39, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam', '(04) 3943 9746', ' ', 21.011085000000000, 105.850041999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:44', '2012-01-16 13:15:44', 1, NULL, 137, NULL, 1, 'Karaoke Gia Đình 39, Bùi Thị Xuân, Q.Hai Bà Trưng,Việt Nam   (04) 3943 9746   Giải Trí , Karaoke', 0, 0),
(1076, 'Karaoke Phương Anh', ' ', '28, Hương Viên, Q.Hai Bà Trưng,Việt Nam', '(04) 3978 1705', ' ', 21.012767000000000, 105.856619000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:44', '2012-01-16 13:15:44', 1, NULL, 137, NULL, 1, 'Karaoke Phương Anh 28, Hương Viên, Q.Hai Bà Trưng,Việt Nam   (04) 3978 1705   Giải Trí , Karaoke', 0, 0),
(1077, 'Bar - Karaoke', ' ', '29A, Phù Đổng Thiên Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 6297 3755', ' ', 21.015540999999995, 105.853947000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:15:44', '2012-01-16 13:15:44', 1, NULL, 137, NULL, 1, 'Bar - Karaoke 29A, Phù Đổng Thiên Vương, Q.Hai Bà Trưng,Việt Nam   (04) 6297 3755   Giải Trí , Bar', 0, 0),
(1078, 'Karaoke Mr.Bean', ' ', '276, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam', '(04) 3972 7277', ' ', 21.009302000000000, 105.859339000000000, 'Giải Trí , Karaoke', 316, 1, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45', 1, NULL, 137, NULL, 1, 'Karaoke Mr.Bean 276, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam   (04) 3972 7277   Giải Trí , Karaoke', 0, 0),
(1079, 'Karaoke Phù Đổng', ' ', '2A, Phù Đổng Thiên Vương, Q.Hai Bà Trưng,Việt Nam', '(04) 3822 5850', ' ', 21.016843000000000, 105.853797000000000, 'Giải Trí , Karaoke', 317, 1, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45', 1, NULL, 137, NULL, 1, 'Karaoke Phù Đổng 2A, Phù Đổng Thiên Vương, Q.Hai Bà Trưng,Việt Nam   (04) 3822 5850   Giải Trí , Karaoke', 0, 0),
(1080, 'Karaoke VOL II', ' ', '306 Tran Khat Chan Street, Hai Ba Trung District,Việt Nam', '(04) 6297 3755', ' ', 21.008340000000000, 105.851941000000000, 'Giải trí , Karaoke', 318, 1, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45', 1, NULL, 137, NULL, 1, 'Karaoke VOL II 306 Tran Khat Chan Street, Hai Ba Trung District,Việt Nam   (04) 6297 3755   Giải trí , Karaoke', 0, 0),
(1081, 'Coco Banana Karaoke', ' ', '64 Mai Hac De Street, Hai Ba Trung District,Vietnam', '(04) 2243 5555', ' ', 21.009322000000000, 105.850825000000000, '', NULL, 1, NULL, '2012-01-16 13:15:45', '2012-01-16 13:15:45', 1, NULL, 137, NULL, 1, 'Coco Banana Karaoke 64 Mai Hac De Street, Hai Ba Trung District,Vietnam   (04) 2243 5555   ', 0, 0),
(1082, 'Karaoke Ngọc Hà', ' ', '28, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam', '(04) 3972 3849', ' ', 21.017043999999995, 105.857585000000000, 'Giải Trí , Karaoke', 319, 1, NULL, '2012-01-16 13:15:50', '2012-01-16 13:15:50', 1, NULL, 137, NULL, 1, 'Karaoke Ngọc Hà 28, Hàng Chuối, Q.Hai Bà Trưng,Việt Nam   (04) 3972 3849   Giải Trí , Karaoke', 0, 0),
(1083, 'Karaoke Idol', ' ', '4, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam', '(04) 3943 9512', ' ', 21.016673000000000, 105.851072000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:50', '2012-01-16 13:15:50', 1, NULL, 137, NULL, 1, 'Karaoke Idol 4, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam   (04) 3943 9512   Giải Trí , Karaoke', 0, 0),
(1084, 'Karaoke Tuấn Anh', ' ', '12, Lò Đúc, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 1102', ' ', 21.011215000000000, 105.859720000000000, 'Giải Trí , Karaoke', 320, 1, NULL, '2012-01-16 13:15:56', '2012-01-16 13:15:56', 1, NULL, 137, NULL, 1, 'Karaoke Tuấn Anh 12, Lò Đúc, Q.Hai Bà Trưng,Việt Nam   (04) 3821 1102   Giải Trí , Karaoke', 0, 0),
(1085, 'KARAOKE THIÊN HÀ', ' ', '114 MAI HẮC ĐẾ, Q.HAI BÀ TRƯNG,Việt Nam', '(04) 3974 2283', ' ', 21.012706999999995, 105.851126000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:56', '2012-01-16 13:15:56', 1, NULL, 137, NULL, 1, 'KARAOKE THIÊN HÀ 114 MAI HẮC ĐẾ, Q.HAI BÀ TRƯNG,Việt Nam   (04) 3974 2283   Giải trí , Karaoke', 0, 0),
(1086, 'Diamond Studio', ' ', '93, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam', '(04) 3978 4764', ' ', 21.013313000000000, 105.851287000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:56', '2012-01-16 13:15:56', 1, NULL, 137, NULL, 1, 'Diamond Studio 93, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam   (04) 3978 4764   Giải Trí , Karaoke', 0, 0),
(1087, 'Karaoke Hoa Cau', ' ', '17, Đại Cồ Việt, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.008571000000000, 105.850943000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:56', '2012-01-16 13:15:56', 1, NULL, 137, NULL, 1, 'Karaoke Hoa Cau 17, Đại Cồ Việt, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1088, 'Karaoke Màn Bạc 2', ' ', '258, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 6266', ' ', 21.009242000000000, 105.860680000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:56', '2012-01-16 13:15:56', 1, NULL, 137, NULL, 1, 'Karaoke Màn Bạc 2 258, Trần Khát Chân, Q.Hai Bà Trưng,Việt Nam   (04) 3971 6266   Giải Trí , Karaoke', 0, 0),
(1089, 'Karaoke Hồng Thủy', ' ', '19, Lê Đại Hành, Q.Hai Bà Trưng,Việt Nam', '(04) 3976 0779', ' ', 21.009813000000000, 105.850117000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:15:56', '2012-01-16 13:15:56', 1, NULL, 137, NULL, 1, 'Karaoke Hồng Thủy 19, Lê Đại Hành, Q.Hai Bà Trưng,Việt Nam   (04) 3976 0779   Giải Trí , Karaoke', 0, 0),
(1090, 'Bar Karaoke Thanh Tâm', ' ', '4, Trần Thánh Tông, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 1881', ' ', 21.015391000000000, 105.859816000000000, 'Giải Trí , Bar', 321, 1, NULL, '2012-01-16 13:16:06', '2012-01-16 13:16:06', 1, NULL, 137, NULL, 1, 'Bar Karaoke Thanh Tâm 4, Trần Thánh Tông, Q.Hai Bà Trưng,Việt Nam   (04) 3821 1881   Giải Trí , Bar', 0, 0);
INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(1091, 'Karaoke Beatles', ' ', '142, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.013919000000000, 105.850680000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:06', '2012-01-16 13:16:06', 1, NULL, 137, NULL, 1, 'Karaoke Beatles 142, Triệu Việt Vương, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1092, 'Karaoke Bình Minh', ' ', '27, Lò Đúc, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 2805', ' ', 21.017294000000000, 105.855836000000000, 'Giải Trí , Karaoke', 322, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Karaoke Bình Minh 27, Lò Đúc, Q.Hai Bà Trưng,Việt Nam   (04) 3971 2805   Giải Trí , Karaoke', 0, 0),
(1093, 'Nhà Hàng Karaoke Trẻ', ' ', '103, Lê Văn Hưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3971 0690', ' ', 21.018014999999995, 105.854795000000010, 'Giải Trí , Café', 323, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Nhà Hàng Karaoke Trẻ 103, Lê Văn Hưu, Q.Hai Bà Trưng,Việt Nam   (04) 3971 0690   Giải Trí , Café', 0, 0),
(1094, 'KARAOKE ANH EM', ' ', '35C Cảm Hội, Q. Hoàn Kiếm,Việt Nam', '(04) 3971 6329', ' ', 21.010769000000000, 105.860154000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'KARAOKE ANH EM 35C Cảm Hội, Q. Hoàn Kiếm,Việt Nam   (04) 3971 6329   Giải trí , Karaoke', 0, 0),
(1095, 'Karaoke Zone', ' ', '16B, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.015091000000000, 105.851179000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Karaoke Zone 16B, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1096, 'Ricoh Karaoke', ' ', '45, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam', '(04) 3822 5833', ' ', 21.015091000000000, 105.851179000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Ricoh Karaoke 45, Mai Hắc Đế, Q.Hai Bà Trưng,Việt Nam   (04) 3822 5833   Giải Trí , Karaoke', 0, 0),
(1097, 'Bar Karaoke True Lies', ' ', '19, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam', '(04) 3978 1194', ' ', 21.015101000000000, 105.850965000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Bar Karaoke True Lies 19, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam   (04) 3978 1194   Giải Trí , Karaoke', 0, 0),
(1098, 'Dntn Lê Long', ' ', '19, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam', '(04) 3976 2148', ' ', 21.015101000000000, 105.850965000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Dntn Lê Long 19, Tuệ Tĩnh, Q.Hai Bà Trưng,Việt Nam   (04) 3976 2148   Giải Trí , Karaoke', 0, 0),
(1099, 'Anh Em Karaoke', ' ', '35C Cam Hoi Street, Hoan Kiem District,Vietnam', '(04) 3971 6329', ' ', 21.011551000000000, 105.860835000000010, '', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Anh Em Karaoke 35C Cam Hoi Street, Hoan Kiem District,Vietnam   (04) 3971 6329   ', 0, 0),
(1100, 'Autumn Karaoke', ' ', '22 Le Van Huu Street, Hai Ba Trung District,Vietnam', '(04) 3943 3563', ' ', 21.018145000000000, 105.854377000000000, '', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Autumn Karaoke 22 Le Van Huu Street, Hai Ba Trung District,Vietnam   (04) 3943 3563   ', 0, 0),
(1101, 'Autumn Karaoke (Quán Karaoke Mùa Thu)', ' ', '22 Le Van Huu Street, Hai Ba Trung District (22 Lê Văn Hưu, Quận Hai Bà Trưng),Việt Nam', '(04) 3943 3563', ' ', 21.017935000000000, 105.854859000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Autumn Karaoke (Quán Karaoke Mùa Thu) 22 Le Van Huu Street, Hai Ba Trung District (22 Lê Văn Hưu, Quận Hai Bà Trưng),Việt Nam   (04) 3943 3563   Giải trí , Karaoke', 0, 0),
(1102, 'Nhà Hàng Karaoke Nhất Thống', ' ', '14 Thi Sách, Q.Hai Bà Trưng,Việt Nam', '(04) 3943 8741', ' ', 21.017958000000000, 105.854143000000010, 'Nhà hàng', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Nhà Hàng Karaoke Nhất Thống 14 Thi Sách, Q.Hai Bà Trưng,Việt Nam   (04) 3943 8741   Nhà hàng', 0, 0),
(1103, 'Ngoc Linh Karaoke', ' ', '60 Thai Ha Street, Dong Da District,Vietnam', '(04) 3537 5273', ' ', 21.010023000000000, 105.823531000000000, '', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Ngoc Linh Karaoke 60 Thai Ha Street, Dong Da District,Vietnam   (04) 3537 5273   ', 0, 0),
(1104, 'Ngoc Linh Karaoke', ' ', '60 Thai Ha Street, Dong Da District,Việt Nam', '(04) 3537 5273', ' ', 21.010023000000000, 105.823531000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:17', '2012-01-16 13:16:17', 1, NULL, 137, NULL, 1, 'Ngoc Linh Karaoke 60 Thai Ha Street, Dong Da District,Việt Nam   (04) 3537 5273   Giải trí , Karaoke', 0, 0),
(1105, 'Karaoke 123', ' ', '184, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3857 1333', ' ', 21.013313000000000, 105.819991000000000, 'Giải Trí , Karaoke', 324, 1, NULL, '2012-01-16 13:16:22', '2012-01-16 13:16:22', 1, NULL, 137, NULL, 1, 'Karaoke 123 184, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3857 1333   Giải Trí , Karaoke', 0, 0),
(1106, 'Karaoke Hoàng Gia', ' ', '2A Ngõ 98, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3537 2970', ' ', 21.011786000000000, 105.821654000000000, 'Giải Trí , Karaoke', 325, 1, NULL, '2012-01-16 13:16:23', '2012-01-16 13:16:23', 1, NULL, 137, NULL, 1, 'Karaoke Hoàng Gia 2A Ngõ 98, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3537 2970   Giải Trí , Karaoke', 0, 0),
(1107, 'Bar - Karaoke Thanh Long', ' ', '56, Trung Liệt, Q.Đống Đa,Việt Nam', ' ', ' ', 21.011986000000000, 105.821289000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:16:23', '2012-01-16 13:16:23', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Thanh Long 56, Trung Liệt, Q.Đống Đa,Việt Nam       Giải Trí , Bar', 0, 0),
(1108, 'Karaoke Hilton Club', ' ', '161, Đặng Tiến Đông, Q.Đống Đa,Việt Nam', ' ', ' ', 21.013268000000000, 105.822603000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:23', '2012-01-16 13:16:23', 1, NULL, 137, NULL, 1, 'Karaoke Hilton Club 161, Đặng Tiến Đông, Q.Đống Đa,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1109, 'Karaoke 178', ' ', 'Đống Đa,Ha Tay, Việt Nam', ' ', ' ', 21.013929000000000, 105.820698000000000, 'Adult Business', NULL, 1, NULL, '2012-01-16 13:16:23', '2012-01-16 13:16:23', 1, NULL, 137, NULL, 1, 'Karaoke 178 Đống Đa,Ha Tay, Việt Nam       Adult Business', 0, 0),
(1110, 'Vinakaraoke', ' ', 'p1e2 Thái Thịnh, Trung Liệt, Đống Đa,Hanoi, Vietnam', '091556 5599', ' ', 21.010974000000000, 105.818102000000000, 'Karroke Supply Store', 326, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Vinakaraoke p1e2 Thái Thịnh, Trung Liệt, Đống Đa,Hanoi, Vietnam   091556 5599   Karroke Supply Store', 0, 0),
(1111, 'Karaoke Sao Mai', ' ', '158, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3537 1894', ' ', 21.012747000000000, 105.820715000000000, 'Giải Trí , Karaoke', 327, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Karaoke Sao Mai 158, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3537 1894   Giải Trí , Karaoke', 0, 0),
(1112, 'Trung Tâm VOD- Karaoke', ' ', 'C4 – P8 Cục Đo Đạc Bản Đồ, Thái Thịnh, Đống Đa,Việt Nam', '(04) 2240 3939', ' ', 21.010724000000000, 105.818553000000000, '', 328, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Trung Tâm VOD- Karaoke C4 – P8 Cục Đo Đạc Bản Đồ, Thái Thịnh, Đống Đa,Việt Nam   (04) 2240 3939   ', 0, 0),
(1113, 'Karaoke 178', ' ', 'Đống Đa,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.013929000000000, 105.820698000000000, 'Adult Business', NULL, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Karaoke 178 Đống Đa,thủ đô Hà Nội, Việt Nam       Adult Business', 0, 0),
(1114, 'Bar - Karaoke Mưa Hồng', ' ', '135, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3857 0325', ' ', 21.013297999999995, 105.819744000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Mưa Hồng 135, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3857 0325   Giải Trí , Bar', 0, 0),
(1115, 'Bar - Karaoke Hương Cau', ' ', '143, Thái Hà, Q.Đống Đa,Việt Nam', ' ', ' ', 21.013718999999995, 105.819159000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Hương Cau 143, Thái Hà, Q.Đống Đa,Việt Nam       Giải Trí , Bar', 0, 0),
(1116, 'Bar - Karaoke Kim Ngân', ' ', '137, Thái Hà, Q.Đống Đa,Việt Nam', '(04) 3537 1380', ' ', 21.013729000000000, 105.819148000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Kim Ngân 137, Thái Hà, Q.Đống Đa,Việt Nam   (04) 3537 1380   Giải Trí , Bar', 0, 0),
(1117, 'Karaoke Hoa Thông', ' ', '119, Thái Thịnh, Q.Đống Đa,Việt Nam', ' ', ' ', 21.011745999999995, 105.817737999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Karaoke Hoa Thông 119, Thái Thịnh, Q.Đống Đa,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1118, 'Karaoke Chợt Nhớ 2', ' ', '81, Láng Hạ, Q.Đống Đa,Việt Nam', '(04) 3514 8493', ' ', 21.017945000000000, 105.816193000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'Karaoke Chợt Nhớ 2 81, Láng Hạ, Q.Đống Đa,Việt Nam   (04) 3514 8493   Giải Trí , Karaoke', 0, 0),
(1119, 'KARAOKE THIÊN BẢO', ' ', '11 CHÙA BỘC, P.QUANG TRUNG, Q. ĐỐNG ĐA,Việt Nam', '(04) 3852 2146', ' ', 21.007739000000000, 105.827863000000010, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:33', '2012-01-16 13:16:33', 1, NULL, 137, NULL, 1, 'KARAOKE THIÊN BẢO 11 CHÙA BỘC, P.QUANG TRUNG, Q. ĐỐNG ĐA,Việt Nam   (04) 3852 2146   Giải trí , Karaoke', 0, 0),
(1120, 'Karaoke Phương Lan', ' ', '558, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3776 0266', ' ', 21.007379000000000, 105.815977999999990, 'Giải Trí , Karaoke', 329, 1, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39', 1, NULL, 137, NULL, 1, 'Karaoke Phương Lan 558, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3776 0266   Giải Trí , Karaoke', 0, 0),
(1121, 'Karaoke Thúy Trang', ' ', '658, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3835 3404', ' ', 21.006537999999995, 105.816429000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39', 1, NULL, 137, NULL, 1, 'Karaoke Thúy Trang 658, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3835 3404   Giải Trí , Karaoke', 0, 0),
(1122, 'Dong Phong Karaoke', ' ', '544 Duong Lang street, Dong Da District,Vietnam', '(04) 3776 0018', ' ', 21.006658000000000, 105.816472000000000, '', NULL, 1, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39', 1, NULL, 137, NULL, 1, 'Dong Phong Karaoke 544 Duong Lang street, Dong Da District,Vietnam   (04) 3776 0018   ', 0, 0),
(1123, 'Karaoke Huy Anh', ' ', '175A, Trường Chinh, Q.Thanh Xuân,Việt Nam', '(04) 3565 9067', ' ', 21.000959000000000, 105.828295000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39', 1, NULL, 137, NULL, 1, 'Karaoke Huy Anh 175A, Trường Chinh, Q.Thanh Xuân,Việt Nam   (04) 3565 9067   Giải Trí , Karaoke', 0, 0),
(1124, 'Karaoke Hương Giang', ' ', '79 Thai Thinh Street, Dong Da District,Vietnam', '(04) 3853 9179', ' ', 21.014125000000000, 105.814674000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39', 1, NULL, 137, NULL, 1, 'Karaoke Hương Giang 79 Thai Thinh Street, Dong Da District,Vietnam   (04) 3853 9179   Giải Trí , Karaoke', 0, 0),
(1125, 'Karaoke Phương Nhung', ' ', '254, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3562 2834', ' ', 21.006117000000000, 105.816772000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39', 1, NULL, 137, NULL, 1, 'Karaoke Phương Nhung 254, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3562 2834   Giải Trí , Karaoke', 0, 0),
(1126, 'Nhat Hang Karaoke', ' ', '271 Truong Chinh Street, Thanh Xuan District,Vietnam', '(04) 3566 5271', ' ', 21.001788999999995, 105.824678000000000, '', NULL, 1, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39', 1, NULL, 137, NULL, 1, 'Nhat Hang Karaoke 271 Truong Chinh Street, Thanh Xuan District,Vietnam   (04) 3566 5271   ', 0, 0),
(1127, 'Karaoke 1. 2. 3 Restaurant', ' ', '182-184 Thai Ha Street,  Dong Da District,Việt Nam', '(04) 3857 1333', ' ', 21.016020999999995, 105.815889000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:39', '2012-01-16 13:16:39', 1, NULL, 137, NULL, 1, 'Karaoke 1. 2. 3 Restaurant 182-184 Thai Ha Street,  Dong Da District,Việt Nam   (04) 3857 1333   Giải trí , Karaoke', 0, 0),
(1128, 'Karaoke Anh & Em', ' ', '175, Trường Chinh, Q.Thanh Xuân,Việt Nam', '(04) 3563 8092', ' ', 21.000959000000000, 105.828295000000000, 'Giải Trí , Karaoke', 330, 1, NULL, '2012-01-16 13:16:48', '2012-01-16 13:16:48', 1, NULL, 137, NULL, 1, 'Karaoke Anh & Em 175, Trường Chinh, Q.Thanh Xuân,Việt Nam   (04) 3563 8092   Giải Trí , Karaoke', 0, 0),
(1129, 'Nhat Hang Karaoke', ' ', '271 Truong Chinh Street, Thanh Xuan District,Việt Nam', '(04) 3566 5271', ' ', 21.001788999999995, 105.824678000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:48', '2012-01-16 13:16:48', 1, NULL, 137, NULL, 1, 'Nhat Hang Karaoke 271 Truong Chinh Street, Thanh Xuan District,Việt Nam   (04) 3566 5271   Giải trí , Karaoke', 0, 0),
(1130, 'Karaoke Thùy Linh', ' ', '87, Láng Hạ, Q.Đống Đa,Việt Nam', '(04) 3514 7696', ' ', 21.016653000000000, 105.815281000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:48', '2012-01-16 13:16:48', 1, NULL, 137, NULL, 1, 'Karaoke Thùy Linh 87, Láng Hạ, Q.Đống Đa,Việt Nam   (04) 3514 7696   Giải Trí , Karaoke', 0, 0),
(1131, 'Karaoke Kiev Pectopah', ' ', '406, Trường Chinh, Q.Đống Đa,Việt Nam', '(04) 3853 3016', ' ', 21.001909999999995, 105.824524000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:48', '2012-01-16 13:16:48', 1, NULL, 137, NULL, 1, 'Karaoke Kiev Pectopah 406, Trường Chinh, Q.Đống Đa,Việt Nam   (04) 3853 3016   Giải Trí , Karaoke', 0, 0),
(1132, 'Karaoke Lc', ' ', '81, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 2846', ' ', 21.007418999999995, 105.860975000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:48', '2012-01-16 13:16:48', 1, NULL, 137, NULL, 1, 'Karaoke Lc 81, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam   (04) 3821 2846   Giải Trí , Karaoke', 0, 0),
(1133, 'Karaoke Huyền Nga', ' ', '215, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3821 2640', ' ', 21.005175000000000, 105.861715000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:48', '2012-01-16 13:16:48', 1, NULL, 137, NULL, 1, 'Karaoke Huyền Nga 215, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam   (04) 3821 2640   Giải Trí , Karaoke', 0, 0),
(1134, 'Karaoke 83 Club', ' ', '181, Nguyễn Ngọc Vũ, Q.Cầu Giấy,Việt Nam', '(04) 3556 2468', ' ', 21.012581999999995, 105.807411000000000, 'Giải Trí , Karaoke', 331, 1, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50', 1, NULL, 137, NULL, 1, 'Karaoke 83 Club 181, Nguyễn Ngọc Vũ, Q.Cầu Giấy,Việt Nam   (04) 3556 2468   Giải Trí , Karaoke', 0, 0),
(1135, 'Karaoke-Bar Ngọc Ánh', ' ', '560, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3835 2179', ' ', 21.012195999999996, 105.809519000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50', 1, NULL, 137, NULL, 1, 'Karaoke-Bar Ngọc Ánh 560, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3835 2179   Giải Trí , Karaoke', 0, 0),
(1136, 'Karaoke', ' ', '22A, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', ' ', ' ', 21.014009000000000, 105.803404000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50', 1, NULL, 137, NULL, 1, 'Karaoke 22A, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1137, 'Karaoke Ban Mai', ' ', '32-B3, Vũ Ngọc Phan, Q.Đống Đa,Việt Nam', '(04) 3835 4527', ' ', 21.014209000000000, 105.810227000000000, 'Giải Trí , Karaoke', 332, 1, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50', 1, NULL, 137, NULL, 1, 'Karaoke Ban Mai 32-B3, Vũ Ngọc Phan, Q.Đống Đa,Việt Nam   (04) 3835 4527   Giải Trí , Karaoke', 0, 0),
(1138, 'Karaoke Phương Thảo', ' ', '562, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3835 5619', ' ', 21.012225999999995, 105.809487000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50', 1, NULL, 137, NULL, 1, 'Karaoke Phương Thảo 562, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3835 5619   Giải Trí , Karaoke', 0, 0),
(1139, 'Đông Phong Quán', ' ', '544, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3776 0018', ' ', 21.011956000000000, 105.809777000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:50', '2012-01-16 13:16:50', 1, NULL, 137, NULL, 1, 'Đông Phong Quán 544, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3776 0018   Giải trí , Karaoke', 0, 0),
(1140, 'karaoke lala', ' ', 'Đống Đa,Hà Nội, Vietnam', '0127382 6000', ' ', 21.022369000000000, 105.835661999999990, '', 333, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'karaoke lala Đống Đa,Hà Nội, Vietnam   0127382 6000   ', 0, 0),
(1141, 'Bar - Karaoke Nhật Minh', ' ', '120, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam', '(04) 3775 1629', ' ', 21.016141999999995, 105.805710000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Nhật Minh 120, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam   (04) 3775 1629   Giải Trí , Karaoke', 0, 0),
(1142, 'Karaoke Phương Anh', ' ', '634, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3776 1568', ' ', 21.014880000000000, 105.806043000000000, 'Giải Trí , Karaoke', 334, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Karaoke Phương Anh 634, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3776 1568   Giải Trí , Karaoke', 0, 0),
(1143, 'Karaoke Huyền Anh', ' ', '648, Đường Láng, Q.Đống Đa,Việt Nam', '(04) 3835 8050', ' ', 21.014990999999995, 105.805947000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Karaoke Huyền Anh 648, Đường Láng, Q.Đống Đa,Việt Nam   (04) 3835 8050   Giải Trí , Karaoke', 0, 0),
(1144, 'KARAOKE THĂNG LONG', ' ', '32/14B Vũ Ngọc Phan, Q.Đống Đa,Việt Nam', '(04) 3776 4456', ' ', 21.014478000000000, 105.810308999999990, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'KARAOKE THĂNG LONG 32/14B Vũ Ngọc Phan, Q.Đống Đa,Việt Nam   (04) 3776 4456   Giải trí , Karaoke', 0, 0),
(1145, 'Karaoke Hoa Đô', ' ', '23, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam', ' ', ' ', 21.013548000000000, 105.803232000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Karaoke Hoa Đô 23, Trần Duy Hưng, Q.Cầu Giấy,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1146, 'Bar - Karaoke', ' ', '32/14, Vũ Ngọc Phan, Q.Đống Đa,Việt Nam', '(04) 3776 4456', ' ', 21.014178999999995, 105.811054000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Bar - Karaoke 32/14, Vũ Ngọc Phan, Q.Đống Đa,Việt Nam   (04) 3776 4456   Giải Trí , Bar', 0, 0),
(1147, 'Thang Long Karaoke', ' ', '32/14B Vu Ngoc Phan Street, Dong Da District,Vietnam', '(04) 3776 4456', ' ', 21.013110000000000, 105.812678000000000, '', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Thang Long Karaoke 32/14B Vu Ngoc Phan Street, Dong Da District,Vietnam   (04) 3776 4456   ', 0, 0),
(1148, 'Cà Phê - Karaoke 140', ' ', '140, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam', '(04) 3835 8628', ' ', 21.015802000000000, 105.805314000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Cà Phê - Karaoke 140 140, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam   (04) 3835 8628   Giải Trí , Karaoke', 0, 0),
(1149, 'Karaoke Duy Anh', ' ', '129, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam', '(04) 3773 2633', ' ', 21.016022000000000, 105.805893000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Karaoke Duy Anh 129, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam   (04) 3773 2633   Giải Trí , Karaoke', 0, 0),
(1150, 'Karaoke Mỹ Linh', ' ', '98, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam', '(04) 3775 5707', ' ', 21.016573000000000, 105.806150000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Karaoke Mỹ Linh 98, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam   (04) 3775 5707   Giải Trí , Karaoke', 0, 0),
(1151, 'Karaoke Hà Vi', ' ', '46, Láng Hạ, Q.Đống Đa,Việt Nam', '(04) 3831 1396', ' ', 21.013377999999996, 105.812834000000000, 'Giải Trí , Karaoke', 335, 1, NULL, '2012-01-16 13:16:51', '2012-01-16 13:16:51', 1, NULL, 137, NULL, 1, 'Karaoke Hà Vi 46, Láng Hạ, Q.Đống Đa,Việt Nam   (04) 3831 1396   Giải Trí , Karaoke', 0, 0),
(1152, 'Karaoke Crown', ' ', '5/2/27 Huynh Thuc Khang Street, Dong Da District,Việt Nam', '(04) 3773 8289', ' ', 21.018360999999995, 105.810736999999990, 'Giải trí , Karaoke', 336, 1, NULL, '2012-01-16 13:16:54', '2012-01-16 13:16:54', 1, NULL, 137, NULL, 1, 'Karaoke Crown 5/2/27 Huynh Thuc Khang Street, Dong Da District,Việt Nam   (04) 3773 8289   Giải trí , Karaoke', 0, 0),
(1153, 'Karaoke Kim Anh', ' ', '512, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam', '(04) 3773 2552', ' ', 21.018646000000000, 105.807883000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:54', '2012-01-16 13:16:54', 1, NULL, 137, NULL, 1, 'Karaoke Kim Anh 512, Nguyễn Chí Thanh, Q.Đống Đa,Việt Nam   (04) 3773 2552   Giải Trí , Karaoke', 0, 0),
(1154, 'Karaoke Mặt Trời Đêm', ' ', '58, Pháo Đài Láng, Q.Đống Đa,Việt Nam', '(04) 3835 5833', ' ', 21.019166999999996, 105.805314000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:54', '2012-01-16 13:16:54', 1, NULL, 137, NULL, 1, 'Karaoke Mặt Trời Đêm 58, Pháo Đài Láng, Q.Đống Đa,Việt Nam   (04) 3835 5833   Giải Trí , Karaoke', 0, 0),
(1155, 'Hoa Do Karaoke', ' ', '23 Tran Duy Hung Street, Cau Giay District,Vietnam', '(04) 6266 0859', ' ', 21.007359000000000, 105.794735000000000, '', NULL, 1, NULL, '2012-01-16 13:16:55', '2012-01-16 13:16:55', 1, NULL, 137, NULL, 1, 'Hoa Do Karaoke 23 Tran Duy Hung Street, Cau Giay District,Vietnam   (04) 6266 0859   ', 0, 0),
(1156, 'Karaoke Phố', ' ', '27A, Quốc Tử Giám, Q.Đống Đa,Việt Nam', '(04) 3732 4087', ' ', 21.026498000000000, 105.837268999999990, 'Giải Trí , Karaoke', 337, 1, NULL, '2012-01-16 13:16:55', '2012-01-16 13:16:55', 1, NULL, 137, NULL, 1, 'Karaoke Phố 27A, Quốc Tử Giám, Q.Đống Đa,Việt Nam   (04) 3732 4087   Giải Trí , Karaoke', 0, 0),
(1157, 'Cà Phê Karaoke Anh Dũng', ' ', '28, NGÔ TẤT TỐ, Q.ĐỐNG ĐA,Việt Nam', '(04) 3829 5382', ' ', 21.027495999999996, 105.837476000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:55', '2012-01-16 13:16:55', 1, NULL, 137, NULL, 1, 'Cà Phê Karaoke Anh Dũng 28, NGÔ TẤT TỐ, Q.ĐỐNG ĐA,Việt Nam   (04) 3829 5382   Giải Trí , Karaoke', 0, 0),
(1158, 'Karaoke Thủy Tiên', ' ', '7, Quốc Tử Giám, Q.Đống Đa,Việt Nam', ' ', ' ', 21.026022000000000, 105.838192000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:16:55', '2012-01-16 13:16:55', 1, NULL, 137, NULL, 1, 'Karaoke Thủy Tiên 7, Quốc Tử Giám, Q.Đống Đa,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1159, 'Karaoke Clb A', ' ', '91, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 4518', ' ', 21.025797000000000, 105.842097000000000, 'Giải Trí , Karaoke', 338, 1, NULL, '2012-01-16 13:16:58', '2012-01-16 13:16:58', 1, NULL, 137, NULL, 1, 'Karaoke Clb A 91, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam   (04) 3942 4518   Giải Trí , Karaoke', 0, 0),
(1160, 'Karaoke Phương Nam', ' ', '38  Nam Ngư, Q.Hoàn Kiếm,Việt Nam', '(04) 3822 1501', ' ', 21.026554999999995, 105.843623000000010, 'Giải Trí , Karaoke', 339, 1, NULL, '2012-01-16 13:17:24', '2012-01-16 13:17:24', 1, NULL, 137, NULL, 1, 'Karaoke Phương Nam 38  Nam Ngư, Q.Hoàn Kiếm,Việt Nam   (04) 3822 1501   Giải Trí , Karaoke', 0, 0),
(1161, 'KARAOKE A RÔ', ' ', '91 Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 4518', ' ', 21.025931000000000, 105.841790000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:24', '2012-01-16 13:17:24', 1, NULL, 137, NULL, 1, 'KARAOKE A RÔ 91 Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam   (04) 3942 4518   Giải trí , Karaoke', 0, 0),
(1162, 'Club Bar Karaoke Sơn Long', ' ', '5, Tôn Thất Thiệp, Q.Ba Đình,Việt Nam', '(04) 3823 2459', ' ', 21.029772000000000, 105.842982000000000, 'Giải Trí , Karaoke', 340, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Club Bar Karaoke Sơn Long 5, Tôn Thất Thiệp, Q.Ba Đình,Việt Nam   (04) 3823 2459   Giải Trí , Karaoke', 0, 0),
(1163, 'Thien Y Karaoke', ' ', '38 Nam Ngu Street, Hoan Kiem District,Vietnam', '(04) 3822 1501', ' ', 21.026814000000000, 105.842403000000000, '', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Thien Y Karaoke 38 Nam Ngu Street, Hoan Kiem District,Vietnam   (04) 3822 1501   ', 0, 0),
(1164, 'Karaoke H & D', ' ', '95 TRẦN HƯNG ĐẠO Q.HOÀN KIẾM,Việt Nam', '(04) 3942 3006', ' ', 21.023973999999995, 105.842215000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke H & D 95 TRẦN HƯNG ĐẠO Q.HOÀN KIẾM,Việt Nam   (04) 3942 3006   Giải Trí , Karaoke', 0, 0),
(1165, 'Karaoke Embassy', ' ', '12, Yết Kiêu, Q.Hoàn Kiếm,Việt Nam', '(04) 3942 4889', ' ', 21.022642000000000, 105.843723000000000, 'Giải Trí , Karaoke', 341, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Embassy 12, Yết Kiêu, Q.Hoàn Kiếm,Việt Nam   (04) 3942 4889   Giải Trí , Karaoke', 0, 0),
(1166, 'Quán Bar - Karaoke Eagle', ' ', '60, Thợ Nhuộm, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 4396', ' ', 21.025030000000000, 105.845975000000010, 'Giải Trí , Bar', 342, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Quán Bar - Karaoke Eagle 60, Thợ Nhuộm, Q.Hoàn Kiếm,Việt Nam   (04) 3824 4396   Giải Trí , Bar', 0, 0),
(1167, 'Karaoke Lx', ' ', '1, Tống Duy Tân, Q.Hoàn Kiếm,Việt Nam', '(04) 2211 1348', ' ', 21.030023000000000, 105.844656000000000, 'Giải Trí , Karaoke', 343, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Lx 1, Tống Duy Tân, Q.Hoàn Kiếm,Việt Nam   (04) 2211 1348   Giải Trí , Karaoke', 0, 0),
(1168, 'KARAOKE NAM NGƯ', ' ', '59 NAM NGƯ, Q.HOÀN KIẾM,Việt Nam', '(04) 3942 0009', ' ', 21.026554999999995, 105.843623000000010, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'KARAOKE NAM NGƯ 59 NAM NGƯ, Q.HOÀN KIẾM,Việt Nam   (04) 3942 0009   Giải trí , Karaoke', 0, 0),
(1169, 'A Ro Karaoke', ' ', '91 Ly Thuong Kiet Street, Hoan Kiem  District,Vietnam', '(04) 3942 4518', ' ', 21.025611999999995, 105.843841000000000, '', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'A Ro Karaoke 91 Ly Thuong Kiet Street, Hoan Kiem  District,Vietnam   (04) 3942 4518   ', 0, 0),
(1170, 'Karaoke M. Cristo', ' ', '2, Tôn Thất Thiệp, Q.Ba Đình,Việt Nam', '(04) 3823 7643', ' ', 21.030293000000000, 105.843089999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke M. Cristo 2, Tôn Thất Thiệp, Q.Ba Đình,Việt Nam   (04) 3823 7643   Giải Trí , Karaoke', 0, 0),
(1171, 'Bar Karaoke Hoài Nam', ' ', '87 Ton Duc Thang Street, Dong Da District,Vietnam', '(04) 3823 0492', ' ', 21.030332000000000, 105.835944000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Bar Karaoke Hoài Nam 87 Ton Duc Thang Street, Dong Da District,Vietnam   (04) 3823 0492   Giải Trí , Karaoke', 0, 0),
(1172, 'Karaoke Bôm Bốp', ' ', '91A Lý Nam Đế, Q.Hoàn Kiếm,Việt Nam', '(04) 3733 8666', ' ', 21.033356999999995, 105.844603000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Bôm Bốp 91A Lý Nam Đế, Q.Hoàn Kiếm,Việt Nam   (04) 3733 8666   Giải Trí , Karaoke', 0, 0),
(1173, 'Bar - Karaoke', ' ', '28, Yết Kiêu, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.021801000000000, 105.843422000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Bar - Karaoke 28, Yết Kiêu, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Bar', 0, 0),
(1174, 'KaraokeVenice', ' ', '42 Sơn Tây, Ba Dinh,Hanoi, Vietnam', '(04) 3734 9666', ' ', 21.032706000000000, 105.829078000000000, '', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'KaraokeVenice 42 Sơn Tây, Ba Dinh,Hanoi, Vietnam   (04) 3734 9666   ', 0, 0),
(1175, 'KaraokeVenice', ' ', '42 Sơn Tây, Ba Đình,thủ đô Hà Nội, Việt Nam', '(04) 3734 9666', ' ', 21.032706000000000, 105.829078000000000, '', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'KaraokeVenice 42 Sơn Tây, Ba Đình,thủ đô Hà Nội, Việt Nam   (04) 3734 9666   ', 0, 0),
(1176, 'Karaoke Lucky Luck', ' ', '54, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam', '(04) 3934 9554', ' ', 21.024709999999995, 105.845917000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Lucky Luck 54, Lý Thường Kiệt, Q.Hoàn Kiếm,Việt Nam   (04) 3934 9554   Giải Trí , Karaoke', 0, 0),
(1177, 'NHÀ HÀNG KARAOKE LIÊN TRÌ', ' ', '18 Liên Trì, Q. Hoàn Kiếm,Việt Nam', '(04) 3822 1899', ' ', 21.021618000000000, 105.846454000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'NHÀ HÀNG KARAOKE LIÊN TRÌ 18 Liên Trì, Q. Hoàn Kiếm,Việt Nam   (04) 3822 1899   Giải trí , Karaoke', 0, 0),
(1178, 'Karaoke Phú Hương', ' ', '18, Liên Trì, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.021280000000000, 105.846544000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Phú Hương 18, Liên Trì, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1179, 'Karaoke Trống Đồng', ' ', '29, Phủ Doãn, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.029322000000000, 105.847993000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Trống Đồng 29, Phủ Doãn, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1180, 'Karaoke Ngọc Anh', ' ', '35, Đường Thành, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.032997000000000, 105.846404999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Ngọc Anh 35, Đường Thành, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1181, 'Karaoke Thanh Tùng', ' ', '50, Giảng Võ, Q.Ba Đình,Việt Nam', '(04) 3733 6085', ' ', 21.029907999999995, 105.828004999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Thanh Tùng 50, Giảng Võ, Q.Ba Đình,Việt Nam   (04) 3733 6085   Giải Trí , Karaoke', 0, 0),
(1182, 'Karaoke Phương Phương', ' ', '56, Giảng Võ, Q.Ba Đình,Việt Nam', '(04) 3914 3356', ' ', 21.029907999999995, 105.828004999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Phương Phương 56, Giảng Võ, Q.Ba Đình,Việt Nam   (04) 3914 3356   Giải Trí , Karaoke', 0, 0),
(1183, 'Karaoke Hát Chọn Bài', ' ', '86, Hào Nam, Q.Đống Đa,Việt Nam', '(04) 3511 5543', ' ', 21.023883999999995, 105.827297000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Hát Chọn Bài 86, Hào Nam, Q.Đống Đa,Việt Nam   (04) 3511 5543   Giải Trí , Karaoke', 0, 0),
(1184, 'Karaoke Ocean', ' ', '1E, Trường Chinh, Q.Thanh Xuân,Việt Nam', '(04) 3628 4979', ' ', 20.997302999999995, 105.842854000000000, 'Giải Trí , Karaoke', 344, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Ocean 1E, Trường Chinh, Q.Thanh Xuân,Việt Nam   (04) 3628 4979   Giải Trí , Karaoke', 0, 0),
(1185, 'Karaoke Ngân Hà', ' ', '112, Phố Vọng, Q.Thanh Xuân,Việt Nam', ' ', ' ', 20.997132000000000, 105.842854000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:30', '2012-01-16 13:17:30', 1, NULL, 137, NULL, 1, 'Karaoke Ngân Hà 112, Phố Vọng, Q.Thanh Xuân,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1186, 'Karaoke Sóng Ngầm', ' ', '1B, Trường Chinh, Q.Thanh Xuân,Việt Nam', '(04) 3628 2855', ' ', 20.997302999999995, 105.842854000000000, 'Giải Trí , Karaoke', 345, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Sóng Ngầm 1B, Trường Chinh, Q.Thanh Xuân,Việt Nam   (04) 3628 2855   Giải Trí , Karaoke', 0, 0),
(1187, 'Karaoke Hương Quỳnh', ' ', '134, Phố Vọng, Q.Thanh Xuân,Việt Nam', '(04) 3869 2454', ' ', 20.996766999999995, 105.842982000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Hương Quỳnh 134, Phố Vọng, Q.Thanh Xuân,Việt Nam   (04) 3869 2454   Giải Trí , Karaoke', 0, 0),
(1188, 'Club Karaoke Màn Bạc', ' ', '124, Đại La, Q.Hai Bà Trưng,Việt Nam', '(04) 3869 8064', ' ', 20.996431000000000, 105.846115000000000, 'Giải Trí , Karaoke', 346, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Club Karaoke Màn Bạc 124, Đại La, Q.Hai Bà Trưng,Việt Nam   (04) 3869 8064   Giải Trí , Karaoke', 0, 0),
(1189, 'Dntn Long Trang', ' ', '124, Đại La, Q.Hai Bà Trưng,Việt Nam', '(04) 3628 1115', ' ', 20.996376000000000, 105.846325000000000, 'Giải Trí , Bida', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Dntn Long Trang 124, Đại La, Q.Hai Bà Trưng,Việt Nam   (04) 3628 1115   Giải Trí , Bida', 0, 0),
(1190, 'Karaoke Duy Hiếu', ' ', '147, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam', '090788 0009', ' ', 20.995940000000000, 105.845508999999990, 'Giải Trí , Karaoke', 347, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Duy Hiếu 147, Trần Đại Nghĩa, Q.Hai Bà Trưng,Việt Nam   090788 0009   Giải Trí , Karaoke', 0, 0),
(1191, 'Karaoke 76 Đại La', ' ', '76, Đại La, Q.Hai Bà Trưng,Việt Nam', '(04) 3863 4741', ' ', 20.996220999999995, 105.847360000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke 76 Đại La 76, Đại La, Q.Hai Bà Trưng,Việt Nam   (04) 3863 4741   Giải Trí , Karaoke', 0, 0),
(1192, 'Karaoke New Style', ' ', '22A Dai La Street, Hai Ba Trung District,Việt Nam', '(04) 2246 1547', ' ', 20.996041000000000, 105.849473999999990, 'Giải trí , Karaoke', 348, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke New Style 22A Dai La Street, Hai Ba Trung District,Việt Nam   (04) 2246 1547   Giải trí , Karaoke', 0, 0),
(1193, 'Sang Karaoke', ' ', '237 Bach Mai Street, Hai Ba Trung District,Vietnam', '(04) 3863 1164', ' ', 20.997229000000000, 105.849785000000000, '', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Sang Karaoke 237 Bach Mai Street, Hai Ba Trung District,Vietnam   (04) 3863 1164   ', 0, 0),
(1194, 'Karaoke Hoa Style', ' ', '22A, Đại La, Q.Hai Bà Trưng,Việt Nam', '(04) 3863 1893', ' ', 20.995870000000000, 105.849280000000000, 'Giải Trí , Karaoke', 349, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Hoa Style 22A, Đại La, Q.Hai Bà Trưng,Việt Nam   (04) 3863 1893   Giải Trí , Karaoke', 0, 0),
(1195, 'KARAOKE SANG', ' ', '237 Bạch Mai, Q.Hai Bà Trưng,Việt Nam', '(04) 3863 1164', ' ', 20.996421000000000, 105.850182000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'KARAOKE SANG 237 Bạch Mai, Q.Hai Bà Trưng,Việt Nam   (04) 3863 1164   Giải trí , Karaoke', 0, 0),
(1196, 'Karaoke Anh Quân', ' ', '73, Quán Thánh, Q.Ba Đình,Việt Nam', '(04) 3843 0038', ' ', 21.042890000000000, 105.837028000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Anh Quân 73, Quán Thánh, Q.Ba Đình,Việt Nam   (04) 3843 0038   Giải Trí , Karaoke', 0, 0),
(1197, 'KARAOKE VỌNG CÁC', ' ', '28  NGUYỄN BIỂU - P. 1 - Q. 5,Việt Nam', '(08) 3923 7088', ' ', 21.041059000000000, 105.840095000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'KARAOKE VỌNG CÁC 28  NGUYỄN BIỂU - P. 1 - Q. 5,Việt Nam   (08) 3923 7088   Giải trí , Karaoke', 0, 0),
(1198, 'Karaoke Boston Star', ' ', '158 QUÁN THÁNH Q.BA ĐÌNH,Việt Nam', '(04) 3716 3640', ' ', 21.042733999999996, 105.836655000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Boston Star 158 QUÁN THÁNH Q.BA ĐÌNH,Việt Nam   (04) 3716 3640   Giải Trí , Karaoke', 0, 0),
(1199, 'Karaoke Hải Âu', ' ', '158 QUÁN THÁNH Q.BA ĐÌNH,Việt Nam', '(04) 3716 3961', ' ', 21.042733999999996, 105.836655000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Hải Âu 158 QUÁN THÁNH Q.BA ĐÌNH,Việt Nam   (04) 3716 3961   Giải Trí , Karaoke', 0, 0),
(1200, 'Công Ty Tnhh Việt Quan Thanh', ' ', '77, Quán Thánh, Q.Ba Đình,Việt Nam', '(04) 3823 7022', ' ', 21.042649999999995, 105.841372999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Công Ty Tnhh Việt Quan Thanh 77, Quán Thánh, Q.Ba Đình,Việt Nam   (04) 3823 7022   Giải Trí , Karaoke', 0, 0),
(1201, 'Karaoke Minh Anh', ' ', '8, Nguyễn Biểu, Q.Ba Đình,Việt Nam', ' ', ' ', 21.042420000000000, 105.840316000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Minh Anh 8, Nguyễn Biểu, Q.Ba Đình,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1202, 'Nhà May Hiền', ' ', '113, Quán Thánh, Q.Ba Đình,Việt Nam', '(04) 3734 0552', ' ', 21.042819999999995, 105.837908000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Nhà May Hiền 113, Quán Thánh, Q.Ba Đình,Việt Nam   (04) 3734 0552   Giải Trí , Karaoke', 0, 0),
(1203, 'Karaoke Nốt Nhạc Xanh', ' ', '65 HÀNG BÚN, Q.BA ĐÌNH,Việt Nam', '(04) 3733 2601', ' ', 21.040637000000000, 105.842382000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Nốt Nhạc Xanh 65 HÀNG BÚN, Q.BA ĐÌNH,Việt Nam   (04) 3733 2601   Giải Trí , Karaoke', 0, 0),
(1204, 'Bar Karaoke Chúc Linh', ' ', '37, Quán Thánh, Q.Ba Đình,Việt Nam', '(04) 3733 9897', ' ', 21.042109000000000, 105.843927000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Bar Karaoke Chúc Linh 37, Quán Thánh, Q.Ba Đình,Việt Nam   (04) 3733 9897   Giải Trí , Karaoke', 0, 0),
(1205, 'Karaoke Dạ Hương', ' ', '75, Quán Thánh, Q.Ba Đình,Việt Nam', '(04) 3733 4686', ' ', 21.042629999999996, 105.841598000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Dạ Hương 75, Quán Thánh, Q.Ba Đình,Việt Nam   (04) 3733 4686   Giải Trí , Karaoke', 0, 0),
(1206, 'KARAOKE WINDOW', ' ', '100 CỬA BẮC, Q. BA ĐÌNH,Việt Nam', '(04) 3734 1447', ' ', 21.041909000000000, 105.842264000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'KARAOKE WINDOW 100 CỬA BẮC, Q. BA ĐÌNH,Việt Nam   (04) 3734 1447   Giải trí , Karaoke', 0, 0),
(1207, 'Karaoke Vạn Xuân', ' ', '34, Cửa Bắc, Q.Ba Đình,Việt Nam', '(04) 3829 0793', ' ', 21.044763000000000, 105.843347000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Vạn Xuân 34, Cửa Bắc, Q.Ba Đình,Việt Nam   (04) 3829 0793   Giải Trí , Karaoke', 0, 0),
(1208, 'Karaoke Vọng Hồ', ' ', '49, Hàng Bún, Q.Ba Đình,Việt Nam', '(04) 3716 2928', ' ', 21.041578999999995, 105.845123000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke Vọng Hồ 49, Hàng Bún, Q.Ba Đình,Việt Nam   (04) 3716 2928   Giải Trí , Karaoke', 0, 0),
(1209, 'Karaoke 132 Quán Thánh', ' ', '132, Quán Thánh, Q.Ba Đình,Việt Nam', '(04) 3716 2702', ' ', 21.042449999999995, 105.842586000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Karaoke 132 Quán Thánh 132, Quán Thánh, Q.Ba Đình,Việt Nam   (04) 3716 2702   Giải Trí , Karaoke', 0, 0),
(1210, 'Window Karaoke', ' ', '100 Cua Bac Streer, Ba Dinh District,Vietnam', '(04) 3734 1447', ' ', 21.043797999999995, 105.842532000000000, '', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Window Karaoke 100 Cua Bac Streer, Ba Dinh District,Vietnam   (04) 3734 1447   ', 0, 0),
(1211, 'Bằng Lăng Quán', ' ', '35, Phạm Hồng Thái, Q.Ba Đình,Việt Nam', '(04) 3829 4822', ' ', 21.043551000000000, 105.845364000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Bằng Lăng Quán 35, Phạm Hồng Thái, Q.Ba Đình,Việt Nam   (04) 3829 4822   Giải Trí , Karaoke', 0, 0),
(1212, 'Anh Son Karaoke', ' ', '19 Ngu Xa Street, Ba Dinh District,Vietnam', '(04) 3829 0024', ' ', 21.046154999999995, 105.842264000000000, '', NULL, 1, NULL, '2012-01-16 13:17:31', '2012-01-16 13:17:31', 1, NULL, 137, NULL, 1, 'Anh Son Karaoke 19 Ngu Xa Street, Ba Dinh District,Vietnam   (04) 3829 0024   ', 0, 0),
(1213, 'Anh Son Karaoke (Quán Karaoke Anh Sơn)', ' ', '19 Ngu Xa Street, Ba Dinh District (19 Ngũ Xá, Quận Ba Đình),Việt Nam', '(04) 3829 0024', ' ', 21.046154999999995, 105.842264000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Anh Son Karaoke (Quán Karaoke Anh Sơn) 19 Ngu Xa Street, Ba Dinh District (19 Ngũ Xá, Quận Ba Đình),Việt Nam   (04) 3829 0024   Giải trí , Karaoke', 0, 0),
(1214, 'Women Bar & Coffee', ' ', '19 Yên Ninh, Ba Đình,Hà Nội, Việt Nam', '(04) 6684 8538', ' ', 21.043533000000000, 105.844523000000010, 'Dịch vụ , Cơ sở tổ chức hội nghị', 350, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Women Bar & Coffee 19 Yên Ninh, Ba Đình,Hà Nội, Việt Nam   (04) 6684 8538   Dịch vụ , Cơ sở tổ chức hội nghị', 0, 0),
(1215, 'Quán Cà Phê Hoàng Yến', ' ', '26, Phan Huy Ích, Q.Ba Đình,Việt Nam', '(04) 3927 2123', ' ', 21.040787999999996, 105.845514000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Quán Cà Phê Hoàng Yến 26, Phan Huy Ích, Q.Ba Đình,Việt Nam   (04) 3927 2123   Giải Trí , Karaoke', 0, 0),
(1216, 'Quán Cafe - Karaoke 54', ' ', '54, Hòe Nhai, Q.Ba Đình,Việt Nam', '(04) 3747 1326', ' ', 21.040106999999995, 105.845622000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Quán Cafe - Karaoke 54 54, Hòe Nhai, Q.Ba Đình,Việt Nam   (04) 3747 1326   Giải Trí , Karaoke', 0, 0),
(1217, 'Karaoke Wizard', ' ', '30, Phạm Hồng Thái, Q.Ba Đình,Việt Nam', '(04) 6651 2939', ' ', 21.043741000000000, 105.844849000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Karaoke Wizard 30, Phạm Hồng Thái, Q.Ba Đình,Việt Nam   (04) 6651 2939   Giải Trí , Karaoke', 0, 0),
(1218, 'Karaoke Indochine', ' ', '34E, Hòe Nhai, Q.Ba Đình,Việt Nam', ' ', ' ', 21.040627000000000, 105.845976000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Karaoke Indochine 34E, Hòe Nhai, Q.Ba Đình,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1219, 'Karaoke Thảo Nguyên', ' ', '8, Yên Phụ, Q.Tây Hồ,Việt Nam', '(04) 3715 0294', ' ', 21.051020999999995, 105.839420000000000, 'Giải Trí , Karaoke', 351, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Karaoke Thảo Nguyên 8, Yên Phụ, Q.Tây Hồ,Việt Nam   (04) 3715 0294   Giải Trí , Karaoke', 0, 0),
(1220, 'Sunny Bar-Karaoke', ' ', '18, Lê Văn Linh, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.037452999999996, 105.845869000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Sunny Bar-Karaoke 18, Lê Văn Linh, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1221, 'Karaoke Hải Hoàng', ' ', '2, Châu Long, Q.Ba Đình,Việt Nam', '(04) 3829 4006', ' ', 21.046465000000000, 105.843015000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Karaoke Hải Hoàng 2, Châu Long, Q.Ba Đình,Việt Nam   (04) 3829 4006   Giải Trí , Karaoke', 0, 0),
(1222, 'KARAOKE THANH THỦY', ' ', '108 Ngọc Hà, Q.Ba Đình,Việt Nam', '(04) 3843 5579', ' ', 21.038865000000000, 105.828873999999980, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'KARAOKE THANH THỦY 108 Ngọc Hà, Q.Ba Đình,Việt Nam   (04) 3843 5579   Giải trí , Karaoke', 0, 0),
(1223, 'KARAOKE YẾN NHI', ' ', '19B ĐỘI CẤN, Q.BA ĐÌNH,Việt Nam', '(04) 3928 5839', ' ', 21.034618999999996, 105.830976999999990, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'KARAOKE YẾN NHI 19B ĐỘI CẤN, Q.BA ĐÌNH,Việt Nam   (04) 3928 5839   Giải trí , Karaoke', 0, 0),
(1224, 'Yen Karaoke', ' ', '72 An Khanh Street, Hoai Duc District,Việt Nam', '093607 7911', ' ', 21.034679000000000, 105.849495000000000, 'Giải trí , Karaoke', 352, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Yen Karaoke 72 An Khanh Street, Hoai Duc District,Việt Nam   093607 7911   Giải trí , Karaoke', 0, 0),
(1225, 'Yen NHI Karaoke', ' ', '19B Doi Can Street, Ba Dinh District,Vietnam', '(04) 3928 5839', ' ', 21.034784999999996, 105.829979000000010, '', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Yen NHI Karaoke 19B Doi Can Street, Ba Dinh District,Vietnam   (04) 3928 5839   ', 0, 0),
(1226, 'Bar - Karaoke Thi Tân', ' ', '22, Thanh Niên, Q.Tây Hồ,Việt Nam', ' ', ' ', 21.050310000000000, 105.839688999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Thi Tân 22, Thanh Niên, Q.Tây Hồ,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1227, 'Karaoke Đại Thế Giới', ' ', '288 Nghi Tàm, Q. Tây Hồ,Việt Nam', '(04) 6292 2288', ' ', 21.058834000000000, 105.834465999999990, 'Giải Trí , Karaoke', 353, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Karaoke Đại Thế Giới 288 Nghi Tàm, Q. Tây Hồ,Việt Nam   (04) 6292 2288   Giải Trí , Karaoke', 0, 0);
INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`, `type`, `meta`, `del_flag`, `rank`) VALUES
(1228, 'Bar - Karaoke Thanh Long', ' ', '136, Yên Phụ, Q.Tây Hồ,Việt Nam', ' ', ' ', 21.055657000000000, 105.835826000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Thanh Long 136, Yên Phụ, Q.Tây Hồ,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1229, 'Karaoke Hanoi New', ' ', '47, Nghi Tàm, Q.Tây Hồ,Việt Nam', '(04) 3829 0484', ' ', 21.052081999999995, 105.838895000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Karaoke Hanoi New 47, Nghi Tàm, Q.Tây Hồ,Việt Nam   (04) 3829 0484   Giải Trí , Karaoke', 0, 0),
(1230, 'New Great World Karaoke', ' ', '288 Nghi Tam Street, Cau Giay District,Vietnam', '098496 8888', ' ', 21.059111000000000, 105.834625000000000, '', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'New Great World Karaoke 288 Nghi Tam Street, Cau Giay District,Vietnam   098496 8888   ', 0, 0),
(1231, 'Big World Karaoke', ' ', '288 Nghi Tam Street, Tay Ho District,Vietnam', '(04) 6292 2288', ' ', 21.059190999999995, 105.834582000000000, '', NULL, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Big World Karaoke 288 Nghi Tam Street, Tay Ho District,Vietnam   (04) 6292 2288   ', 0, 0),
(1232, 'Tan Dai The Gioi Karaoke (Quán Karaoke Tân Đại Thế Giới)', ' ', '288 Nghi Tam Street, Cau Giay District (288 Nghi Tàm, Quận Cầu Giấy),Việt Nam', '098496 8888', ' ', 21.059111000000000, 105.834625000000000, 'Giải trí , Karaoke', 354, 1, NULL, '2012-01-16 13:17:32', '2012-01-16 13:17:32', 1, NULL, 137, NULL, 1, 'Tan Dai The Gioi Karaoke (Quán Karaoke Tân Đại Thế Giới) 288 Nghi Tam Street, Cau Giay District (288 Nghi Tàm, Quận Cầu Giấy),Việt Nam   098496 8888   Giải trí , Karaoke', 0, 0),
(1233, 'Big World Karaoke', ' ', '288 Nghi Tam Street, Tay Ho District,Việt Nam', '(04) 6292 2288', ' ', 21.059190999999995, 105.834582000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Big World Karaoke 288 Nghi Tam Street, Tay Ho District,Việt Nam   (04) 6292 2288   Giải trí , Karaoke', 0, 0),
(1234, 'Karaoke Melody', ' ', '13, Xuân Diệu, Q.Tây Hồ,Việt Nam', '(04) 3719 4464', ' ', 21.061309000000000, 105.831996000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Karaoke Melody 13, Xuân Diệu, Q.Tây Hồ,Việt Nam   (04) 3719 4464   Giải Trí , Karaoke', 0, 0),
(1235, 'La Do Karaoke', ' ', '4 Tong Dan Street, Hoan Kiem District,Vietnam', '(04) 3935 1133', ' ', 21.027970000000000, 105.857391000000000, '', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'La Do Karaoke 4 Tong Dan Street, Hoan Kiem District,Vietnam   (04) 3935 1133   ', 0, 0),
(1236, 'Cửa Hàng Bar - Karaoke Thảo Nguyên', ' ', '10 HÀNG VÔI, Q.HOÀN KIẾM,Việt Nam', '(04) 3934 5909', ' ', 21.029727999999995, 105.856740000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Cửa Hàng Bar - Karaoke Thảo Nguyên 10 HÀNG VÔI, Q.HOÀN KIẾM,Việt Nam   (04) 3934 5909   Giải Trí , Karaoke', 0, 0),
(1237, 'Karaoke Blue', ' ', '8, Hàng Vôi, Q.Hoàn Kiếm,Việt Nam', '(04) 3825 7075', ' ', 21.030023000000000, 105.856672000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Karaoke Blue 8, Hàng Vôi, Q.Hoàn Kiếm,Việt Nam   (04) 3825 7075   Giải Trí , Karaoke', 0, 0),
(1238, 'Bar Karaoke Làn Sóng Xanh', ' ', '61, Lò Sũ, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 0592', ' ', 21.031395000000000, 105.854849000000000, 'Giải Trí , Karaoke', 355, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Bar Karaoke Làn Sóng Xanh 61, Lò Sũ, Q.Hoàn Kiếm,Việt Nam   (04) 3824 0592   Giải Trí , Karaoke', 0, 0),
(1239, 'Karaoke Thu Trang', ' ', '31 LÒ SŨ, Q.HOÀN KIẾM,Việt Nam', '(04) 3824 1626', ' ', 21.031257000000000, 105.856078000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Karaoke Thu Trang 31 LÒ SŨ, Q.HOÀN KIẾM,Việt Nam   (04) 3824 1626   Giải Trí , Karaoke', 0, 0),
(1240, 'Ben Ho Karaoke', ' ', '29 Lo Su Street, Ly Thai to Ward, Hoan Kiem District,Vietnam', '(04) 3917 1842', ' ', 21.031488000000000, 105.855165000000000, '', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Ben Ho Karaoke 29 Lo Su Street, Ly Thai to Ward, Hoan Kiem District,Vietnam   (04) 3917 1842   ', 0, 0),
(1241, 'Karaoke Rock', ' ', '169, Lò Sũ, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.031395000000000, 105.854183000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Karaoke Rock 169, Lò Sũ, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1242, 'Bar - Karaoke Kim Ngân', ' ', '35, Lò Sũ, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 0602', ' ', 21.031264000000000, 105.855739000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Kim Ngân 35, Lò Sũ, Q.Hoàn Kiếm,Việt Nam   (04) 3824 0602   Giải Trí , Karaoke', 0, 0),
(1243, 'Cửa Hàng Karaoke Linh Loan', ' ', '61B, Lò Sũ, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 9535', ' ', 21.031395000000000, 105.854849000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Cửa Hàng Karaoke Linh Loan 61B, Lò Sũ, Q.Hoàn Kiếm,Việt Nam   (04) 3824 9535   Giải Trí , Karaoke', 0, 0),
(1244, 'KARAOKE BÊN HỒ', ' ', '29 LÒ SŨ, P.LÝ THÁI TỔ, Q.HOÀN KIẾM,Việt Nam', '(04) 3917 1842', ' ', 21.031490000000000, 105.853980000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'KARAOKE BÊN HỒ 29 LÒ SŨ, P.LÝ THÁI TỔ, Q.HOÀN KIẾM,Việt Nam   (04) 3917 1842   Giải trí , Karaoke', 0, 0),
(1245, 'Karaoke Thông Tài', ' ', '245, Phúc Tân, Q.Hoàn Kiếm,Việt Nam', '(04) 3932 0640', ' ', 21.034728999999995, 105.856124999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Karaoke Thông Tài 245, Phúc Tân, Q.Hoàn Kiếm,Việt Nam   (04) 3932 0640   Giải Trí , Karaoke', 0, 0),
(1246, 'Huong Tra Karaoke', ' ', '50 Le Van Huu Street, Hai Ba Trung District,Việt Nam', '(04) 3943 1812', ' ', 21.018356000000000, 105.852048000000000, 'Giải trí , Karaoke', 356, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Huong Tra Karaoke 50 Le Van Huu Street, Hai Ba Trung District,Việt Nam   (04) 3943 1812   Giải trí , Karaoke', 0, 0),
(1247, 'Karaoke Hà Ngân', ' ', '105, Chương Dương Độ, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 4706', ' ', 21.029952999999995, 105.860052000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Karaoke Hà Ngân 105, Chương Dương Độ, Q.Hoàn Kiếm,Việt Nam   (04) 3824 4706   Giải Trí , Karaoke', 0, 0),
(1248, 'Hoang Long Karaoke', ' ', '28 Ham Thuyen Street, Hoan Kiem District,Vietnam', '(04) 3933 3917', ' ', 21.018922000000000, 105.857424000000000, '', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Hoang Long Karaoke 28 Ham Thuyen Street, Hoan Kiem District,Vietnam   (04) 3933 3917   ', 0, 0),
(1249, 'Vip Summit Karaoke (Quán Karaoke Vip Summit)', ' ', '69 Trieu Viet Vuong Street, Hai Ba Trung District (69 Triệu Việt Vương, Quận Hai Bà Trưng),Việt Nam', '0125229 9299', ' ', 21.018236000000000, 105.850632000000000, 'Giải trí , Karaoke', 357, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Vip Summit Karaoke (Quán Karaoke Vip Summit) 69 Trieu Viet Vuong Street, Hai Ba Trung District (69 Triệu Việt Vương, Quận Hai Bà Trưng),Việt Nam   0125229 9299   Giải trí , Karaoke', 0, 0),
(1250, 'Karaoke Ballad', ' ', '38 Kim Lien Moi Street, Dong Da District,Việt Nam', '(04) 2244 6789', ' ', 21.033076999999995, 105.849323000000000, 'Giải trí , Karaoke', 358, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'Karaoke Ballad 38 Kim Lien Moi Street, Dong Da District,Việt Nam   (04) 2244 6789   Giải trí , Karaoke', 0, 0),
(1251, 'MUA Thu Karaoke', ' ', '22 Le Van Huu Street, Hai Ba Trung District,Vietnam', '(04) 3943 3563', ' ', 21.018180999999995, 105.853475000000000, '', NULL, 1, NULL, '2012-01-16 13:17:33', '2012-01-16 13:17:33', 1, NULL, 137, NULL, 1, 'MUA Thu Karaoke 22 Le Van Huu Street, Hai Ba Trung District,Vietnam   (04) 3943 3563   ', 0, 0),
(1252, 'Nhà Nghỉ - Karaoke Tùng Anh', ' ', '969, Hồng Hà, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 8035', ' ', 21.022171000000000, 105.861511000000010, 'Khách Sạn , Nhà Khách, Nhà Nghỉ', 359, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Nhà Nghỉ - Karaoke Tùng Anh 969, Hồng Hà, Q.Hoàn Kiếm,Việt Nam   (04) 3824 8035   Khách Sạn , Nhà Khách, Nhà Nghỉ', 0, 0),
(1253, 'Karaoke 2005', ' ', '10, Ngô Thì Nhậm, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.018581000000000, 105.853304000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke 2005 10, Ngô Thì Nhậm, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1254, 'Karaoke Embass', ' ', '31, Hàn Thuyên, Q.Hai Bà Trưng,Việt Nam', '(04) 3972 1892', ' ', 21.018376000000000, 105.855776999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Embass 31, Hàn Thuyên, Q.Hai Bà Trưng,Việt Nam   (04) 3972 1892   Giải Trí , Karaoke', 0, 0),
(1255, 'KARAOKE HOÀNG LONG', ' ', '28 Hàn Thuyên, Q. Hoàn Kiếm,Việt Nam', '(04) 3933 3917', ' ', 21.018343999999995, 105.855531000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'KARAOKE HOÀNG LONG 28 Hàn Thuyên, Q. Hoàn Kiếm,Việt Nam   (04) 3933 3917   Giải trí , Karaoke', 0, 0),
(1256, 'Karaoke 34', ' ', '34, Trần Quốc Toản, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.019417000000000, 105.850353000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke 34 34, Trần Quốc Toản, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1257, 'Bar - Karaoke Ngọc Quang', ' ', '69, Hồng Mai, Q.Hai Bà Trưng,Việt Nam', '(04) 3863 1618', ' ', 20.999056000000000, 105.853040999999990, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Bar - Karaoke Ngọc Quang 69, Hồng Mai, Q.Hai Bà Trưng,Việt Nam   (04) 3863 1618   Giải Trí , Bar', 0, 0),
(1258, 'Karaoke Ngọc Trâm', ' ', '63, Hồng Mai, Q.Hai Bà Trưng,Việt Nam', '(04) 3863 5033', ' ', 20.999056000000000, 105.853040999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Ngọc Trâm 63, Hồng Mai, Q.Hai Bà Trưng,Việt Nam   (04) 3863 5033   Giải Trí , Karaoke', 0, 0),
(1259, 'Karaoke Đất Việt', ' ', '189, Minh Khai, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 20.995394000000000, 105.859552999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Đất Việt 189, Minh Khai, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1260, 'Karaoke Thanh Thảo', ' ', '639, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3862 6877', ' ', 20.997368000000000, 105.862310000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Thanh Thảo 639, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam   (04) 3862 6877   Giải Trí , Karaoke', 0, 0),
(1261, 'KARAOKE Gia Đình', ' ', '1 Võ Thị Sáu, Hai Bà Trưng,thủ đô Hà Nội, Vietnam', '090313 3479', ' ', 21.004532000000000, 105.856965000000000, '', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'KARAOKE Gia Đình 1 Võ Thị Sáu, Hai Bà Trưng,thủ đô Hà Nội, Vietnam   090313 3479   ', 0, 0),
(1262, 'Bar Karaoke', ' ', 'Bạch Mai, quận Hai Bà Trưng,Hà Nội, Việt Nam', ' ', ' ', 21.004398999999996, 105.851126000000000, '', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Bar Karaoke Bạch Mai, quận Hai Bà Trưng,Hà Nội, Việt Nam       ', 0, 0),
(1263, 'Bar Karaoke', ' ', 'Bạch Mai, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam', ' ', ' ', 21.004398999999996, 105.851126000000000, '', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Bar Karaoke Bạch Mai, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam       ', 0, 0),
(1264, 'Karaoke Fantasy', ' ', '201, Bạch Mai, Q.Hai Bà Trưng,Việt Nam', ' ', ' ', 21.004633999999996, 105.851254000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Fantasy 201, Bạch Mai, Q.Hai Bà Trưng,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1265, 'Karaoke Khánh Ly', ' ', '263, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam', '(04) 3862 1255', ' ', 21.004314000000000, 105.861576000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Khánh Ly 263, Kim Ngưu, Q.Hai Bà Trưng,Việt Nam   (04) 3862 1255   Giải Trí , Karaoke', 0, 0),
(1266, 'KARAOKE Gia Đình', ' ', '1 Võ Thị Sáu, Hai Bà Trưng,Hà Nội, Việt Nam', '090313 3479', ' ', 21.004525999999995, 105.856935000000010, '', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'KARAOKE Gia Đình 1 Võ Thị Sáu, Hai Bà Trưng,Hà Nội, Việt Nam   090313 3479   ', 0, 0),
(1267, 'Karaoke Family', ' ', '243, Phúc Tân, Q.Hoàn Kiếm,Việt Nam', '(04) 3932 3989', ' ', 21.034769000000000, 105.856104000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Family 243, Phúc Tân, Q.Hoàn Kiếm,Việt Nam   (04) 3932 3989   Giải Trí , Karaoke', 0, 0),
(1268, 'Karaoke Sunny', ' ', '55, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.035219999999995, 105.857000000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Sunny 55, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1269, 'Karaoke H2!', ' ', '33, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam', '(04) 3932 2722', ' ', 21.035139999999995, 105.856694000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke H2! 33, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam   (04) 3932 2722   Giải Trí , Karaoke', 0, 0),
(1270, 'Karaoke 235', ' ', '235, Phúc Tân, Q.Hoàn Kiếm,Việt Nam', '(04) 3932 2285', ' ', 21.034960000000000, 105.856007000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke 235 235, Phúc Tân, Q.Hoàn Kiếm,Việt Nam   (04) 3932 2285   Giải Trí , Karaoke', 0, 0),
(1271, 'Karaoke Ngọc Diệp', ' ', '64, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 8212', ' ', 21.035219999999995, 105.857193000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Ngọc Diệp 64, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam   (04) 3824 8212   Giải Trí , Karaoke', 0, 0),
(1272, 'Karaoke Xuân Thu', ' ', '17, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam', '(04) 3932 0047', ' ', 21.034818999999995, 105.855943000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Xuân Thu 17, Nguyễn Khiết, Q.Hoàn Kiếm,Việt Nam   (04) 3932 0047   Giải Trí , Karaoke', 0, 0),
(1273, 'Karaoke Ngọc Thắng', ' ', '222, Phúc Tân, Q.Hoàn Kiếm,Việt Nam', '(04) 3824 6145', ' ', 21.034789000000000, 105.856124999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Ngọc Thắng 222, Phúc Tân, Q.Hoàn Kiếm,Việt Nam   (04) 3824 6145   Giải Trí , Karaoke', 0, 0),
(1274, 'Karaoke Thuyền & Biển', ' ', '238, Phúc Tân, Q.Hoàn Kiếm,Việt Nam', '(04) 3932 6525', ' ', 21.034538999999995, 105.856232999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Thuyền & Biển 238, Phúc Tân, Q.Hoàn Kiếm,Việt Nam   (04) 3932 6525   Giải Trí , Karaoke', 0, 0),
(1275, 'Bar Karaoke Tuấn Anh', ' ', '19, Hàng Gà, Q.Hoàn Kiếm,Việt Nam', '(04) 3828 1347', ' ', 21.035841000000000, 105.847316999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Bar Karaoke Tuấn Anh 19, Hàng Gà, Q.Hoàn Kiếm,Việt Nam   (04) 3828 1347   Giải Trí , Karaoke', 0, 0),
(1276, 'Karaoke Mắt Đêm', ' ', '34, Hàng Muối, Q.Hoàn Kiếm,Việt Nam', ' ', ' ', 21.033957999999995, 105.854956000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Mắt Đêm 34, Hàng Muối, Q.Hoàn Kiếm,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1277, 'Karaoke Thành Đạt', ' ', '313, Phúc Tân, Q.Hoàn Kiếm,Việt Nam', '(04) 3932 0090', ' ', 21.033307000000000, 105.857107000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Thành Đạt 313, Phúc Tân, Q.Hoàn Kiếm,Việt Nam   (04) 3932 0090   Giải Trí , Karaoke', 0, 0),
(1278, 'Htx Đống Đa', ' ', '297, Giảng Võ, Q.Đống Đa,Việt Nam', '(04) 3851 4587', ' ', 21.024975999999995, 105.821890000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Htx Đống Đa 297, Giảng Võ, Q.Đống Đa,Việt Nam   (04) 3851 4587   Giải Trí , Karaoke', 0, 0),
(1279, 'Bar Karaoke Bảo Linh', ' ', '122, Ngọc Khánh, Q.Ba Đình,Việt Nam', '(04) 3835 2932', ' ', 21.025725999999995, 105.818531000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Bar Karaoke Bảo Linh 122, Ngọc Khánh, Q.Ba Đình,Việt Nam   (04) 3835 2932   Giải Trí , Karaoke', 0, 0),
(1280, 'Karaoke Huy', ' ', '337, La Thành, Q.Đống Đa,Việt Nam', '(04) 6275 2712', ' ', 21.022926999999996, 105.821921999999990, 'Giải Trí , Karaoke', 360, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Huy 337, La Thành, Q.Đống Đa,Việt Nam   (04) 6275 2712   Giải Trí , Karaoke', 0, 0),
(1281, 'Karaoke Cowboy', ' ', '201 Giang Vo Street, Ba Dinh District,Vietnam', '(04) 3512 2672', ' ', 21.023582999999995, 105.820441000000000, '', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Cowboy 201 Giang Vo Street, Ba Dinh District,Vietnam   (04) 3512 2672   ', 0, 0),
(1282, 'Karaoke Gia Đình Chợt Nhớ', ' ', '140, Kim Mã, Q.Ba Đình,Việt Nam', '(04) 3734 2959', ' ', 21.032015999999995, 105.826664000000000, 'Giải Trí , Karaoke', 361, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Gia Đình Chợt Nhớ 140, Kim Mã, Q.Ba Đình,Việt Nam   (04) 3734 2959   Giải Trí , Karaoke', 0, 0),
(1283, 'Karaoke Cowboy', ' ', '201 Giang Vo Street, Ba Dinh District,Việt Nam', '(04) 3512 2672', ' ', 21.023582999999995, 105.820441000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Cowboy 201 Giang Vo Street, Ba Dinh District,Việt Nam   (04) 3512 2672   Giải trí , Karaoke', 0, 0),
(1284, 'Karaoke Giai Điệu Mới', ' ', '329, La Thành, Q.Đống Đa,Việt Nam', '(04) 3514 5954', ' ', 21.022872000000000, 105.822104000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Giai Điệu Mới 329, La Thành, Q.Đống Đa,Việt Nam   (04) 3514 5954   Giải Trí , Karaoke', 0, 0),
(1285, 'Karaoke 329', ' ', '329, La Thành, Q.Đống Đa,Việt Nam', '(04) 3514 5945', ' ', 21.022872000000000, 105.822104000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke 329 329, La Thành, Q.Đống Đa,Việt Nam   (04) 3514 5945   Giải Trí , Karaoke', 0, 0),
(1286, 'Karaoke Grammy', ' ', '331-333, La Thành, Q.Đống Đa,Việt Nam', ' ', ' ', 21.022862000000000, 105.821997000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Grammy 331-333, La Thành, Q.Đống Đa,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1287, 'BAR KARAOKE Z101', ' ', '101 C7 TRẦN HUY LIỆU, Q. BA ĐÌNH,Việt Nam', '(04) 3726 0709', ' ', 21.029692000000000, 105.820527000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'BAR KARAOKE Z101 101 C7 TRẦN HUY LIỆU, Q. BA ĐÌNH,Việt Nam   (04) 3726 0709   Giải trí , Karaoke', 0, 0),
(1288, 'Quán Karaoke Dạ Hương', ' ', '16 Ngoc Khanh Street, Ba Dinh District (16 Ngọc Khánh, Quận Ba Đình),Việt Nam', '(04) 3771 7992', ' ', 21.028905000000000, 105.817488000000000, 'Giải Trí , Karaoke', 362, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Quán Karaoke Dạ Hương 16 Ngoc Khanh Street, Ba Dinh District (16 Ngọc Khánh, Quận Ba Đình),Việt Nam   (04) 3771 7992   Giải Trí , Karaoke', 0, 0),
(1289, 'Z101 Karaoke', ' ', '101 C7 Tran Huy Lieu Street, Ba Dinh District,Vietnam', '(04) 3726 0709', ' ', 21.030179000000000, 105.820000999999990, '', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Z101 Karaoke 101 C7 Tran Huy Lieu Street, Ba Dinh District,Vietnam   (04) 3726 0709   ', 0, 0),
(1290, 'Karaoke Thu Hương', ' ', '47, Hào Nam, Q.Đống Đa,Việt Nam', '(04) 3856 4413', ' ', 21.022311999999996, 105.826675000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Thu Hương 47, Hào Nam, Q.Đống Đa,Việt Nam   (04) 3856 4413   Giải Trí , Karaoke', 0, 0),
(1291, 'Karaoke Lucky', ' ', '108, Ngọc Khánh, Q.Ba Đình,Việt Nam', '(04) 3771 5623', ' ', 21.028851000000000, 105.817330000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Karaoke Lucky 108, Ngọc Khánh, Q.Ba Đình,Việt Nam   (04) 3771 5623   Giải Trí , Karaoke', 0, 0),
(1292, 'KARAOKE ĐÊM HÀ NỘI', ' ', '109B NGỌC KHÁNH Q.BA ĐÌNH,Việt Nam', '(04) 3846 1420', ' ', 21.029070999999995, 105.817264999999990, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'KARAOKE ĐÊM HÀ NỘI 109B NGỌC KHÁNH Q.BA ĐÌNH,Việt Nam   (04) 3846 1420   Giải trí , Karaoke', 0, 0),
(1293, 'Dem Ha Noi Karaoke', ' ', '109B Ngoc Khanh Street, Ba Dinh District,Vietnam', '(04) 3846 1420', ' ', 21.028597000000000, 105.817748000000000, '', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'Dem Ha Noi Karaoke 109B Ngoc Khanh Street, Ba Dinh District,Vietnam   (04) 3846 1420   ', 0, 0),
(1294, 'KARAOKE CHỢT NGỚ', ' ', '140 Kim Mã, Q.Ba Đình,Việt Nam', '(04) 3734 2759', ' ', 21.031154000000000, 105.822972999999990, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:34', '2012-01-16 13:17:34', 1, NULL, 137, NULL, 1, 'KARAOKE CHỢT NGỚ 140 Kim Mã, Q.Ba Đình,Việt Nam   (04) 3734 2759   Giải trí , Karaoke', 0, 0),
(1295, 'Karaoke Ngọc Long', ' ', '347, Kim Mã, Q.Ba Đình,Việt Nam', '(04) 3846 1182', ' ', 21.030577999999995, 105.816825999999990, 'Giải Trí , Karaoke', 363, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Ngọc Long 347, Kim Mã, Q.Ba Đình,Việt Nam   (04) 3846 1182   Giải Trí , Karaoke', 0, 0),
(1296, 'Karaoke Ngọc Nhi', ' ', '84 Nguyen Chi Thanh Street, Dong Da District,Việt Nam', '(04) 3835 5385', ' ', 21.023834000000000, 105.810984000000000, 'Giải Trí , Karaoke', 364, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Ngọc Nhi 84 Nguyen Chi Thanh Street, Dong Da District,Việt Nam   (04) 3835 5385   Giải Trí , Karaoke', 0, 0),
(1297, 'Karaoke Thùy Linh', ' ', '68, Thành Công, Q.Ba Đình,Việt Nam', '(04) 3831 1205', ' ', 21.022621999999995, 105.816214000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Thùy Linh 68, Thành Công, Q.Ba Đình,Việt Nam   (04) 3831 1205   Giải Trí , Karaoke', 0, 0),
(1298, 'Karaoke Hoàng Yến', ' ', '50, Thành Công, Q.Ba Đình,Việt Nam', '(04) 3835 0672', ' ', 21.022171000000000, 105.816020999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Hoàng Yến 50, Thành Công, Q.Ba Đình,Việt Nam   (04) 3835 0672   Giải Trí , Karaoke', 0, 0),
(1299, 'Bile Karaoke', ' ', '30, Thành Công, Q.Ba Đình,Việt Nam', ' ', ' ', 21.021540000000000, 105.815913999999990, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Bile Karaoke 30, Thành Công, Q.Ba Đình,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1300, 'Karaoke Gia Đình 397', ' ', '397, Kim Mã, Q.Ba Đình,Việt Nam', '094587 8898', ' ', 21.030393000000000, 105.816048000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Gia Đình 397 397, Kim Mã, Q.Ba Đình,Việt Nam   094587 8898   Giải Trí , Karaoke', 0, 0),
(1301, 'Karaoke Tiên Tân', ' ', '218, Đội Cấn, Q.Ba Đình,Việt Nam', '(04) 3762 5478', ' ', 21.035309999999996, 105.820409000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Tiên Tân 218, Đội Cấn, Q.Ba Đình,Việt Nam   (04) 3762 5478   Giải Trí , Karaoke', 0, 0),
(1302, 'Karaoke Chìa Khóa Vàng', ' ', '319, Đội Cấn, Q.Ba Đình,Việt Nam', '(04) 3762 3700', ' ', 21.035499999999995, 105.818049000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Chìa Khóa Vàng 319, Đội Cấn, Q.Ba Đình,Việt Nam   (04) 3762 3700   Giải Trí , Karaoke', 0, 0),
(1303, 'Karaoke Mtv', ' ', '3, Phạm Huy Thông, Q.Ba Đình,Việt Nam', '(04) 3771 8326', ' ', 21.026482999999995, 105.811107000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Mtv 3, Phạm Huy Thông, Q.Ba Đình,Việt Nam   (04) 3771 8326   Giải Trí , Karaoke', 0, 0),
(1304, 'Karaoke Atlantic', ' ', '51 phố Khương Trung mới, phường  Khương Trung,Hà Nội, Việt Nam', '(04) 6293 1983', ' ', 20.998885000000000, 105.817887000000000, 'Giải trí , Câu lạc bộ bóng đá', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Atlantic 51 phố Khương Trung mới, phường  Khương Trung,Hà Nội, Việt Nam   (04) 6293 1983   Giải trí , Câu lạc bộ bóng đá', 0, 0),
(1305, 'Bi Bong Karaoke', ' ', '96 Nguyen Trai Street, Thanh Xuan District,Vietnam', '(04) 2247 2266', ' ', 20.997543000000000, 105.812695000000000, '', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Bi Bong Karaoke 96 Nguyen Trai Street, Thanh Xuan District,Vietnam   (04) 2247 2266   ', 0, 0),
(1306, 'Bi Bong Karaoke (Quán Karaoke Bi Bống)', ' ', '96 Nguyen Trai Street, Thanh Xuan District (96 Nguyễn Trãi, Quận Thanh Xuân),Việt Nam', '(04) 2247 2266', ' ', 20.997543000000000, 105.812695000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Bi Bong Karaoke (Quán Karaoke Bi Bống) 96 Nguyen Trai Street, Thanh Xuan District (96 Nguyễn Trãi, Quận Thanh Xuân),Việt Nam   (04) 2247 2266   Giải trí , Karaoke', 0, 0),
(1307, 'Karaoke 164B', ' ', '164B, Hoàng Hoa Thám, Q.Tây Hồ,Việt Nam', '(04) 6273 3938', ' ', 21.042099000000000, 105.819969000000000, 'Giải Trí , Karaoke', 365, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke 164B 164B, Hoàng Hoa Thám, Q.Tây Hồ,Việt Nam   (04) 6273 3938   Giải Trí , Karaoke', 0, 0),
(1308, 'Big Bang Karaoke', ' ', '36/1 Van Cao Street, Ba Dinh District,Việt Nam', '090446 3463', ' ', 21.041689000000000, 105.816901000000000, 'Giải trí , Karaoke', 366, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Big Bang Karaoke 36/1 Van Cao Street, Ba Dinh District,Việt Nam   090446 3463   Giải trí , Karaoke', 0, 0),
(1309, 'KARAOKE HOA CAU', ' ', '92 ĐỐC NGỮ Q.BA ĐÌNH,Việt Nam', '(04) 3832 7923', ' ', 21.041809000000000, 105.814390000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'KARAOKE HOA CAU 92 ĐỐC NGỮ Q.BA ĐÌNH,Việt Nam   (04) 3832 7923   Giải trí , Karaoke', 0, 0),
(1310, 'Karaoke Pro', ' ', '164 Hoang Hoa Tham Street, Tay Ho District,Vietnam', '(04) 6273 3938', ' ', 21.044152000000000, 105.813339000000000, '', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Pro 164 Hoang Hoa Tham Street, Tay Ho District,Vietnam   (04) 6273 3938   ', 0, 0),
(1311, 'Karaoke Pro', ' ', '164 Hoang Hoa Tham Street, Tay Ho District,Việt Nam', '(04) 6273 3938', ' ', 21.044152000000000, 105.813339000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Pro 164 Hoang Hoa Tham Street, Tay Ho District,Việt Nam   (04) 6273 3938   Giải trí , Karaoke', 0, 0),
(1312, 'Billiards Club - Karaoke', ' ', '9, Liễu Giai, Q.Ba Đình,Việt Nam', '(04) 3762 8406', ' ', 21.035470000000000, 105.814862000000000, 'Giải Trí , Bida', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Billiards Club - Karaoke 9, Liễu Giai, Q.Ba Đình,Việt Nam   (04) 3762 8406   Giải Trí , Bida', 0, 0),
(1313, 'KARAOKE PRO', ' ', '164 Hoàng Hoa Thám, Q.Tây Hồ,Việt Nam', '(04) 6373 3938', ' ', 21.044111999999995, 105.813382000000000, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'KARAOKE PRO 164 Hoàng Hoa Thám, Q.Tây Hồ,Việt Nam   (04) 6373 3938   Giải trí , Karaoke', 0, 0),
(1314, 'Nhà hát karaoke', ' ', '315 A Cầu treo sinh thái, quận Hai Bà Trưng,Hà Nội, Việt Nam', '(04) 3644 9569', ' ', 20.993846999999995, 105.876122000000000, 'Theaters', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Nhà hát karaoke 315 A Cầu treo sinh thái, quận Hai Bà Trưng,Hà Nội, Việt Nam   (04) 3644 9569   Theaters', 0, 0),
(1315, 'Nhà hát karaoke', ' ', '315 A Cầu treo sinh thái, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam', '(04) 3644 9569', ' ', 20.993860000000000, 105.876119000000000, '', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Nhà hát karaoke 315 A Cầu treo sinh thái, Hai Bà Trưng,thủ đô Hà Nội, Việt Nam   (04) 3644 9569   ', 0, 0),
(1316, 'Bar Karaoke Tuyết Tuyết', ' ', '203, Lĩnh Nam, Q.Hoàng Mai,Việt Nam', '(04) 3644 1307', ' ', 20.985042000000000, 105.871886000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Bar Karaoke Tuyết Tuyết 203, Lĩnh Nam, Q.Hoàng Mai,Việt Nam   (04) 3644 1307   Giải Trí , Bar', 0, 0),
(1317, 'Karaoke Hoài Thu', ' ', '216, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam', '098446 1059', ' ', 21.044232000000000, 105.873174000000000, 'Giải Trí , Karaoke', 367, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke Hoài Thu 216, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam   098446 1059   Giải Trí , Karaoke', 0, 0),
(1318, 'Karaoke An Lạc', ' ', '213, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam', '(04) 3873 3097', ' ', 21.044492000000000, 105.873420000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:35', '2012-01-16 13:17:35', 1, NULL, 137, NULL, 1, 'Karaoke An Lạc 213, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam   (04) 3873 3097   Giải Trí , Karaoke', 0, 0),
(1319, 'Karaoke Gia Đình - Bốn Mùa', ' ', '256, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam', '(04) 3872 5999', ' ', 21.044502999999995, 105.873667000000000, 'Giải Trí , Karaoke', 368, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Gia Đình - Bốn Mùa 256, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam   (04) 3872 5999   Giải Trí , Karaoke', 0, 0),
(1320, 'Bar Karaoke Yến Linh', ' ', '256, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam', ' ', ' ', 21.044537999999996, 105.873662000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Bar Karaoke Yến Linh 256, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam       Giải Trí , Karaoke', 0, 0),
(1321, 'Karaoke Phương Huyền', ' ', '237, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam', '(04) 3873 3217', ' ', 21.044692999999995, 105.873806000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Phương Huyền 237, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam   (04) 3873 3217   Giải Trí , Karaoke', 0, 0),
(1322, 'Karaoke Tuấn Anh', ' ', '294, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam', '(04) 3872 5867', ' ', 21.044878000000000, 105.874273000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Tuấn Anh 294, Nguyễn Văn Cừ, Q.Long Biên,Việt Nam   (04) 3872 5867   Giải Trí , Karaoke', 0, 0),
(1323, 'Karaoke Thùy Dương', ' ', '220, Ngọc Lâm, Q.Long Biên,Việt Nam', '(04) 3873 1721', ' ', 21.046724999999995, 105.871403000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Thùy Dương 220, Ngọc Lâm, Q.Long Biên,Việt Nam   (04) 3873 1721   Giải Trí , Karaoke', 0, 0),
(1324, 'Four Seasons Karaoke', ' ', '236 Nguyen Van Cu Street, Long Bien District,Việt Nam', '(04) 3872 5999', ' ', 21.046254999999995, 105.876446000000000, 'Giải trí , Karaoke', 369, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Four Seasons Karaoke 236 Nguyen Van Cu Street, Long Bien District,Việt Nam   (04) 3872 5999   Giải trí , Karaoke', 0, 0),
(1325, 'Karaoke Hương Quỳnh', ' ', '118, Nguyễn Sơn, Q.Long Biên,Việt Nam', '(04) 3827 1127', ' ', 21.047105999999996, 105.877637000000000, 'Giải Trí , Bar', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Hương Quỳnh 118, Nguyễn Sơn, Q.Long Biên,Việt Nam   (04) 3827 1127   Giải Trí , Bar', 0, 0),
(1326, 'Karaoke Pharaoh', ' ', '27, Nguyễn Sơn, Q.Long Biên,Việt Nam', '(04) 3873 2113', ' ', 21.047851999999995, 105.876118000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Pharaoh 27, Nguyễn Sơn, Q.Long Biên,Việt Nam   (04) 3873 2113   Giải Trí , Karaoke', 0, 0),
(1327, 'Karaoke Thúy Nga', ' ', '51, Nguyễn Sơn, Q.Long Biên,Việt Nam', '(04) 3650 2120', ' ', 21.047096000000000, 105.877519000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Thúy Nga 51, Nguyễn Sơn, Q.Long Biên,Việt Nam   (04) 3650 2120   Giải Trí , Karaoke', 0, 0),
(1328, 'Karaoke Sao Mai', ' ', '114, Nguyễn Sơn, Q.Long Biên,Việt Nam', '090217 7666', ' ', 21.047160999999996, 105.877551000000010, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Sao Mai 114, Nguyễn Sơn, Q.Long Biên,Việt Nam   090217 7666   Giải Trí , Karaoke', 0, 0),
(1329, 'Karaoke Lx', ' ', '136, Nguyễn Sơn, Q.Long Biên,Việt Nam', '(04) 6671 8672', ' ', 21.046565000000000, 105.878500000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Lx 136, Nguyễn Sơn, Q.Long Biên,Việt Nam   (04) 6671 8672   Giải Trí , Karaoke', 0, 0),
(1330, 'Karaoke Phi Linh', ' ', '20 Chua Lang Street, Dong Da District,Việt Nam', '(04) 3775 3774', ' ', 21.022749000000000, 105.809732000000000, 'Giải Trí , Karaoke', 370, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Phi Linh 20 Chua Lang Street, Dong Da District,Việt Nam   (04) 3775 3774   Giải Trí , Karaoke', 0, 0),
(1331, 'Karaoke Thu Huyền', ' ', '52 Chua Lang Street, Dong Da District,Việt Nam', '(04) 3835 5015', ' ', 21.022749000000000, 105.809732000000000, 'Giải Trí , Karaoke', 371, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Thu Huyền 52 Chua Lang Street, Dong Da District,Việt Nam   (04) 3835 5015   Giải Trí , Karaoke', 0, 0),
(1332, 'Karaoke 107', ' ', '107, Đào Tấn, Q.Ba Đình,Việt Nam', '(04) 3766 6018', ' ', 21.033778000000000, 105.805968000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke 107 107, Đào Tấn, Q.Ba Đình,Việt Nam   (04) 3766 6018   Giải Trí , Karaoke', 0, 0),
(1333, 'Karaoke Kim Oanh', ' ', '120, Chùa Láng, Q.Đống Đa,Việt Nam', '(04) 3775 1901', ' ', 21.023218000000000, 105.802454000000000, 'Giải Trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Karaoke Kim Oanh 120, Chùa Láng, Q.Đống Đa,Việt Nam   (04) 3775 1901   Giải Trí , Karaoke', 0, 0),
(1334, 'QUÁN KARAOKE THIÊN Ý', ' ', '107, Đào Tấn, Q.Ba Đình,Việt Nam', '(04) 3766 6018', ' ', 21.033117000000000, 105.807695000000010, 'Giải trí , Karaoke', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'QUÁN KARAOKE THIÊN Ý 107, Đào Tấn, Q.Ba Đình,Việt Nam   (04) 3766 6018   Giải trí , Karaoke', 0, 0),
(1335, 'CuBin', ' ', 'Cầu Yên Hoà, Cầu Giấy,Hà Nội, Việt Nam', '097457 8190', ' ', 21.024844999999996, 105.796827000000010, 'Giải trí , Karaoke', 372, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'CuBin Cầu Yên Hoà, Cầu Giấy,Hà Nội, Việt Nam   097457 8190   Giải trí , Karaoke', 0, 0),
(1336, 'Hai Linh Karaoke', ' ', '248 Duong Buoi Street, Ba Dinh District,Vietnam', '(04) 3832 5104', ' ', 21.035747000000000, 105.806698000000000, '', NULL, 1, NULL, '2012-01-16 13:17:36', '2012-01-16 13:17:36', 1, NULL, 137, NULL, 1, 'Hai Linh Karaoke 248 Duong Buoi Street, Ba Dinh District,Vietnam   (04) 3832 5104   ', 0, 0),
(1344, 'Cửa hàng đồ ăn nhanh', ' ', 'Đội Cấn - Ba Đình - Hà Nội', ' ', ' ', 21.037734600000000, 105.814289899999960, ' ', NULL, 1, NULL, '2012-01-31 17:00:45', '2012-01-31 17:00:45', 1, NULL, 4, NULL, 1, 'Cửa hàng đồ ăn nhanh Đội Cấn - Ba Đình - Hà Nội        ', 0, 0),
(1345, 'Nhà Hàng Vạn Hoa', ' ', 'Đội Cấn - Ba Đình - Hà Nội', ' ', ' ', 21.037734600000000, 105.814289899999960, ' ', NULL, 1, NULL, '2012-01-31 17:20:02', '2012-01-31 17:20:02', 1, NULL, 4, NULL, 1, 'Nhà Hàng Vạn Hoa Đội Cấn - Ba Đình - Hà Nội        ', 0, 0),
(1346, 'Cho thuê nhà trọ giá rẻ', '', 'Đội Cấn - Ba Đình - Hà Nội', '', ' ', 21.022501999999996, 105.846062000000070, ' ', NULL, 1, NULL, '2012-01-31 17:32:43', '2012-01-31 17:32:43', 1, NULL, 1, 2, 0, 'Cho thuê nhà trọ giá rẻ Đội Cấn - Ba Đình - Hà Nội      ', 0, 0),
(1349, 'Nhà Hàng 123', ' ', 'Đội Cấn - Ba Đình - Hà Nội', ' ', ' ', 21.038109599999995, 105.814243700000020, ',Nhà hàng', 381, 1, NULL, '2012-02-01 10:04:45', '2012-02-01 10:21:09', 1, NULL, 4, NULL, 1, 'Nhà Hàng 123 Đội Cấn - Ba Đình - Hà Nội       ,Nhà hàng', 0, 0),
(1351, 'Nhà cho thuê', 'Nhà 3 tầng, rộng, thoáng mát. Mỗi tầng có nhà vệ sinh riêng.', 'Số 18, Đội Cấn, Ba Đình, Hà Nội', '01688153348', ' ', 21.022501999999996, 105.846062000000090, ' ', NULL, 1, NULL, '2012-02-01 14:44:32', '2012-02-01 14:44:32', 1, NULL, 1, 2, 0, 'Nhà cho thuê Số 18, Đội Cấn, Ba Đình, Hà Nội Nhà 3 tầng, rộng, thoáng mát. Mỗi tầng có nhà vệ sinh riêng. 01688153348    ', 0, 0),
(1359, 'Cho thuê cửa hàng', '', 'Hàng bài - Hà Nội', '', ' ', 21.022501999999996, 105.846062000000090, ' ', NULL, 1, NULL, '2012-02-06 15:11:23', '2012-02-06 15:11:23', 1, NULL, 1, 2, 0, 'Cho thuê cửa hàng Hàng bài - Hà Nội      ', 0, 0),
(1360, 'Nha o Ke go', ' ', 'Ke go', ' ', ' ', 18.046384032222570, 105.632967485937570, ' ', NULL, 1, NULL, '2012-02-06 17:12:03', '2012-02-06 17:12:03', 1, NULL, 1337, NULL, 1, 'Nha o Ke go Ke go        ', 0, 0),
(1361, 'CCCC Vimeco, S=146 m2, 3 phòng ngủ', 'Căn hộ CCCC Vimeco (cạnh Big C), diện tích S=146 m2, CT2-tầng 14, 3 phòng ngủ, 2 WC, hướng Đông Nam, trang bị đầy đủ đồ dùng để ở, phù hợp với NNN, người VN có thu nhập cao. Giá 900 USD.<BR><BR>Liên hệ: Bà Lan, 0913204246, 04-38563674\n					', 'Chung cư Vimeco, Hà Nội', '0913204246', ' ', 21.033332800000000, 105.849998499999980, '', NULL, 1, NULL, '2012-02-09 11:02:32', '2012-02-09 11:02:32', 1, NULL, 1, NULL, 0, 'CCCC Vimeco, S=146 m2, 3 phòng ngủ Chung cư Vimeco, Hà Nội Căn hộ CCCC Vimeco (cạnh Big C), diện tích S=146 m2, CT2-tầng 14, 3 phòng ngủ, 2 WC, hướng Đông Nam, trang bị đầy đủ đồ dùng để ở, phù hợp với NNN, người VN có thu nhập cao. Giá 900 USD.<BR><BR>Liên hệ: Bà Lan, 0913204246, 04-38563674\n					 0913204246   ', 0, 0),
(1362, 'Cho thuê văn phòng diện tích 100m2 giá 6,5tr', 'Cho thuê tầng 1,2 của tòa nhà 4 tầng làm văn Phòng. Diện tích 50m2/1tầng tại đường Lê Trọng Tấn, Thanh Xuân, Hà Nội; <BR>Hiện đã có đầy đủ bàn ghế làm việc, khu văn minh, có thể để ô tô, xe máy, gần mặt đường. Giá: 6.5tr / tháng. Liên hệ: Chị Hạnh (chính chủ) 0988 522 123 (miễn trung gian)\n					', 'đường Lê Trọng Tấn, Thanh Xuân, Hà Nội', '0988522123', ' ', 20.992280999999995, 105.833129900000000, '', NULL, 1, NULL, '2012-02-09 11:09:20', '2012-02-09 11:09:20', 1, NULL, 1, NULL, 0, 'Cho thuê văn phòng diện tích 100m2 giá 6,5tr đường Lê Trọng Tấn, Thanh Xuân, Hà Nội Cho thuê tầng 1,2 của tòa nhà 4 tầng làm văn Phòng. Diện tích 50m2/1tầng tại đường Lê Trọng Tấn, Thanh Xuân, Hà Nội; <BR>Hiện đã có đầy đủ bàn ghế làm việc, khu văn minh, có thể để ô tô, xe máy, gần mặt đường. Giá: 6.5tr / tháng. Liên hệ: Chị Hạnh (chính chủ) 0988 522 123 (miễn trung gian)\n					 0988522123   ', 0, 0),
(1363, 'Cho thuê phòng trọ khu Bằng A, Linh Đàm', 'Cho thuê phòng trọ khép kín khu bằng A, gần chùa Bằng A.Diện tích 20m2, gác xép 8m2Giá thuê: 2tr/tháng.Liên hê; Anh Giang 0982781223, chị Tâm 0903268140\n					', 'khu Bằng A, Linh Đàm, Hoàng Mai, Hà Nội', '0903268140', ' ', 20.971452700000000, 105.828277600000000, '', NULL, 1, NULL, '2012-02-09 11:21:31', '2012-02-09 11:21:31', 1, NULL, 1, NULL, 0, 'Cho thuê phòng trọ khu Bằng A, Linh Đàm khu Bằng A, Linh Đàm, Hoàng Mai, Hà Nội Cho thuê phòng trọ khép kín khu bằng A, gần chùa Bằng A.Diện tích 20m2, gác xép 8m2Giá thuê: 2tr/tháng.Liên hê; Anh Giang 0982781223, chị Tâm 0903268140\n					 0903268140   ', 0, 0),
(1364, 'Nhà hàng kỉ nguyên', NULL, 'Đội Cấn - Hà Nội', NULL, NULL, 21.037857700000000, 105.814269200000000, NULL, NULL, 1, NULL, '2012-02-10 17:30:18', '2012-02-10 17:30:18', 1, NULL, 4, NULL, 1, 'Nhà hàng kỉ nguyên,Đội Cấn - Hà Nội,', 0, 0),
(1365, 'Quán Bia Việt Hà', '', 'Đội Cấn - Hà Nội', '0973956705', '', 21.037857700000000, 105.814269200000000, '', NULL, 1, NULL, '2012-02-10 17:33:39', '2012-02-10 17:47:37', 1, NULL, 4, NULL, 1, 'Quán Bia Việt Hà,,Đội Cấn - Hà Nội,0973956705,,,', 0, 0),
(1370, 'Cho thuê nhà trọ tấng 5 khép kín', '', 'Hai Bà Trưng - Hà Nội', '', '', 21.022502000000000, 105.846062000000070, NULL, NULL, 1, NULL, '2012-02-11 09:43:05', '2012-02-11 09:43:48', 1, NULL, 1, NULL, 1, 'Cho thuê nhà trọ tấng 5 khép kín,Hai Bà Trưng - Hà Nội,,,,', 0, 0),
(1371, 'Test price', '', 'Hóa Lò - Hà Nội', '', '', 21.022502000000000, 105.846062000000070, NULL, NULL, 1, NULL, '2012-02-11 10:58:36', '2012-02-11 11:31:46', 1, NULL, 1, NULL, 1, 'Test price,Hóa Lò - Hà Nội,,,,', 0, 0),
(1379, 'vịt cỏ vân đình', NULL, 'km10-nguyễn trãi-hà đông- hà nội', NULL, NULL, 21.038872710666060, 105.805563500463900, NULL, NULL, 1, NULL, '2012-02-27 08:33:39', '2012-02-27 08:33:39', 1, NULL, 4, NULL, 1, 'vịt cỏ vân đình,km10-nguyễn trãi-hà đông- hà nội,', 0, 0),
(1380, 'nhà hàng tuấn beo', NULL, '120 ba la hà đông hà nội', NULL, NULL, 21.037911400000000, 105.814232400000040, NULL, NULL, 1, NULL, '2012-02-27 08:38:04', '2012-02-27 08:38:04', 1, NULL, 4, NULL, 1, 'nhà hàng tuấn beo,120 ba la hà đông hà nội,', 0, 0),
(1381, 'nhà hàng dân tộc', NULL, 'km9 nguyễn trãi thanh xuân hà nội', NULL, NULL, 21.037911400000000, 105.814232400000040, NULL, NULL, 1, NULL, '2012-02-27 08:43:58', '2012-02-27 08:43:58', 1, NULL, 4, NULL, 1, 'nhà hàng dân tộc,km9 nguyễn trãi thanh xuân hà nội,', 0, 0),
(1386, 'bia hơi huế thực', NULL, '179 đội cấn- ba đình-hà nội', NULL, NULL, 21.037911400000000, 105.814232400000040, NULL, NULL, 1, NULL, '2012-02-27 08:52:40', '2012-02-27 08:52:40', 1, NULL, 4, NULL, 1, 'bia hơi huế thực,179 đội cấn- ba đình-hà nội,', 0, 0),
(1387, 'chả cá lá nốt đặ sản hà nội', NULL, '230 đội cấn ba đình hà nội', NULL, NULL, 21.037911400000000, 105.814232400000040, NULL, NULL, 1, NULL, '2012-02-27 08:57:47', '2012-02-27 08:57:47', 1, NULL, 4, NULL, 1, 'chả cá lá nốt đặ sản hà nội,230 đội cấn ba đình hà nội,', 0, 0),
(1390, 'chả cá lá nốt đặ sản hà nội', NULL, '230 đội cấn ba đình hà nội', NULL, NULL, 21.037911400000000, 105.814232400000040, NULL, NULL, 1, NULL, '2012-02-27 08:57:58', '2012-02-27 08:57:58', 1, NULL, 4, NULL, 1, 'chả cá lá nốt đặ sản hà nội,230 đội cấn ba đình hà nội,', 0, 0),
(1410, 'Nhà cho thuê', '', 'Số 18, ngõ 379, Đội Cấn, Ba Đình, Hà Nội', '01688153348', 'lifemap.vn', 21.037911400000000, 105.814232400000040, 'Địa điểm đẹp', NULL, 1, NULL, '2012-02-29 08:09:39', '2012-02-29 08:10:24', 1, NULL, 4, NULL, 1, 'Nhà cho thuê,,Số 18, ngõ 379, Đội Cấn, Ba Đình, Hà Nội,01688153348,,Địa điểm đẹp,', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pos_category`
--

CREATE TABLE IF NOT EXISTS `pos_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies category',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name is of category',
  `description` text COLLATE utf8_unicode_ci COMMENT 'desc is of category',
  `name_table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên bảng thuộc tính tương ứng với Category',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'id identifies category',
  `type` tinyint(4) DEFAULT NULL COMMENT 'Cho phép ẩn/ hiện category',
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'code of pos category',
  `file_id` int(11) DEFAULT NULL COMMENT 'File id',
  `order` tinyint(1) DEFAULT '1',
  `view_flag` tinyint(4) DEFAULT '1' COMMENT 'File id',
  `detail_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'sub name is of category',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id_idx` (`parent_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1340 ;

--
-- Dumping data for table `pos_category`
--

INSERT INTO `pos_category` (`id`, `name`, `description`, `name_table`, `created_at`, `updated_at`, `parent_id`, `type`, `code`, `file_id`, `order`, `view_flag`, `detail_name`) VALUES
(1, 'Nhà cho thuê', NULL, 'pos_rent_house', '2011-12-02 15:34:43', '2011-12-02 15:34:49', NULL, 0, 'pos_rent_house', NULL, 1, 1, ''),
(2, 'Cho thuê phòng trọ', NULL, NULL, '2011-12-05 09:11:12', '2011-12-05 09:11:18', 1, 0, NULL, NULL, 1, 1, ''),
(3, 'Cho thuê biệt thự', NULL, NULL, '2011-12-05 09:12:05', '2011-12-05 09:12:10', 1, 0, NULL, NULL, 1, 1, ''),
(4, 'Quán bia', NULL, NULL, '2011-12-13 08:52:36', '2011-12-13 08:52:43', NULL, 1, NULL, NULL, 1, 1, ''),
(136, 'Quán Cafe', NULL, NULL, '2011-12-29 21:31:55', '2011-12-29 21:31:55', NULL, 1, 'pos_cafe', NULL, 1, 1, ''),
(137, 'Quán Karaoke', NULL, NULL, '2012-01-14 16:29:50', '2012-01-14 16:29:52', NULL, 1, 'pos_karaoke', NULL, 1, 1, ''),
(1337, 'Công ty', NULL, NULL, '2012-01-16 15:57:21', '2012-01-16 15:57:21', NULL, 1, 'pos_company', NULL, 1, 1, ''),
(1338, 'Khách sạn', NULL, NULL, '2012-01-16 16:26:57', '2012-01-16 16:26:57', NULL, 1, 'pos_hotel', NULL, 1, 1, ''),
(1339, 'Quán game', NULL, NULL, '2012-01-16 17:44:54', '2012-01-16 17:44:54', NULL, 1, 'pos_game', NULL, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `pos_checkin`
--

CREATE TABLE IF NOT EXISTS `pos_checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos_checkin',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'status is of pos_checkin',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_public` int(1) NOT NULL DEFAULT '1' COMMENT 'Public Flag',
  `pos_category_id` int(11) DEFAULT NULL COMMENT 'id identifies category',
  PRIMARY KEY (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `pos_category_id_idx` (`pos_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `pos_checkin`
--

INSERT INTO `pos_checkin` (`id`, `pos_id`, `member_id`, `status`, `created_at`, `updated_at`, `is_public`, `pos_category_id`) VALUES
(1, 1, 1, 0, '2011-11-07 16:05:15', '2012-02-17 14:15:18', 1, NULL),
(2, 1, 3, 0, '2011-11-08 16:09:36', '2012-01-17 11:14:53', 1, NULL),
(3, 1, 5, 1, '2011-11-07 15:56:00', '2011-11-07 16:09:36', 1, NULL),
(4, 1, 15, 0, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(5, 2, 1, 0, '2011-11-21 15:24:40', '2012-02-17 14:15:18', 1, NULL),
(6, 5, 1, 0, '2011-11-22 09:14:56', '2012-02-17 14:15:18', 1, NULL),
(7, 3, 1, 0, '2011-11-22 09:16:42', '2012-02-17 14:15:18', 1, NULL),
(9, 4, 1, 0, '2011-11-22 10:01:49', '2012-02-17 14:15:18', 1, NULL),
(10, 23, 1, 0, '2011-11-22 15:14:54', '2012-02-17 14:15:18', 1, NULL),
(11, 23, 1, 0, '2011-11-22 15:14:58', '2012-02-17 14:15:18', 1, NULL),
(12, 23, 1, 0, '2011-11-22 15:15:01', '2012-02-17 14:15:18', 1, NULL),
(13, 23, 1, 0, '2011-11-22 15:15:02', '2012-02-17 14:15:18', 1, NULL),
(14, 23, 1, 0, '2011-11-22 15:15:04', '2012-02-17 14:15:18', 1, NULL),
(15, 23, 1, 0, '2011-11-22 15:15:06', '2012-02-17 14:15:18', 1, NULL),
(16, 23, 1, 0, '2011-11-22 15:15:08', '2012-02-17 14:15:18', 1, NULL),
(17, 23, 1, 0, '2011-11-22 15:15:09', '2012-02-17 14:15:18', 1, NULL),
(18, 23, 1, 0, '2011-11-22 15:15:11', '2012-02-17 14:15:18', 1, NULL),
(19, 23, 1, 0, '2011-11-22 15:15:13', '2012-02-17 14:15:18', 1, NULL),
(20, 23, 1, 0, '2011-11-22 15:15:15', '2012-02-17 14:15:18', 1, NULL),
(21, 23, 1, 0, '2011-11-22 15:15:16', '2012-02-17 14:15:18', 1, NULL),
(22, 23, 1, 0, '2011-11-22 15:15:18', '2012-02-17 14:15:18', 1, NULL),
(23, 21, 1, 0, '2011-11-22 15:18:13', '2012-02-17 14:15:18', 1, NULL),
(24, 21, 1, 0, '2011-11-22 15:18:26', '2012-02-17 14:15:18', 1, NULL),
(25, 21, 1, 0, '2011-11-22 15:18:27', '2012-02-17 14:15:18', 1, NULL),
(26, 21, 1, 0, '2011-11-22 15:18:29', '2012-02-17 14:15:18', 1, NULL),
(27, 21, 1, 0, '2011-11-22 15:18:31', '2012-02-17 14:15:18', 1, NULL),
(28, 21, 1, 0, '2011-11-22 15:18:33', '2012-02-17 14:15:18', 1, NULL),
(29, 22, 1, 0, '2011-11-22 15:19:00', '2012-02-17 14:15:18', 1, NULL),
(30, 22, 1, 0, '2011-11-22 15:19:23', '2012-02-17 14:15:18', 1, NULL),
(31, 24, 1, 0, '2011-11-22 15:27:57', '2012-02-17 14:15:18', 1, NULL),
(32, 25, 18, 0, '2011-11-22 15:36:53', '2012-02-17 14:27:36', 1, NULL),
(38, 25, 1, 0, '2011-11-25 10:54:23', '2012-02-17 14:15:18', 1, NULL),
(39, 26, 18, 0, '2011-11-25 11:04:57', '2012-02-17 14:27:36', 1, NULL),
(40, 27, 18, 0, '2011-11-25 11:06:28', '2012-02-17 14:27:36', 1, NULL),
(41, 27, 1, 0, '2011-11-25 11:07:26', '2012-02-17 14:15:18', 1, NULL),
(42, 28, 3, 0, '2011-11-25 11:08:56', '2012-01-17 11:14:53', 1, NULL),
(43, 28, 1, 0, '2011-11-25 11:10:36', '2012-02-17 14:15:18', 1, NULL),
(44, 23, 1, 0, '2011-11-26 09:10:37', '2012-02-17 14:15:18', 1, NULL),
(45, 22, 1, 0, '2011-11-26 09:11:12', '2012-02-17 14:15:18', 1, NULL),
(46, 21, 1, 0, '2011-11-26 09:11:33', '2012-02-17 14:15:18', 1, NULL),
(47, 24, 1, 0, '2011-11-26 09:48:43', '2012-02-17 14:15:18', 1, NULL),
(48, 23, 1, 0, '2011-11-26 09:48:56', '2012-02-17 14:15:18', 1, NULL),
(49, 2, 1, 0, '2011-11-26 10:07:24', '2012-02-17 14:15:18', 1, NULL),
(50, 25, 18, 0, '2011-11-26 10:10:54', '2012-02-17 14:27:36', 1, NULL),
(51, 25, 1, 0, '2011-11-29 13:51:21', '2012-02-17 14:15:18', 1, NULL),
(52, 32, 1, 0, '2011-11-29 14:05:45', '2012-02-17 14:15:18', 1, NULL),
(53, 32, 1, 0, '2011-11-29 14:05:47', '2012-02-17 14:15:18', 1, NULL),
(54, 32, 1, 0, '2011-11-29 14:05:48', '2012-02-17 14:15:18', 1, NULL),
(55, 33, 1, 0, '2011-11-29 16:36:16', '2012-02-17 14:15:18', 1, NULL),
(56, 31, 1, 0, '2011-11-29 16:36:58', '2012-02-17 14:15:18', 1, NULL),
(57, 33, 1, 0, '2011-11-29 16:39:33', '2012-02-17 14:15:18', 1, NULL),
(58, 34, 1, 0, '2011-12-01 14:23:03', '2012-02-17 14:15:18', 1, NULL),
(59, 35, 1, 0, '2011-12-01 16:04:55', '2012-02-17 14:15:18', 1, NULL),
(60, 32, 1, 0, '2011-12-01 16:46:26', '2012-02-17 14:15:18', 1, NULL),
(61, 2, 1, 0, '2011-12-16 10:12:03', '2012-02-17 14:15:18', 1, NULL),
(62, 35, 1, 0, '2011-12-16 10:22:11', '2012-02-17 14:15:18', 1, NULL),
(63, 35, 1, 0, '2011-12-16 10:24:51', '2012-02-17 14:15:18', 1, NULL),
(64, 35, 1, 0, '2011-12-16 10:25:28', '2012-02-17 14:15:18', 1, NULL),
(65, 2, 1, 0, '2011-12-16 10:29:03', '2012-02-17 14:15:18', 1, NULL),
(66, 2, 1, 0, '2011-12-16 10:29:36', '2012-02-17 14:15:18', 1, NULL),
(67, 2, 1, 0, '2011-12-16 10:30:51', '2012-02-17 14:15:18', 1, NULL),
(68, 35, 1, 0, '2011-12-16 10:35:21', '2012-02-17 14:15:18', 1, NULL),
(69, 36, 1, 0, '2011-12-16 13:40:19', '2012-02-17 14:15:18', 1, NULL),
(70, 103, 1, 0, '2011-12-23 10:52:41', '2012-02-17 14:15:18', 1, NULL),
(71, 102, 1, 0, '2011-12-23 10:59:14', '2012-02-17 14:15:18', 1, NULL),
(72, 101, 1, 0, '2011-12-23 11:00:02', '2012-02-17 14:15:18', 1, NULL),
(73, 130, 1, 0, '2011-12-29 20:50:52', '2012-02-17 14:15:18', 1, NULL),
(74, 130, 1, 0, '2011-12-29 20:50:52', '2012-02-17 14:15:18', 1, NULL),
(75, 132, 1, 0, '2011-12-29 21:27:09', '2012-02-17 14:15:18', 1, NULL),
(76, 4, 3, 0, '2011-12-31 11:51:53', '2012-01-17 11:14:53', 1, NULL),
(77, 3, 3, 0, '2011-12-31 12:04:19', '2012-01-17 11:14:53', 1, NULL),
(78, 136, 1, 0, '2012-01-13 17:13:18', '2012-02-17 14:15:18', 1, NULL),
(79, 28, 1, 0, '2012-01-13 17:14:50', '2012-02-17 14:15:18', 1, NULL),
(80, 1337, 1, 0, '2012-01-16 16:01:49', '2012-02-17 14:15:18', 1, NULL),
(81, 1319, 3, 1, '2012-01-17 11:14:54', '2012-01-17 11:14:54', 1, NULL),
(82, 1325, 1, 0, '2012-01-17 14:23:01', '2012-02-17 14:15:18', 1, NULL),
(83, 1325, 1, 0, '2012-01-17 14:23:08', '2012-02-17 14:15:18', 1, NULL),
(84, 1325, 1, 0, '2012-01-17 14:23:09', '2012-02-17 14:15:18', 1, NULL),
(85, 1325, 1, 0, '2012-01-17 14:23:10', '2012-02-17 14:15:18', 1, NULL),
(86, 1325, 1, 0, '2012-01-17 14:23:10', '2012-02-17 14:15:18', 1, NULL),
(87, 1325, 1, 0, '2012-01-17 14:23:11', '2012-02-17 14:15:18', 1, NULL),
(88, 1325, 1, 0, '2012-01-17 14:23:11', '2012-02-17 14:15:18', 1, NULL),
(89, 1325, 1, 0, '2012-01-17 14:23:11', '2012-02-17 14:15:18', 1, NULL),
(90, 1325, 1, 0, '2012-01-17 14:23:12', '2012-02-17 14:15:18', 1, NULL),
(91, 1341, 1, 0, '2012-01-17 16:37:42', '2012-02-17 14:15:18', 1, NULL),
(92, 1344, 1, 0, '2012-01-31 17:06:28', '2012-02-17 14:15:18', 1, NULL),
(93, 1344, 1, 0, '2012-01-31 17:11:19', '2012-02-17 14:15:18', 1, NULL),
(94, 1343, 1, 0, '2012-01-31 17:12:53', '2012-02-17 14:15:18', 1, NULL),
(95, 1345, 1, 0, '2012-01-31 17:20:10', '2012-02-17 14:15:18', 1, NULL),
(96, 1349, 1, 0, '2012-02-01 10:21:30', '2012-02-17 14:15:18', 1, NULL),
(97, 1351, 1, 0, '2012-02-02 09:41:00', '2012-02-17 14:15:18', 1, NULL),
(98, 1369, 1, 0, '2012-02-14 11:27:39', '2012-02-17 14:15:18', 1, 4),
(99, 1360, 1, 0, '2012-02-14 11:30:20', '2012-02-17 14:15:18', 1, 1337),
(100, 1301, 1, 1, '2012-02-17 14:15:18', '2012-02-17 14:15:18', 1, 137),
(101, 1369, 18, 0, '2012-02-17 14:23:00', '2012-02-17 14:27:36', 1, 4),
(102, 1222, 18, 1, '2012-02-17 14:27:36', '2012-02-17 14:27:36', 1, 137);

-- --------------------------------------------------------

--
-- Table structure for table `pos_comment`
--

CREATE TABLE IF NOT EXISTS `pos_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos_comment',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'content is of pos_comment',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `claim_status` tinyint(4) DEFAULT NULL COMMENT 'claim_status is of pos_comment',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'status is of pos_comment',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pos_category_id` int(11) DEFAULT NULL COMMENT 'id identifies category',
  PRIMARY KEY (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `pos_category_id_idx` (`pos_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=137 ;

--
-- Dumping data for table `pos_comment`
--

INSERT INTO `pos_comment` (`id`, `pos_id`, `content`, `member_id`, `claim_status`, `status`, `created_at`, `updated_at`, `pos_category_id`) VALUES
(1, 1, 'Nha hang co chat luong phuc vu rat tot', 1, NULL, 1, '2011-11-07 16:06:20', '2011-11-07 16:06:26', NULL),
(2, 1, 'Nha hang nay co mon nhau ngon tuyet', 3, NULL, 1, '2011-11-10 09:39:36', '2011-11-10 09:39:41', NULL),
(3, 1, 'Chia se thong tin cua ban ve dia diem nay', 1, NULL, 1, '2011-11-10 16:19:33', '2011-11-10 16:19:33', NULL),
(4, 1, 'Nha hang gia hoi dat', 1, NULL, 1, '2011-11-10 16:22:10', '2011-11-10 16:22:10', NULL),
(5, 1, 'Chia se thong tin cua ban ve dia diem nay', 1, NULL, 1, '2011-11-10 16:29:49', '2011-11-10 16:29:49', NULL),
(6, 1, 'nha hang nay khuan vien cung rong, khong qua on ao giua long thu do', 1, NULL, 1, '2011-11-10 16:37:58', '2011-11-10 16:37:58', NULL),
(7, 1, 'hom truoc ban minh to chuc sinh nhat o day, vui  lam, hihi', 1, NULL, 1, '2011-11-10 16:40:07', '2011-11-10 16:40:07', NULL),
(8, 1, 'Chia se thong tin cua ban ve dia diem nay', 1, NULL, 1, '2011-11-11 11:14:01', '2011-11-11 11:14:01', NULL),
(9, 1, 'Chia se thong tin cua ban ve dia diem naysdferstswe', 1, NULL, 1, '2011-11-11 11:36:49', '2011-11-11 11:36:49', NULL),
(10, 1, 'Chia se thong tin cua ban ve dia diem nayfádfádfád', 1, NULL, 1, '2011-11-11 11:47:32', '2011-11-11 11:47:32', NULL),
(11, 1, 'gàgsdfgsfdgsdf', 1, NULL, 1, '2011-11-11 11:48:32', '2011-11-11 11:48:32', NULL),
(12, 1, 'fgsdfgdhdjfgh', 1, NULL, 1, '2011-11-11 11:51:33', '2011-11-11 11:51:33', NULL),
(13, 1, 'Chia se thong tin cua ban ve dia diem nay', 1, NULL, 1, '2011-11-11 14:44:59', '2011-11-11 14:44:59', NULL),
(14, 1, 'jdhfsjdfhsjd hfsdkjf sdfsdfsd', 1, NULL, 1, '2011-11-11 14:45:16', '2011-11-11 14:45:16', NULL),
(15, 1, 'sdfgsdfgsdfgsđfgsdf', 1, NULL, 1, '2011-11-11 14:58:49', '2011-11-11 14:58:49', NULL),
(16, 2, 'fdgsdffgsdf', 1, NULL, 1, '2011-11-21 15:20:36', '2011-11-21 15:20:36', NULL),
(17, 35, 'fgsdfgsdfgs', 1, NULL, 1, '2011-12-05 11:55:39', '2011-12-05 11:55:39', NULL),
(18, 35, 'gsfdgsdfgsfd', 1, NULL, 1, '2011-12-05 11:56:03', '2011-12-05 11:56:03', NULL),
(19, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:08:57', '2011-12-05 17:08:57', NULL),
(20, 1, 'fgdgsdfgsdf', 1, NULL, 1, '2011-12-05 17:09:17', '2011-12-05 17:09:17', NULL),
(21, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:12:11', '2011-12-05 17:12:11', NULL),
(22, 1, 'gsfdgasdfasd', 1, NULL, 1, '2011-12-05 17:13:48', '2011-12-05 17:13:48', NULL),
(23, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:15:46', '2011-12-05 17:15:46', NULL),
(24, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:16:36', '2011-12-05 17:16:36', NULL),
(25, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:18:25', '2011-12-05 17:18:25', NULL),
(26, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:19:55', '2011-12-05 17:19:55', NULL),
(27, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:38:30', '2011-12-05 17:38:30', NULL),
(28, 1, 'gfagsfgá', 1, NULL, 1, '2011-12-05 17:38:50', '2011-12-05 17:38:50', NULL),
(29, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:39:55', '2011-12-05 17:39:55', NULL),
(30, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:43:29', '2011-12-05 17:43:29', NULL),
(31, 35, 'dgágádgádgadsg', 1, NULL, 1, '2011-12-05 17:44:59', '2011-12-05 17:44:59', NULL),
(32, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:46:08', '2011-12-05 17:46:08', NULL),
(33, 35, 'sđhgsdhdghdrthdrtỷe', 1, NULL, 1, '2011-12-05 17:48:52', '2011-12-05 17:48:52', NULL),
(34, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:53:38', '2011-12-05 17:53:38', NULL),
(35, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:54:12', '2011-12-05 17:54:12', NULL),
(36, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 09:32:05', '2011-12-07 09:32:05', NULL),
(37, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 09:52:13', '2011-12-07 09:52:13', NULL),
(38, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:05:14', '2011-12-07 10:05:14', NULL),
(39, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:11:30', '2011-12-07 10:11:30', NULL),
(40, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:27:09', '2011-12-07 10:27:09', NULL),
(41, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:27:16', '2011-12-07 10:27:16', NULL),
(42, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:55:24', '2011-12-07 10:55:24', NULL),
(43, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 11:00:06', '2011-12-07 11:00:06', NULL),
(44, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 08:29:39', '2011-12-09 08:29:39', NULL),
(45, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 08:32:07', '2011-12-09 08:32:07', NULL),
(46, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 08:53:49', '2011-12-09 08:53:49', NULL),
(47, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 09:03:03', '2011-12-09 09:03:03', NULL),
(48, 35, 'tesst', 1, NULL, 1, '2011-12-09 09:18:04', '2011-12-09 09:18:04', NULL),
(49, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 09:39:03', '2011-12-09 09:39:03', NULL),
(50, 35, 'fgskdf;lkgs;lldfkgl;skdfl;gksd', 1, NULL, 1, '2011-12-09 09:44:19', '2011-12-09 09:44:19', NULL),
(51, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 09:48:36', '2011-12-09 09:48:36', NULL),
(52, 35, 'nhà trọ này giá rẻ lại tiện nghi', 1, NULL, 1, '2011-12-09 09:50:44', '2011-12-09 09:50:44', NULL),
(53, 35, 'Nhà trọ này khá rộng, và sạch sẽ', 1, NULL, 1, '2011-12-09 10:00:56', '2011-12-09 10:00:56', NULL),
(54, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:06:39', '2011-12-09 10:06:39', NULL),
(55, 35, 'Cho thuê nhà trọ giá rẻ bất ngờ', 1, NULL, 1, '2011-12-09 10:09:54', '2011-12-09 10:09:54', NULL),
(56, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:13:35', '2011-12-09 10:13:35', NULL),
(57, 35, 'fdlgk;lsdfkg;skd;glskdl;', 1, NULL, 1, '2011-12-09 10:16:42', '2011-12-09 10:16:42', NULL),
(58, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:19:40', '2011-12-09 10:19:40', NULL),
(59, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:38:32', '2011-12-09 10:38:32', NULL),
(60, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:39:18', '2011-12-09 10:39:18', NULL),
(61, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:41:48', '2011-12-09 10:41:48', NULL),
(62, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:46:28', '2011-12-09 10:46:28', NULL),
(63, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:47:12', '2011-12-09 10:47:12', NULL),
(64, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:11:44', '2011-12-09 11:11:44', NULL),
(65, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:12:43', '2011-12-09 11:12:43', NULL),
(66, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:30:21', '2011-12-09 11:30:21', NULL),
(67, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:32:24', '2011-12-09 11:32:24', NULL),
(68, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:34:46', '2011-12-09 11:34:46', NULL),
(69, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:39:03', '2011-12-09 11:39:03', NULL),
(70, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:45:08', '2011-12-09 11:45:08', NULL),
(71, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:45:14', '2011-12-09 11:45:14', NULL),
(72, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:46:14', '2011-12-09 11:46:14', NULL),
(73, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:02', '2011-12-09 12:14:02', NULL),
(74, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:04', '2011-12-09 12:14:04', NULL),
(75, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:06', '2011-12-09 12:14:06', NULL),
(76, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:07', '2011-12-09 12:14:07', NULL),
(77, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:28', '2011-12-09 12:14:28', NULL),
(78, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:29', '2011-12-09 12:14:29', NULL),
(79, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:35', '2011-12-09 12:14:35', NULL),
(80, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:36', '2011-12-09 12:14:36', NULL),
(81, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:37', '2011-12-09 12:14:37', NULL),
(82, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 13:37:44', '2011-12-09 13:37:44', NULL),
(83, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 17:19:24', '2011-12-09 17:19:24', NULL),
(84, 35, 'sgsdfgsdff', 1, NULL, 1, '2011-12-09 17:19:43', '2011-12-09 17:19:43', NULL),
(85, 35, 'sgsdfgsdff', 1, NULL, 1, '2011-12-09 17:20:02', '2011-12-09 17:20:02', NULL),
(86, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 17:20:29', '2011-12-09 17:20:29', NULL),
(87, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 17:25:51', '2011-12-09 17:25:51', NULL),
(88, 35, 'kgjfdlkgjalksjdgkládjd', 1, NULL, 1, '2011-12-09 17:27:16', '2011-12-09 17:27:16', NULL),
(89, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 17:29:36', '2011-12-09 17:29:36', NULL),
(90, 35, 'dfgsdfgsdfgsdfgsd', 1, NULL, 1, '2011-12-09 17:37:11', '2011-12-09 17:37:11', NULL),
(91, 35, 'nhà trọ cho thuê', 1, NULL, 1, '2011-12-09 17:43:10', '2011-12-09 17:43:10', NULL),
(92, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-10 08:41:06', '2011-12-10 08:41:06', NULL),
(93, 35, 'fákd;lfka;slkf;lád', 1, NULL, 1, '2011-12-15 08:35:52', '2011-12-15 08:35:52', NULL),
(94, 35, 'fákd;lfka;slkf;lád', 1, NULL, 1, '2011-12-15 08:35:59', '2011-12-15 08:35:59', NULL),
(95, 35, 'jfdkgjsdflkgjslkdfjgks', 1, NULL, 1, '2011-12-15 08:41:31', '2011-12-15 08:41:31', NULL),
(96, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-15 08:49:07', '2011-12-15 08:49:07', NULL),
(97, 35, 'dfshdsgfhdfghdf', 1, NULL, 1, '2011-12-15 09:01:53', '2011-12-15 09:01:53', NULL),
(98, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-19 14:44:30', '2011-12-19 14:44:30', NULL),
(99, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-19 15:10:36', '2011-12-19 15:10:36', NULL),
(100, 35, 'gàgsdfgsdfgs', 1, NULL, 1, '2011-12-20 09:14:29', '2011-12-20 09:14:29', NULL),
(101, 35, 'hello, how are you', 1, NULL, 1, '2011-12-20 09:15:24', '2011-12-20 09:15:24', NULL),
(102, 130, 'vfhgjhkj hklh k lj k', 1, NULL, 1, '2011-12-29 20:50:59', '2011-12-29 20:50:59', NULL),
(103, 135, 'skfjslkafjlsafsd sdfsdfsa', 1, NULL, 1, '2012-01-03 19:25:57', '2012-01-03 19:25:57', NULL),
(104, 4, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2012-01-05 10:17:02', '2012-01-05 10:17:02', NULL),
(105, 2, 'vui qua', 1, NULL, 1, '2012-01-05 10:17:37', '2012-01-05 10:17:37', NULL),
(106, 4, 'hgthtfyuytu', 1, NULL, 1, '2012-01-05 10:17:54', '2012-01-05 10:17:54', NULL),
(107, 2, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2012-01-09 14:09:16', '2012-01-09 14:09:16', NULL),
(108, 2, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2012-01-09 14:27:17', '2012-01-09 14:27:17', NULL),
(109, 2, 'alo ko so vo ', 9, NULL, 1, '2012-01-14 11:10:18', '2012-01-14 11:10:18', NULL),
(110, 2, 'alo ko so vo ', 9, NULL, 1, '2012-01-14 11:10:21', '2012-01-14 11:10:21', NULL),
(111, 2, 'alo ko so vo ', 9, NULL, 1, '2012-01-14 11:10:22', '2012-01-14 11:10:22', NULL),
(112, 2, 'alo ko so vo ', 9, NULL, 1, '2012-01-14 11:10:23', '2012-01-14 11:10:23', NULL),
(113, 2, 'alo ko so vo ', 9, NULL, 1, '2012-01-14 11:10:23', '2012-01-14 11:10:23', NULL),
(114, 2, 'alo kosovo', 9, NULL, 1, '2012-01-14 11:10:28', '2012-01-14 11:10:28', NULL),
(115, 2, 'alo kosovo', 9, NULL, 1, '2012-01-14 11:10:29', '2012-01-14 11:10:29', NULL),
(116, 2, 'alo kosovo', 9, NULL, 1, '2012-01-14 11:10:30', '2012-01-14 11:10:30', NULL),
(117, 2, 'alo kosovo', 9, NULL, 1, '2012-01-14 11:10:30', '2012-01-14 11:10:30', NULL),
(118, 2, 'alo kosovo', 9, NULL, 1, '2012-01-14 11:10:31', '2012-01-14 11:10:31', NULL),
(119, 2, 'alo kosovo', 9, NULL, 1, '2012-01-14 11:10:31', '2012-01-14 11:10:31', NULL),
(120, 2, 'alo kosovo', 9, NULL, 1, '2012-01-14 11:10:31', '2012-01-14 11:10:31', NULL),
(121, 678, 'Quán nhỏ xinh, tấp nập quá', 1, NULL, 1, '2012-01-18 07:39:27', '2012-01-18 07:39:27', NULL),
(122, 1319, 'dia diem dep day', 1, NULL, 1, '2012-01-25 18:36:38', '2012-01-25 18:36:38', NULL),
(123, 1349, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-01 10:21:19', '2012-02-01 10:21:19', NULL),
(124, 678, 'quan nay duoc', 1, NULL, 1, '2012-02-06 18:12:42', '2012-02-06 18:12:42', NULL),
(125, 1355, 'Cảm nhận của bạn về địa điểm', 18, NULL, 1, '2012-02-09 08:46:40', '2012-02-09 08:46:40', 1),
(126, 1355, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-09 08:48:01', '2012-02-09 08:48:01', 1),
(127, 1360, 'char ra cai j', 29, NULL, 1, '2012-02-09 08:59:23', '2012-02-09 08:59:23', 1337),
(128, 1360, 'abc', 1, NULL, 1, '2012-02-09 09:00:28', '2012-02-09 09:00:28', 1337),
(129, 1375, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-13 09:52:31', '2012-02-13 09:52:31', 1),
(130, 1375, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-13 09:54:10', '2012-02-13 09:54:10', 1),
(131, 1369, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-13 10:33:32', '2012-02-13 10:33:32', 4),
(132, 1371, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-14 09:41:27', '2012-02-14 09:41:27', 1),
(133, 1371, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-14 09:41:32', '2012-02-14 09:41:32', 1),
(134, 1371, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-14 09:41:37', '2012-02-14 09:41:37', 1),
(135, 1371, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-14 09:41:43', '2012-02-14 09:41:43', 1),
(136, 1371, 'Cảm nhận của bạn về địa điểm', 1, NULL, 1, '2012-02-14 09:43:04', '2012-02-14 09:43:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_follow`
--

CREATE TABLE IF NOT EXISTS `pos_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos_follow',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'status is of pos_follow',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_public` int(1) NOT NULL DEFAULT '1' COMMENT 'Public Flag',
  `pos_category_id` int(11) DEFAULT NULL COMMENT 'id identifies category',
  PRIMARY KEY (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `pos_category_id_idx` (`pos_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `pos_follow`
--

INSERT INTO `pos_follow` (`id`, `pos_id`, `member_id`, `status`, `created_at`, `updated_at`, `is_public`, `pos_category_id`) VALUES
(1, 1, 1, 0, '2011-11-07 16:06:49', '2012-02-01 10:21:33', 1, NULL),
(2, 1, 3, 1, '2011-11-07 16:09:36', '2011-12-31 12:04:16', 1, NULL),
(3, 1, 15, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(4, 2, 1, 0, '2011-11-21 15:25:00', '2012-02-01 10:21:33', 1, NULL),
(8, 3, 1, 0, '2011-11-22 09:57:07', '2012-02-01 10:21:33', 1, NULL),
(9, 5, 1, 0, '2011-11-22 10:01:33', '2012-02-01 10:21:33', 1, NULL),
(10, 4, 1, 0, '2011-11-22 10:10:47', '2012-02-01 10:21:33', 1, NULL),
(11, 23, 1, 0, '2011-11-22 15:17:15', '2012-02-01 10:21:33', 1, NULL),
(12, 22, 1, 0, '2011-11-22 15:21:53', '2012-02-01 10:21:33', 1, NULL),
(13, 22, 1, 0, '2011-11-22 15:22:10', '2012-02-01 10:21:33', 1, NULL),
(14, 21, 1, 0, '2011-11-22 15:24:41', '2012-02-01 10:21:33', 1, NULL),
(15, 25, 18, 0, '2011-11-22 15:48:19', '2012-02-09 08:46:25', 1, NULL),
(16, 25, 1, 0, '2011-11-25 10:52:43', '2012-02-01 10:21:33', 1, NULL),
(17, 26, 18, 0, '2011-11-25 11:05:04', '2012-02-09 08:46:25', 1, NULL),
(18, 27, 18, 0, '2011-11-25 11:06:33', '2012-02-09 08:46:25', 1, NULL),
(19, 27, 1, 0, '2011-11-25 11:07:33', '2012-02-01 10:21:33', 1, NULL),
(20, 28, 3, 1, '2011-11-25 11:09:01', '2011-12-31 12:04:16', 1, NULL),
(21, 28, 1, 0, '2011-11-25 11:10:42', '2012-02-01 10:21:33', 1, NULL),
(22, 29, 1, 0, '2011-11-29 13:52:49', '2012-02-01 10:21:33', 1, NULL),
(23, 30, 1, 0, '2011-11-29 13:53:53', '2012-02-01 10:21:33', 1, NULL),
(24, 30, 1, 0, '2011-11-29 13:53:54', '2012-02-01 10:21:33', 1, NULL),
(25, 30, 1, 0, '2011-11-29 13:53:56', '2012-02-01 10:21:33', 1, NULL),
(26, 30, 1, 0, '2011-11-29 13:53:58', '2012-02-01 10:21:33', 1, NULL),
(27, 30, 1, 0, '2011-11-29 13:54:00', '2012-02-01 10:21:33', 1, NULL),
(28, 30, 1, 0, '2011-11-29 13:54:02', '2012-02-01 10:21:33', 1, NULL),
(29, 30, 1, 0, '2011-11-29 13:54:03', '2012-02-01 10:21:33', 1, NULL),
(30, 30, 1, 0, '2011-11-29 13:54:05', '2012-02-01 10:21:33', 1, NULL),
(31, 31, 1, 0, '2011-11-29 13:58:41', '2012-02-01 10:21:33', 1, NULL),
(32, 31, 1, 0, '2011-11-29 13:58:43', '2012-02-01 10:21:33', 1, NULL),
(33, 31, 1, 0, '2011-11-29 13:58:45', '2012-02-01 10:21:33', 1, NULL),
(34, 31, 1, 0, '2011-11-29 13:58:46', '2012-02-01 10:21:33', 1, NULL),
(35, 31, 1, 0, '2011-11-29 13:58:48', '2012-02-01 10:21:33', 1, NULL),
(36, 32, 1, 0, '2011-11-29 14:05:13', '2012-02-01 10:21:33', 1, NULL),
(37, 33, 1, 0, '2011-11-29 16:33:23', '2012-02-01 10:21:33', 1, NULL),
(38, 34, 1, 0, '2011-12-01 14:23:11', '2012-02-01 10:21:33', 1, NULL),
(39, 35, 1, 0, '2011-12-01 16:05:00', '2012-02-01 10:21:33', 1, NULL),
(40, 35, 18, 0, '0000-00-00 00:00:00', '2012-02-09 08:46:25', 1, NULL),
(41, 35, 18, 0, '2011-12-05 09:12:05', '2012-02-09 08:46:25', 1, NULL),
(42, 36, 1, 0, '2011-12-16 13:40:28', '2012-02-01 10:21:33', 1, NULL),
(43, 101, 1, 0, '2011-12-23 11:00:51', '2012-02-01 10:21:33', 1, NULL),
(44, 130, 1, 0, '2011-12-29 20:50:53', '2012-02-01 10:21:33', 1, NULL),
(45, 3, 3, 1, '2011-12-31 12:04:16', '2011-12-31 12:04:16', 1, NULL),
(46, 2, 18, 0, '2012-01-09 14:01:23', '2012-02-09 08:46:25', 1, NULL),
(47, 1337, 1, 0, '2012-01-16 16:01:59', '2012-02-01 10:21:33', 1, NULL),
(48, 1334, 1, 0, '2012-01-25 18:41:44', '2012-02-01 10:21:33', 1, NULL),
(49, 1344, 1, 0, '2012-01-31 17:07:12', '2012-02-01 10:21:33', 1, NULL),
(50, 1344, 1, 0, '2012-01-31 17:07:31', '2012-02-01 10:21:33', 1, NULL),
(51, 1343, 1, 0, '2012-01-31 17:12:59', '2012-02-01 10:21:33', 1, NULL),
(52, 1342, 1, 0, '2012-01-31 17:17:28', '2012-02-01 10:21:33', 1, NULL),
(53, 1345, 1, 0, '2012-01-31 17:20:14', '2012-02-01 10:21:33', 1, NULL),
(54, 1349, 1, 1, '2012-02-01 10:21:33', '2012-02-01 10:21:33', 1, NULL),
(55, 1355, 18, 1, '2012-02-09 08:46:25', '2012-02-09 08:46:25', 1, 1),
(56, 1360, 29, 1, '2012-02-09 08:59:11', '2012-02-09 08:59:11', 1, 1337),
(57, 1375, 18, 1, '2012-02-13 09:53:31', '2012-02-13 09:53:31', 1, 1),
(58, 1371, 1, 1, '2012-02-14 09:44:03', '2012-02-14 09:44:03', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_google`
--

CREATE TABLE IF NOT EXISTS `pos_google` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos',
  `cid` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'id of pos google',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'title is of pos',
  `description` text COLLATE utf8_unicode_ci COMMENT 'desc is of pos',
  `address` text COLLATE utf8_unicode_ci COMMENT 'address is of pos',
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tel is of pos',
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'website is of pos',
  `lat` double(18,6) DEFAULT NULL COMMENT 'latitude theo google map',
  `lng` double(18,6) DEFAULT NULL COMMENT 'longitude theo google map',
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tags is of pos',
  `place_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Place url',
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'File image url',
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id identifies category',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'trang thai xu ly of dia diem',
  `keyword` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id identifies category',
  `url_search` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url lay thong tin',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'File url',
  `flow_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flow_id_idx` (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pos_google`
--


-- --------------------------------------------------------

--
-- Table structure for table `pos_google_area`
--

CREATE TABLE IF NOT EXISTS `pos_google_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos',
  `lat` double(18,15) DEFAULT NULL COMMENT 'latitude theo google map',
  `lng` double(18,15) DEFAULT NULL COMMENT 'longitude theo google map',
  `radius` float(18,2) NOT NULL DEFAULT '0.00' COMMENT 'ban kinh luoi',
  `url` text COLLATE utf8_unicode_ci COMMENT 'url lay thong tin',
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id identifies category',
  `radius_area` smallint(6) NOT NULL DEFAULT '0' COMMENT 'trang thai of dia diem',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'trang thai of dia diem',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `min_radius_area` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=883 ;

--
-- Dumping data for table `pos_google_area`
--

INSERT INTO `pos_google_area` (`id`, `lat`, `lng`, `radius`, `url`, `area`, `radius_area`, `status`, `created_at`, `updated_at`, `min_radius_area`) VALUES
(442, 21.011124337540000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:44', '2012-01-13 09:25:44', 0),
(443, 21.011124337540000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:44', '2012-01-13 09:25:44', 0),
(444, 21.011124337540000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:44', '2012-01-13 09:25:44', 0),
(445, 21.011124337540000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:44', '2012-01-13 09:25:44', 0),
(446, 21.011124337540000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:44', '2012-01-13 09:25:44', 0),
(447, 21.011124337540000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:44', '2012-01-13 09:25:44', 0),
(448, 21.011124337540000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:44', '2012-01-13 09:25:44', 0),
(449, 21.011124337540000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(450, 21.011124337540000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(451, 21.011124337540000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(452, 21.011124337540000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(453, 21.011124337540000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(454, 21.011124337540000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(455, 21.011124337540000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(456, 21.011124337540000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(457, 21.011124337540000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:45', '2012-01-13 09:25:45', 0),
(458, 21.011124337540000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(459, 21.011124337540000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(460, 21.011124337540000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(461, 21.011124337540000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(462, 21.011124337540000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.01112433754,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(463, 21.025876028745003, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(464, 20.996372646334002, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(465, 21.040627719951000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(466, 20.981620955129000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(467, 21.055379411156000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:46', '2012-01-13 09:25:46', 0),
(468, 20.966869263924000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(469, 21.070131102361003, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(470, 20.952117572718000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(471, 21.084882793567000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(472, 20.937365881513000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(473, 21.099634484772000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(474, 20.922614190307005, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(475, 21.114386175978000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(476, 20.907862499102000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(477, 21.129137867183000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:47', '2012-01-13 09:25:47', 0),
(478, 20.893110807897000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(479, 21.143889558388008, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(480, 20.878359116691000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(481, 21.158641249594000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(482, 20.863607425486000, 105.838937841190030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.83893784119&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(483, 21.025876028745003, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(484, 20.996372646334002, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(485, 21.040627719951000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(486, 20.981620955129000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:48', '2012-01-13 09:25:48', 0),
(487, 21.055379411156000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:49', '2012-01-13 09:25:49', 0),
(488, 20.966869263924000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:49', '2012-01-13 09:25:49', 0),
(489, 21.070131102361003, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:49', '2012-01-13 09:25:49', 0),
(490, 20.952117572718000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:49', '2012-01-13 09:25:49', 0),
(491, 21.084882793567000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:49', '2012-01-13 09:25:49', 0),
(492, 20.937365881513000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:49', '2012-01-13 09:25:49', 0),
(493, 21.099634484772000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:49', '2012-01-13 09:25:49', 0),
(494, 20.922614190307005, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:49', '2012-01-13 09:25:49', 0),
(495, 21.114386175978000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(496, 20.907862499102000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(497, 21.129137867183000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(498, 20.893110807897000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(499, 21.143889558388008, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(500, 20.878359116691000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(501, 21.158641249594000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(502, 20.863607425486000, 105.854740219389980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.85474021939&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(503, 21.025876028745003, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:50', '2012-01-13 09:25:50', 0),
(504, 20.996372646334002, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:51', '2012-01-13 09:25:51', 0),
(505, 21.040627719951000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:51', '2012-01-13 09:25:51', 0),
(506, 20.981620955129000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:51', '2012-01-13 09:25:51', 0),
(507, 21.055379411156000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:51', '2012-01-13 09:25:51', 0),
(508, 20.966869263924000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:51', '2012-01-13 09:25:51', 0),
(509, 21.070131102361003, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:51', '2012-01-13 09:25:51', 0),
(510, 20.952117572718000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:51', '2012-01-13 09:25:51', 0),
(511, 21.084882793567000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:51', '2012-01-13 09:25:51', 0),
(512, 20.937365881513000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:52', '2012-01-13 09:25:52', 0),
(513, 21.099634484772000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:52', '2012-01-13 09:25:52', 0),
(514, 20.922614190307005, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:52', '2012-01-13 09:25:52', 0),
(515, 21.114386175978000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:52', '2012-01-13 09:25:52', 0),
(516, 20.907862499102000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:52', '2012-01-13 09:25:52', 0),
(517, 21.129137867183000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:52', '2012-01-13 09:25:52', 0),
(518, 20.893110807897000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:52', '2012-01-13 09:25:52', 0),
(519, 21.143889558388008, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:52', '2012-01-13 09:25:52', 0),
(520, 20.878359116691000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:53', '2012-01-13 09:25:53', 0),
(521, 21.158641249594000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:53', '2012-01-13 09:25:53', 0),
(522, 20.863607425486000, 105.823135462979990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.82313546298&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:53', '2012-01-13 09:25:53', 0),
(523, 21.025876028745003, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:53', '2012-01-13 09:25:53', 0),
(524, 20.996372646334002, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:53', '2012-01-13 09:25:53', 0),
(525, 21.040627719951000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:53', '2012-01-13 09:25:53', 0),
(526, 20.981620955129000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:53', '2012-01-13 09:25:53', 0),
(527, 21.055379411156000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:53', '2012-01-13 09:25:53', 0),
(528, 20.966869263924000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:54', '2012-01-13 09:25:54', 0),
(529, 21.070131102361003, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:55', '2012-01-13 09:25:55', 0),
(530, 20.952117572718000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:55', '2012-01-13 09:25:55', 0),
(531, 21.084882793567000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:55', '2012-01-13 09:25:55', 0),
(532, 20.937365881513000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:55', '2012-01-13 09:25:55', 0),
(533, 21.099634484772000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:55', '2012-01-13 09:25:55', 0),
(534, 20.922614190307005, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:55', '2012-01-13 09:25:55', 0),
(535, 21.114386175978000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:55', '2012-01-13 09:25:55', 0),
(536, 20.907862499102000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:55', '2012-01-13 09:25:55', 0),
(537, 21.129137867183000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:56', '2012-01-13 09:25:56', 0),
(538, 20.893110807897000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:56', '2012-01-13 09:25:56', 0),
(539, 21.143889558388008, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:56', '2012-01-13 09:25:56', 0),
(540, 20.878359116691000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:56', '2012-01-13 09:25:56', 0),
(541, 21.158641249594000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:56', '2012-01-13 09:25:56', 0),
(542, 20.863607425486000, 105.870542597600020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.8705425976&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:56', '2012-01-13 09:25:56', 0),
(543, 21.025876028745003, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:56', '2012-01-13 09:25:56', 0),
(544, 20.996372646334002, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:56', '2012-01-13 09:25:56', 0),
(545, 21.040627719951000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:57', '2012-01-13 09:25:57', 0),
(546, 20.981620955129000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:57', '2012-01-13 09:25:57', 0),
(547, 21.055379411156000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:57', '2012-01-13 09:25:57', 0),
(548, 20.966869263924000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:57', '2012-01-13 09:25:57', 0),
(549, 21.070131102361003, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:57', '2012-01-13 09:25:57', 0),
(550, 20.952117572718000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:57', '2012-01-13 09:25:57', 0),
(551, 21.084882793567000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:57', '2012-01-13 09:25:57', 0),
(552, 20.937365881513000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:58', '2012-01-13 09:25:58', 0),
(553, 21.099634484772000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:58', '2012-01-13 09:25:58', 0),
(554, 20.922614190307005, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:58', '2012-01-13 09:25:58', 0),
(555, 21.114386175978000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:58', '2012-01-13 09:25:58', 0),
(556, 20.907862499102000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:58', '2012-01-13 09:25:58', 0),
(557, 21.129137867183000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:58', '2012-01-13 09:25:58', 0),
(558, 20.893110807897000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:58', '2012-01-13 09:25:58', 0),
(559, 21.143889558388008, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:58', '2012-01-13 09:25:58', 0),
(560, 20.878359116691000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:59', '2012-01-13 09:25:59', 0),
(561, 21.158641249594000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:59', '2012-01-13 09:25:59', 0),
(562, 20.863607425486000, 105.807333084770000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.80733308477&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:59', '2012-01-13 09:25:59', 0),
(563, 21.025876028745003, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:59', '2012-01-13 09:25:59', 0),
(564, 20.996372646334002, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:59', '2012-01-13 09:25:59', 0),
(565, 21.040627719951000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:59', '2012-01-13 09:25:59', 0),
(566, 20.981620955129000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:59', '2012-01-13 09:25:59', 0),
(567, 21.055379411156000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:25:59', '2012-01-13 09:25:59', 0),
(568, 20.966869263924000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:00', '2012-01-13 09:26:00', 0);
INSERT INTO `pos_google_area` (`id`, `lat`, `lng`, `radius`, `url`, `area`, `radius_area`, `status`, `created_at`, `updated_at`, `min_radius_area`) VALUES
(569, 21.070131102361003, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:00', '2012-01-13 09:26:00', 0),
(570, 20.952117572718000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:00', '2012-01-13 09:26:00', 0),
(571, 21.084882793567000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:00', '2012-01-13 09:26:00', 0),
(572, 20.937365881513000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:00', '2012-01-13 09:26:00', 0),
(573, 21.099634484772000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:00', '2012-01-13 09:26:00', 0),
(574, 20.922614190307005, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:00', '2012-01-13 09:26:00', 0),
(575, 21.114386175978000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(576, 20.907862499102000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(577, 21.129137867183000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(578, 20.893110807897000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(579, 21.143889558388008, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(580, 20.878359116691000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(581, 21.158641249594000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(582, 20.863607425486000, 105.886344975809990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.88634497581&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(583, 21.025876028745003, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:01', '2012-01-13 09:26:01', 0),
(584, 20.996372646334002, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(585, 21.040627719951000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(586, 20.981620955129000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(587, 21.055379411156000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(588, 20.966869263924000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(589, 21.070131102361003, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(590, 20.952117572718000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(591, 21.084882793567000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(592, 20.937365881513000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:02', '2012-01-13 09:26:02', 0),
(593, 21.099634484772000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(594, 20.922614190307005, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(595, 21.114386175978000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(596, 20.907862499102000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(597, 21.129137867183000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(598, 20.893110807897000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(599, 21.143889558388008, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(600, 20.878359116691000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(601, 21.158641249594000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:03', '2012-01-13 09:26:03', 0),
(602, 20.863607425486000, 105.791530706570000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.79153070657&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:04', '2012-01-13 09:26:04', 0),
(603, 21.025876028745003, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:04', '2012-01-13 09:26:04', 0),
(604, 20.996372646334002, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:04', '2012-01-13 09:26:04', 0),
(605, 21.040627719951000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:04', '2012-01-13 09:26:04', 0),
(606, 20.981620955129000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:04', '2012-01-13 09:26:04', 0),
(607, 21.055379411156000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:04', '2012-01-13 09:26:04', 0),
(608, 20.966869263924000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:04', '2012-01-13 09:26:04', 0),
(609, 21.070131102361003, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:04', '2012-01-13 09:26:04', 0),
(610, 20.952117572718000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:05', '2012-01-13 09:26:05', 0),
(611, 21.084882793567000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:05', '2012-01-13 09:26:05', 0),
(612, 20.937365881513000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:05', '2012-01-13 09:26:05', 0),
(613, 21.099634484772000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:05', '2012-01-13 09:26:05', 0),
(614, 20.922614190307005, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:05', '2012-01-13 09:26:05', 0),
(615, 21.114386175978000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:06', '2012-01-13 09:26:06', 0),
(616, 20.907862499102000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:06', '2012-01-13 09:26:06', 0),
(617, 21.129137867183000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:06', '2012-01-13 09:26:06', 0),
(618, 20.893110807897000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:06', '2012-01-13 09:26:06', 0),
(619, 21.143889558388008, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:06', '2012-01-13 09:26:06', 0),
(620, 20.878359116691000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:06', '2012-01-13 09:26:06', 0),
(621, 21.158641249594000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:06', '2012-01-13 09:26:06', 0),
(622, 20.863607425486000, 105.902147354010000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.90214735401&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:06', '2012-01-13 09:26:06', 0),
(623, 21.025876028745003, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(624, 20.996372646334002, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(625, 21.040627719951000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(626, 20.981620955129000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(627, 21.055379411156000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(628, 20.966869263924000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(629, 21.070131102361003, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(630, 20.952117572718000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(631, 21.084882793567000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:07', '2012-01-13 09:26:07', 0),
(632, 20.937365881513000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(633, 21.099634484772000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(634, 20.922614190307005, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(635, 21.114386175978000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(636, 20.907862499102000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(637, 21.129137867183000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(638, 20.893110807897000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(639, 21.143889558388008, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(640, 20.878359116691000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:08', '2012-01-13 09:26:08', 0),
(641, 21.158641249594000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:09', '2012-01-13 09:26:09', 0),
(642, 20.863607425486000, 105.775728328360000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.77572832836&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:09', '2012-01-13 09:26:09', 0),
(643, 21.025876028745003, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:09', '2012-01-13 09:26:09', 0),
(644, 20.996372646334002, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:09', '2012-01-13 09:26:09', 0),
(645, 21.040627719951000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:09', '2012-01-13 09:26:09', 0),
(646, 20.981620955129000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:09', '2012-01-13 09:26:09', 0),
(647, 21.055379411156000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:10', '2012-01-13 09:26:10', 0),
(648, 20.966869263924000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:10', '2012-01-13 09:26:10', 0),
(649, 21.070131102361003, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:10', '2012-01-13 09:26:10', 0),
(650, 20.952117572718000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:10', '2012-01-13 09:26:10', 0),
(651, 21.084882793567000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:10', '2012-01-13 09:26:10', 0),
(652, 20.937365881513000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:10', '2012-01-13 09:26:10', 0),
(653, 21.099634484772000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:10', '2012-01-13 09:26:10', 0),
(654, 20.922614190307005, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:10', '2012-01-13 09:26:10', 0),
(655, 21.114386175978000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:11', '2012-01-13 09:26:11', 0),
(656, 20.907862499102000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:11', '2012-01-13 09:26:11', 0),
(657, 21.129137867183000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:11', '2012-01-13 09:26:11', 0),
(658, 20.893110807897000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:11', '2012-01-13 09:26:11', 0),
(659, 21.143889558388008, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:11', '2012-01-13 09:26:11', 0),
(660, 20.878359116691000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:11', '2012-01-13 09:26:11', 0),
(661, 21.158641249594000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:11', '2012-01-13 09:26:11', 0),
(662, 20.863607425486000, 105.917949732220010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.91794973222&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:11', '2012-01-13 09:26:11', 0),
(663, 21.025876028745003, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:12', '2012-01-13 09:26:12', 0),
(664, 20.996372646334002, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:12', '2012-01-13 09:26:12', 0),
(665, 21.040627719951000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:12', '2012-01-13 09:26:12', 0),
(666, 20.981620955129000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:12', '2012-01-13 09:26:12', 0),
(667, 21.055379411156000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:12', '2012-01-13 09:26:12', 0),
(668, 20.966869263924000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:12', '2012-01-13 09:26:12', 0),
(669, 21.070131102361003, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:13', '2012-01-13 09:26:13', 0),
(670, 20.952117572718000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:13', '2012-01-13 09:26:13', 0),
(671, 21.084882793567000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:13', '2012-01-13 09:26:13', 0),
(672, 20.937365881513000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:13', '2012-01-13 09:26:13', 0),
(673, 21.099634484772000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:13', '2012-01-13 09:26:13', 0),
(674, 20.922614190307005, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:14', '2012-01-13 09:26:14', 0),
(675, 21.114386175978000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:14', '2012-01-13 09:26:14', 0),
(676, 20.907862499102000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:14', '2012-01-13 09:26:14', 0),
(677, 21.129137867183000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:14', '2012-01-13 09:26:14', 0),
(678, 20.893110807897000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:14', '2012-01-13 09:26:14', 0),
(679, 21.143889558388008, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:14', '2012-01-13 09:26:14', 0),
(680, 20.878359116691000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:14', '2012-01-13 09:26:14', 0),
(681, 21.158641249594000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:15', '2012-01-13 09:26:15', 0),
(682, 20.863607425486000, 105.759925950150020, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.75992595015&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:15', '2012-01-13 09:26:15', 0),
(683, 21.025876028745003, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:15', '2012-01-13 09:26:15', 0),
(684, 20.996372646334002, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:15', '2012-01-13 09:26:15', 0),
(685, 21.040627719951000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:15', '2012-01-13 09:26:15', 0),
(686, 20.981620955129000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:15', '2012-01-13 09:26:15', 0),
(687, 21.055379411156000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:15', '2012-01-13 09:26:15', 0),
(688, 20.966869263924000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:15', '2012-01-13 09:26:15', 0),
(689, 21.070131102361003, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:16', '2012-01-13 09:26:16', 0),
(690, 20.952117572718000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:16', '2012-01-13 09:26:16', 0),
(691, 21.084882793567000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:16', '2012-01-13 09:26:16', 0),
(692, 20.937365881513000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:16', '2012-01-13 09:26:16', 0),
(693, 21.099634484772000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:16', '2012-01-13 09:26:16', 0),
(694, 20.922614190307005, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:17', '2012-01-13 09:26:17', 0),
(695, 21.114386175978000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:17', '2012-01-13 09:26:17', 0);
INSERT INTO `pos_google_area` (`id`, `lat`, `lng`, `radius`, `url`, `area`, `radius_area`, `status`, `created_at`, `updated_at`, `min_radius_area`) VALUES
(696, 20.907862499102000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:17', '2012-01-13 09:26:17', 0),
(697, 21.129137867183000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:17', '2012-01-13 09:26:17', 0),
(698, 20.893110807897000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:17', '2012-01-13 09:26:17', 0),
(699, 21.143889558388008, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:17', '2012-01-13 09:26:17', 0),
(700, 20.878359116691000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:18', '2012-01-13 09:26:18', 0),
(701, 21.158641249594000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:18', '2012-01-13 09:26:18', 0),
(702, 20.863607425486000, 105.933752110429990, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.93375211043&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:18', '2012-01-13 09:26:18', 0),
(703, 21.025876028745003, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:18', '2012-01-13 09:26:18', 0),
(704, 20.996372646334002, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:18', '2012-01-13 09:26:18', 0),
(705, 21.040627719951000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:18', '2012-01-13 09:26:18', 0),
(706, 20.981620955129000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:18', '2012-01-13 09:26:18', 0),
(707, 21.055379411156000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:18', '2012-01-13 09:26:18', 0),
(708, 20.966869263924000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:19', '2012-01-13 09:26:19', 0),
(709, 21.070131102361003, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:19', '2012-01-13 09:26:19', 0),
(710, 20.952117572718000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:19', '2012-01-13 09:26:19', 0),
(711, 21.084882793567000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:19', '2012-01-13 09:26:19', 0),
(712, 20.937365881513000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:19', '2012-01-13 09:26:19', 0),
(713, 21.099634484772000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:19', '2012-01-13 09:26:19', 0),
(714, 20.922614190307005, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(715, 21.114386175978000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(716, 20.907862499102000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(717, 21.129137867183000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(718, 20.893110807897000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(719, 21.143889558388008, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(720, 20.878359116691000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(721, 21.158641249594000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(722, 20.863607425486000, 105.744123571950000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.74412357195&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(723, 21.025876028745003, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:20', '2012-01-13 09:26:20', 0),
(724, 20.996372646334002, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:21', '2012-01-13 09:26:21', 0),
(725, 21.040627719951000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:21', '2012-01-13 09:26:21', 0),
(726, 20.981620955129000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:21', '2012-01-13 09:26:21', 0),
(727, 21.055379411156000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:21', '2012-01-13 09:26:21', 0),
(728, 20.966869263924000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:21', '2012-01-13 09:26:21', 0),
(729, 21.070131102361003, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:21', '2012-01-13 09:26:21', 0),
(730, 20.952117572718000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:21', '2012-01-13 09:26:21', 0),
(731, 21.084882793567000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:22', '2012-01-13 09:26:22', 0),
(732, 20.937365881513000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:22', '2012-01-13 09:26:22', 0),
(733, 21.099634484772000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:22', '2012-01-13 09:26:22', 0),
(734, 20.922614190307005, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:22', '2012-01-13 09:26:22', 0),
(735, 21.114386175978000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:22', '2012-01-13 09:26:22', 0),
(736, 20.907862499102000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:22', '2012-01-13 09:26:22', 0),
(737, 21.129137867183000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:23', '2012-01-13 09:26:23', 0),
(738, 20.893110807897000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:23', '2012-01-13 09:26:23', 0),
(739, 21.143889558388008, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:23', '2012-01-13 09:26:23', 0),
(740, 20.878359116691000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:23', '2012-01-13 09:26:23', 0),
(741, 21.158641249594000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:23', '2012-01-13 09:26:23', 0),
(742, 20.863607425486000, 105.949554488630000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.94955448863&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:23', '2012-01-13 09:26:23', 0),
(743, 21.025876028745003, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:24', '2012-01-13 09:26:24', 0),
(744, 20.996372646334002, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:24', '2012-01-13 09:26:24', 0),
(745, 21.040627719951000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:24', '2012-01-13 09:26:24', 0),
(746, 20.981620955129000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:24', '2012-01-13 09:26:24', 0),
(747, 21.055379411156000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:24', '2012-01-13 09:26:24', 0),
(748, 20.966869263924000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:24', '2012-01-13 09:26:24', 0),
(749, 21.070131102361003, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:24', '2012-01-13 09:26:24', 0),
(750, 20.952117572718000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:25', '2012-01-13 09:26:25', 0),
(751, 21.084882793567000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:25', '2012-01-13 09:26:25', 0),
(752, 20.937365881513000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:25', '2012-01-13 09:26:25', 0),
(753, 21.099634484772000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:25', '2012-01-13 09:26:25', 0),
(754, 20.922614190307005, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:25', '2012-01-13 09:26:25', 0),
(755, 21.114386175978000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:25', '2012-01-13 09:26:25', 0),
(756, 20.907862499102000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:25', '2012-01-13 09:26:25', 0),
(757, 21.129137867183000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:25', '2012-01-13 09:26:25', 0),
(758, 20.893110807897000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:26', '2012-01-13 09:26:26', 0),
(759, 21.143889558388008, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:26', '2012-01-13 09:26:26', 0),
(760, 20.878359116691000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:26', '2012-01-13 09:26:26', 0),
(761, 21.158641249594000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:26', '2012-01-13 09:26:26', 0),
(762, 20.863607425486000, 105.728321193739970, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.72832119374&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:26', '2012-01-13 09:26:26', 0),
(763, 21.025876028745003, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:27', '2012-01-13 09:26:27', 0),
(764, 20.996372646334002, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:27', '2012-01-13 09:26:27', 0),
(765, 21.040627719951000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:27', '2012-01-13 09:26:27', 0),
(766, 20.981620955129000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:27', '2012-01-13 09:26:27', 0),
(767, 21.055379411156000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:28', '2012-01-13 09:26:28', 0),
(768, 20.966869263924000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:28', '2012-01-13 09:26:28', 0),
(769, 21.070131102361003, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:28', '2012-01-13 09:26:28', 0),
(770, 20.952117572718000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:28', '2012-01-13 09:26:28', 0),
(771, 21.084882793567000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:28', '2012-01-13 09:26:28', 0),
(772, 20.937365881513000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:28', '2012-01-13 09:26:28', 0),
(773, 21.099634484772000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:28', '2012-01-13 09:26:28', 0),
(774, 20.922614190307005, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:29', '2012-01-13 09:26:29', 0),
(775, 21.114386175978000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:29', '2012-01-13 09:26:29', 0),
(776, 20.907862499102000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:29', '2012-01-13 09:26:29', 0),
(777, 21.129137867183000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:29', '2012-01-13 09:26:29', 0),
(778, 20.893110807897000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:29', '2012-01-13 09:26:29', 0),
(779, 21.143889558388008, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:29', '2012-01-13 09:26:29', 0),
(780, 20.878359116691000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:29', '2012-01-13 09:26:29', 0),
(781, 21.158641249594000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:30', '2012-01-13 09:26:30', 0),
(782, 20.863607425486000, 105.965356866839980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.96535686684&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:30', '2012-01-13 09:26:30', 0),
(783, 21.025876028745003, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:30', '2012-01-13 09:26:30', 0),
(784, 20.996372646334002, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:30', '2012-01-13 09:26:30', 0),
(785, 21.040627719951000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:30', '2012-01-13 09:26:30', 0),
(786, 20.981620955129000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:30', '2012-01-13 09:26:30', 0),
(787, 21.055379411156000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:30', '2012-01-13 09:26:30', 0),
(788, 20.966869263924000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:31', '2012-01-13 09:26:31', 0),
(789, 21.070131102361003, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:31', '2012-01-13 09:26:31', 0),
(790, 20.952117572718000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:31', '2012-01-13 09:26:31', 0),
(791, 21.084882793567000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:31', '2012-01-13 09:26:31', 0),
(792, 20.937365881513000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:31', '2012-01-13 09:26:31', 0),
(793, 21.099634484772000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:31', '2012-01-13 09:26:31', 0),
(794, 20.922614190307005, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:32', '2012-01-13 09:26:32', 0),
(795, 21.114386175978000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:32', '2012-01-13 09:26:32', 0),
(796, 20.907862499102000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:32', '2012-01-13 09:26:32', 0),
(797, 21.129137867183000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:32', '2012-01-13 09:26:32', 0),
(798, 20.893110807897000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:32', '2012-01-13 09:26:32', 0),
(799, 21.143889558388008, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:32', '2012-01-13 09:26:32', 0),
(800, 20.878359116691000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:33', '2012-01-13 09:26:33', 0),
(801, 21.158641249594000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:33', '2012-01-13 09:26:33', 0),
(802, 20.863607425486000, 105.712518815530000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.71251881553&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:33', '2012-01-13 09:26:33', 0),
(803, 21.025876028745003, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:33', '2012-01-13 09:26:33', 0),
(804, 20.996372646334002, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:33', '2012-01-13 09:26:33', 0),
(805, 21.040627719951000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:33', '2012-01-13 09:26:33', 0),
(806, 20.981620955129000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:34', '2012-01-13 09:26:34', 0),
(807, 21.055379411156000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:34', '2012-01-13 09:26:34', 0),
(808, 20.966869263924000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:34', '2012-01-13 09:26:34', 0),
(809, 21.070131102361003, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:34', '2012-01-13 09:26:34', 0),
(810, 20.952117572718000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:35', '2012-01-13 09:26:35', 0),
(811, 21.084882793567000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:35', '2012-01-13 09:26:35', 0),
(812, 20.937365881513000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:35', '2012-01-13 09:26:35', 0),
(813, 21.099634484772000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:35', '2012-01-13 09:26:35', 0),
(814, 20.922614190307005, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:36', '2012-01-13 09:26:36', 0),
(815, 21.114386175978000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:36', '2012-01-13 09:26:36', 0),
(816, 20.907862499102000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:36', '2012-01-13 09:26:36', 0),
(817, 21.129137867183000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:36', '2012-01-13 09:26:36', 0),
(818, 20.893110807897000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:37', '2012-01-13 09:26:37', 0),
(819, 21.143889558388008, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:37', '2012-01-13 09:26:37', 0),
(820, 20.878359116691000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:37', '2012-01-13 09:26:37', 0),
(821, 21.158641249594000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:38', '2012-01-13 09:26:38', 0),
(822, 20.863607425486000, 105.981159245050010, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.98115924505&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:38', '2012-01-13 09:26:38', 0);
INSERT INTO `pos_google_area` (`id`, `lat`, `lng`, `radius`, `url`, `area`, `radius_area`, `status`, `created_at`, `updated_at`, `min_radius_area`) VALUES
(823, 21.025876028745003, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:39', '2012-01-13 09:26:39', 0),
(824, 20.996372646334002, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:39', '2012-01-13 09:26:39', 0),
(825, 21.040627719951000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:39', '2012-01-13 09:26:39', 0),
(826, 20.981620955129000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:40', '2012-01-13 09:26:40', 0),
(827, 21.055379411156000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:40', '2012-01-13 09:26:40', 0),
(828, 20.966869263924000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:40', '2012-01-13 09:26:40', 0),
(829, 21.070131102361003, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:40', '2012-01-13 09:26:40', 0),
(830, 20.952117572718000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:40', '2012-01-13 09:26:40', 0),
(831, 21.084882793567000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:41', '2012-01-13 09:26:41', 0),
(832, 20.937365881513000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:41', '2012-01-13 09:26:41', 0),
(833, 21.099634484772000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:41', '2012-01-13 09:26:41', 0),
(834, 20.922614190307005, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:41', '2012-01-13 09:26:41', 0),
(835, 21.114386175978000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:41', '2012-01-13 09:26:41', 0),
(836, 20.907862499102000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:41', '2012-01-13 09:26:41', 0),
(837, 21.129137867183000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(838, 20.893110807897000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(839, 21.143889558388008, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(840, 20.878359116691000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(841, 21.158641249594000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(842, 20.863607425486000, 105.696716437329980, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.69671643733&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(843, 21.025876028745003, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(844, 20.996372646334002, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(845, 21.040627719951000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:42', '2012-01-13 09:26:42', 0),
(846, 20.981620955129000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:43', '2012-01-13 09:26:43', 0),
(847, 21.055379411156000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:43', '2012-01-13 09:26:43', 0),
(848, 20.966869263924000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:43', '2012-01-13 09:26:43', 0),
(849, 21.070131102361003, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:43', '2012-01-13 09:26:43', 0),
(850, 20.952117572718000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:43', '2012-01-13 09:26:43', 0),
(851, 21.084882793567000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:43', '2012-01-13 09:26:43', 0),
(852, 20.937365881513000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:44', '2012-01-13 09:26:44', 0),
(853, 21.099634484772000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:44', '2012-01-13 09:26:44', 0),
(854, 20.922614190307005, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:44', '2012-01-13 09:26:44', 0),
(855, 21.114386175978000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:44', '2012-01-13 09:26:44', 0),
(856, 20.907862499102000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:44', '2012-01-13 09:26:44', 0),
(857, 21.129137867183000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:44', '2012-01-13 09:26:44', 0),
(858, 20.893110807897000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:44', '2012-01-13 09:26:44', 0),
(859, 21.143889558388008, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:45', '2012-01-13 09:26:45', 0),
(860, 20.878359116691000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:45', '2012-01-13 09:26:45', 0),
(861, 21.158641249594000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:45', '2012-01-13 09:26:45', 0),
(862, 20.863607425486000, 105.996961623250030, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.99696162325&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:45', '2012-01-13 09:26:45', 0),
(863, 21.025876028745003, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.025876028745,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:45', '2012-01-13 09:26:45', 0),
(864, 20.996372646334002, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.996372646334,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:45', '2012-01-13 09:26:45', 0),
(865, 21.040627719951000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.040627719951,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:46', '2012-01-13 09:26:46', 0),
(866, 20.981620955129000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.981620955129,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:46', '2012-01-13 09:26:46', 0),
(867, 21.055379411156000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.055379411156,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:46', '2012-01-13 09:26:46', 0),
(868, 20.966869263924000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.966869263924,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:46', '2012-01-13 09:26:46', 0),
(869, 21.070131102361003, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.070131102361,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:46', '2012-01-13 09:26:46', 0),
(870, 20.952117572718000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.952117572718,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:46', '2012-01-13 09:26:46', 0),
(871, 21.084882793567000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.084882793567,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(872, 20.937365881513000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.937365881513,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(873, 21.099634484772000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.099634484772,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(874, 20.922614190307005, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.922614190307,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(875, 21.114386175978000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.114386175978,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(876, 20.907862499102000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.907862499102,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(877, 21.129137867183000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.129137867183,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(878, 20.893110807897000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.893110807897,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(879, 21.143889558388008, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.143889558388,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:47', '2012-01-13 09:26:47', 0),
(880, 20.878359116691000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.878359116691,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:48', '2012-01-13 09:26:48', 0),
(881, 21.158641249594000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=21.158641249594,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:48', '2012-01-13 09:26:48', 0),
(882, 20.863607425486000, 105.680914059120000, 0.82, 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=20.863607425486,105.68091405912&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=0.82&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA', 'hanoi', 17, 0, '2012-01-13 09:26:48', '2012-01-13 09:26:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pos_google_flow`
--

CREATE TABLE IF NOT EXISTS `pos_google_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos',
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id identifies category',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'trang thai of dia diem',
  `keyword` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id identifies category',
  `url` text COLLATE utf8_unicode_ci COMMENT 'url lay thong tin',
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id identifies category',
  `stop` int(11) NOT NULL DEFAULT '0' COMMENT 'trang thai of dia diem',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `size_area` int(11) NOT NULL DEFAULT '0',
  `max_content` int(11) NOT NULL DEFAULT '0',
  `size_content` int(11) NOT NULL DEFAULT '0',
  `timeout_content` int(11) NOT NULL DEFAULT '100000',
  `timeout_pos` int(11) NOT NULL DEFAULT '100000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pos_google_flow`
--

INSERT INTO `pos_google_flow` (`id`, `category`, `status`, `keyword`, `url`, `area`, `stop`, `created_at`, `updated_at`, `size_area`, `max_content`, `size_content`, `timeout_content`, `timeout_pos`) VALUES
(1, 'pos_cafe', 2, 'cafe', '', 'hanoi', 0, '2012-01-13 09:32:06', '2012-01-14 08:26:07', 0, 0, 0, 100000, 100000),
(2, 'pos_karaoke', 0, 'karaoke', '', 'hanoi', 21, '2012-01-14 08:21:01', '2012-01-14 09:27:16', 0, 0, 0, 100000, 100000),
(3, 'pos_company', 0, 'công+ty', '', 'hanoi', 23, '2012-01-17 11:27:13', '2012-01-17 11:58:50', 1, 200, 100, 20000, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `pos_google_flow_content`
--

CREATE TABLE IF NOT EXISTS `pos_google_flow_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'trang thai of dia diem',
  `url` text COLLATE utf8_unicode_ci COMMENT 'url lay thong tin',
  `area_id` int(11) NOT NULL COMMENT 'id identifies area',
  `start` int(11) NOT NULL DEFAULT '0' COMMENT 'trang thai of dia diem',
  `flow_id` int(11) NOT NULL COMMENT 'id identifies area',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'File url',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flow_id_idx` (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pos_google_flow_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `pos_log`
--

CREATE TABLE IF NOT EXISTS `pos_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos_log',
  `pos_id` int(11) DEFAULT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `object_id` int(11) DEFAULT NULL COMMENT 'id của tác động',
  `action_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên các tác động lên địa điểm',
  `is_public` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=163 ;

--
-- Dumping data for table `pos_log`
--

INSERT INTO `pos_log` (`id`, `pos_id`, `member_id`, `created_at`, `updated_at`, `object_id`, `action_name`, `is_public`) VALUES
(1, 1, 1, '2011-11-07 16:08:16', '2011-11-07 16:08:22', NULL, NULL, 1),
(2, 4, 3, '2011-12-31 11:51:53', '2011-12-31 11:51:53', 76, 'action_checkin', 1),
(3, 3, 3, '2011-12-31 12:04:16', '2011-12-31 12:04:16', 45, 'action_follow', 1),
(4, 3, 3, '2011-12-31 12:04:19', '2011-12-31 12:04:19', 77, 'action_checkin', 1),
(5, 135, 1, '2012-01-03 19:25:58', '2012-01-03 19:25:58', 103, 'action_comment', 1),
(6, 4, 1, '2012-01-05 10:17:03', '2012-01-05 10:17:03', 104, 'action_comment', 1),
(7, 2, 1, '2012-01-05 10:17:37', '2012-01-05 10:17:37', 105, 'action_comment', 1),
(8, 4, 1, '2012-01-05 10:17:54', '2012-01-05 10:17:54', 106, 'action_comment', 1),
(9, 136, 1, '2012-01-06 17:56:37', '2012-01-06 17:56:37', 132, 'action_post_photo_pos', 1),
(10, 2, 18, '2012-01-09 14:01:23', '2012-01-09 14:01:23', 46, 'action_follow', 1),
(11, 2, 1, '2012-01-09 14:09:16', '2012-01-09 14:09:16', 107, 'action_comment', 1),
(12, 2, 1, '2012-01-09 14:27:17', '2012-01-09 14:27:17', 108, 'action_comment', 1),
(13, 136, 1, '2012-01-13 17:13:18', '2012-01-13 17:13:18', 78, 'action_checkin', 1),
(14, 136, 1, '2012-01-13 17:13:36', '2012-01-13 17:13:36', 133, 'action_post_photo_pos', 1),
(15, 28, 1, '2012-01-13 17:14:50', '2012-01-13 17:14:50', 79, 'action_checkin', 1),
(16, 2, 9, '2012-01-14 11:10:18', '2012-01-14 11:10:18', 109, 'action_comment', 1),
(17, 2, 9, '2012-01-14 11:10:21', '2012-01-14 11:10:21', 110, 'action_comment', 1),
(18, 2, 9, '2012-01-14 11:10:22', '2012-01-14 11:10:22', 111, 'action_comment', 1),
(19, 2, 9, '2012-01-14 11:10:23', '2012-01-14 11:10:23', 112, 'action_comment', 1),
(20, 2, 9, '2012-01-14 11:10:23', '2012-01-14 11:10:23', 113, 'action_comment', 1),
(21, 2, 9, '2012-01-14 11:10:28', '2012-01-14 11:10:28', 114, 'action_comment', 1),
(22, 2, 9, '2012-01-14 11:10:29', '2012-01-14 11:10:29', 115, 'action_comment', 1),
(23, 2, 9, '2012-01-14 11:10:30', '2012-01-14 11:10:30', 116, 'action_comment', 1),
(24, 2, 9, '2012-01-14 11:10:30', '2012-01-14 11:10:30', 117, 'action_comment', 1),
(25, 2, 9, '2012-01-14 11:10:31', '2012-01-14 11:10:31', 118, 'action_comment', 1),
(26, 2, 9, '2012-01-14 11:10:31', '2012-01-14 11:10:31', 119, 'action_comment', 1),
(27, 2, 9, '2012-01-14 11:10:31', '2012-01-14 11:10:31', 120, 'action_comment', 1),
(28, NULL, 1, '2012-01-16 15:57:20', '2012-01-16 15:57:20', 1337, 'action_post_pos', 1),
(29, 1337, 1, '2012-01-16 16:01:49', '2012-01-16 16:01:49', 80, 'action_checkin', 1),
(30, 1337, 1, '2012-01-16 16:01:59', '2012-01-16 16:01:59', 47, 'action_follow', 1),
(31, NULL, 1, '2012-01-16 16:26:57', '2012-01-16 16:26:57', 1338, 'action_post_pos', 1),
(32, NULL, 1, '2012-01-16 17:44:54', '2012-01-16 17:44:54', 1339, 'action_post_pos', 1),
(33, 1340, 1, '2012-01-16 17:46:15', '2012-01-16 17:46:15', 102, 'action_post_house', 1),
(34, 1340, 1, '2012-01-16 17:46:41', '2012-01-16 17:46:41', 134, 'action_post_photo_pos', 1),
(35, 1340, 1, '2012-01-16 17:47:47', '2012-01-16 17:47:47', 135, 'action_post_photo_pos', 1),
(36, NULL, 1, '2012-01-17 11:01:41', '2012-01-17 11:01:41', 1341, 'action_post_pos', 1),
(37, 1319, 3, '2012-01-17 11:14:54', '2012-01-17 11:14:54', 81, 'action_checkin', 1),
(38, 1319, 1, '2012-01-17 11:19:20', '2012-01-17 11:19:20', 136, 'action_post_photo_pos', 1),
(39, 1319, 1, '2012-01-17 11:19:35', '2012-01-17 11:19:35', 137, 'action_post_photo_pos', 1),
(40, 1325, 1, '2012-01-17 14:23:01', '2012-01-17 14:23:01', 82, 'action_checkin', 1),
(41, 1325, 1, '2012-01-17 14:23:08', '2012-01-17 14:23:08', 83, 'action_checkin', 1),
(42, 1325, 1, '2012-01-17 14:23:10', '2012-01-17 14:23:10', 84, 'action_checkin', 1),
(43, 1325, 1, '2012-01-17 14:23:10', '2012-01-17 14:23:10', 85, 'action_checkin', 1),
(44, 1325, 1, '2012-01-17 14:23:10', '2012-01-17 14:23:10', 86, 'action_checkin', 1),
(45, 1325, 1, '2012-01-17 14:23:11', '2012-01-17 14:23:11', 87, 'action_checkin', 1),
(46, 1325, 1, '2012-01-17 14:23:11', '2012-01-17 14:23:11', 88, 'action_checkin', 1),
(47, 1325, 1, '2012-01-17 14:23:11', '2012-01-17 14:23:11', 89, 'action_checkin', 1),
(48, 1325, 1, '2012-01-17 14:23:12', '2012-01-17 14:23:12', 90, 'action_checkin', 1),
(49, NULL, 1, '2012-01-17 15:02:00', '2012-01-17 15:02:00', 1342, 'action_post_pos', 1),
(50, 1341, 1, '2012-01-17 16:37:42', '2012-01-17 16:37:42', 91, 'action_checkin', 1),
(51, 678, 1, '2012-01-18 07:39:00', '2012-01-18 07:39:00', 138, 'action_post_photo_pos', 1),
(52, 678, 1, '2012-01-18 07:39:30', '2012-01-18 07:39:30', 121, 'action_comment', 1),
(53, 678, 1, '2012-01-18 09:32:04', '2012-01-18 09:32:04', 139, 'action_post_photo_pos', 1),
(54, 1319, 1, '2012-01-25 18:36:39', '2012-01-25 18:36:39', 122, 'action_comment', 1),
(55, 1334, 1, '2012-01-25 18:41:44', '2012-01-25 18:41:44', 48, 'action_follow', 1),
(56, NULL, 1, '2012-01-31 17:00:44', '2012-01-31 17:00:44', 1343, 'action_post_pos', 1),
(57, NULL, 1, '2012-01-31 17:00:45', '2012-01-31 17:00:45', 1344, 'action_post_pos', 1),
(58, 1344, 1, '2012-01-31 17:06:28', '2012-01-31 17:06:28', 92, 'action_checkin', 1),
(59, 1344, 1, '2012-01-31 17:07:12', '2012-01-31 17:07:12', 49, 'action_follow', 1),
(60, 1344, 1, '2012-01-31 17:07:31', '2012-01-31 17:07:31', 50, 'action_follow', 1),
(61, 1344, 1, '2012-01-31 17:11:19', '2012-01-31 17:11:19', 93, 'action_checkin', 1),
(62, 1343, 1, '2012-01-31 17:12:53', '2012-01-31 17:12:53', 94, 'action_checkin', 1),
(63, 1343, 1, '2012-01-31 17:12:59', '2012-01-31 17:12:59', 51, 'action_follow', 1),
(64, 1342, 1, '2012-01-31 17:17:28', '2012-01-31 17:17:28', 52, 'action_follow', 1),
(65, NULL, 1, '2012-01-31 17:20:02', '2012-01-31 17:20:02', 1345, 'action_post_pos', 1),
(66, 1345, 1, '2012-01-31 17:20:10', '2012-01-31 17:20:10', 95, 'action_checkin', 1),
(67, 1345, 1, '2012-01-31 17:20:14', '2012-01-31 17:20:14', 53, 'action_follow', 1),
(68, 1346, 1, '2012-01-31 17:32:43', '2012-01-31 17:32:43', 103, 'action_post_house', 1),
(69, 1346, 1, '2012-01-31 17:33:06', '2012-01-31 17:33:06', 140, 'action_post_photo_pos', 1),
(70, 1347, 1, '2012-01-31 17:38:19', '2012-01-31 17:38:19', 104, 'action_post_house', 1),
(71, 1348, 1, '2012-01-31 17:57:33', '2012-01-31 17:57:33', 105, 'action_post_house', 1),
(72, NULL, 1, '2012-02-01 10:04:45', '2012-02-01 10:04:45', 1349, 'action_post_pos', 1),
(73, 1349, 1, '2012-02-01 10:17:30', '2012-02-01 10:17:30', 141, 'action_post_photo_pos', 1),
(74, 1349, 1, '2012-02-01 10:21:19', '2012-02-01 10:21:19', 123, 'action_comment', 1),
(75, 1349, 1, '2012-02-01 10:21:30', '2012-02-01 10:21:30', 96, 'action_checkin', 1),
(76, 1349, 1, '2012-02-01 10:21:33', '2012-02-01 10:21:33', 54, 'action_follow', 1),
(77, 1350, 1, '2012-02-01 11:53:52', '2012-02-01 11:53:52', 106, 'action_post_house', 1),
(78, 1351, 1, '2012-02-01 14:44:33', '2012-02-01 14:44:33', 107, 'action_post_house', 1),
(79, 1351, 1, '2012-02-02 09:41:01', '2012-02-02 09:41:01', 97, 'action_checkin', 1),
(80, 1352, 1, '2012-02-02 09:43:41', '2012-02-02 09:43:41', 108, 'action_post_house', 1),
(81, NULL, 1, '2012-02-02 09:54:16', '2012-02-02 09:54:16', 1353, 'action_post_pos', 1),
(82, 1354, 1, '2012-02-02 09:55:02', '2012-02-02 09:55:02', 109, 'action_post_house', 1),
(83, 1355, 1, '2012-02-02 09:57:15', '2012-02-02 09:57:15', 110, 'action_post_house', 1),
(84, 1355, 1, '2012-02-03 14:00:36', '2012-02-03 14:00:36', 142, 'action_post_photo_pos', 1),
(85, 1355, 1, '2012-02-03 14:02:23', '2012-02-03 14:02:23', 143, 'action_post_photo_pos', 1),
(86, 1356, 1, '2012-02-03 14:03:11', '2012-02-03 14:03:11', 111, 'action_post_house', 1),
(87, 1356, 1, '2012-02-03 14:03:28', '2012-02-03 14:03:28', 144, 'action_post_photo_pos', 1),
(88, 1356, 1, '2012-02-03 14:08:30', '2012-02-03 14:08:30', 145, 'action_post_photo_pos', 1),
(89, 1357, 1, '2012-02-03 14:09:01', '2012-02-03 14:09:01', 112, 'action_post_house', 1),
(90, 1357, 1, '2012-02-03 14:09:08', '2012-02-03 14:09:08', 146, 'action_post_photo_pos', 1),
(91, 1358, 1, '2012-02-06 13:51:16', '2012-02-06 13:51:16', 113, 'action_post_house', 1),
(92, 1359, 1, '2012-02-06 15:11:23', '2012-02-06 15:11:23', 114, 'action_post_house', 1),
(93, NULL, 1, '2012-02-06 17:12:04', '2012-02-06 17:12:04', 1360, 'action_post_pos', 1),
(94, 678, 1, '2012-02-06 18:12:42', '2012-02-06 18:12:42', 124, 'action_comment', 1),
(95, 1355, 18, '2012-02-09 08:46:25', '2012-02-09 08:46:25', 55, 'action_follow', 1),
(96, 1355, 18, '2012-02-09 08:46:40', '2012-02-09 08:46:40', 125, 'action_comment', 1),
(97, 1355, 1, '2012-02-09 08:48:01', '2012-02-09 08:48:01', 126, 'action_comment', 1),
(98, 1360, 29, '2012-02-09 08:59:11', '2012-02-09 08:59:11', 56, 'action_follow', 1),
(99, 1360, 29, '2012-02-09 08:59:23', '2012-02-09 08:59:23', 127, 'action_comment', 1),
(100, 1360, 1, '2012-02-09 09:00:28', '2012-02-09 09:00:28', 128, 'action_comment', 1),
(101, NULL, 1, '2012-02-10 17:30:18', '2012-02-10 17:30:18', 1364, 'action_post_pos', 1),
(102, NULL, 1, '2012-02-10 17:33:39', '2012-02-10 17:33:39', 1365, 'action_post_pos', 1),
(103, 1366, 1, '2012-02-10 17:52:51', '2012-02-10 17:52:51', 118, 'action_post_house', 1),
(104, 1367, 1, '2012-02-10 17:57:09', '2012-02-10 17:57:09', 119, 'action_post_house', 1),
(105, 1368, 1, '2012-02-11 08:53:04', '2012-02-11 08:53:04', 120, 'action_post_house', 1),
(106, NULL, 1, '2012-02-11 08:55:09', '2012-02-11 08:55:09', 1369, 'action_post_pos', 1),
(107, 1370, 1, '2012-02-11 09:43:06', '2012-02-11 09:43:06', 121, 'action_post_house', 1),
(108, 1371, 1, '2012-02-11 10:58:36', '2012-02-11 10:58:36', 122, 'action_post_house', 1),
(109, 1372, 1, '2012-02-11 10:59:42', '2012-02-11 10:59:42', 123, 'action_post_house', 1),
(110, 1373, 1, '2012-02-11 11:01:46', '2012-02-11 11:01:46', 124, 'action_post_house', 1),
(111, 1374, 1, '2012-02-11 11:18:12', '2012-02-11 11:18:12', 125, 'action_post_house', 1),
(112, 1375, 1, '2012-02-11 11:32:45', '2012-02-11 11:32:45', 126, 'action_post_house', 1),
(113, 1375, 1, '2012-02-13 09:52:31', '2012-02-13 09:52:31', 129, 'action_comment', 1),
(114, 1375, 18, '2012-02-13 09:53:31', '2012-02-13 09:53:31', 57, 'action_follow', 1),
(115, 1375, 1, '2012-02-13 09:54:10', '2012-02-13 09:54:10', 130, 'action_comment', 1),
(116, 1369, 1, '2012-02-13 10:33:32', '2012-02-13 10:33:32', 131, 'action_comment', 1),
(117, 1371, 1, '2012-02-14 09:41:28', '2012-02-14 09:41:28', 132, 'action_comment', 1),
(118, 1371, 1, '2012-02-14 09:41:33', '2012-02-14 09:41:33', 133, 'action_comment', 1),
(119, 1371, 1, '2012-02-14 09:41:38', '2012-02-14 09:41:38', 134, 'action_comment', 1),
(120, 1371, 1, '2012-02-14 09:41:43', '2012-02-14 09:41:43', 135, 'action_comment', 1),
(121, 1371, 1, '2012-02-14 09:43:04', '2012-02-14 09:43:04', 136, 'action_comment', 1),
(122, 1371, 1, '2012-02-14 09:44:03', '2012-02-14 09:44:03', 58, 'action_follow', 1),
(123, 1369, 1, '2012-02-14 11:27:39', '2012-02-14 11:27:39', 98, 'action_checkin', 1),
(124, 1360, 1, '2012-02-14 11:30:20', '2012-02-14 11:30:20', 99, 'action_checkin', 1),
(125, 1301, 1, '2012-02-17 14:15:18', '2012-02-17 14:15:18', 100, 'action_checkin', 1),
(126, 1369, 18, '2012-02-17 14:23:00', '2012-02-17 14:23:00', 101, 'action_checkin', 1),
(127, 1222, 18, '2012-02-17 14:27:36', '2012-02-17 14:27:36', 102, 'action_checkin', 1),
(128, NULL, 1, '2012-02-27 08:30:21', '2012-02-27 08:30:21', 1376, 'action_post_pos', 1),
(129, NULL, 1, '2012-02-27 08:30:41', '2012-02-27 08:30:41', 1377, 'action_post_pos', 1),
(130, NULL, 1, '2012-02-27 08:30:42', '2012-02-27 08:30:42', 1378, 'action_post_pos', 1),
(131, NULL, 1, '2012-02-27 08:33:39', '2012-02-27 08:33:39', 1379, 'action_post_pos', 1),
(132, NULL, 1, '2012-02-27 08:38:04', '2012-02-27 08:38:04', 1380, 'action_post_pos', 1),
(133, NULL, 1, '2012-02-27 08:43:58', '2012-02-27 08:43:58', 1381, 'action_post_pos', 1),
(134, NULL, 1, '2012-02-27 08:45:29', '2012-02-27 08:45:29', 1382, 'action_post_pos', 1),
(135, NULL, 1, '2012-02-27 08:46:24', '2012-02-27 08:46:24', 1383, 'action_post_pos', 1),
(136, NULL, 1, '2012-02-27 08:50:47', '2012-02-27 08:50:47', 1384, 'action_post_pos', 1),
(137, NULL, 1, '2012-02-27 08:52:37', '2012-02-27 08:52:37', 1385, 'action_post_pos', 1),
(138, NULL, 1, '2012-02-27 08:52:40', '2012-02-27 08:52:40', 1386, 'action_post_pos', 1),
(139, NULL, 1, '2012-02-27 08:57:47', '2012-02-27 08:57:47', 1387, 'action_post_pos', 1),
(140, NULL, 1, '2012-02-27 08:57:51', '2012-02-27 08:57:51', 1388, 'action_post_pos', 1),
(141, NULL, 1, '2012-02-27 08:57:56', '2012-02-27 08:57:56', 1389, 'action_post_pos', 1),
(142, NULL, 1, '2012-02-27 08:57:58', '2012-02-27 08:57:58', 1390, 'action_post_pos', 1),
(143, NULL, 1, '2012-02-27 09:00:51', '2012-02-27 09:00:51', 1391, 'action_post_pos', 1),
(144, NULL, 1, '2012-02-27 09:07:51', '2012-02-27 09:07:51', 1392, 'action_post_pos', 1),
(145, NULL, 1, '2012-02-27 09:10:22', '2012-02-27 09:10:22', 1393, 'action_post_pos', 1),
(146, NULL, 1, '2012-02-27 09:13:58', '2012-02-27 09:13:58', 1394, 'action_post_pos', 1),
(147, NULL, 1, '2012-02-27 09:14:47', '2012-02-27 09:14:47', 1395, 'action_post_pos', 1),
(148, NULL, 1, '2012-02-27 09:14:51', '2012-02-27 09:14:51', 1396, 'action_post_pos', 1),
(149, NULL, 1, '2012-02-27 09:17:05', '2012-02-27 09:17:05', 1397, 'action_post_pos', 1),
(150, NULL, 1, '2012-02-27 09:17:08', '2012-02-27 09:17:08', 1398, 'action_post_pos', 1),
(151, NULL, 1, '2012-02-27 09:17:13', '2012-02-27 09:17:13', 1399, 'action_post_pos', 1),
(152, NULL, 1, '2012-02-27 09:17:19', '2012-02-27 09:17:19', 1400, 'action_post_pos', 1),
(153, NULL, 1, '2012-02-27 09:17:25', '2012-02-27 09:17:25', 1401, 'action_post_pos', 1),
(154, NULL, 1, '2012-02-27 09:20:35', '2012-02-27 09:20:35', 1402, 'action_post_pos', 1),
(155, NULL, 1, '2012-02-27 09:21:12', '2012-02-27 09:21:12', 1403, 'action_post_pos', 1),
(156, NULL, 1, '2012-02-27 09:21:13', '2012-02-27 09:21:13', 1404, 'action_post_pos', 1),
(157, NULL, 1, '2012-02-27 09:23:55', '2012-02-27 09:23:55', 1405, 'action_post_pos', 1),
(158, NULL, 1, '2012-02-27 09:44:09', '2012-02-27 09:44:09', 1406, 'action_post_pos', 1),
(159, NULL, 1, '2012-02-27 10:00:47', '2012-02-27 10:00:47', 1407, 'action_post_pos', 1),
(160, NULL, 1, '2012-02-27 10:04:26', '2012-02-27 10:04:26', 1408, 'action_post_pos', 1),
(161, NULL, 1, '2012-02-27 10:05:42', '2012-02-27 10:05:42', 1409, 'action_post_pos', 1),
(162, NULL, 1, '2012-02-29 08:09:40', '2012-02-29 08:09:40', 1410, 'action_post_pos', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_photo`
--

CREATE TABLE IF NOT EXISTS `pos_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos_photo',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `file_id` int(11) NOT NULL COMMENT 'File id',
  `claim_status` tinyint(4) DEFAULT NULL COMMENT 'claim_status is of pos_photo',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'status is of pos_photo',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_public` int(1) NOT NULL DEFAULT '1' COMMENT 'Public Flag',
  `description` text COMMENT 'desc is of pos photo',
  `pos_category_id` int(11) DEFAULT NULL COMMENT 'id identifies category',
  PRIMARY KEY (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`),
  KEY `pos_category_id_idx` (`pos_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=147 ;

--
-- Dumping data for table `pos_photo`
--

INSERT INTO `pos_photo` (`id`, `member_id`, `pos_id`, `file_id`, `claim_status`, `status`, `created_at`, `updated_at`, `is_public`, `description`, `pos_category_id`) VALUES
(2, 1, 1, 24, NULL, 1, '2011-11-07 16:10:08', '2011-11-07 16:10:14', 1, NULL, NULL),
(3, 1, 1, 7, NULL, 1, '2011-11-07 16:10:39', '2011-11-07 16:10:39', 1, NULL, NULL),
(4, 1, 1, 8, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(5, 1, 1, 9, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(6, 1, 1, 10, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(7, 1, 1, 11, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(8, 1, 1, 12, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(9, 1, 1, 13, NULL, 0, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(10, 1, 1, 14, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(11, 1, 1, 15, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(12, 1, 1, 16, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(13, 1, 1, 17, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(14, 1, 1, 18, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL, NULL),
(16, 1, 1, 67, NULL, 1, '2011-11-21 14:12:55', '2011-11-21 14:12:55', 1, NULL, NULL),
(17, 1, 1, 68, NULL, 1, '2011-11-21 14:35:47', '2011-11-21 14:35:47', 1, NULL, NULL),
(18, 1, 1, 69, NULL, 1, '2011-11-21 14:42:40', '2011-11-21 14:42:40', 1, NULL, NULL),
(19, 1, 1, 70, NULL, 1, '2011-11-21 14:48:37', '2011-11-21 14:48:37', 1, NULL, NULL),
(20, 1, 1, 71, NULL, 1, '2011-11-21 15:11:40', '2011-11-21 15:11:40', 1, NULL, NULL),
(21, 1, 1, 72, NULL, 1, '2011-11-21 15:12:46', '2011-11-21 15:12:46', 1, NULL, NULL),
(22, 1, 1, 73, NULL, 1, '2011-11-21 16:53:25', '2011-11-21 16:53:25', 1, NULL, NULL),
(23, 1, 1, 74, NULL, 1, '2011-11-21 17:32:16', '2011-11-21 17:32:16', 1, NULL, NULL),
(24, 1, 1, 75, NULL, 1, '2011-11-21 17:44:53', '2011-11-21 17:44:53', 1, NULL, NULL),
(25, 1, 1, 76, NULL, 1, '2011-11-21 17:45:18', '2011-11-21 17:45:18', 1, NULL, NULL),
(26, 1, 1, 77, NULL, 1, '2011-11-21 17:49:22', '2011-11-21 17:49:22', 1, NULL, NULL),
(27, 1, 1, 78, NULL, 1, '2011-11-21 17:49:30', '2011-11-21 17:49:30', 1, NULL, NULL),
(28, 1, 1, 79, NULL, 1, '2011-11-21 17:50:30', '2011-11-21 17:50:30', 1, NULL, NULL),
(29, 1, 1, 80, NULL, 1, '2011-11-22 14:03:02', '2011-11-22 14:03:02', 1, NULL, NULL),
(30, 1, 1, 81, NULL, 1, '2011-11-22 14:16:55', '2011-11-22 14:16:55', 1, NULL, NULL),
(31, 1, 1, 82, NULL, 1, '2011-11-22 14:18:13', '2011-11-22 14:18:13', 1, NULL, NULL),
(32, 18, 25, 83, NULL, 1, '2011-11-22 15:44:37', '2011-11-22 15:44:37', 1, NULL, NULL),
(33, 18, 25, 84, NULL, 1, '2011-11-22 15:45:45', '2011-11-22 15:45:45', 1, NULL, NULL),
(34, 1, 1, 85, NULL, 1, '2011-11-23 14:35:07', '2011-11-23 14:35:07', 1, NULL, NULL),
(35, 3, 28, 86, NULL, 1, '2011-11-25 11:09:25', '2011-11-25 11:09:25', 1, NULL, NULL),
(36, 1, 24, 87, NULL, 1, '2011-11-25 14:50:30', '2011-11-25 14:50:30', 1, NULL, NULL),
(37, 1, 24, 88, NULL, 1, '2011-11-25 14:53:22', '2011-11-25 14:53:22', 1, NULL, NULL),
(38, 1, 1, 89, NULL, 1, '2011-11-28 15:00:42', '2011-11-28 15:00:42', 1, NULL, NULL),
(39, 1, 1, 90, NULL, 1, '2011-11-28 15:30:05', '2011-11-28 15:30:05', 1, NULL, NULL),
(40, 1, 1, 91, NULL, 1, '2011-11-29 17:02:09', '2011-11-29 17:02:09', 1, NULL, NULL),
(41, 1, 34, 92, NULL, 1, '2011-12-01 10:47:25', '2011-12-01 10:47:25', 1, NULL, NULL),
(42, 1, 34, 93, NULL, 1, '2011-12-01 10:47:43', '2011-12-01 10:47:43', 1, NULL, NULL),
(43, 1, 34, 94, NULL, 1, '2011-12-01 11:14:36', '2011-12-01 11:14:36', 1, NULL, NULL),
(44, 1, 34, 95, NULL, 1, '2011-12-01 11:25:19', '2011-12-01 11:25:19', 1, NULL, NULL),
(45, 1, 34, 96, NULL, 1, '2011-12-01 11:25:49', '2011-12-01 11:25:49', 1, NULL, NULL),
(46, 1, 34, 97, NULL, 1, '2011-12-01 11:32:01', '2011-12-01 11:32:01', 1, NULL, NULL),
(47, 1, 34, 98, NULL, 1, '2011-12-01 11:32:22', '2011-12-01 11:32:22', 1, NULL, NULL),
(48, 1, 34, 99, NULL, 1, '2011-12-01 11:32:40', '2011-12-01 11:32:40', 1, NULL, NULL),
(49, 1, 34, 100, NULL, 1, '2011-12-01 11:32:47', '2011-12-01 11:32:47', 1, NULL, NULL),
(50, 1, 34, 101, NULL, 1, '2011-12-01 11:32:54', '2011-12-01 11:32:54', 1, NULL, NULL),
(51, 1, 34, 102, NULL, 1, '2011-12-01 11:35:47', '2011-12-01 11:35:47', 1, NULL, NULL),
(52, 1, 34, 103, NULL, 1, '2011-12-01 11:36:08', '2011-12-01 11:36:08', 1, NULL, NULL),
(53, 1, 34, 104, NULL, 1, '2011-12-01 11:36:19', '2011-12-01 11:36:19', 1, NULL, NULL),
(54, 1, 34, 105, NULL, 1, '2011-12-01 11:36:25', '2011-12-01 11:36:25', 1, NULL, NULL),
(55, 1, 32, 106, NULL, 1, '2011-12-01 15:20:16', '2011-12-01 15:20:16', 1, NULL, NULL),
(56, 1, 1, 107, NULL, 1, '2011-12-01 15:34:36', '2011-12-01 15:34:36', 1, NULL, NULL),
(57, 1, 35, 108, NULL, 1, '2011-12-02 16:14:16', '2011-12-02 16:14:16', 1, NULL, NULL),
(58, 1, 35, 109, NULL, 1, '2011-12-05 11:35:54', '2011-12-05 11:35:54', 1, NULL, NULL),
(59, 1, 35, 110, NULL, 1, '2011-12-09 11:49:55', '2011-12-09 11:49:55', 1, NULL, NULL),
(60, 1, 35, 111, NULL, 1, '2011-12-09 11:58:11', '2011-12-09 11:58:11', 1, NULL, NULL),
(61, 1, 35, 112, NULL, 1, '2011-12-09 11:58:43', '2011-12-09 11:58:43', 1, NULL, NULL),
(62, 1, 35, 113, NULL, 1, '2011-12-09 14:01:10', '2011-12-09 14:01:10', 1, NULL, NULL),
(63, 1, 35, 115, NULL, 1, '2011-12-10 10:04:18', '2011-12-10 10:04:18', 1, NULL, NULL),
(64, 1, 35, 116, NULL, 1, '2011-12-15 09:04:56', '2011-12-15 09:04:56', 1, NULL, NULL),
(65, 1, 35, 117, NULL, 1, '2011-12-15 09:06:00', '2011-12-15 09:06:00', 1, NULL, NULL),
(66, 1, 35, 118, NULL, 1, '2011-12-15 09:10:35', '2011-12-15 09:10:35', 1, NULL, NULL),
(67, 1, 2, 119, NULL, 1, '2011-12-19 12:00:00', '2011-12-19 12:00:00', 1, NULL, NULL),
(68, 1, 1, 120, NULL, 1, '2011-12-21 15:24:07', '2011-12-21 15:24:07', 1, NULL, NULL),
(69, 1, 41, 121, NULL, 1, '2011-12-21 15:37:02', '2011-12-21 15:37:02', 1, NULL, NULL),
(70, 1, 45, 123, NULL, 1, '2011-12-21 16:12:25', '2011-12-21 16:12:25', 1, NULL, NULL),
(71, 1, 47, 124, NULL, 1, '2011-12-21 16:20:55', '2011-12-21 16:20:55', 1, NULL, NULL),
(72, 1, 49, 125, NULL, 1, '2011-12-21 16:24:26', '2011-12-21 16:24:26', 1, NULL, NULL),
(73, 1, 51, 126, NULL, 1, '2011-12-21 16:28:52', '2011-12-21 16:28:52', 1, NULL, NULL),
(74, 1, 53, 127, NULL, 1, '2011-12-21 16:33:58', '2011-12-21 16:33:58', 1, NULL, NULL),
(75, 1, 55, 128, NULL, 1, '2011-12-21 16:35:15', '2011-12-21 16:35:15', 1, '1', NULL),
(76, 1, 57, 129, NULL, 1, '2011-12-21 16:41:14', '2011-12-21 16:41:14', 1, '1', NULL),
(77, 1, 59, 130, NULL, 1, '2011-12-21 16:49:33', '2011-12-21 16:49:33', 1, 'Mặt trước ngôi nhà', NULL),
(78, 1, 61, 131, NULL, 1, '2011-12-21 16:54:39', '2011-12-21 16:54:39', 1, 'Mặt trước ngôi nhà', NULL),
(79, 1, 63, 132, NULL, 1, '2011-12-21 17:00:05', '2011-12-21 17:00:05', 1, 'Mặt trước ngôi nhà', NULL),
(80, 1, 65, 133, NULL, 1, '2011-12-21 17:06:47', '2011-12-21 17:06:47', 1, 'Mặt trước ngôi nhà', NULL),
(81, 1, 67, 134, NULL, 1, '2011-12-21 17:19:17', '2011-12-21 17:19:17', 1, 'Mặt sau ngôi nhà', NULL),
(82, 1, 69, 135, NULL, 1, '2011-12-21 17:35:58', '2011-12-21 17:35:58', 1, 'Mặt trước', NULL),
(83, 1, 71, 136, NULL, 1, '2011-12-21 17:50:45', '2011-12-21 17:50:45', 1, 'fgsdfgs', NULL),
(84, 1, 73, 137, NULL, 1, '2011-12-21 18:04:01', '2011-12-21 18:04:01', 1, NULL, NULL),
(85, 1, 75, 138, NULL, 1, '2011-12-21 18:08:41', '2011-12-21 18:08:41', 1, 'etywertes', NULL),
(86, 1, 75, 139, NULL, 1, '2011-12-21 18:13:01', '2011-12-21 18:13:01', 1, 'etywertes', NULL),
(87, 1, 77, 140, NULL, 1, '2011-12-21 18:18:06', '2011-12-21 18:18:06', 1, NULL, NULL),
(88, 1, 77, 141, NULL, 1, '2011-12-21 18:19:28', '2011-12-21 18:19:28', 1, NULL, NULL),
(89, 1, 79, 142, NULL, 1, '2011-12-21 18:22:29', '2011-12-21 18:22:29', 1, NULL, NULL),
(90, 1, 81, 143, NULL, 1, '2011-12-21 18:25:08', '2011-12-21 18:25:08', 1, NULL, NULL),
(91, 1, 83, 144, NULL, 1, '2011-12-22 10:08:48', '2011-12-22 10:08:48', 1, 'Mặt trước ngôi nhà', NULL),
(92, 1, 87, 145, NULL, 1, '2011-12-22 10:27:38', '2011-12-22 10:27:38', 1, 'Mặt trước ngôi nhà', NULL),
(93, 1, 89, 146, NULL, 1, '2011-12-22 10:50:26', '2011-12-22 10:50:26', 1, 'Mặt trước ngôi nhà', NULL),
(94, 1, 91, 147, NULL, 1, '2011-12-22 10:53:03', '2011-12-22 10:53:03', 1, 'Mặt trước ngôi nhà', NULL),
(95, 1, 35, 148, NULL, 1, '2011-12-22 11:07:39', '2011-12-22 11:07:39', 1, NULL, NULL),
(96, 1, 35, 149, NULL, 1, '2011-12-22 11:09:32', '2011-12-22 11:09:32', 1, NULL, NULL),
(97, 1, 35, 150, NULL, 1, '2011-12-22 11:14:42', '2011-12-22 11:14:42', 1, NULL, NULL),
(98, 1, 35, 151, NULL, 1, '2011-12-22 11:17:15', '2011-12-22 11:17:15', 1, NULL, NULL),
(99, 1, 35, 152, NULL, 1, '2011-12-22 11:18:47', '2011-12-22 11:18:47', 1, NULL, NULL),
(100, 1, 35, 153, NULL, 1, '2011-12-22 11:21:05', '2011-12-22 11:21:05', 1, NULL, NULL),
(101, 1, 35, 154, NULL, 1, '2011-12-22 11:22:39', '2011-12-22 11:22:39', 1, NULL, NULL),
(102, 1, 35, 155, NULL, 1, '2011-12-22 11:25:07', '2011-12-22 11:25:07', 1, NULL, NULL),
(103, 1, 35, 156, NULL, 1, '2011-12-22 11:25:36', '2011-12-22 11:25:36', 1, NULL, NULL),
(104, 1, 35, 157, NULL, 1, '2011-12-22 11:25:50', '2011-12-22 11:25:50', 1, NULL, NULL),
(105, 1, 35, 158, NULL, 1, '2011-12-22 11:28:10', '2011-12-22 11:28:10', 1, NULL, NULL),
(106, 1, 35, 159, NULL, 1, '2011-12-22 11:28:24', '2011-12-22 11:28:24', 1, NULL, NULL),
(107, 1, 35, 160, NULL, 1, '2011-12-22 11:31:30', '2011-12-22 11:31:30', 1, NULL, NULL),
(108, 1, 35, 161, NULL, 1, '2011-12-22 11:31:48', '2011-12-22 11:31:48', 1, NULL, NULL),
(109, 1, 35, 162, NULL, 1, '2011-12-22 11:44:18', '2011-12-22 11:44:18', 1, NULL, NULL),
(110, 1, 35, 163, NULL, 1, '2011-12-22 11:44:32', '2011-12-22 11:44:32', 1, NULL, NULL),
(111, 1, 35, 164, NULL, 1, '2011-12-22 11:46:11', '2011-12-22 11:46:11', 1, NULL, NULL),
(112, 1, 35, 165, NULL, 1, '2011-12-22 11:48:40', '2011-12-22 11:48:40', 1, NULL, NULL),
(113, 1, 35, 166, NULL, 1, '2011-12-22 11:50:06', '2011-12-22 11:50:06', 1, NULL, NULL),
(114, 1, 35, 167, NULL, 1, '2011-12-22 11:53:47', '2011-12-22 11:53:47', 1, NULL, NULL),
(115, 1, 35, 168, NULL, 1, '2011-12-22 11:58:16', '2011-12-22 11:58:16', 1, NULL, NULL),
(116, 1, 35, 169, NULL, 1, '2011-12-22 14:12:19', '2011-12-22 14:12:19', 1, NULL, NULL),
(117, 1, 35, 170, NULL, 1, '2011-12-22 14:14:32', '2011-12-22 14:14:32', 1, NULL, NULL),
(118, 1, 35, 171, NULL, 1, '2011-12-22 14:15:40', '2011-12-22 14:15:40', 1, NULL, NULL),
(119, 1, 93, 172, NULL, 1, '2011-12-22 14:21:16', '2011-12-22 14:21:16', 1, NULL, NULL),
(120, 1, 95, 173, NULL, 1, '2011-12-22 14:31:12', '2011-12-22 14:31:12', 1, NULL, NULL),
(121, 1, 97, 174, NULL, 1, '2011-12-22 14:40:06', '2011-12-22 14:40:06', 1, NULL, NULL),
(122, 1, 99, 175, NULL, 1, '2011-12-22 14:57:40', '2011-12-22 14:57:40', 1, NULL, NULL),
(123, 1, 99, 176, NULL, 1, '2011-12-22 14:57:54', '2011-12-22 14:57:54', 1, NULL, NULL),
(124, 1, 101, 177, NULL, 1, '2011-12-22 15:30:29', '2011-12-22 15:30:30', 1, NULL, NULL),
(125, 1, 101, 178, NULL, 1, '2011-12-22 15:30:43', '2011-12-22 15:30:43', 1, NULL, NULL),
(126, 1, 103, 179, NULL, 1, '2011-12-22 15:34:28', '2011-12-22 15:34:28', 1, NULL, NULL),
(127, 1, 103, 180, NULL, 1, '2011-12-22 15:34:39', '2011-12-22 15:34:39', 1, NULL, NULL),
(128, 1, 127, 181, NULL, 1, '2011-12-27 17:32:14', '2011-12-27 17:32:14', 1, NULL, NULL),
(129, 1, 130, 184, NULL, 1, '2011-12-29 20:49:56', '2011-12-29 20:49:56', 1, NULL, NULL),
(130, 1, 135, 185, NULL, 1, '2011-12-29 20:53:37', '2011-12-29 20:53:37', 1, NULL, NULL),
(131, 1, 135, 186, NULL, 1, '2011-12-29 20:53:55', '2011-12-29 20:53:55', 1, NULL, NULL),
(132, 1, 136, 187, NULL, 1, '2012-01-06 17:56:37', '2012-01-06 17:56:37', 1, NULL, NULL),
(133, 1, 136, 190, NULL, 1, '2012-01-13 17:13:36', '2012-01-13 17:13:36', 1, NULL, NULL),
(134, 1, 1340, 373, NULL, 1, '2012-01-16 17:46:41', '2012-01-16 17:46:41', 1, NULL, NULL),
(135, 1, 1340, 374, NULL, 1, '2012-01-16 17:47:47', '2012-01-16 17:47:47', 1, NULL, NULL),
(136, 1, 1319, 375, NULL, 1, '2012-01-17 11:19:20', '2012-01-17 11:19:20', 1, NULL, NULL),
(137, 1, 1319, 376, NULL, 1, '2012-01-17 11:19:35', '2012-01-17 11:19:35', 1, NULL, NULL),
(138, 1, 678, 377, NULL, 1, '2012-01-18 07:38:59', '2012-01-18 07:38:59', 1, NULL, NULL),
(139, 1, 678, 378, NULL, 1, '2012-01-18 09:32:04', '2012-01-18 09:32:04', 1, NULL, NULL),
(140, 1, 1346, 380, NULL, 1, '2012-01-31 17:33:06', '2012-01-31 17:33:06', 1, NULL, NULL),
(141, 1, 1349, 381, NULL, 1, '2012-02-01 10:17:30', '2012-02-01 10:17:30', 1, NULL, NULL),
(143, 1, 1355, 383, NULL, 1, '2012-02-03 14:02:23', '2012-02-03 14:02:23', 1, NULL, NULL),
(144, 1, 1356, 384, NULL, 1, '2012-02-03 14:03:28', '2012-02-03 14:03:28', 1, NULL, NULL),
(145, 1, 1356, 385, NULL, 1, '2012-02-03 14:08:30', '2012-02-03 14:08:30', 1, NULL, NULL),
(146, 1, 1357, 386, NULL, 1, '2012-02-03 14:09:08', '2012-02-03 14:09:08', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_rent_house`
--

CREATE TABLE IF NOT EXISTS `pos_rent_house` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies posCategoryAtribute',
  `pos_id` int(11) NOT NULL COMMENT ' ',
  `price` float(5,1) DEFAULT NULL COMMENT 'Giá cho thuê nhà',
  `unit_price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'đơn vị giá',
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái còn hết phòng',
  `area` tinyint(6) DEFAULT NULL COMMENT 'diện tích phòng ',
  `unit_area` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'đơn vị diện tích',
  `num_room` tinyint(4) DEFAULT NULL COMMENT 'Số phòng ',
  `direction` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hướng nhà ',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên người liên hệ',
  `contact_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email liên hệ',
  `contact_tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `const_price_ranges` tinyint(4) DEFAULT NULL COMMENT 'Khoảng giá trị của giá nhà cho thuê ',
  PRIMARY KEY (`id`),
  KEY `pos_id_idx` (`pos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=127 ;

--
-- Dumping data for table `pos_rent_house`
--

INSERT INTO `pos_rent_house` (`id`, `pos_id`, `price`, `unit_price`, `status`, `area`, `unit_area`, `num_room`, `direction`, `created_at`, `updated_at`, `contact_name`, `contact_email`, `contact_tel`, `const_price_ranges`) VALUES
(1, 35, 2.0, 'triệu', 0, 40, 'm2', 3, 'Đông - Nam', '2011-12-02 15:00:32', '2011-12-15 10:52:06', 'C. Thanh', 'nguyenhue244@gmail.com', '0973956705', NULL),
(2, 36, 10.0, 'triệu', 1, 127, 'm2', 7, 'Đông - Nam', '2011-12-16 11:08:15', '2011-12-16 11:08:21', 'A.Thái', 'sns@example.com', '0169282115', NULL),
(3, 37, 2.0, 'triệu/tháng', 1, NULL, NULL, 1, NULL, '2011-12-20 10:13:13', '2011-12-20 10:13:13', 'c. Tuyết', 'nguyenhue244@gmail.com', '0973956705', NULL),
(4, 38, 4.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-20 11:56:20', '2011-12-20 11:56:20', 'LifeMap', 'sns@example.com', '0975956705', NULL),
(6, 40, 2.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 15:33:49', '2011-12-21 15:33:49', 'LifeMap', 'sns@example.com', '', NULL),
(7, 41, 2.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 15:36:35', '2011-12-21 15:36:36', 'LifeMap', 'sns@example.com', '', NULL),
(9, 43, 5.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:07:24', '2011-12-21 16:07:24', 'LifeMap', 'sns@example.com', '', NULL),
(11, 45, 4.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:11:45', '2011-12-21 16:11:45', 'LifeMap', 'sns@example.com', '', NULL),
(13, 47, 10.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:20:08', '2011-12-21 16:20:08', 'LifeMap', 'sns@example.com', '', NULL),
(15, 49, 20.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:24:00', '2011-12-21 16:24:00', 'LifeMap', 'sns@example.com', '', NULL),
(16, 50, 3.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:28:15', '2011-12-21 16:28:15', 'LifeMap', 'sns@example.com', '', NULL),
(49, 83, 3.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:08:01', '2011-12-22 10:08:01', 'LifeMap', 'sns@example.com', '', NULL),
(50, 84, 3.5, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:22:39', '2011-12-22 10:22:39', 'LifeMap', 'sns@example.com', '', NULL),
(53, 87, 20.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:27:13', '2011-12-22 10:27:13', 'LifeMap', 'sns@example.com', '', NULL),
(54, 88, 10.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:49:58', '2011-12-22 10:49:58', 'LifeMap', 'sns@example.com', '', NULL),
(57, 91, 6.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:52:35', '2011-12-22 10:52:35', 'LifeMap', 'sns@example.com', '', NULL),
(71, 105, 5.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-27 14:50:41', '2011-12-27 14:50:41', 'LifeMap', 'sns@example.com', '', NULL),
(73, 107, 6.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-27 14:51:33', '2011-12-27 14:51:33', 'LifeMap', 'sns@example.com', '', NULL),
(96, 130, 9.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-28 09:04:29', '2011-12-28 09:04:29', 'LifeMap', 'sns@example.com', '', NULL),
(103, 1346, 0.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2012-01-31 17:32:43', '2012-01-31 17:32:43', '', '', '', NULL),
(107, 1351, 10.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2012-02-01 14:44:33', '2012-02-01 14:44:33', 'Nguyễn Đình Bảo', 'damphilong101@gmail.com', '01688153348', NULL),
(114, 1359, 0.0, 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2012-02-06 15:11:23', '2012-02-06 15:11:23', '', '', '', NULL),
(115, 1361, 20.0, 'triệu/tháng', 1, 127, 'm2', 3, 'Đông - Nam', '2012-02-09 11:02:33', '2012-02-09 11:02:33', 'Bà Lan', '', '0913204246', NULL),
(116, 1362, 6.5, 'triệu/tháng', 1, 50, 'm2', NULL, '', '2012-02-09 11:09:20', '2012-02-09 11:09:20', 'Chị Hạnh', '', '0988522123', NULL),
(117, 1363, 2.0, 'triệu/tháng', 1, 20, 'm2', 1, '', '2012-02-09 11:21:31', '2012-02-09 11:21:31', 'chị Tâm', '', '0903268140', NULL),
(121, 1370, 10.0, 'triệu/tháng', 1, 0, 'm2', NULL, 'Tây Bắc', '2012-02-11 09:43:06', '2012-02-11 10:35:50', NULL, 'sns@example.com', '', 1),
(122, 1371, 18.0, 'triệu/tháng', 1, 0, 'm2', NULL, 'Tây Bắc', '2012-02-11 10:58:36', '2012-02-11 11:31:46', NULL, '', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pos_rent_house_crawl_pos`
--

CREATE TABLE IF NOT EXISTS `pos_rent_house_crawl_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos',
  `source_id` int(11) NOT NULL COMMENT 'id is of poster',
  `cid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url lay thong tin',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url lay thong tin',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'title is of pos',
  `description` text COLLATE utf8_unicode_ci COMMENT 'desc is of pos',
  `address` text COLLATE utf8_unicode_ci COMMENT 'address is of pos',
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tel is of pos',
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'website is of pos',
  `lat` float(18,7) DEFAULT NULL COMMENT 'latitude theo google map',
  `lng` float(18,7) DEFAULT NULL COMMENT 'longitude theo google map',
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tags is of pos',
  `file_id` int(11) DEFAULT NULL COMMENT 'File id',
  `pos_sub_category_id` int(11) DEFAULT NULL COMMENT 'id identifies sub_category',
  `price` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Giá cho thuê nhà',
  `unit_price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'đơn vị giá',
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'diện tích phòng ',
  `unit_area` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'đơn vị diện tích',
  `num_room` tinyint(4) DEFAULT NULL COMMENT 'Số phòng ',
  `direction` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hướng nhà ',
  `contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên người liên hệ',
  `contact_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email liên hệ',
  `contact_tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Điện thoại liên hệ',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'trang thai of dia diem',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=258 ;

--
-- Dumping data for table `pos_rent_house_crawl_pos`
--

INSERT INTO `pos_rent_house_crawl_pos` (`id`, `source_id`, `cid`, `url`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `pos_sub_category_id`, `price`, `unit_price`, `area`, `unit_area`, `num_room`, `direction`, `contact_name`, `contact_email`, `contact_tel`, `status`, `created_at`, `updated_at`) VALUES
(243, 2, '502805628', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805628-cho-thue-chung-cu-bac-ha--58-m2.html', 'Cho thue chung cu Bac Ha - 58 m2', '\r						<p></p>Căn ho chinh chu da sua dep de lam VP: Tran, vach, den, kinh, rem, op go...cho thue 6,5 tr/thang\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Mr Nam – 0988709790\r							<b>Email:&nbsp;</b>nguyenhungnamkts@gmail.com\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:00'),
(244, 2, '502805575', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805575-cho-vp-de-o-180m2-toa-thanh-cong-tower-lang-ha.html', 'Cho VP, để ở 180m2 tòa Thành Công Tower Láng Hạ.', '\r						<p></p>Cho thuê căn hộ làm VP hoặc để ở kết hợp VP, diện tích 180m2 thiết kế đẹp theo phong cách VP với 01 phòng lớn, 3 phòng ban và 2 khu vệ sinh. Căn hộ đã thiết kế sàn gỗ đẹp, đủ điều hòa nóng lạnh đường chờ internet, TV. VP trên tầng cao, view thoáng đẹp trong tòa nhà hỗn hợp địa chỉ 57 Láng Hạ - Ba Đình có đầy đủ các dịch vụ cao cấp tiện ích đi kèm thang máy bảo vệ hoạt động liên tục, có nhiều chỗ để xe.<BR>cho thuê dài hạn giá 1000$/tháng. <BR>Quý khách có nhu cầu thuê VP, để ở vui lòng liên hệ: <BR>Vũ Giang Đông: 090.345.7879<BR>Ghi chú: Làm việc trực tiếp không trung gian! <BR><BR>\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Giang Đông – 0903457879\r							<b>Email:&nbsp;</b>giangdongvnn@gmail.com\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:07'),
(245, 2, '502805538', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805538-cho-thue-nha-mat-pho-hoang-quoc-viet-cau-giay.html', 'Cho thuê nhà mặt phố Hoàng Quốc Việt Cầu Giấy', '\r						<p></p>Cho thuê nhà mặt phố Hoàng Quốc Việt Cầu Giấy. Diện tích 130m2. Mặt tiền 5m. Nhà 5 tầng đẹp. Rất phù hợp mở văn phòng đại diện, ngân hàng, công ty. Cho thuê dài hạn. Giá 2500 USD/tháng Liên hệ Anh An: SDT 0908024588\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Anh An – 0908024588\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:09'),
(246, 2, '502805528', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805528-cho-thue-cccc-27-huynh-thuc-khang--ha-noi.html', 'Cho thuê CCCC 27 Huỳnh Thúc Kháng - Hà nội', '\r						<p></p>Cần cho thuê căn hộ ở chung cư cao cấp 27 Huỳnh Thúc Kháng, S=130m2, phòng khách, bếp, 3 phòng ngủ, 2 vệ sinh, sàn gỗ, điều hoà, tủ lạnh, ti vi, internet trang thiết bị sinh hoạt đầy đủ. Giá cả 1000$/tháng.\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Chị Thanh – 0912396539\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:10'),
(247, 2, '502803600', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502803600-cho-sinh-vien-nu-thue-phong.html', 'Cho sinh viên nữ thuê phòng', '\r						<p></p>Cho thuê 1 phòng khép kín, sạch đẹp, 12.5m2 cho sinh viên nữ. Địa chỉ: nhà 302, dãy trong, khu Tập thể ĐH Kiến trúc, Nguyễn Trãi, Hà Nội. (Nhà có 2 mẹ con phụ nữ và 2 sinh viên nữ khác đã thuê phòng khác nên không cho Nam thuê). Nhà gần trường ĐH Hà Nội, ĐH KHXHNV, ĐH KHTN, gần chợ và bến xe buýt, thuận tiện giao thông đi lại. Giá thuê: 1.800.000 VNĐ (Có thể ở ghép 2-3 người). Sẽ bớt 1chút giá thuê cho người có nhu cầu thực sự.<BR>ai có nhu cầu liên hệ Cô Hồng 0944042173<BR>\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Cô Hồng – 0944042173\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:15'),
(248, 2, '502805399', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805399-cho-thue-nha-mat-duong-truong-chinh.html', 'Cho thuê nhà mặt đường Trường Chinh', '\r						<p></p>Cho thuê tầng 1 nhà mặt đường Trường Chinh diện tích 3 x 12m, tại địa chỉ 262 Trường Chinh Đống Đa Hà Nội. Giá 10triệu/tháng. Liên hệ A Tuấn: 0903258898\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Anh Tuấn – 0903258898\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:19'),
(249, 2, '502805365', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805365-cho-thue-nha-4-tang-duong-le-duc-tho-keo-dai.html', 'Cho thuê nhà 4 tầng đường Lê đức Thọ kéo dài', '\r						<p></p>Cho thuê nhà 4T, dãy 2 đường Lê Đức Thọ kéo dài (Đi phố Mai Dịch thì sau trường MN Mai Dịch). Hướng ĐN; Diện tích: 65m2 x 4T, MT: 5 m, đường 7 m, hè: 3 m, ôtô vào trong nhà. Cầu thang + sàn gỗ, điện nước đủ. Giá: 18 triệu/tháng. Liên hệ: A. Hoàng: 0974478201\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>A. Hoàng – 0974478201\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:21'),
(250, 2, '502805349', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805349-cho-thue-gap-cccc-the-garden.html', 'Cho thuê gấp CCCC The Garden', '\r						<p></p>Hiện tôi có nhu cầu cho thuê căn hộ tại khu chung cư cao cấp The Garden thuộc quần thể khu mỹ đình sông đà – the manor, từ liêm, hà nội. <BR>Bao quanh bởi các toà nhà, trung tâm thương mại, bên dưới có siêu thị big c, trường mẫu giáo quốc tế. An ninh tốt, giao thông thuận tiện. <BR>Căn hộ có diện tích 117m2, căn góc, căn hộ đầy đủ đồ (TV, giường tủ, đồ bếp, máy giặt...) được thiết kế hiện đại. <BR>Giá: 1400usd/ tháng, mọi chi tiết xin vui liên hệ chị Hoa 0913031100.\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Chị Hoa, 0913031100 – 0913031100\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:26'),
(251, 2, '502805306', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805306-cho-thue-nha-lam-van-phong-tai-khu-pho-co.html', 'Cho thuê nhà làm văn phòng tại khu phố cổ', '\r						<p></p>Cần cho thuê nhà tại khu phố cổ MT 3m x dài 18 m phố Bát Sứ, phường Hàng Bồ, quận Hoàn Kiếm, Hà Nội. Giá cả thỏa thuận LH anh Tùng 0988558653\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Anh Tùng – 0988558653\r							<b>Email:&nbsp;</b>tungptlawyer168@gmail.com\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:28'),
(252, 2, '502805297', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805297-cho-thue-nha-lam-van-phong-tai-kdt-dai-kim.html', 'Cho thuê nhà làm văn phòng tại KĐT Đại Kim', '\r						<p></p>Hiện gđ tôi có nhà cho thuê tại số nhà lô 39A1 KĐT Đại Kim, 4 tầng, diện tích 54m2/tầng<BR>Giá thỏa thuận<BR>Liên hệ: Ngọc 0904.378.468\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>C. Ngọc – 0904378468\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:31'),
(253, 2, '502805287', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805287-cho-thue-can-ho-me-tri-ha.html', 'Cho thuê căn hộ mễ trì hạ', '\r						<p></p>Diện tích: 115m2 gồm 3 phòng ngủ, 1 phòng khách, phòng bếp + phòng ăn và 2WC. Căn góc, 2 ban công thoáng mát, đầy đủ tiện nghi: Giường tủ, sofa, điều hòa, máy giặt, tủ lạnh, internet VNPT tốc độ cao, truyền hinh VTC HD, sàn gỗ, dịch vụ vệ sinh công cộng sạch sẽ, an ninh đảm bảo, bảo vệ 24/24<BR><BR>Giá thuê: 14 triệu/tháng\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>C. Hương 0913015370 – 0983740151\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:33'),
(254, 2, '502805276', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805276-cho-thue-phong-tro-khu-bang-a-linh-dam.html', 'Cho thuê phòng trọ khu Bằng A, Linh Đàm', 'Cho thuê phòng trọ khép kín khu bằng A, gần chùa Bằng A.Diện tích 20m2, gác xép 8m2Giá thuê: 2tr/tháng.Liên hê; Anh Giang 0982781223, chị Tâm 0903268140\n					', 'khu Bằng A, Linh Đàm, Hoàng Mai, Hà Nội', '0903268140', NULL, 20.9714527, 105.8282776, '', NULL, NULL, '2', NULL, '20', NULL, 1, '', 'chị Tâm', '', '0903268140', 3, '2012-02-09 10:55:21', '2012-02-09 11:21:31'),
(255, 2, '502805263', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805263-cho-thue-van-phong-dien-tich-100m2-gia-65tr.html', 'Cho thuê văn phòng diện tích 100m2 giá 6,5tr', 'Cho thuê tầng 1,2 của tòa nhà 4 tầng làm văn Phòng. Diện tích 50m2/1tầng tại đường Lê Trọng Tấn, Thanh Xuân, Hà Nội; <BR>Hiện đã có đầy đủ bàn ghế làm việc, khu văn minh, có thể để ô tô, xe máy, gần mặt đường. Giá: 6.5tr / tháng. Liên hệ: Chị Hạnh (chính chủ) 0988 522 123 (miễn trung gian)\n					', 'đường Lê Trọng Tấn, Thanh Xuân, Hà Nội', '0988522123', NULL, 20.9922810, 105.8331299, '', NULL, NULL, '6.5', NULL, '50', NULL, NULL, '', 'Chị Hạnh', '', '0988522123', 3, '2012-02-09 10:55:21', '2012-02-09 11:09:20'),
(256, 2, '502805198', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502805198-cho-thue-mat-bang-dai-lo-thang-long.html', 'CHO THUÊ MẶT BẰNG ĐẠI LỘ THĂNG LONG', '\r						<p></p>Cho thuê mặt bằng 2 tầng, diện tích 340m2 trên mặt đại lộ Thăng Long (từ trung tâm hội nghị quốc gia đi xuống khoảng 1km), mặt tiền 15m, vỉa hè rộng và sâu, giá cả: thoả thuận\r					', '\r						<b>Li&#234;n h&#7879;:&nbsp;</b>Ms. Hằng – 0947855558\r					', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2012-02-09 10:55:21', '2012-02-09 10:56:41'),
(257, 2, '502776849', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/502776849-cccc-vimeco-s146-m2-3-phong-ngu.html', 'CCCC Vimeco, S=146 m2, 3 phòng ngủ', 'Căn hộ CCCC Vimeco (cạnh Big C), diện tích S=146 m2, CT2-tầng 14, 3 phòng ngủ, 2 WC, hướng Đông Nam, trang bị đầy đủ đồ dùng để ở, phù hợp với NNN, người VN có thu nhập cao. Giá 900 USD.<BR><BR>Liên hệ: Bà Lan, 0913204246, 04-38563674\n					', 'Chung cư Vimeco, Hà Nội', '0913204246', NULL, 21.0333328, 105.8499985, '', NULL, NULL, '20', NULL, '146', NULL, 3, 'Đông - Nam', 'Bà Lan', '', '0913204246', 3, '2012-02-09 10:55:21', '2012-02-09 11:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `pos_rent_house_crawl_source`
--

CREATE TABLE IF NOT EXISTS `pos_rent_house_crawl_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos',
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id identifies category',
  `source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id identifies category',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url lay thong tin',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'trang thai of dia diem',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_rent_house_crawl_source`
--

INSERT INTO `pos_rent_house_crawl_source` (`id`, `area`, `source`, `url`, `status`, `created_at`, `updated_at`) VALUES
(2, 'hanoi', 'vnexpress', 'http://vnexpress.net/rao-vat/12/cho-thue-nha-dat/Ha-noi/&d=', 0, '2012-02-09 10:53:42', '2012-02-09 10:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `pos_sponsor`
--

CREATE TABLE IF NOT EXISTS `pos_sponsor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos_sponsor',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `expire_date` datetime NOT NULL COMMENT 'ngày hết hạn tài trợ',
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_sponsor`
--


-- --------------------------------------------------------

--
-- Table structure for table `pos_warn`
--

CREATE TABLE IF NOT EXISTS `pos_warn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id identifies pos_warn',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'content is of pos_warn',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `pos_warn`
--

INSERT INTO `pos_warn` (`id`, `pos_id`, `member_id`, `content`, `created_at`, `updated_at`) VALUES
(36, 35, 1, 'Nội dung cảnh báo ...', '2011-12-02 16:13:08', '2011-12-02 16:13:08'),
(37, 1319, 1, 'abc', '2012-01-31 09:07:06', '2012-01-31 09:07:06'),
(38, 1349, 1, 'Địa chỉ không đúng', '2012-02-01 10:20:35', '2012-02-01 10:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Identified profile name (ASCII)',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This is a required',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cannot select duplicate item',
  `is_edit_public_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Settable public flag',
  `default_public_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Default of public flag',
  `form_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Form type to input/select',
  `value_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of input value',
  `is_disp_regist` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Shows when registeration',
  `is_disp_config` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Shows when edit',
  `is_disp_search` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Shows when searching',
  `is_public_web` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag for adding public_flag for publishing to web',
  `value_regexp` text COLLATE utf8_unicode_ci COMMENT 'Regular expression',
  `value_min` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Minimum value',
  `value_max` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Maximum value',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves input/select items for the member profile' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `name`, `is_required`, `is_unique`, `is_edit_public_flag`, `default_public_flag`, `form_type`, `value_type`, `is_disp_regist`, `is_disp_config`, `is_disp_search`, `is_public_web`, `value_regexp`, `value_min`, `value_max`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'op_preset_sex', 1, 0, 0, 1, 'select', 'string', 1, 1, 1, 0, NULL, NULL, NULL, 110, '2011-06-22 08:46:10', '2011-06-22 08:46:10'),
(2, 'op_preset_birthday', 0, 0, 0, 1, 'date', 'string', 1, 1, 1, 0, NULL, NULL, NULL, 120, '2011-06-22 08:46:10', '2011-06-22 08:46:10'),
(3, 'op_preset_region', 0, 0, 0, 1, 'region_select', 'JP', 1, 1, 1, 0, NULL, NULL, NULL, 125, '2011-06-22 08:46:10', '2011-06-22 08:46:10'),
(4, 'op_preset_self_introduction', 0, 0, 0, 1, 'textarea', 'string', 1, 1, 1, 0, NULL, NULL, NULL, 130, '2011-06-22 08:46:10', '2011-06-22 08:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `profile_option`
--

CREATE TABLE IF NOT EXISTS `profile_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `profile_id` int(11) NOT NULL COMMENT 'Profile id',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_idx` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves options of profile items' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `profile_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `profile_option_translation`
--

CREATE TABLE IF NOT EXISTS `profile_option_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Choice',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_option_translation`
--


-- --------------------------------------------------------

--
-- Table structure for table `profile_translation`
--

CREATE TABLE IF NOT EXISTS `profile_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `caption` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Item name to show',
  `info` text COLLATE utf8_unicode_ci COMMENT 'Description',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_translation`
--


-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `session_data` text COLLATE utf8_unicode_ci COMMENT 'Session information',
  `time` text COLLATE utf8_unicode_ci COMMENT 'Timestamp of generated time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves session data';

--
-- Dumping data for table `session`
--


-- --------------------------------------------------------

--
-- Table structure for table `skin_config`
--

CREATE TABLE IF NOT EXISTS `skin_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `plugin` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Plugin name',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_name_UNIQUE_idx` (`plugin`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of this SNS' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `skin_config`
--


-- --------------------------------------------------------

--
-- Table structure for table `sns_config`
--

CREATE TABLE IF NOT EXISTS `sns_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of this SNS' AUTO_INCREMENT=28 ;

--
-- Dumping data for table `sns_config`
--

INSERT INTO `sns_config` (`id`, `name`, `value`) VALUES
(1, 'OpenPNE_revision', '46'),
(2, 'opAshiatoPlugin_revision', '3'),
(3, 'opAuthMobileUIDPlugin_revision', '1'),
(4, 'opBlogPlugin_revision', '2'),
(5, 'opCommunityTopicPlugin_revision', '5'),
(6, 'opDiaryPlugin_revision', '8'),
(7, 'opFavoritePlugin_revision', '4'),
(8, 'opIntroFriendPlugin_revision', '2'),
(9, 'opMessagePlugin_revision', '4'),
(10, 'opOpenSocialPlugin_revision', '16'),
(11, 'shindig_token_cipher_key', '4b8d760a3ddf003fc8fd3cc36b5b87c4'),
(12, 'shindig_token_hmac_key', '78785f4debd23c24e93850db2f58b88e'),
(13, 'op_web_api_plugin_auth_type', '1'),
(14, 'op_web_api_plugin_using_cdata', '1'),
(15, 'sns_name', 'LifeMap.vn'),
(16, 'sns_title', 'Bản đồ cuộc sống - Map of the Life'),
(17, 'admin_mail_address', 'noreply@lifemap.vn'),
(18, 'enable_pc', '1'),
(19, 'enable_mobile', '1'),
(20, 'enable_friend_link', '1'),
(21, 'image_max_filesize', '3000K'),
(22, 'daily_news_day', 'a:2:{i:0;s:1:"0";i:1;s:1:"3";}'),
(23, 'is_use_captcha', '0'),
(24, 'is_allow_post_activity', '1'),
(25, 'is_allow_config_public_flag_profile_page', '1'),
(26, 'is_allow_web_public_flag_age', '0'),
(27, 'nickname_of_member_who_does_not_have_credentials', '-');

-- --------------------------------------------------------

--
-- Table structure for table `sns_term`
--

CREATE TABLE IF NOT EXISTS `sns_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Term name',
  `application` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pc_frontend' COMMENT 'Application name',
  PRIMARY KEY (`id`),
  KEY `application_INDEX_idx` (`application`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves terms of this SNS' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `sns_term`
--

INSERT INTO `sns_term` (`id`, `name`, `application`) VALUES
(1, 'friend', 'pc_frontend'),
(2, 'friend', 'mobile_frontend'),
(3, 'my_friend', 'pc_frontend'),
(4, 'my_friend', 'mobile_frontend'),
(5, 'community', 'pc_frontend'),
(6, 'community', 'mobile_frontend'),
(7, 'nickname', 'pc_frontend'),
(8, 'nickname', 'mobile_frontend'),
(9, 'activity', 'pc_frontend'),
(10, 'activity', 'mobile_frontend'),
(11, 'post_activity', 'pc_frontend'),
(12, 'post_activity', 'mobile_frontend');

-- --------------------------------------------------------

--
-- Table structure for table `sns_term_translation`
--

CREATE TABLE IF NOT EXISTS `sns_term_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Term value',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sns_term_translation`
--

INSERT INTO `sns_term_translation` (`id`, `value`, `lang`) VALUES
(1, 'friend', 'en'),
(1, 'フレンド', 'ja_JP'),
(1, 'Bạn bè', 'vi_VN'),
(2, 'friend', 'en'),
(2, 'ﾌﾚﾝﾄﾞ', 'ja_JP'),
(2, 'Bạn bè', 'vi_VN'),
(3, 'my friend', 'en'),
(3, 'マイフレンド', 'ja_JP'),
(3, 'Bạn của tôi', 'vi_VN'),
(4, 'my friend', 'en'),
(4, 'ﾏｲﾌﾚﾝﾄﾞ', 'ja_JP'),
(4, 'Bạn của tôi', 'vi_VN'),
(5, 'community', 'en'),
(5, 'コミュニティ', 'ja_JP'),
(5, 'Hội nhóm', 'vi_VN'),
(6, 'community', 'en'),
(6, 'ｺﾐｭﾆﾃｨ', 'ja_JP'),
(6, 'Hội nhóm', 'vi_VN'),
(7, 'nickname', 'en'),
(7, 'ニックネーム', 'ja_JP'),
(7, 'Tên', 'vi_VN'),
(8, 'nickname', 'en'),
(8, 'ﾆｯｸﾈｰﾑ', 'ja_JP'),
(8, 'Tên', 'vi_VN'),
(9, 'activity', 'en'),
(9, 'アクティビティ', 'ja_JP'),
(9, 'Hoạt động', 'vi_VN'),
(10, 'activity', 'en'),
(10, 'ｱｸﾃｨﾋﾞﾃｨ', 'ja_JP'),
(10, 'Hoạt động', 'vi_VN'),
(11, 'Post Activity', 'en'),
(11, 'アクティビティ投稿', 'ja_JP'),
(11, 'Hoạt động cuối', 'vi_VN'),
(12, 'Post Activity', 'en'),
(12, '投稿', 'ja_JP'),
(12, 'Hoạt động cuối', 'vi_VN');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_data`
--
ALTER TABLE `activity_data`
  ADD CONSTRAINT `activity_data_in_reply_to_activity_id_activity_data_id` FOREIGN KEY (`in_reply_to_activity_id`) REFERENCES `activity_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activity_data_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `activity_image`
--
ALTER TABLE `activity_image`
  ADD CONSTRAINT `activity_image_activity_data_id_activity_data_id` FOREIGN KEY (`activity_data_id`) REFERENCES `activity_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activity_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `album_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `album_image`
--
ALTER TABLE `album_image`
  ADD CONSTRAINT `album_image_album_id_album_id` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `album_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `album_image_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `application_invite`
--
ALTER TABLE `application_invite`
  ADD CONSTRAINT `application_invite_application_id_application_id` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_invite_from_member_id_member_id` FOREIGN KEY (`from_member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_invite_to_member_id_member_id` FOREIGN KEY (`to_member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `application_lifecycle_event_queue`
--
ALTER TABLE `application_lifecycle_event_queue`
  ADD CONSTRAINT `application_lifecycle_event_queue_application_id_application_id` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_lifecycle_event_queue_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `application_persistent_data`
--
ALTER TABLE `application_persistent_data`
  ADD CONSTRAINT `application_persistent_data_application_id_application_id` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_persistent_data_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `application_translation`
--
ALTER TABLE `application_translation`
  ADD CONSTRAINT `application_translation_id_application_id` FOREIGN KEY (`id`) REFERENCES `application` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ashiato`
--
ALTER TABLE `ashiato`
  ADD CONSTRAINT `ashiato_member_id_from_member_id` FOREIGN KEY (`member_id_from`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ashiato_member_id_to_member_id` FOREIGN KEY (`member_id_to`) REFERENCES `member` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `banner_image`
--
ALTER TABLE `banner_image`
  ADD CONSTRAINT `banner_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banner_translation`
--
ALTER TABLE `banner_translation`
  ADD CONSTRAINT `banner_translation_id_banner_id` FOREIGN KEY (`id`) REFERENCES `banner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `banner_use_image`
--
ALTER TABLE `banner_use_image`
  ADD CONSTRAINT `banner_use_image_banner_id_banner_id` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`),
  ADD CONSTRAINT `banner_use_image_banner_image_id_banner_image_id` FOREIGN KEY (`banner_image_id`) REFERENCES `banner_image` (`id`);

--
-- Constraints for table `blog_rss_cache`
--
ALTER TABLE `blog_rss_cache`
  ADD CONSTRAINT `blog_rss_cache_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);

--
-- Constraints for table `community`
--
ALTER TABLE `community`
  ADD CONSTRAINT `community_community_category_id_community_category_id` FOREIGN KEY (`community_category_id`) REFERENCES `community_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `community_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `community_config`
--
ALTER TABLE `community_config`
  ADD CONSTRAINT `community_config_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_event`
--
ALTER TABLE `community_event`
  ADD CONSTRAINT `community_event_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_event_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `community_event_comment`
--
ALTER TABLE `community_event_comment`
  ADD CONSTRAINT `community_event_comment_community_event_id_community_event_id` FOREIGN KEY (`community_event_id`) REFERENCES `community_event` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_event_comment_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `community_event_comment_image`
--
ALTER TABLE `community_event_comment_image`
  ADD CONSTRAINT `community_event_comment_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_event_comment_image_post_id_community_event_comment_id` FOREIGN KEY (`post_id`) REFERENCES `community_event_comment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_event_image`
--
ALTER TABLE `community_event_image`
  ADD CONSTRAINT `community_event_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_event_image_post_id_community_event_id` FOREIGN KEY (`post_id`) REFERENCES `community_event` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_event_member`
--
ALTER TABLE `community_event_member`
  ADD CONSTRAINT `community_event_member_community_event_id_community_event_id` FOREIGN KEY (`community_event_id`) REFERENCES `community_event` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_event_member_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_member`
--
ALTER TABLE `community_member`
  ADD CONSTRAINT `community_member_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_member_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_member_position`
--
ALTER TABLE `community_member_position`
  ADD CONSTRAINT `ccci` FOREIGN KEY (`community_member_id`) REFERENCES `community_member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_member_position_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_member_position_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_topic`
--
ALTER TABLE `community_topic`
  ADD CONSTRAINT `community_topic_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_topic_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `community_topic_comment`
--
ALTER TABLE `community_topic_comment`
  ADD CONSTRAINT `community_topic_comment_community_topic_id_community_topic_id` FOREIGN KEY (`community_topic_id`) REFERENCES `community_topic` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_topic_comment_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `community_topic_comment_image`
--
ALTER TABLE `community_topic_comment_image`
  ADD CONSTRAINT `community_topic_comment_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_topic_comment_image_post_id_community_topic_comment_id` FOREIGN KEY (`post_id`) REFERENCES `community_topic_comment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_topic_image`
--
ALTER TABLE `community_topic_image`
  ADD CONSTRAINT `community_topic_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_topic_image_post_id_community_topic_id` FOREIGN KEY (`post_id`) REFERENCES `community_topic` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deleted_message`
--
ALTER TABLE `deleted_message`
  ADD CONSTRAINT `deleted_message_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diary`
--
ALTER TABLE `diary`
  ADD CONSTRAINT `diary_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diary_comment`
--
ALTER TABLE `diary_comment`
  ADD CONSTRAINT `diary_comment_diary_id_diary_id` FOREIGN KEY (`diary_id`) REFERENCES `diary` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diary_comment_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diary_comment_image`
--
ALTER TABLE `diary_comment_image`
  ADD CONSTRAINT `diary_comment_image_diary_comment_id_diary_comment_id` FOREIGN KEY (`diary_comment_id`) REFERENCES `diary_comment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diary_comment_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diary_comment_unread`
--
ALTER TABLE `diary_comment_unread`
  ADD CONSTRAINT `diary_comment_unread_diary_id_diary_id` FOREIGN KEY (`diary_id`) REFERENCES `diary` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diary_comment_unread_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diary_comment_update`
--
ALTER TABLE `diary_comment_update`
  ADD CONSTRAINT `diary_comment_update_diary_id_diary_id` FOREIGN KEY (`diary_id`) REFERENCES `diary` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diary_comment_update_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diary_image`
--
ALTER TABLE `diary_image`
  ADD CONSTRAINT `diary_image_diary_id_diary_id` FOREIGN KEY (`diary_id`) REFERENCES `diary` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diary_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_member_id_from_member_id` FOREIGN KEY (`member_id_from`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_member_id_to_member_id` FOREIGN KEY (`member_id_to`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `file_bin`
--
ALTER TABLE `file_bin`
  ADD CONSTRAINT `file_bin_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gadget_config`
--
ALTER TABLE `gadget_config`
  ADD CONSTRAINT `gadget_config_gadget_id_gadget_id` FOREIGN KEY (`gadget_id`) REFERENCES `gadget` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `intro_friend`
--
ALTER TABLE `intro_friend`
  ADD CONSTRAINT `intro_friend_member_id_from_member_id` FOREIGN KEY (`member_id_from`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `intro_friend_member_id_to_member_id` FOREIGN KEY (`member_id_to`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `intro_friend_member_id_to_member_relationship_member_id_to` FOREIGN KEY (`member_id_to`) REFERENCES `member_relationship` (`member_id_to`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_invite_member_id_member_id` FOREIGN KEY (`invite_member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `member_application`
--
ALTER TABLE `member_application`
  ADD CONSTRAINT `member_application_application_id_application_id` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_application_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_application_setting`
--
ALTER TABLE `member_application_setting`
  ADD CONSTRAINT `mmmi` FOREIGN KEY (`member_application_id`) REFERENCES `member_application` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_config`
--
ALTER TABLE `member_config`
  ADD CONSTRAINT `member_config_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_image`
--
ALTER TABLE `member_image`
  ADD CONSTRAINT `member_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_image_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_profile`
--
ALTER TABLE `member_profile`
  ADD CONSTRAINT `member_profile_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_profile_profile_id_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_profile_profile_option_id_profile_option_id` FOREIGN KEY (`profile_option_id`) REFERENCES `profile_option` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_relationship`
--
ALTER TABLE `member_relationship`
  ADD CONSTRAINT `member_relationship_member_id_from_member_id` FOREIGN KEY (`member_id_from`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_relationship_member_id_to_member_id` FOREIGN KEY (`member_id_to`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `message_message_type_id_message_type_id` FOREIGN KEY (`message_type_id`) REFERENCES `message_type` (`id`);

--
-- Constraints for table `message_file`
--
ALTER TABLE `message_file`
  ADD CONSTRAINT `message_file_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_file_message_id_message_id` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message_send_list`
--
ALTER TABLE `message_send_list`
  ADD CONSTRAINT `message_send_list_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `message_send_list_message_id_message_id` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`);

--
-- Constraints for table `message_type_translation`
--
ALTER TABLE `message_type_translation`
  ADD CONSTRAINT `message_type_translation_id_message_type_id` FOREIGN KEY (`id`) REFERENCES `message_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `navigation_translation`
--
ALTER TABLE `navigation_translation`
  ADD CONSTRAINT `navigation_translation_id_navigation_id` FOREIGN KEY (`id`) REFERENCES `navigation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_mail_translation`
--
ALTER TABLE `notification_mail_translation`
  ADD CONSTRAINT `notification_mail_translation_id_notification_mail_id` FOREIGN KEY (`id`) REFERENCES `notification_mail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oauth_consumer`
--
ALTER TABLE `oauth_consumer`
  ADD CONSTRAINT `oauth_consumer_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `oauth_consumer_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `openid_trust_log`
--
ALTER TABLE `openid_trust_log`
  ADD CONSTRAINT `openid_trust_log_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `o_auth_admin_token`
--
ALTER TABLE `o_auth_admin_token`
  ADD CONSTRAINT `o_auth_admin_token_oauth_consumer_id_oauth_consumer_id` FOREIGN KEY (`oauth_consumer_id`) REFERENCES `oauth_consumer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `o_auth_member_token`
--
ALTER TABLE `o_auth_member_token`
  ADD CONSTRAINT `o_auth_member_token_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `o_auth_member_token_oauth_consumer_id_oauth_consumer_id` FOREIGN KEY (`oauth_consumer_id`) REFERENCES `oauth_consumer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos`
--
ALTER TABLE `pos`
  ADD CONSTRAINT `pos_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_ibfk_2` FOREIGN KEY (`ower_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_pos_category_id_pos_category_id` FOREIGN KEY (`pos_category_id`) REFERENCES `pos_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_pos_sub_category_id_pos_category_id` FOREIGN KEY (`pos_sub_category_id`) REFERENCES `pos_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_category`
--
ALTER TABLE `pos_category`
  ADD CONSTRAINT `pos_category_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_checkin`
--
ALTER TABLE `pos_checkin`
  ADD CONSTRAINT `pos_checkin_pos_category_id_pos_category_id` FOREIGN KEY (`pos_category_id`) REFERENCES `pos_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_comment`
--
ALTER TABLE `pos_comment`
  ADD CONSTRAINT `pos_comment_pos_category_id_pos_category_id` FOREIGN KEY (`pos_category_id`) REFERENCES `pos_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_follow`
--
ALTER TABLE `pos_follow`
  ADD CONSTRAINT `pos_follow_pos_category_id_pos_category_id` FOREIGN KEY (`pos_category_id`) REFERENCES `pos_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_google`
--
ALTER TABLE `pos_google`
  ADD CONSTRAINT `pos_google_flow_id_pos_google_flow_id` FOREIGN KEY (`flow_id`) REFERENCES `pos_google_flow` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_google_flow_content`
--
ALTER TABLE `pos_google_flow_content`
  ADD CONSTRAINT `pos_google_flow_content_flow_id_pos_google_flow_id` FOREIGN KEY (`flow_id`) REFERENCES `pos_google_flow` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_photo`
--
ALTER TABLE `pos_photo`
  ADD CONSTRAINT `pos_photo_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_photo_pos_category_id_pos_category_id` FOREIGN KEY (`pos_category_id`) REFERENCES `pos_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_rent_house`
--
ALTER TABLE `pos_rent_house`
  ADD CONSTRAINT `pos_rent_house_pos_id_pos_id` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_sponsor`
--
ALTER TABLE `pos_sponsor`
  ADD CONSTRAINT `pos_sponsor_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_sponsor_pos_id_pos_id` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_warn`
--
ALTER TABLE `pos_warn`
  ADD CONSTRAINT `pos_warn_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_warn_pos_id_pos_id` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile_option`
--
ALTER TABLE `profile_option`
  ADD CONSTRAINT `profile_option_profile_id_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile_option_translation`
--
ALTER TABLE `profile_option_translation`
  ADD CONSTRAINT `profile_option_translation_id_profile_option_id` FOREIGN KEY (`id`) REFERENCES `profile_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_translation`
--
ALTER TABLE `profile_translation`
  ADD CONSTRAINT `profile_translation_id_profile_id` FOREIGN KEY (`id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sns_term_translation`
--
ALTER TABLE `sns_term_translation`
  ADD CONSTRAINT `sns_term_translation_id_sns_term_id` FOREIGN KEY (`id`) REFERENCES `sns_term` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
