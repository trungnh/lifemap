-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2008 at 02:55 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sns_27_08`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_data`
--

CREATE TABLE `activity_data` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `in_reply_to_activity_id` int(11) default NULL COMMENT 'Activity data id is in reply to',
  `body` varchar(140) collate utf8_unicode_ci NOT NULL COMMENT 'Activity body',
  `uri` text collate utf8_unicode_ci COMMENT 'Activity URI',
  `public_flag` tinyint(4) NOT NULL default '1' COMMENT 'Public flag of activity',
  `is_pc` tinyint(1) NOT NULL default '1' COMMENT 'Display this in PC?',
  `is_mobile` tinyint(1) NOT NULL default '1' COMMENT 'Display this in Mobile?',
  `source` varchar(64) collate utf8_unicode_ci default NULL COMMENT 'The source caption',
  `source_uri` text collate utf8_unicode_ci COMMENT 'The source URI',
  `foreign_table` text collate utf8_unicode_ci COMMENT 'Reference table name',
  `foreign_id` bigint(20) default NULL COMMENT 'The id of reference table',
  `template` varchar(64) collate utf8_unicode_ci default NULL COMMENT 'Template name',
  `template_param` longtext collate utf8_unicode_ci COMMENT 'Params for template',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `activity_image` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `activity_data_id` int(11) NOT NULL COMMENT 'Activity data id',
  `mime_type` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT 'MIME type',
  `uri` text collate utf8_unicode_ci COMMENT 'Image URI',
  `file_id` int(11) default NULL COMMENT 'File id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `username` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Administrator''s username',
  `password` varchar(40) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Administrator''s password',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `album` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `public_flag` tinyint(4) NOT NULL default '1',
  `file_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `album_image` (
  `id` int(11) NOT NULL auto_increment,
  `album_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `file_id` int(11) default NULL,
  `description` text,
  `filesize` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `album_id_idx` (`album_id`),
  KEY `file_id_idx` (`file_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

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
(11, 16, 1, 65, 'Lâu đài', 0, '2011-10-21 14:57:23', '2011-10-21 14:57:23');

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `id` bigint(20) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `url` varchar(128) NOT NULL,
  `height` bigint(20) default NULL,
  `scrolling` tinyint(1) NOT NULL default '0',
  `singleton` tinyint(1) NOT NULL default '1',
  `is_active` tinyint(1) NOT NULL default '1',
  `is_pc` tinyint(1) NOT NULL default '1',
  `is_mobile` tinyint(1) NOT NULL default '0',
  `links` longtext,
  `consumer_key` varchar(16) NOT NULL default '',
  `consumer_secret` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
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

CREATE TABLE `application_invite` (
  `id` bigint(20) NOT NULL auto_increment,
  `application_id` bigint(20) NOT NULL,
  `to_member_id` int(11) NOT NULL,
  `from_member_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `application_lifecycle_event_queue` (
  `id` bigint(20) NOT NULL auto_increment,
  `application_id` bigint(20) NOT NULL,
  `member_id` int(11) default NULL,
  `name` varchar(128) NOT NULL,
  `params` longtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `application_persistent_data` (
  `id` bigint(20) NOT NULL auto_increment,
  `application_id` bigint(20) NOT NULL,
  `member_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `application_translation` (
  `id` bigint(20) NOT NULL default '0',
  `title` varchar(128) default NULL,
  `title_url` varchar(128) default NULL,
  `description` text,
  `directory_title` varchar(128) default NULL,
  `screenshot` varchar(128) default NULL,
  `thumbnail` varchar(128) default NULL,
  `author` varchar(128) default NULL,
  `author_aboutme` text,
  `author_affiliation` varchar(128) default NULL,
  `author_email` varchar(128) default NULL,
  `author_photo` varchar(128) default NULL,
  `author_link` varchar(128) default NULL,
  `author_quote` text,
  `settings` longtext,
  `views` longtext,
  `lang` char(5) NOT NULL default '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`,`lang`)
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

CREATE TABLE `ashiato` (
  `id` int(11) NOT NULL auto_increment,
  `member_id_from` int(11) default NULL,
  `member_id_to` int(11) default NULL,
  `r_date` date default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `created_at_idx` (`created_at`),
  KEY `member_id_to_member_id_from_updated_at_idx` (`member_id_to`,`member_id_from`,`updated_at`),
  KEY `member_id_to_r_date_idx` (`member_id_to`,`r_date`),
  KEY `member_id_to_idx` (`member_id_to`),
  KEY `member_id_from_idx` (`member_id_from`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=152 ;

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
(151, 1, 18, '2011-12-23', '2011-12-23 14:46:42', '2011-12-23 14:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Banner name',
  `html` text collate utf8_unicode_ci COMMENT 'HTML of free input banner',
  `is_use_html` tinyint(1) NOT NULL default '0' COMMENT 'This is free HTML banner',
  PRIMARY KEY  (`id`),
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

CREATE TABLE `banner_image` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `file_id` int(11) NOT NULL COMMENT 'An image''s file id',
  `url` text collate utf8_unicode_ci COMMENT 'URL of linked Web page',
  `name` varchar(64) collate utf8_unicode_ci default NULL COMMENT 'Banner image name',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations about banner image files' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `banner_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `banner_translation`
--

CREATE TABLE `banner_translation` (
  `id` int(11) NOT NULL default '0' COMMENT 'Serial number',
  `caption` text collate utf8_unicode_ci NOT NULL COMMENT 'Description',
  `lang` char(5) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`,`lang`)
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

CREATE TABLE `banner_use_image` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `banner_id` int(11) NOT NULL COMMENT 'Banner id',
  `banner_image_id` int(11) NOT NULL COMMENT 'BannerImage id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `uid` varchar(32) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Mobile identified number',
  `memo` text collate utf8_unicode_ci COMMENT 'Free memo',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uid_UNIQUE_idx` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of blacklist' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `blacklist`
--


-- --------------------------------------------------------

--
-- Table structure for table `blog_rss_cache`
--

CREATE TABLE `blog_rss_cache` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `title` text,
  `description` text,
  `link` text,
  `date` datetime default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Community name',
  `file_id` int(11) default NULL COMMENT 'Top image file id',
  `community_category_id` int(11) default NULL COMMENT 'Community category id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_category` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Category name',
  `is_allow_member_community` tinyint(1) NOT NULL default '1' COMMENT 'Member can create this category community',
  `tree_key` int(11) default NULL COMMENT 'Nested tree key',
  `sort_order` int(11) default NULL COMMENT 'Order to sort',
  `lft` int(11) default NULL,
  `rgt` int(11) default NULL,
  `level` smallint(6) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_config` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Configuration name',
  `value` text collate utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_event` (
  `id` int(11) NOT NULL auto_increment,
  `community_id` int(11) NOT NULL,
  `member_id` int(11) default NULL,
  `name` text NOT NULL,
  `body` text NOT NULL,
  `event_updated_at` datetime default NULL,
  `open_date` datetime NOT NULL,
  `open_date_comment` text NOT NULL,
  `area` text NOT NULL,
  `application_deadline` datetime default NULL,
  `capacity` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_event_comment` (
  `id` int(11) NOT NULL auto_increment,
  `community_event_id` int(11) NOT NULL,
  `member_id` int(11) default NULL,
  `number` int(11) NOT NULL default '0',
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_event_comment_image` (
  `id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) default NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_event_image` (
  `id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) default NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_event_member` (
  `id` int(11) NOT NULL auto_increment,
  `community_event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_member` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `is_pre` tinyint(1) NOT NULL default '0' COMMENT 'Is pre member?',
  `is_receive_mail_pc` tinyint(1) NOT NULL default '0' COMMENT 'Notification of posting in community by computer E-mail.',
  `is_receive_mail_mobile` tinyint(1) NOT NULL default '0' COMMENT 'Notification of posting in community by mobile E-mail.',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_member_position` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `community_member_id` int(11) NOT NULL COMMENT 'Community Member id',
  `name` varchar(32) collate utf8_unicode_ci NOT NULL COMMENT 'Member''s position name in this community',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_topic` (
  `id` int(11) NOT NULL auto_increment,
  `community_id` int(11) NOT NULL,
  `member_id` int(11) default NULL,
  `name` text NOT NULL,
  `body` text NOT NULL,
  `topic_updated_at` datetime default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_topic_comment` (
  `id` int(11) NOT NULL auto_increment,
  `community_topic_id` int(11) NOT NULL,
  `member_id` int(11) default NULL,
  `number` int(11) NOT NULL default '0',
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_topic_comment_image` (
  `id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) default NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `community_topic_image` (
  `id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) default NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `deleted_message` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `message_id` int(11) NOT NULL,
  `message_send_list_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `diary` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `public_flag` tinyint(4) NOT NULL default '1',
  `is_open` tinyint(1) NOT NULL default '0',
  `has_images` tinyint(1) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `diary_comment` (
  `id` int(11) NOT NULL auto_increment,
  `diary_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `body` text NOT NULL,
  `has_images` tinyint(1) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `diary_comment_image` (
  `id` int(11) NOT NULL auto_increment,
  `diary_comment_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `diary_comment_unread` (
  `diary_id` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL,
  PRIMARY KEY  (`diary_id`),
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

CREATE TABLE `diary_comment_update` (
  `diary_id` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL default '0',
  `last_comment_time` datetime NOT NULL,
  `my_last_comment_time` datetime NOT NULL,
  PRIMARY KEY  (`diary_id`,`member_id`),
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

CREATE TABLE `diary_image` (
  `id` int(11) NOT NULL auto_increment,
  `diary_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL auto_increment,
  `member_id_to` int(11) NOT NULL,
  `member_id_from` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `file` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'File name',
  `type` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Type of this file',
  `filesize` int(11) NOT NULL default '0' COMMENT 'File size',
  `original_filename` text collate utf8_unicode_ci COMMENT 'Original filename',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of files uploaded' AUTO_INCREMENT=181 ;

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
(180, 'p_103_1_4a822ceb28f6c8290ccdea5730d79446_jpg', 'image/jpeg', 0, 'Hydrangeas.jpg', '2011-12-22 15:34:39', '2011-12-22 15:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `file_bin`
--

CREATE TABLE `file_bin` (
  `file_id` int(11) NOT NULL default '0' COMMENT 'File id',
  `bin` longblob COMMENT 'Content of file',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`file_id`)
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
(180, NULL, '2011-12-22 15:34:39', '2011-12-22 15:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `gadget`
--

CREATE TABLE `gadget` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `type` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Gadget type',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Gadget name',
  `sort_order` int(11) default NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `sort_order_INDEX_idx` (`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of gadget' AUTO_INCREMENT=66 ;

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
(7, 'sideBannerContents', 'languageSelecterBox', 10, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
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
(21, 'contents', 'albumFriendList', 141, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(22, 'contents', 'albumList', 142, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(23, 'contents', 'albumMyList', 143, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(24, 'profileContents', 'albumMemberList', 141, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(25, 'contents', 'blogFriend', 100, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(26, 'contents', 'blogUser', 110, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(27, 'profileContents', 'blogUser', 100, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(28, 'contents', 'recentCommunityTopicComment', 131, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(29, 'mobileContents', 'recentCommunityTopicComment', 110, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(30, 'contents', 'recentCommunityEventComment', 132, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(31, 'mobileContents', 'recentCommunityEventComment', 111, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(36, 'profileContents', 'diaryMemberList', 101, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(37, 'mobileContents', 'diaryFriendList', 101, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(38, 'mobileContents', 'diaryList', 102, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(39, 'mobileContents', 'diaryCommentHistory', 103, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(40, 'mobileContents', 'diaryMyList', 104, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(41, 'mobileProfileContents', 'diaryMemberList', 101, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(42, 'sideMenu', 'favoriteListBox', 40, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(44, 'contents', 'favoriteBlogNews', 104, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(45, 'mobileContents', 'favoriteDiaryNews', 105, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(46, 'contents', 'applicationBoxes', 110, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(47, 'profileContents', 'applicationBoxes', 110, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
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
(65, 'profileTop', 'listPosCommentBox', 25, '2011-12-23 09:03:14', '2011-12-23 09:03:20');

-- --------------------------------------------------------

--
-- Table structure for table `gadget_config`
--

CREATE TABLE `gadget_config` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Configuration name',
  `gadget_id` int(11) default NULL COMMENT 'Gadget id',
  `value` text collate utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `gadget_id_idx` (`gadget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of gadget' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gadget_config`
--


-- --------------------------------------------------------

--
-- Table structure for table `intro_friend`
--

CREATE TABLE `intro_friend` (
  `id` int(11) NOT NULL auto_increment,
  `member_id_to` int(11) NOT NULL,
  `member_id_from` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `member` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Nickname',
  `invite_member_id` int(11) default NULL COMMENT 'Member id of the person who invited this member',
  `is_login_rejected` tinyint(1) NOT NULL default '0' COMMENT 'Rejected member',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `is_active_INDEX_idx` (`is_active`),
  KEY `invite_member_id_idx` (`invite_member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of members' AUTO_INCREMENT=24 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name`, `invite_member_id`, `is_login_rejected`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'LifeMap', NULL, 0, '2011-06-22 08:46:10', '2011-06-22 08:46:10', 1),
(3, 'thuc.lehuy', NULL, 0, '2011-06-23 08:19:16', '2011-06-23 08:29:10', 1),
(4, '', NULL, 0, '2011-06-23 08:30:13', '2011-06-23 08:30:13', 0),
(5, 'Trường', 3, 0, '2011-06-23 08:30:20', '2011-07-28 14:56:52', 1),
(6, '', NULL, 0, '2011-06-23 08:30:31', '2011-06-23 08:30:31', 0),
(7, '', NULL, 0, '2011-06-23 08:30:37', '2011-06-23 08:30:37', 0),
(9, 'gomugomu', NULL, 0, '2011-06-26 11:24:11', '2011-06-26 11:32:34', 1),
(10, '', NULL, 0, '2011-07-12 08:44:34', '2011-07-12 08:44:34', 0),
(11, 'Shaun the Sheep', 1, 0, '2011-07-17 17:26:36', '2011-08-20 12:07:38', 1),
(12, '', NULL, 0, '2011-07-23 11:47:34', '2011-07-23 11:47:34', 0),
(13, '', NULL, 0, '2011-07-23 11:51:24', '2011-07-23 11:51:24', 0),
(14, 'le_huy_thuc', NULL, 0, '2011-07-27 14:22:20', '2011-07-28 13:59:54', 1),
(15, 'Hanh', NULL, 0, '2011-07-30 12:02:27', '2011-07-30 12:04:22', 1),
(16, 'Ng Hong Phuc', NULL, 0, '2011-07-30 12:23:36', '2011-07-30 12:26:15', 1),
(17, 'ThaoDH', NULL, 0, '2011-08-16 15:23:08', '2011-08-16 15:25:15', 1),
(18, 'hue', NULL, 0, '2011-08-22 14:35:02', '2011-08-22 14:37:46', 1),
(19, 'tuent', NULL, 0, '2011-08-22 20:03:00', '2011-08-27 10:54:55', 1),
(20, 'baond', NULL, 0, '2011-08-23 09:49:11', '2011-08-23 09:54:34', 1),
(21, '', 18, 0, '2011-08-27 10:00:02', '2011-08-27 10:00:02', 0),
(22, '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(23, '', 1, 0, '2011-12-07 11:25:52', '2011-12-07 11:25:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_application`
--

CREATE TABLE `member_application` (
  `id` bigint(20) NOT NULL auto_increment,
  `member_id` int(11) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `public_flag` varchar(255) NOT NULL default 'public',
  `sort_order` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `member_application_setting` (
  `id` bigint(20) NOT NULL auto_increment,
  `member_application_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL default 'application',
  `name` varchar(255) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `value` text,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `member_config` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Configuration name',
  `value` text collate utf8_unicode_ci NOT NULL COMMENT 'Configuration value',
  `value_datetime` datetime default NULL COMMENT 'Configuration datetime value',
  `name_value_hash` varchar(32) collate utf8_unicode_ci NOT NULL COMMENT 'Hash value for searching name & value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name_INDEX_idx` (`name`),
  KEY `name_value_hash_INDEX_idx` (`name_value_hash`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of each members' AUTO_INCREMENT=180 ;

--
-- Dumping data for table `member_config`
--

INSERT INTO `member_config` (`id`, `member_id`, `name`, `value`, `value_datetime`, `name_value_hash`, `created_at`, `updated_at`) VALUES
(1, 1, 'pc_address', 'sns@example.com', NULL, '885654aa381dfadbc6ea2c47a4a30f6a', '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(2, 1, 'password', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '927246e0e2492bb1c4334e89edfa252f', '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(3, 1, 'secret_question', '5', NULL, '0ca0709b3ef4d5c7bde5e0f67c2021e1', '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(4, 1, 'secret_answer', 'c81c00cad27aa757b313626c3c02094f', NULL, '8e460ad7facdeae96bfb1871f5d7a5b3', '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(5, 1, 'lastLogin', '', '2008-04-21 01:40:50', '83f893f513b36f24c7bbdf4839c518b0', '2011-06-22 15:48:25', '2008-04-21 01:40:51'),
(6, 1, 'remember_key', '9ec57d59b476f8d3b3dcd555568c8bedcdf430100caa0445156e9882c65a6510', NULL, '77e6b44c9532033462b3deacdbb6ca1b', '2011-06-22 22:20:35', '2008-04-21 01:27:35'),
(10, 3, 'pc_address', 'thuc.lehuy@gmail.com', NULL, '538611991e09e8bd308f1cc7b3b1db70', '2011-06-23 08:19:16', '2011-06-23 08:29:09'),
(12, 3, 'register_token', '3e63d83172c0d15bbd22e170c777a5a31', NULL, 'aeff2e0fde2ae628927e87fd4326baf8', '2011-06-23 08:19:16', '2011-06-23 08:19:16'),
(13, 3, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '2011-06-23 08:19:20', '2011-06-23 08:19:20'),
(14, 3, 'is_admin_invited', '1', NULL, 'eb60f13757f1516e0031606640744834', '2011-06-23 08:19:20', '2011-06-23 08:19:20'),
(15, 3, 'secret_question', '1', NULL, '388f9fd417f5cc3e8f0fdf68c16b8b9f', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(16, 3, 'secret_answer', 'e3da0a13b092a28b3a3cd57defeade7b', NULL, '690449687ba140d7e8bf8fec30c1cb82', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(17, 3, 'age_public_flag', '1', NULL, '3d34c0084dd7730c2258cc6f8b6dc55e', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(18, 3, 'password', '3d217ef7dcca205e4bc1a08281d669d2', NULL, 'c507ac2c0399311b4a89914482e53ce2', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(19, 3, 'mail_address_hash', 'cq3bd54elbfn', NULL, 'f5fa3322197e678a9f8cc4d52a0a012c', '2011-06-23 08:29:09', '2011-06-23 08:29:09'),
(20, 3, 'lastLogin', '', '2011-11-25 11:09:58', '83f893f513b36f24c7bbdf4839c518b0', '2011-06-23 08:29:13', '2011-11-25 11:09:58'),
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
(54, 9, 'lastLogin', '', '2011-06-26 21:24:07', '83f893f513b36f24c7bbdf4839c518b0', '2011-06-26 11:32:37', '2011-06-26 21:24:07'),
(55, 9, 'op_ashiato_count', '5', NULL, '7b01a5695c5ccf776b1a7df4d7e33e85', '2011-06-26 11:34:49', '2011-08-27 11:49:26'),
(56, 3, 'remember_key', '', NULL, 'fdc7fbdf631686f3f71e1e49bc5568fa', '2011-07-01 19:55:33', '2011-11-25 11:09:58'),
(57, 1, 'op_ashiato_count', '22', NULL, 'd8fe4f310ef442b5f28d2266b2b6dce8', '2011-07-06 06:37:45', '2011-10-03 12:51:04'),
(58, 3, 'op_ashiato_count', '51', NULL, '17bc5da94013f6df12267d7d62be6bc1', '2011-07-06 06:38:38', '2011-12-23 14:36:55'),
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
(86, 14, 'op_ashiato_count', '7', NULL, '6ecff272a02093a4b67d157a5acff442', '2011-07-28 14:03:02', '2011-11-03 10:52:43'),
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
(113, 15, 'op_ashiato_count', '8', NULL, '0abc8c53f6a28ff644d9a7b92709d743', '2011-08-01 19:26:26', '2011-10-31 11:46:31'),
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
(142, 18, 'lastLogin', '', '2011-12-10 11:40:45', '83f893f513b36f24c7bbdf4839c518b0', '2011-08-22 14:37:50', '2011-12-10 11:40:45'),
(143, 18, 'remember_key', '', NULL, 'fdc7fbdf631686f3f71e1e49bc5568fa', '2011-08-22 14:41:20', '2011-12-10 11:40:46'),
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
(156, 20, 'op_ashiato_count', '17', NULL, '0c73561f013ab7a9fd07e127a55115aa', '2011-08-25 21:38:21', '2011-11-07 10:38:00'),
(157, 17, 'op_ashiato_count', '5', NULL, '7b01a5695c5ccf776b1a7df4d7e33e85', '2011-08-25 21:38:47', '2011-11-07 11:04:25'),
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
(169, 18, 'op_ashiato_count', '9', NULL, '0279fba94a032c695260c8d8f5a5d8ac', '2011-08-27 11:43:16', '2011-12-23 14:46:42'),
(170, 11, 'op_ashiato_count', '6', NULL, '04e673f27df6097aa11b89238b4096ca', '2011-08-27 11:49:03', '2011-12-22 16:10:04'),
(171, 1, 'language', 'en', NULL, 'd6943c66c1cf90fbca9fa99c08a911a9', '2011-10-21 11:31:21', '2011-10-21 11:31:21'),
(172, 1, 'time_zone', 'Asia/Bangkok', NULL, '72b8ececd4541a08b413462f9d88efa3', '2011-10-21 11:31:21', '2011-10-21 11:31:21'),
(173, 19, 'remember_key', '', NULL, 'fdc7fbdf631686f3f71e1e49bc5568fa', '2011-11-01 13:51:28', '2011-11-03 11:04:22'),
(174, 22, 'pc_address_pre', 'hoahuongduong_2441988@yahoo.com', NULL, '5e03c445718219c62d333b294989db24', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 22, 'register_token', '227822d263a070ee835b1b80618dbe2c97', NULL, '23327622517d5299694b7e6c853cb136', '0000-00-00 00:00:00', '2011-12-05 16:32:36'),
(176, 22, 'register_auth_mode', 'MailAddress', NULL, 'fba890f9ba38ac0b250c1d2f2fc42afc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 23, 'pc_address_pre', 'huent.lifetek@gmail.com', NULL, '1d24da7d8d228a45ec6ab4970e7f7328', '2011-12-07 11:25:53', '2011-12-07 11:25:53'),
(178, 23, 'pc_address_token', 'de35d367f4c672dcceb4c2cbf3a0c5dc', NULL, '7a0a8e600fd47c705205a612c99f4c36', '2011-12-07 11:25:53', '2011-12-07 11:53:31'),
(179, 23, 'register_token', '23234fe863ae32e2ec1f050dfb885858c2', NULL, '7d99adb7c0b153c08b73aa9498fb4f73', '2011-12-07 11:25:53', '2011-12-07 11:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `member_image`
--

CREATE TABLE `member_image` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `file_id` int(11) NOT NULL COMMENT 'Image file id in the ''file'' table',
  `is_primary` tinyint(1) default NULL COMMENT 'This is primary',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves images in member profiles' AUTO_INCREMENT=27 ;

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
(26, 1, 114, NULL, '2011-12-09 14:17:33', '2011-12-09 14:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `member_profile`
--

CREATE TABLE `member_profile` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `profile_id` int(11) NOT NULL COMMENT 'Profile id',
  `profile_option_id` int(11) default NULL COMMENT 'Profile option id',
  `value` text collate utf8_unicode_ci NOT NULL COMMENT 'Text content for this profile item',
  `value_datetime` datetime default NULL COMMENT 'Profile datetime value',
  `public_flag` tinyint(4) default NULL COMMENT 'Public flag',
  `tree_key` bigint(20) default NULL,
  `lft` int(11) default NULL,
  `rgt` int(11) default NULL,
  `level` smallint(6) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `lft_INDEX_idx` (`lft`),
  KEY `member_id_idx` (`member_id`),
  KEY `profile_id_idx` (`profile_id`),
  KEY `profile_option_id_idx` (`profile_option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of every member''''s profile' AUTO_INCREMENT=49 ;

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
(48, 19, 4, NULL, '', NULL, 1, 48, 1, 2, 0, '2011-08-27 10:54:54', '2011-08-27 10:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `member_relationship`
--

CREATE TABLE `member_relationship` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `member_id_to` int(11) NOT NULL COMMENT 'Target member id',
  `member_id_from` int(11) NOT NULL COMMENT 'Subject member id',
  `is_friend` tinyint(1) default NULL COMMENT 'The members are friends',
  `is_friend_pre` tinyint(1) default NULL COMMENT 'The members are going to be friends',
  `is_access_block` tinyint(1) default NULL COMMENT 'The subject member is blocked the target',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `member_id_to_from_UNIQUE_idx` (`member_id_to`,`member_id_from`),
  UNIQUE KEY `member_id_from_to_UNIQUE_idx` (`member_id_from`,`member_id_to`),
  KEY `member_id_to_idx` (`member_id_to`),
  KEY `member_id_from_idx` (`member_id_from`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves ralationships of each members' AUTO_INCREMENT=55 ;

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
(54, 1, 23, 1, 0, NULL, '2011-12-07 11:25:59', '2011-12-07 11:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `subject` text,
  `body` text,
  `is_deleted` tinyint(1) NOT NULL default '0',
  `is_send` tinyint(1) NOT NULL default '0',
  `thread_message_id` int(11) default '0',
  `return_message_id` int(11) default '0',
  `message_type_id` int(11) default NULL,
  `foreign_id` int(11) default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `message_type_id_idx` (`message_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=197 ;

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
(196, 1, 'fdsgdfgs', 'gasfdgsdfs', 0, 1, 0, 0, 1, 0, '2011-11-04 09:09:04', '2011-11-04 09:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `message_file`
--

CREATE TABLE `message_file` (
  `id` int(11) NOT NULL auto_increment,
  `message_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `message_send_list` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `message_id` int(11) default NULL,
  `is_read` tinyint(1) NOT NULL default '0',
  `is_deleted` tinyint(1) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `message_id_idx` (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=197 ;

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
(196, 18, 196, 0, 0, '2011-11-04 09:09:04', '2011-11-04 09:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `message_type`
--

CREATE TABLE `message_type` (
  `id` int(11) NOT NULL auto_increment,
  `type_name` text NOT NULL,
  `foreign_table` text,
  `is_deleted` tinyint(1) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
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

CREATE TABLE `message_type_translation` (
  `id` int(11) NOT NULL default '0',
  `body` text,
  `subject` text,
  `caption` text NOT NULL,
  `info` text,
  `lang` char(5) NOT NULL default '',
  PRIMARY KEY  (`id`,`lang`)
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

CREATE TABLE `navigation` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `type` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Navigation type',
  `uri` text collate utf8_unicode_ci NOT NULL COMMENT 'Linked page''s URI',
  `sort_order` int(11) default NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type_sort_order_INDEX_idx` (`type`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of navigation items' AUTO_INCREMENT=73 ;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`id`, `type`, `uri`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'secure_global', '@homepage', 0, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(2, 'secure_global', '@member_index', 10, '2011-06-22 08:46:11', '2011-12-05 14:24:04'),
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
(22, 'backend_side', 'community/index', 30, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(23, 'backend_side', 'sns/config', 40, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(24, 'backend_side', '@mail_config', 35, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(25, 'backend_side', 'design/index', 50, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(26, 'backend_side', 'navigation/index', 60, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(27, 'backend_side', 'profile/list', 70, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(28, 'backend_side', 'plugin/list', 80, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(29, 'backend_side', 'admin/index', 90, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(31, 'default', '@album_list_mine', 15, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(34, 'mobile_home', 'ashiato/list', 12, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(36, 'community', 'communityTopic/listCommunity', 5, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(37, 'community', 'communityEvent/listCommunity', 6, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(38, 'backend_side', 'communityTopic/topicList', 25, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
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
(53, 'secure_global', '@homepage', 23, '2011-06-22 08:46:11', '2011-07-13 23:10:25'),
(54, 'mobile_home_side', '@ranking', 23, '2011-06-22 08:46:11', '2011-06-22 08:46:11'),
(56, 'insecure_global', '@homepage', 20, '2011-07-11 23:39:22', '2011-07-11 23:39:22'),
(57, 'insecure_global', '@member_index', 30, '2011-07-11 23:39:37', '2011-12-05 14:23:28'),
(58, 'insecure_global', '@rent_house', 40, '2011-07-11 23:40:07', '2011-12-05 14:07:20'),
(63, 'default', '@member_invite', 50, '2011-07-13 23:56:41', '2011-07-13 23:56:41'),
(64, 'insecure_login_global', '@member_logout', 10, '2011-07-16 15:23:19', '2011-07-16 15:23:19'),
(65, 'insecure_login_global', '@member_logout', 20, '2011-07-16 15:23:46', '2011-07-16 15:23:46'),
(66, 'default', '@community_search', 60, '2011-07-16 15:47:59', '2011-07-16 15:47:59'),
(67, 'default', '@member_search', 70, '2011-07-16 15:49:17', '2011-07-16 15:49:17'),
(68, 'insecure_global', '@homepage', 50, '2011-07-17 14:57:08', '2011-07-17 14:57:08'),
(69, 'secure_login_global', 'diary/new', 40, '2011-08-03 03:54:38', '2011-08-03 03:54:38'),
(70, 'secure_login_global', 'album/new', 50, '2011-08-03 03:56:15', '2011-08-03 03:56:15'),
(71, 'secure_login_global', 'community/edit', 60, '2011-08-03 04:14:26', '2011-08-03 04:14:26'),
(72, 'secure_login_global', '@member_invite', 70, '2011-08-03 04:39:57', '2011-08-03 04:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_translation`
--

CREATE TABLE `navigation_translation` (
  `id` int(11) NOT NULL default '0' COMMENT 'Serial number',
  `caption` text collate utf8_unicode_ci NOT NULL COMMENT 'Description',
  `lang` char(5) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`,`lang`)
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
(2, 'Trang cá nhân', 'vi_VN'),
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
(22, 'Communities', 'en'),
(22, 'コミュニティ管理', 'ja_JP'),
(23, 'SNS', 'en'),
(23, 'SNS設定', 'ja_JP'),
(24, 'Email', 'en'),
(24, 'メール設定', 'ja_JP'),
(25, 'Appearance', 'en'),
(25, 'デザイン設定', 'ja_JP'),
(26, 'Navigations', 'en'),
(26, 'ナビゲーション設定', 'ja_JP'),
(27, 'Profile', 'en'),
(27, 'プロフィール項目設定', 'ja_JP'),
(28, 'Plugins', 'en'),
(28, 'プラグイン設定', 'ja_JP'),
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
(38, 'トピック管理', 'ja_JP'),
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
(53, 'Ứng dụng', 'vi_VN'),
(54, 'Rankingﾞ', 'en'),
(54, '[i:191]ﾗﾝｷﾝｸﾞ', 'ja_JP'),
(56, 'Main Page', 'en'),
(56, 'Trang chủ', 'ja_JP'),
(56, 'Trang chủ', 'vi_VN'),
(57, 'My Home', 'en'),
(57, 'Trang cá nhân', 'ja_JP'),
(57, 'Trang cá nhân', 'vi_VN'),
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
(68, 'Ứng dụng', 'vi_VN'),
(69, 'Add diary', 'en'),
(69, 'Viết nhật ký', 'vi_VN'),
(70, 'Create album', 'en'),
(70, 'Tạo album ảnh', 'vi_VN'),
(71, 'Create community', 'en'),
(71, 'Tạo hội nhóm', 'vi_VN'),
(72, 'Invite member', 'en'),
(72, 'Mời bạn bè', 'vi_VN');

-- --------------------------------------------------------

--
-- Table structure for table `notification_mail`
--

CREATE TABLE `notification_mail` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Notification Identifier Name',
  `renderer` varchar(64) collate utf8_unicode_ci NOT NULL default 'twig' COMMENT 'Notification Template Renderer',
  `is_enabled` tinyint(1) NOT NULL default '1' COMMENT 'Notification Enabled',
  PRIMARY KEY  (`id`),
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

CREATE TABLE `notification_mail_translation` (
  `id` int(11) NOT NULL default '0' COMMENT 'Serial number',
  `title` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Notification Title',
  `template` text collate utf8_unicode_ci NOT NULL COMMENT 'Notification Template',
  `lang` char(5) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification_mail_translation`
--


-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE `oauth_consumer` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Consumer name',
  `description` text collate utf8_unicode_ci COMMENT 'Consumer description',
  `key_string` varchar(16) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Token for this consumer',
  `secret` varchar(32) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Password for this consumer',
  `file_id` int(11) default NULL COMMENT 'Image file id of this consumer',
  `using_apis` longtext collate utf8_unicode_ci COMMENT 'API list that this consumer uses',
  `member_id` int(11) default NULL COMMENT 'Member id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `openid_trust_log` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `member_id` int(11) default NULL COMMENT 'Member id',
  `uri` text collate utf8_unicode_ci COMMENT 'URI for RP',
  `uri_key` varchar(32) collate utf8_unicode_ci default NULL COMMENT 'Hashed URI for RP',
  `is_permanent` tinyint(1) default NULL COMMENT 'A permanent flag',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `o_auth_admin_token` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `oauth_consumer_id` int(11) NOT NULL COMMENT 'OAuth Consumer id',
  `key_string` varchar(16) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Key string of this token',
  `secret` varchar(32) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Secret string of this token',
  `type` varchar(255) collate utf8_unicode_ci default 'request' COMMENT 'Token type',
  `is_active` tinyint(1) NOT NULL default '1' COMMENT 'Activation flag',
  `callback_url` text collate utf8_unicode_ci COMMENT 'Callback url',
  `verifier` text collate utf8_unicode_ci COMMENT 'Token verifier',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `o_auth_member_token` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `oauth_consumer_id` int(11) NOT NULL COMMENT 'OAuth Consumer id',
  `key_string` varchar(16) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Key string of this token',
  `secret` varchar(32) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Secret string of this token',
  `type` varchar(255) collate utf8_unicode_ci default 'request' COMMENT 'Token type',
  `is_active` tinyint(1) NOT NULL default '1' COMMENT 'Activation flag',
  `callback_url` text collate utf8_unicode_ci COMMENT 'Callback url',
  `verifier` text collate utf8_unicode_ci COMMENT 'Token verifier',
  `member_id` int(11) default NULL COMMENT 'Member id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `plugin` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Nickname',
  `is_enabled` tinyint(1) NOT NULL default '1' COMMENT 'Notification Enabled',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `pos` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies pos',
  `title` varchar(255) collate utf8_unicode_ci NOT NULL COMMENT 'title is of pos',
  `description` text collate utf8_unicode_ci COMMENT 'desc is of pos',
  `address` text collate utf8_unicode_ci COMMENT 'address is of pos',
  `tel` varchar(20) collate utf8_unicode_ci default NULL COMMENT 'tel is of pos',
  `website` varchar(255) collate utf8_unicode_ci default NULL COMMENT 'website is of pos',
  `lat` float(18,2) default NULL COMMENT 'latitude theo google map',
  `lng` float(18,2) default NULL COMMENT 'longitude theo google map',
  `tags` varchar(255) collate utf8_unicode_ci default NULL COMMENT 'tags is of pos',
  `file_id` int(11) default NULL COMMENT 'File id',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `ower_id` int(11) default NULL COMMENT 'id is of location',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_public` int(1) NOT NULL default '1' COMMENT 'Public Flag',
  `editer` varchar(255) collate utf8_unicode_ci default NULL COMMENT 'danh sach member_id duoc phep edit pos,moi member_id cach nhau bang dau phay ',
  `pos_category_id` int(11) default NULL COMMENT 'id identifies category',
  `pos_sub_category_id` int(11) default NULL COMMENT 'id identifies sub_category',
  PRIMARY KEY  (`id`),
  KEY `file_id_idx` (`file_id`),
  KEY `ower_id_idx` (`ower_id`),
  KEY `pos_category_id_idx` (`pos_category_id`),
  KEY `pos_sub_category_id_idx` (`pos_sub_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=104 ;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `title`, `description`, `address`, `tel`, `website`, `lat`, `lng`, `tags`, `file_id`, `member_id`, `ower_id`, `created_at`, `updated_at`, `is_public`, `editer`, `pos_category_id`, `pos_sub_category_id`) VALUES
(1, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.03, 105.95, 'nha hang, quan bia, nhau nhet, hieu beo,Ăn uống,Thêm tags cho địa điểm,Giai tri,Dia diem,kkkkkkkkkkkk,Checkin', 85, 1, 1, '2011-11-07 15:58:31', '2011-11-23 15:38:21', 1, NULL, 4, NULL),
(2, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.03, 105.85, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL),
(3, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.04, 105.86, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL),
(4, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.05, 105.87, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL),
(5, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.06, 105.89, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL),
(6, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.07, 105.90, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL),
(7, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.08, 105.92, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL),
(8, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.09, 105.93, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL),
(9, 'Bia hoi Hieu Beo', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.10, 105.94, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, 4, NULL),
(10, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.11, 105.94, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(11, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.12, 105.94, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(12, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.13, 105.94, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(13, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.14, 105.94, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(14, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.15, 105.94, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(15, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.16, 105.95, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(16, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.17, 105.95, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(17, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.18, 105.95, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(18, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.19, 105.95, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(19, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.10, 105.95, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(20, 'Bia hoi Ha Bao', 'nha hang bia hoi chat luong tuyet hao', 'So 187 duong Xa Dan, quan Dong Da', '0973956705', 'biahoihieubeo.com.vn', 21.11, 105.95, 'nha hang, quan bia, nhau nhet, hieu beo', 2, 1, 3, '2011-11-07 15:58:31', '2011-11-07 15:58:35', 1, NULL, NULL, NULL),
(21, 'dfsf', 'fdfd', NULL, NULL, NULL, 21.04, 105.81, NULL, NULL, 1, NULL, '2011-11-22 15:02:18', '2011-11-22 15:02:18', 1, NULL, NULL, NULL),
(22, 'dfsf', 'fdfd', NULL, NULL, NULL, 21.04, 105.81, NULL, NULL, 1, NULL, '2011-11-22 15:02:27', '2011-11-22 15:02:27', 1, NULL, NULL, NULL),
(23, 'dfsf', 'fdfd', NULL, NULL, NULL, 21.04, 105.81, NULL, NULL, 1, NULL, '2011-11-22 15:02:31', '2011-11-22 15:02:31', 1, NULL, NULL, NULL),
(24, 'ghfghfg', 'jhjgfhjfghjf', NULL, NULL, NULL, 21.04, 105.81, NULL, NULL, 1, NULL, '2011-11-22 15:27:44', '2011-11-22 15:27:44', 1, NULL, NULL, NULL),
(25, 'Nhà Hàng Thiên Hương', 'fádfsdfád', NULL, NULL, NULL, 21.04, 105.81, NULL, 83, 18, NULL, '2011-11-22 15:36:31', '2011-11-22 15:54:27', 1, NULL, NULL, NULL),
(26, 'Sieu thi Metro', 'Sieu thi tien nghi, mat hang da dang', NULL, NULL, NULL, 21.04, 105.79, NULL, NULL, 18, NULL, '2011-11-25 11:04:40', '2011-11-25 11:04:40', 1, NULL, NULL, NULL),
(27, 'Hua', 'My university', NULL, NULL, NULL, 21.04, 105.88, NULL, NULL, 18, NULL, '2011-11-25 11:06:18', '2011-11-25 11:06:18', 1, NULL, NULL, NULL),
(28, 'Nhà thuốc Bảo An', 'Nhà thuốc tây nổi tiếng', NULL, NULL, NULL, 21.01, 105.83, NULL, 86, 3, NULL, '2011-11-25 11:08:48', '2011-11-25 11:09:46', 1, NULL, NULL, NULL),
(29, 'hjdgfjhdf', 'hsdfgsdfg', NULL, NULL, NULL, 21.04, 105.81, NULL, NULL, 1, NULL, '2011-11-29 13:52:36', '2011-11-29 13:52:36', 1, NULL, NULL, NULL),
(30, 'fsfsfsfs', 'sdvvsđsv', NULL, NULL, NULL, 21.03, 105.81, NULL, NULL, 1, NULL, '2011-11-29 13:53:43', '2011-11-29 13:53:43', 1, NULL, NULL, NULL),
(31, 'dknfdffd', 'fdfdfđf', NULL, NULL, NULL, 21.04, 105.78, NULL, NULL, 1, NULL, '2011-11-29 13:58:28', '2011-11-29 13:58:28', 1, NULL, NULL, NULL),
(32, 'dsds', 'dsds', NULL, NULL, NULL, 21.03, 105.80, NULL, NULL, 1, NULL, '2011-11-29 14:05:05', '2011-11-29 14:05:05', 1, NULL, NULL, NULL),
(33, 'hdhgdfhdfgh', NULL, NULL, NULL, NULL, 21.06, 105.80, NULL, NULL, 1, NULL, '2011-11-29 16:32:57', '2011-11-29 16:32:57', 1, NULL, NULL, NULL),
(34, 'gsdghsdf', NULL, 'hsdfghsd', NULL, NULL, 21.04, 105.80, ',Nội dung tag ...', NULL, 1, NULL, '2011-11-30 15:14:22', '2011-12-01 15:11:21', 1, NULL, NULL, NULL),
(35, 'Cho thuê phòng trọ giá rẻ tiện nghi - Bến xe Nam Thăng Long', 'Cho thue phong tang 6 Chung cu Dinh Cong, Dien tich 66m2. Nha 2 dau hoi thoang mat. Gia thue 6tr/thang \r\n', 'Gần bến xe Nam Thăng Long - Hà Nôi', NULL, NULL, 21.04, 105.78, ',Nội dung tag ...,gfhsdhgdfhdf,hflakhdklfhálkdffádffád,fdsgsdfgsdf,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,Nội dung tag ...,N', NULL, 1, 1, '2011-11-30 16:18:37', '2011-12-15 10:41:12', 1, '18', 1, 2),
(36, 'Cho thuê biệt thự', 'Biệt thư 3 tầng với 200m2, đầy đủ tiện nghi', 'Cầu giấy, Hà Nội', NULL, NULL, 21.01, 105.78, NULL, 85, 1, 18, '2011-12-16 10:59:05', '2011-12-16 10:59:11', 1, '1', 1, 3),
(37, 'Cho thuê phòng trọ giá rẻ, khép kín, dưới 2 triệu gần bến xe Nam Thăng Long', 'Nhà ở chung với chủ, an ninh tốt, giá điện 2000/1 số, nước 50k/1 người', 'Số nhà 379, Xuân Đỉnh', '0973956705', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-20 10:13:13', '2011-12-20 10:13:13', 1, NULL, 1, 2),
(38, 'Cho thuê căn hộ gia đình tại Khương Thượng', 'Nhà tháng mát, đầy đủ tiện nghi', 'Khương Thượng, Hà Nội', '0975956705', NULL, 21.02, 105.80, NULL, NULL, 1, NULL, '2011-12-20 11:56:20', '2011-12-20 11:56:20', 1, NULL, 1, 2),
(39, 'Cho thuê phòng tại Ba Đinh, Hà Nội', 'sdfádfa', 'Ba Đình Hà nội', '', NULL, 21.04, 105.83, NULL, NULL, 1, NULL, '2011-12-21 15:30:35', '2011-12-21 15:30:35', 1, NULL, 1, 2),
(40, 'Nhà trọ giá rẻ', '', 'Ba Đình hà nội', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 15:33:49', '2011-12-21 15:33:49', 1, NULL, 1, 2),
(41, 'Cho thuê phòng trọ', '', 'Dịch vọng, cầu giấy, hà nội', '', NULL, 21.03, 105.79, NULL, NULL, 1, NULL, '2011-12-21 15:36:35', '2011-12-21 15:36:35', 1, NULL, 1, 3),
(42, 'Cho thuê phòng trọ', '', 'Từ Liêm - Hà Nội', '', NULL, 21.07, 105.83, NULL, NULL, 1, NULL, '2011-12-21 16:07:20', '2011-12-21 16:07:20', 1, NULL, 1, 2),
(43, 'Cho thuê phòng trọ', '', 'Từ Liêm - Hà Nội', '', NULL, 21.07, 105.83, NULL, NULL, 1, NULL, '2011-12-21 16:07:24', '2011-12-21 16:07:24', 1, NULL, 1, 2),
(44, 'Cho thuê biệt thự', '', 'Nguyễn Thái Học Hà nội', '', NULL, 21.03, 105.84, NULL, NULL, 1, NULL, '2011-12-21 16:11:41', '2011-12-21 16:11:41', 1, NULL, 1, 3),
(45, 'Cho thuê biệt thự', '', 'Nguyễn Thái Học Hà nội', '', NULL, 21.03, 105.84, NULL, NULL, 1, NULL, '2011-12-21 16:11:45', '2011-12-21 16:11:45', 1, NULL, 1, 3),
(46, 'Cho thuê biệt thự', '', 'Giảng Võ - Hà Nội', '', NULL, 21.03, 105.82, NULL, NULL, 1, NULL, '2011-12-21 16:20:05', '2011-12-21 16:20:05', 1, NULL, 1, 3),
(47, 'Cho thuê biệt thự', '', 'Giảng Võ - Hà Nội', '', NULL, 21.03, 105.82, NULL, NULL, 1, NULL, '2011-12-21 16:20:08', '2011-12-21 16:20:08', 1, NULL, 1, 3),
(48, 'Cho thuê biệt thự', '', 'Cầu giấy - Hà nội', '', NULL, 21.03, 105.80, NULL, NULL, 1, NULL, '2011-12-21 16:23:57', '2011-12-21 16:23:57', 1, NULL, 1, 3),
(49, 'Cho thuê biệt thự', '', 'Cầu giấy - Hà nội', '', NULL, 21.03, 105.80, NULL, NULL, 1, NULL, '2011-12-21 16:24:00', '2011-12-21 16:24:00', 1, NULL, 1, 3),
(50, 'Cho thuê nhà trọ', '', 'Quán Thánh - Hà nội', '', NULL, 21.04, 105.84, NULL, NULL, 1, NULL, '2011-12-21 16:28:15', '2011-12-21 16:28:15', 1, NULL, 1, 2),
(51, 'Cho thuê nhà trọ', '', 'Quán Thánh - Hà nội', '', NULL, 21.04, 105.84, NULL, NULL, 1, NULL, '2011-12-21 16:28:18', '2011-12-21 16:28:18', 1, NULL, 1, 2),
(52, 'dsjfkládkl', '', 'jkjsagkjslkdf', '', NULL, 21.04, 105.82, NULL, NULL, 1, NULL, '2011-12-21 16:31:06', '2011-12-21 16:31:06', 1, NULL, 1, 2),
(53, 'dsjfkládkl', '', 'jkjsagkjslkdf', '', NULL, 21.04, 105.82, NULL, NULL, 1, NULL, '2011-12-21 16:31:27', '2011-12-21 16:31:27', 1, NULL, 1, 2),
(54, 'gdsghdf', '', 'hdfhrt', '', NULL, 21.06, 105.82, NULL, NULL, 1, NULL, '2011-12-21 16:34:40', '2011-12-21 16:34:40', 1, NULL, 1, 2),
(55, 'gdsghdf', '', 'hdfhrt', '', NULL, 21.06, 105.82, NULL, NULL, 1, NULL, '2011-12-21 16:34:43', '2011-12-21 16:34:43', 1, NULL, 1, 2),
(56, 'gtsểt', '', 'hetwỷe', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 16:38:33', '2011-12-21 16:38:33', 1, NULL, 1, 2),
(57, 'gtsểt', '', 'hetwỷe', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 16:38:40', '2011-12-21 16:38:40', 1, NULL, 1, 2),
(58, 'tưẻtwe', '', 'tưẻtwẻ', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 16:48:45', '2011-12-21 16:48:45', 1, NULL, 1, 2),
(59, 'tưẻtwe', '', 'tưẻtwẻ', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 16:48:49', '2011-12-21 16:48:49', 1, NULL, 1, 2),
(60, 'dgetỷe', '', 'yétýe', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 16:53:58', '2011-12-21 16:53:58', 1, NULL, 1, 2),
(61, 'dgetỷe', '', 'yétýe', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 16:54:01', '2011-12-21 16:54:01', 1, NULL, 1, 2),
(62, 'dgrtỷe', '', 'hỷeýtẻ', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 16:59:22', '2011-12-21 16:59:22', 1, NULL, 1, 2),
(63, 'dgrtỷe', '', 'hỷeýtẻ', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 16:59:25', '2011-12-21 16:59:25', 1, NULL, 1, 2),
(64, 'fgsdfgsdf', '', 'gsdfgsdf', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 17:06:19', '2011-12-21 17:06:19', 1, NULL, 1, 2),
(65, 'fgsdfgsdf', '', 'gsdfgsdf', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 17:06:23', '2011-12-21 17:06:23', 1, NULL, 1, 2),
(66, 'uỷutryuỷt', '', 'ủeủeyue', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 17:18:32', '2011-12-21 17:18:32', 1, NULL, 1, 2),
(67, 'uỷutryuỷt', '', 'ủeủeyue', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 17:18:36', '2011-12-21 17:18:36', 1, NULL, 1, 2),
(68, 'hdrthyủtýe', '', 'ýhetỷeỷe', '', NULL, 21.01, 105.81, NULL, NULL, 1, NULL, '2011-12-21 17:35:23', '2011-12-21 17:35:23', 1, NULL, 1, 2),
(69, 'hdrthyủtýe', '', 'ýhetỷeỷe', '', NULL, 21.01, 105.81, NULL, NULL, 1, NULL, '2011-12-21 17:35:26', '2011-12-21 17:35:26', 1, NULL, 1, 2),
(70, 'gfhsdfghshd', '', 'sgsfdgsdf', '', NULL, 21.03, 105.82, NULL, NULL, 1, NULL, '2011-12-21 17:50:19', '2011-12-21 17:50:19', 1, NULL, 1, 2),
(71, 'gfhsdfghshd', '', 'sgsfdgsdf', '', NULL, 21.03, 105.82, NULL, NULL, 1, NULL, '2011-12-21 17:50:23', '2011-12-21 17:50:23', 1, NULL, 1, 2),
(72, 'tesrtsert', '', 'drutyrt', '', NULL, 21.03, 105.82, NULL, NULL, 1, NULL, '2011-12-21 18:03:28', '2011-12-21 18:03:28', 1, NULL, 1, 2),
(73, 'tesrtsert', '', 'drutyrt', '', NULL, 21.03, 105.82, NULL, NULL, 1, NULL, '2011-12-21 18:03:31', '2011-12-21 18:03:31', 1, NULL, 1, 2),
(74, 'hdfghdf', '', 'hdrtydrt', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 18:08:18', '2011-12-21 18:08:18', 1, NULL, 1, 2),
(75, 'hdfghdf', '', 'hdrtydrt', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 18:08:21', '2011-12-21 18:08:21', 1, NULL, 1, 2),
(76, 'fsfsafsdf', '', 'sdfsadfsd fsda', '', NULL, 21.02, 105.86, NULL, NULL, 1, NULL, '2011-12-21 18:17:47', '2011-12-21 18:17:47', 1, NULL, 1, 2),
(77, 'fsfsafsdf', '', 'sdfsadfsd fsda', '', NULL, 21.02, 105.86, NULL, NULL, 1, NULL, '2011-12-21 18:17:51', '2011-12-21 18:17:51', 1, NULL, 1, 2),
(78, 'fsafasdf', '', 'sfsafsfsd', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 18:22:05', '2011-12-21 18:22:05', 1, NULL, 1, 2),
(79, 'fsafasdf', '', 'sfsafsfsd', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-21 18:22:08', '2011-12-21 18:22:08', 1, NULL, 1, 2),
(80, 'fsafsdfsa', '', 'sdfsdfsdfsd', '', NULL, 21.01, 105.87, NULL, NULL, 1, NULL, '2011-12-21 18:24:46', '2011-12-21 18:24:46', 1, NULL, 1, 2),
(81, 'fsafsdfsa', '', 'sdfsdfsdfsd', '', NULL, 21.01, 105.87, NULL, NULL, 1, NULL, '2011-12-21 18:24:51', '2011-12-21 18:24:51', 1, NULL, 1, 2),
(82, 'Cho thuê phòng trọ', '', 'Thành Công - Hà Nội', '', NULL, 21.02, 105.82, NULL, NULL, 1, NULL, '2011-12-22 10:07:58', '2011-12-22 10:07:58', 1, NULL, 1, 2),
(83, 'Cho thuê phòng trọ', '', 'Thành Công - Hà Nội', '', NULL, 21.02, 105.82, NULL, NULL, 1, NULL, '2011-12-22 10:08:01', '2011-12-22 10:08:01', 1, NULL, 1, 2),
(84, 'Cho thuê phòng trọ', '', 'Hà Đình - Hà Nội', '', NULL, 20.99, 105.81, NULL, NULL, 1, NULL, '2011-12-22 10:22:39', '2011-12-22 10:22:39', 1, NULL, 1, 2),
(85, 'Cho thuê phòng trọ', '', 'Hà Đình - Hà Nội', '', NULL, 20.99, 105.81, NULL, NULL, 1, NULL, '2011-12-22 10:22:42', '2011-12-22 10:22:42', 1, NULL, 1, 2),
(86, 'Cho thuê căn hộ ba tầng', '', 'Khu tập thể Vĩnh Hồ - Hà Nội', '', NULL, 21.01, 105.82, NULL, NULL, 1, NULL, '2011-12-22 10:27:10', '2011-12-22 10:27:10', 1, NULL, 1, 3),
(87, 'Cho thuê căn hộ ba tầng', '', 'Khu tập thể Vĩnh Hồ - Hà Nội', '', NULL, 21.01, 105.82, NULL, NULL, 1, NULL, '2011-12-22 10:27:13', '2011-12-22 10:27:13', 1, NULL, 1, 3),
(88, 'Cho thuê biệt thự', '', 'Trung Hòa - Nhân Chính - Hà Nội', '', NULL, 21.01, 105.80, NULL, NULL, 1, NULL, '2011-12-22 10:49:58', '2011-12-22 10:49:58', 1, NULL, 1, 3),
(89, 'Cho thuê biệt thự', '', 'Trung Hòa - Nhân Chính - Hà Nội', '', NULL, 21.01, 105.80, NULL, NULL, 1, NULL, '2011-12-22 10:50:01', '2011-12-22 10:50:01', 1, NULL, 1, 3),
(90, 'Cho thuê phòng trọ', '', 'Láng Hạ - Thái Thịnh', '', NULL, 21.02, 105.81, NULL, NULL, 1, NULL, '2011-12-22 10:52:31', '2011-12-22 10:52:31', 1, NULL, 1, 2),
(91, 'Cho thuê phòng trọ', '', 'Láng Hạ - Thái Thịnh', '', NULL, 21.02, 105.81, NULL, NULL, 1, NULL, '2011-12-22 10:52:34', '2011-12-22 10:52:34', 1, NULL, 1, 2),
(92, 'bjdf;lg', '', 'b;lđfkg;lsdk;', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-22 14:20:57', '2011-12-22 14:20:57', 1, NULL, 1, 2),
(93, 'bjdf;lg', '', 'b;lđfkg;lsdk;', '', NULL, 21.02, 105.85, NULL, 24, 1, NULL, '2011-12-22 14:21:00', '2011-12-22 14:21:31', 1, NULL, 1, 2),
(94, 'Cho thuê biệt thự', '', 'sdfasdfád', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-22 14:30:53', '2011-12-22 14:30:53', 1, NULL, 1, 3),
(95, 'Cho thuê biệt thự', '', 'sdfasdfád', '', NULL, 21.02, 105.85, NULL, 24, 1, NULL, '2011-12-22 14:30:57', '2011-12-22 14:32:11', 1, NULL, 1, 3),
(96, 'fghdfgh', '', 'hsdghd', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-22 14:39:45', '2011-12-22 14:39:45', 1, NULL, 1, 2),
(97, 'fghdfgh', '', 'hsdghd', '', NULL, 21.02, 105.85, NULL, 24, 1, NULL, '2011-12-22 14:39:49', '2011-12-22 14:40:16', 1, NULL, 1, 2),
(98, 'fsdfsadf', '', 'gágsdfgsdf', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-22 14:53:36', '2011-12-22 14:53:36', 1, NULL, 1, 2),
(99, 'fsdfsadf', '', 'gágsdfgsdf', '', NULL, 21.02, 105.85, NULL, 24, 1, NULL, '2011-12-22 14:53:39', '2011-12-22 14:58:09', 1, NULL, 1, 2),
(100, 'fgsdgsd', '', 'gsgsdfgsđ', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-22 15:30:13', '2011-12-22 15:30:13', 1, NULL, 1, 2),
(101, 'fgsdgsd', '', 'gsgsdfgsđ', '', NULL, 21.02, 105.85, NULL, 24, 1, NULL, '2011-12-22 15:30:16', '2011-12-22 15:31:55', 1, NULL, 1, 2),
(102, 'hgjfghj', '', 'jfụtyủty', '', NULL, 21.02, 105.85, NULL, NULL, 1, NULL, '2011-12-22 15:34:00', '2011-12-22 15:34:00', 1, NULL, 1, 2),
(103, 'hgjfghj', '', 'jfụtyủty', '', NULL, 21.02, 105.85, NULL, 24, 1, NULL, '2011-12-22 15:34:04', '2011-12-22 15:35:27', 1, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pos_category`
--

CREATE TABLE `pos_category` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies category',
  `name` varchar(255) collate utf8_unicode_ci NOT NULL COMMENT 'name is of category',
  `description` text collate utf8_unicode_ci COMMENT 'desc is of category',
  `name_table` varchar(255) collate utf8_unicode_ci default NULL COMMENT 'Tên bảng thuộc tính tương ứng với Category',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) default NULL COMMENT 'id identifies category',
  `type` tinyint(4) default NULL COMMENT 'Cho phép ẩn/ hiện category',
  `code` varchar(100) collate utf8_unicode_ci default NULL COMMENT 'code of pos category',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id_idx` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pos_category`
--

INSERT INTO `pos_category` (`id`, `name`, `description`, `name_table`, `created_at`, `updated_at`, `parent_id`, `type`, `code`) VALUES
(1, 'Nhà cho thuê', NULL, 'pos_rent_house', '2011-12-02 15:34:43', '2011-12-02 15:34:49', NULL, 0, 'pos_rent_house'),
(2, 'Cho thuê phòng trọ', NULL, NULL, '2011-12-05 09:11:12', '2011-12-05 09:11:18', 1, 0, NULL),
(3, 'Cho thuê biệt thự', NULL, NULL, '2011-12-05 09:12:05', '2011-12-05 09:12:10', 1, 0, NULL),
(4, 'Quán bia', NULL, NULL, '2011-12-13 08:52:36', '2011-12-13 08:52:43', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_checkin`
--

CREATE TABLE `pos_checkin` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies pos_checkin',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `status` tinyint(4) NOT NULL default '0' COMMENT 'status is of pos_checkin',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_public` int(1) NOT NULL default '1' COMMENT 'Public Flag',
  PRIMARY KEY  (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `pos_checkin`
--

INSERT INTO `pos_checkin` (`id`, `pos_id`, `member_id`, `status`, `created_at`, `updated_at`, `is_public`) VALUES
(1, 1, 1, 0, '2011-11-07 16:05:15', '2011-12-23 11:00:02', 1),
(2, 1, 3, 0, '2011-11-08 16:09:36', '2011-11-25 11:08:56', 1),
(3, 1, 5, 1, '2011-11-07 15:56:00', '2011-11-07 16:09:36', 1),
(4, 1, 15, 0, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1),
(5, 2, 1, 0, '2011-11-21 15:24:40', '2011-12-23 11:00:02', 1),
(6, 5, 1, 0, '2011-11-22 09:14:56', '2011-12-23 11:00:02', 1),
(7, 3, 1, 0, '2011-11-22 09:16:42', '2011-12-23 11:00:02', 1),
(9, 4, 1, 0, '2011-11-22 10:01:49', '2011-12-23 11:00:02', 1),
(10, 23, 1, 0, '2011-11-22 15:14:54', '2011-12-23 11:00:02', 1),
(11, 23, 1, 0, '2011-11-22 15:14:58', '2011-12-23 11:00:02', 1),
(12, 23, 1, 0, '2011-11-22 15:15:01', '2011-12-23 11:00:02', 1),
(13, 23, 1, 0, '2011-11-22 15:15:02', '2011-12-23 11:00:02', 1),
(14, 23, 1, 0, '2011-11-22 15:15:04', '2011-12-23 11:00:02', 1),
(15, 23, 1, 0, '2011-11-22 15:15:06', '2011-12-23 11:00:02', 1),
(16, 23, 1, 0, '2011-11-22 15:15:08', '2011-12-23 11:00:02', 1),
(17, 23, 1, 0, '2011-11-22 15:15:09', '2011-12-23 11:00:02', 1),
(18, 23, 1, 0, '2011-11-22 15:15:11', '2011-12-23 11:00:02', 1),
(19, 23, 1, 0, '2011-11-22 15:15:13', '2011-12-23 11:00:02', 1),
(20, 23, 1, 0, '2011-11-22 15:15:15', '2011-12-23 11:00:02', 1),
(21, 23, 1, 0, '2011-11-22 15:15:16', '2011-12-23 11:00:02', 1),
(22, 23, 1, 0, '2011-11-22 15:15:18', '2011-12-23 11:00:02', 1),
(23, 21, 1, 0, '2011-11-22 15:18:13', '2011-12-23 11:00:02', 1),
(24, 21, 1, 0, '2011-11-22 15:18:26', '2011-12-23 11:00:02', 1),
(25, 21, 1, 0, '2011-11-22 15:18:27', '2011-12-23 11:00:02', 1),
(26, 21, 1, 0, '2011-11-22 15:18:29', '2011-12-23 11:00:02', 1),
(27, 21, 1, 0, '2011-11-22 15:18:31', '2011-12-23 11:00:02', 1),
(28, 21, 1, 0, '2011-11-22 15:18:33', '2011-12-23 11:00:02', 1),
(29, 22, 1, 0, '2011-11-22 15:19:00', '2011-12-23 11:00:02', 1),
(30, 22, 1, 0, '2011-11-22 15:19:23', '2011-12-23 11:00:02', 1),
(31, 24, 1, 0, '2011-11-22 15:27:57', '2011-12-23 11:00:02', 1),
(32, 25, 18, 0, '2011-11-22 15:36:53', '2011-11-26 10:10:54', 1),
(38, 25, 1, 0, '2011-11-25 10:54:23', '2011-12-23 11:00:02', 1),
(39, 26, 18, 0, '2011-11-25 11:04:57', '2011-11-26 10:10:54', 1),
(40, 27, 18, 0, '2011-11-25 11:06:28', '2011-11-26 10:10:54', 1),
(41, 27, 1, 0, '2011-11-25 11:07:26', '2011-12-23 11:00:02', 1),
(42, 28, 3, 1, '2011-11-25 11:08:56', '2011-11-25 11:08:56', 1),
(43, 28, 1, 0, '2011-11-25 11:10:36', '2011-12-23 11:00:02', 1),
(44, 23, 1, 0, '2011-11-26 09:10:37', '2011-12-23 11:00:02', 1),
(45, 22, 1, 0, '2011-11-26 09:11:12', '2011-12-23 11:00:02', 1),
(46, 21, 1, 0, '2011-11-26 09:11:33', '2011-12-23 11:00:02', 1),
(47, 24, 1, 0, '2011-11-26 09:48:43', '2011-12-23 11:00:02', 1),
(48, 23, 1, 0, '2011-11-26 09:48:56', '2011-12-23 11:00:02', 1),
(49, 2, 1, 0, '2011-11-26 10:07:24', '2011-12-23 11:00:02', 1),
(50, 25, 18, 1, '2011-11-26 10:10:54', '2011-11-26 10:10:54', 1),
(51, 25, 1, 0, '2011-11-29 13:51:21', '2011-12-23 11:00:02', 1),
(52, 32, 1, 0, '2011-11-29 14:05:45', '2011-12-23 11:00:02', 1),
(53, 32, 1, 0, '2011-11-29 14:05:47', '2011-12-23 11:00:02', 1),
(54, 32, 1, 0, '2011-11-29 14:05:48', '2011-12-23 11:00:02', 1),
(55, 33, 1, 0, '2011-11-29 16:36:16', '2011-12-23 11:00:02', 1),
(56, 31, 1, 0, '2011-11-29 16:36:58', '2011-12-23 11:00:02', 1),
(57, 33, 1, 0, '2011-11-29 16:39:33', '2011-12-23 11:00:02', 1),
(58, 34, 1, 0, '2011-12-01 14:23:03', '2011-12-23 11:00:02', 1),
(59, 35, 1, 0, '2011-12-01 16:04:55', '2011-12-23 11:00:02', 1),
(60, 32, 1, 0, '2011-12-01 16:46:26', '2011-12-23 11:00:02', 1),
(61, 2, 1, 0, '2011-12-16 10:12:03', '2011-12-23 11:00:02', 1),
(62, 35, 1, 0, '2011-12-16 10:22:11', '2011-12-23 11:00:02', 1),
(63, 35, 1, 0, '2011-12-16 10:24:51', '2011-12-23 11:00:02', 1),
(64, 35, 1, 0, '2011-12-16 10:25:28', '2011-12-23 11:00:02', 1),
(65, 2, 1, 0, '2011-12-16 10:29:03', '2011-12-23 11:00:02', 1),
(66, 2, 1, 0, '2011-12-16 10:29:36', '2011-12-23 11:00:02', 1),
(67, 2, 1, 0, '2011-12-16 10:30:51', '2011-12-23 11:00:02', 1),
(68, 35, 1, 0, '2011-12-16 10:35:21', '2011-12-23 11:00:02', 1),
(69, 36, 1, 0, '2011-12-16 13:40:19', '2011-12-23 11:00:02', 1),
(70, 103, 1, 0, '2011-12-23 10:52:41', '2011-12-23 11:00:02', 1),
(71, 102, 1, 0, '2011-12-23 10:59:14', '2011-12-23 11:00:02', 1),
(72, 101, 1, 1, '2011-12-23 11:00:02', '2011-12-23 11:00:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_comment`
--

CREATE TABLE `pos_comment` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies pos_comment',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `content` text collate utf8_unicode_ci NOT NULL COMMENT 'content is of pos_comment',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `claim_status` tinyint(4) default NULL COMMENT 'claim_status is of pos_comment',
  `status` tinyint(4) NOT NULL default '0' COMMENT 'status is of pos_comment',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Dumping data for table `pos_comment`
--

INSERT INTO `pos_comment` (`id`, `pos_id`, `content`, `member_id`, `claim_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nha hang co chat luong phuc vu rat tot', 1, NULL, 1, '2011-11-07 16:06:20', '2011-11-07 16:06:26'),
(2, 1, 'Nha hang nay co mon nhau ngon tuyet', 3, NULL, 1, '2011-11-10 09:39:36', '2011-11-10 09:39:41'),
(3, 1, 'Chia se thong tin cua ban ve dia diem nay', 1, NULL, 1, '2011-11-10 16:19:33', '2011-11-10 16:19:33'),
(4, 1, 'Nha hang gia hoi dat', 1, NULL, 1, '2011-11-10 16:22:10', '2011-11-10 16:22:10'),
(5, 1, 'Chia se thong tin cua ban ve dia diem nay', 1, NULL, 1, '2011-11-10 16:29:49', '2011-11-10 16:29:49'),
(6, 1, 'nha hang nay khuan vien cung rong, khong qua on ao giua long thu do', 1, NULL, 1, '2011-11-10 16:37:58', '2011-11-10 16:37:58'),
(7, 1, 'hom truoc ban minh to chuc sinh nhat o day, vui  lam, hihi', 1, NULL, 1, '2011-11-10 16:40:07', '2011-11-10 16:40:07'),
(8, 1, 'Chia se thong tin cua ban ve dia diem nay', 1, NULL, 1, '2011-11-11 11:14:01', '2011-11-11 11:14:01'),
(9, 1, 'Chia se thong tin cua ban ve dia diem naysdferstswe', 1, NULL, 1, '2011-11-11 11:36:49', '2011-11-11 11:36:49'),
(10, 1, 'Chia se thong tin cua ban ve dia diem nayfádfádfád', 1, NULL, 1, '2011-11-11 11:47:32', '2011-11-11 11:47:32'),
(11, 1, 'gàgsdfgsfdgsdf', 1, NULL, 1, '2011-11-11 11:48:32', '2011-11-11 11:48:32'),
(12, 1, 'fgsdfgdhdjfgh', 1, NULL, 1, '2011-11-11 11:51:33', '2011-11-11 11:51:33'),
(13, 1, 'Chia se thong tin cua ban ve dia diem nay', 1, NULL, 1, '2011-11-11 14:44:59', '2011-11-11 14:44:59'),
(14, 1, 'jdhfsjdfhsjd hfsdkjf sdfsdfsd', 1, NULL, 1, '2011-11-11 14:45:16', '2011-11-11 14:45:16'),
(15, 1, 'sdfgsdfgsdfgsđfgsdf', 1, NULL, 1, '2011-11-11 14:58:49', '2011-11-11 14:58:49'),
(16, 2, 'fdgsdffgsdf', 1, NULL, 1, '2011-11-21 15:20:36', '2011-11-21 15:20:36'),
(17, 35, 'fgsdfgsdfgs', 1, NULL, 1, '2011-12-05 11:55:39', '2011-12-05 11:55:39'),
(18, 35, 'gsfdgsdfgsfd', 1, NULL, 1, '2011-12-05 11:56:03', '2011-12-05 11:56:03'),
(19, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:08:57', '2011-12-05 17:08:57'),
(20, 1, 'fgdgsdfgsdf', 1, NULL, 1, '2011-12-05 17:09:17', '2011-12-05 17:09:17'),
(21, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:12:11', '2011-12-05 17:12:11'),
(22, 1, 'gsfdgasdfasd', 1, NULL, 1, '2011-12-05 17:13:48', '2011-12-05 17:13:48'),
(23, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:15:46', '2011-12-05 17:15:46'),
(24, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:16:36', '2011-12-05 17:16:36'),
(25, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:18:25', '2011-12-05 17:18:25'),
(26, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:19:55', '2011-12-05 17:19:55'),
(27, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:38:30', '2011-12-05 17:38:30'),
(28, 1, 'gfagsfgá', 1, NULL, 1, '2011-12-05 17:38:50', '2011-12-05 17:38:50'),
(29, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:39:55', '2011-12-05 17:39:55'),
(30, 1, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:43:29', '2011-12-05 17:43:29'),
(31, 35, 'dgágádgádgadsg', 1, NULL, 1, '2011-12-05 17:44:59', '2011-12-05 17:44:59'),
(32, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:46:08', '2011-12-05 17:46:08'),
(33, 35, 'sđhgsdhdghdrthdrtỷe', 1, NULL, 1, '2011-12-05 17:48:52', '2011-12-05 17:48:52'),
(34, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:53:38', '2011-12-05 17:53:38'),
(35, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-05 17:54:12', '2011-12-05 17:54:12'),
(36, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 09:32:05', '2011-12-07 09:32:05'),
(37, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 09:52:13', '2011-12-07 09:52:13'),
(38, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:05:14', '2011-12-07 10:05:14'),
(39, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:11:30', '2011-12-07 10:11:30'),
(40, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:27:09', '2011-12-07 10:27:09'),
(41, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:27:16', '2011-12-07 10:27:16'),
(42, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 10:55:24', '2011-12-07 10:55:24'),
(43, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-07 11:00:06', '2011-12-07 11:00:06'),
(44, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 08:29:39', '2011-12-09 08:29:39'),
(45, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 08:32:07', '2011-12-09 08:32:07'),
(46, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 08:53:49', '2011-12-09 08:53:49'),
(47, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 09:03:03', '2011-12-09 09:03:03'),
(48, 35, 'tesst', 1, NULL, 1, '2011-12-09 09:18:04', '2011-12-09 09:18:04'),
(49, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 09:39:03', '2011-12-09 09:39:03'),
(50, 35, 'fgskdf;lkgs;lldfkgl;skdfl;gksd', 1, NULL, 1, '2011-12-09 09:44:19', '2011-12-09 09:44:19'),
(51, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 09:48:36', '2011-12-09 09:48:36'),
(52, 35, 'nhà trọ này giá rẻ lại tiện nghi', 1, NULL, 1, '2011-12-09 09:50:44', '2011-12-09 09:50:44'),
(53, 35, 'Nhà trọ này khá rộng, và sạch sẽ', 1, NULL, 1, '2011-12-09 10:00:56', '2011-12-09 10:00:56'),
(54, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:06:39', '2011-12-09 10:06:39'),
(55, 35, 'Cho thuê nhà trọ giá rẻ bất ngờ', 1, NULL, 1, '2011-12-09 10:09:54', '2011-12-09 10:09:54'),
(56, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:13:35', '2011-12-09 10:13:35'),
(57, 35, 'fdlgk;lsdfkg;skd;glskdl;', 1, NULL, 1, '2011-12-09 10:16:42', '2011-12-09 10:16:42'),
(58, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:19:40', '2011-12-09 10:19:40'),
(59, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:38:32', '2011-12-09 10:38:32'),
(60, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:39:18', '2011-12-09 10:39:18'),
(61, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:41:48', '2011-12-09 10:41:48'),
(62, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:46:28', '2011-12-09 10:46:28'),
(63, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 10:47:12', '2011-12-09 10:47:12'),
(64, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:11:44', '2011-12-09 11:11:44'),
(65, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:12:43', '2011-12-09 11:12:43'),
(66, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:30:21', '2011-12-09 11:30:21'),
(67, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:32:24', '2011-12-09 11:32:24'),
(68, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:34:46', '2011-12-09 11:34:46'),
(69, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:39:03', '2011-12-09 11:39:03'),
(70, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:45:08', '2011-12-09 11:45:08'),
(71, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:45:14', '2011-12-09 11:45:14'),
(72, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 11:46:14', '2011-12-09 11:46:14'),
(73, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:02', '2011-12-09 12:14:02'),
(74, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:04', '2011-12-09 12:14:04'),
(75, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:06', '2011-12-09 12:14:06'),
(76, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:07', '2011-12-09 12:14:07'),
(77, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:28', '2011-12-09 12:14:28'),
(78, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:29', '2011-12-09 12:14:29'),
(79, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:35', '2011-12-09 12:14:35'),
(80, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:36', '2011-12-09 12:14:36'),
(81, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 12:14:37', '2011-12-09 12:14:37'),
(82, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 13:37:44', '2011-12-09 13:37:44'),
(83, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 17:19:24', '2011-12-09 17:19:24'),
(84, 35, 'sgsdfgsdff', 1, NULL, 1, '2011-12-09 17:19:43', '2011-12-09 17:19:43'),
(85, 35, 'sgsdfgsdff', 1, NULL, 1, '2011-12-09 17:20:02', '2011-12-09 17:20:02'),
(86, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 17:20:29', '2011-12-09 17:20:29'),
(87, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 17:25:51', '2011-12-09 17:25:51'),
(88, 35, 'kgjfdlkgjalksjdgkládjd', 1, NULL, 1, '2011-12-09 17:27:16', '2011-12-09 17:27:16'),
(89, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-09 17:29:36', '2011-12-09 17:29:36'),
(90, 35, 'dfgsdfgsdfgsdfgsd', 1, NULL, 1, '2011-12-09 17:37:11', '2011-12-09 17:37:11'),
(91, 35, 'nhà trọ cho thuê', 1, NULL, 1, '2011-12-09 17:43:10', '2011-12-09 17:43:10'),
(92, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-10 08:41:06', '2011-12-10 08:41:06'),
(93, 35, 'fákd;lfka;slkf;lád', 1, NULL, 1, '2011-12-15 08:35:52', '2011-12-15 08:35:52'),
(94, 35, 'fákd;lfka;slkf;lád', 1, NULL, 1, '2011-12-15 08:35:59', '2011-12-15 08:35:59'),
(95, 35, 'jfdkgjsdflkgjslkdfjgks', 1, NULL, 1, '2011-12-15 08:41:31', '2011-12-15 08:41:31'),
(96, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-15 08:49:07', '2011-12-15 08:49:07'),
(97, 35, 'dfshdsgfhdfghdf', 1, NULL, 1, '2011-12-15 09:01:53', '2011-12-15 09:01:53'),
(98, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-19 14:44:30', '2011-12-19 14:44:30'),
(99, 35, 'Chia sẻ thông tin của bạn về địa điểm', 1, NULL, 1, '2011-12-19 15:10:36', '2011-12-19 15:10:36'),
(100, 35, 'gàgsdfgsdfgs', 1, NULL, 1, '2011-12-20 09:14:29', '2011-12-20 09:14:29'),
(101, 35, 'hello, how are you', 1, NULL, 1, '2011-12-20 09:15:24', '2011-12-20 09:15:24');

-- --------------------------------------------------------

--
-- Table structure for table `pos_follow`
--

CREATE TABLE `pos_follow` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies pos_follow',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `status` tinyint(4) NOT NULL default '0' COMMENT 'status is of pos_follow',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_public` int(1) NOT NULL default '1' COMMENT 'Public Flag',
  PRIMARY KEY  (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `pos_follow`
--

INSERT INTO `pos_follow` (`id`, `pos_id`, `member_id`, `status`, `created_at`, `updated_at`, `is_public`) VALUES
(1, 1, 1, 0, '2011-11-07 16:06:49', '2011-12-23 11:00:51', 1),
(2, 1, 3, 0, '2011-11-07 16:09:36', '2011-11-25 11:09:01', 1),
(3, 1, 15, 0, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1),
(4, 2, 1, 0, '2011-11-21 15:25:00', '2011-12-23 11:00:51', 1),
(8, 3, 1, 0, '2011-11-22 09:57:07', '2011-12-23 11:00:51', 1),
(9, 5, 1, 0, '2011-11-22 10:01:33', '2011-12-23 11:00:51', 1),
(10, 4, 1, 0, '2011-11-22 10:10:47', '2011-12-23 11:00:51', 1),
(11, 23, 1, 0, '2011-11-22 15:17:15', '2011-12-23 11:00:51', 1),
(12, 22, 1, 0, '2011-11-22 15:21:53', '2011-12-23 11:00:51', 1),
(13, 22, 1, 0, '2011-11-22 15:22:10', '2011-12-23 11:00:51', 1),
(14, 21, 1, 0, '2011-11-22 15:24:41', '2011-12-23 11:00:51', 1),
(15, 25, 18, 0, '2011-11-22 15:48:19', '2011-11-25 11:06:33', 1),
(16, 25, 1, 0, '2011-11-25 10:52:43', '2011-12-23 11:00:51', 1),
(17, 26, 18, 0, '2011-11-25 11:05:04', '2011-11-25 11:06:33', 1),
(18, 27, 18, 1, '2011-11-25 11:06:33', '2011-11-25 11:06:33', 1),
(19, 27, 1, 0, '2011-11-25 11:07:33', '2011-12-23 11:00:51', 1),
(20, 28, 3, 1, '2011-11-25 11:09:01', '2011-11-25 11:09:01', 1),
(21, 28, 1, 0, '2011-11-25 11:10:42', '2011-12-23 11:00:51', 1),
(22, 29, 1, 0, '2011-11-29 13:52:49', '2011-12-23 11:00:51', 1),
(23, 30, 1, 0, '2011-11-29 13:53:53', '2011-12-23 11:00:51', 1),
(24, 30, 1, 0, '2011-11-29 13:53:54', '2011-12-23 11:00:51', 1),
(25, 30, 1, 0, '2011-11-29 13:53:56', '2011-12-23 11:00:51', 1),
(26, 30, 1, 0, '2011-11-29 13:53:58', '2011-12-23 11:00:51', 1),
(27, 30, 1, 0, '2011-11-29 13:54:00', '2011-12-23 11:00:51', 1),
(28, 30, 1, 0, '2011-11-29 13:54:02', '2011-12-23 11:00:51', 1),
(29, 30, 1, 0, '2011-11-29 13:54:03', '2011-12-23 11:00:51', 1),
(30, 30, 1, 0, '2011-11-29 13:54:05', '2011-12-23 11:00:51', 1),
(31, 31, 1, 0, '2011-11-29 13:58:41', '2011-12-23 11:00:51', 1),
(32, 31, 1, 0, '2011-11-29 13:58:43', '2011-12-23 11:00:51', 1),
(33, 31, 1, 0, '2011-11-29 13:58:45', '2011-12-23 11:00:51', 1),
(34, 31, 1, 0, '2011-11-29 13:58:46', '2011-12-23 11:00:51', 1),
(35, 31, 1, 0, '2011-11-29 13:58:48', '2011-12-23 11:00:51', 1),
(36, 32, 1, 0, '2011-11-29 14:05:13', '2011-12-23 11:00:51', 1),
(37, 33, 1, 0, '2011-11-29 16:33:23', '2011-12-23 11:00:51', 1),
(38, 34, 1, 0, '2011-12-01 14:23:11', '2011-12-23 11:00:51', 1),
(39, 35, 1, 0, '2011-12-01 16:05:00', '2011-12-23 11:00:51', 1),
(40, 35, 18, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(41, 35, 18, 0, '2011-12-05 09:12:05', '2011-12-05 09:12:05', 1),
(42, 36, 1, 0, '2011-12-16 13:40:28', '2011-12-23 11:00:51', 1),
(43, 101, 1, 1, '2011-12-23 11:00:51', '2011-12-23 11:00:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_log`
--

CREATE TABLE `pos_log` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies pos_log',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `content` text collate utf8_unicode_ci NOT NULL COMMENT 'content is of pos_log',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pos_log`
--

INSERT INTO `pos_log` (`id`, `pos_id`, `member_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '', '2011-11-07 16:08:16', '2011-11-07 16:08:22');

-- --------------------------------------------------------

--
-- Table structure for table `pos_photo`
--

CREATE TABLE `pos_photo` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies pos_photo',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `file_id` int(11) NOT NULL COMMENT 'File id',
  `claim_status` tinyint(4) default NULL COMMENT 'claim_status is of pos_photo',
  `status` tinyint(4) NOT NULL default '0' COMMENT 'status is of pos_photo',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_public` int(1) NOT NULL default '1' COMMENT 'Public Flag',
  `description` text COMMENT 'desc is of pos photo',
  PRIMARY KEY  (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=128 ;

--
-- Dumping data for table `pos_photo`
--

INSERT INTO `pos_photo` (`id`, `member_id`, `pos_id`, `file_id`, `claim_status`, `status`, `created_at`, `updated_at`, `is_public`, `description`) VALUES
(2, 1, 1, 24, NULL, 1, '2011-11-07 16:10:08', '2011-11-07 16:10:14', 1, NULL),
(3, 1, 1, 7, NULL, 1, '2011-11-07 16:10:39', '2011-11-07 16:10:39', 1, NULL),
(4, 1, 1, 8, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(5, 1, 1, 9, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(6, 1, 1, 10, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(7, 1, 1, 11, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(8, 1, 1, 12, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(9, 1, 1, 13, NULL, 0, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(10, 1, 1, 14, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(11, 1, 1, 15, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(12, 1, 1, 16, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(13, 1, 1, 17, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(14, 1, 1, 18, NULL, 1, '2011-11-07 16:09:36', '2011-11-07 16:09:36', 1, NULL),
(16, 1, 1, 67, NULL, 1, '2011-11-21 14:12:55', '2011-11-21 14:12:55', 1, NULL),
(17, 1, 1, 68, NULL, 1, '2011-11-21 14:35:47', '2011-11-21 14:35:47', 1, NULL),
(18, 1, 1, 69, NULL, 1, '2011-11-21 14:42:40', '2011-11-21 14:42:40', 1, NULL),
(19, 1, 1, 70, NULL, 1, '2011-11-21 14:48:37', '2011-11-21 14:48:37', 1, NULL),
(20, 1, 1, 71, NULL, 1, '2011-11-21 15:11:40', '2011-11-21 15:11:40', 1, NULL),
(21, 1, 1, 72, NULL, 1, '2011-11-21 15:12:46', '2011-11-21 15:12:46', 1, NULL),
(22, 1, 1, 73, NULL, 1, '2011-11-21 16:53:25', '2011-11-21 16:53:25', 1, NULL),
(23, 1, 1, 74, NULL, 1, '2011-11-21 17:32:16', '2011-11-21 17:32:16', 1, NULL),
(24, 1, 1, 75, NULL, 1, '2011-11-21 17:44:53', '2011-11-21 17:44:53', 1, NULL),
(25, 1, 1, 76, NULL, 1, '2011-11-21 17:45:18', '2011-11-21 17:45:18', 1, NULL),
(26, 1, 1, 77, NULL, 1, '2011-11-21 17:49:22', '2011-11-21 17:49:22', 1, NULL),
(27, 1, 1, 78, NULL, 1, '2011-11-21 17:49:30', '2011-11-21 17:49:30', 1, NULL),
(28, 1, 1, 79, NULL, 1, '2011-11-21 17:50:30', '2011-11-21 17:50:30', 1, NULL),
(29, 1, 1, 80, NULL, 1, '2011-11-22 14:03:02', '2011-11-22 14:03:02', 1, NULL),
(30, 1, 1, 81, NULL, 1, '2011-11-22 14:16:55', '2011-11-22 14:16:55', 1, NULL),
(31, 1, 1, 82, NULL, 1, '2011-11-22 14:18:13', '2011-11-22 14:18:13', 1, NULL),
(32, 18, 25, 83, NULL, 1, '2011-11-22 15:44:37', '2011-11-22 15:44:37', 1, NULL),
(33, 18, 25, 84, NULL, 1, '2011-11-22 15:45:45', '2011-11-22 15:45:45', 1, NULL),
(34, 1, 1, 85, NULL, 1, '2011-11-23 14:35:07', '2011-11-23 14:35:07', 1, NULL),
(35, 3, 28, 86, NULL, 1, '2011-11-25 11:09:25', '2011-11-25 11:09:25', 1, NULL),
(36, 1, 24, 87, NULL, 1, '2011-11-25 14:50:30', '2011-11-25 14:50:30', 1, NULL),
(37, 1, 24, 88, NULL, 1, '2011-11-25 14:53:22', '2011-11-25 14:53:22', 1, NULL),
(38, 1, 1, 89, NULL, 1, '2011-11-28 15:00:42', '2011-11-28 15:00:42', 1, NULL),
(39, 1, 1, 90, NULL, 1, '2011-11-28 15:30:05', '2011-11-28 15:30:05', 1, NULL),
(40, 1, 1, 91, NULL, 1, '2011-11-29 17:02:09', '2011-11-29 17:02:09', 1, NULL),
(41, 1, 34, 92, NULL, 1, '2011-12-01 10:47:25', '2011-12-01 10:47:25', 1, NULL),
(42, 1, 34, 93, NULL, 1, '2011-12-01 10:47:43', '2011-12-01 10:47:43', 1, NULL),
(43, 1, 34, 94, NULL, 1, '2011-12-01 11:14:36', '2011-12-01 11:14:36', 1, NULL),
(44, 1, 34, 95, NULL, 1, '2011-12-01 11:25:19', '2011-12-01 11:25:19', 1, NULL),
(45, 1, 34, 96, NULL, 1, '2011-12-01 11:25:49', '2011-12-01 11:25:49', 1, NULL),
(46, 1, 34, 97, NULL, 1, '2011-12-01 11:32:01', '2011-12-01 11:32:01', 1, NULL),
(47, 1, 34, 98, NULL, 1, '2011-12-01 11:32:22', '2011-12-01 11:32:22', 1, NULL),
(48, 1, 34, 99, NULL, 1, '2011-12-01 11:32:40', '2011-12-01 11:32:40', 1, NULL),
(49, 1, 34, 100, NULL, 1, '2011-12-01 11:32:47', '2011-12-01 11:32:47', 1, NULL),
(50, 1, 34, 101, NULL, 1, '2011-12-01 11:32:54', '2011-12-01 11:32:54', 1, NULL),
(51, 1, 34, 102, NULL, 1, '2011-12-01 11:35:47', '2011-12-01 11:35:47', 1, NULL),
(52, 1, 34, 103, NULL, 1, '2011-12-01 11:36:08', '2011-12-01 11:36:08', 1, NULL),
(53, 1, 34, 104, NULL, 1, '2011-12-01 11:36:19', '2011-12-01 11:36:19', 1, NULL),
(54, 1, 34, 105, NULL, 1, '2011-12-01 11:36:25', '2011-12-01 11:36:25', 1, NULL),
(55, 1, 32, 106, NULL, 1, '2011-12-01 15:20:16', '2011-12-01 15:20:16', 1, NULL),
(56, 1, 1, 107, NULL, 1, '2011-12-01 15:34:36', '2011-12-01 15:34:36', 1, NULL),
(57, 1, 35, 108, NULL, 1, '2011-12-02 16:14:16', '2011-12-02 16:14:16', 1, NULL),
(58, 1, 35, 109, NULL, 1, '2011-12-05 11:35:54', '2011-12-05 11:35:54', 1, NULL),
(59, 1, 35, 110, NULL, 1, '2011-12-09 11:49:55', '2011-12-09 11:49:55', 1, NULL),
(60, 1, 35, 111, NULL, 1, '2011-12-09 11:58:11', '2011-12-09 11:58:11', 1, NULL),
(61, 1, 35, 112, NULL, 1, '2011-12-09 11:58:43', '2011-12-09 11:58:43', 1, NULL),
(62, 1, 35, 113, NULL, 1, '2011-12-09 14:01:10', '2011-12-09 14:01:10', 1, NULL),
(63, 1, 35, 115, NULL, 1, '2011-12-10 10:04:18', '2011-12-10 10:04:18', 1, NULL),
(64, 1, 35, 116, NULL, 1, '2011-12-15 09:04:56', '2011-12-15 09:04:56', 1, NULL),
(65, 1, 35, 117, NULL, 1, '2011-12-15 09:06:00', '2011-12-15 09:06:00', 1, NULL),
(66, 1, 35, 118, NULL, 1, '2011-12-15 09:10:35', '2011-12-15 09:10:35', 1, NULL),
(67, 1, 2, 119, NULL, 1, '2011-12-19 12:00:00', '2011-12-19 12:00:00', 1, NULL),
(68, 1, 1, 120, NULL, 1, '2011-12-21 15:24:07', '2011-12-21 15:24:07', 1, NULL),
(69, 1, 41, 121, NULL, 1, '2011-12-21 15:37:02', '2011-12-21 15:37:02', 1, NULL),
(70, 1, 45, 123, NULL, 1, '2011-12-21 16:12:25', '2011-12-21 16:12:25', 1, NULL),
(71, 1, 47, 124, NULL, 1, '2011-12-21 16:20:55', '2011-12-21 16:20:55', 1, NULL),
(72, 1, 49, 125, NULL, 1, '2011-12-21 16:24:26', '2011-12-21 16:24:26', 1, NULL),
(73, 1, 51, 126, NULL, 1, '2011-12-21 16:28:52', '2011-12-21 16:28:52', 1, NULL),
(74, 1, 53, 127, NULL, 1, '2011-12-21 16:33:58', '2011-12-21 16:33:58', 1, NULL),
(75, 1, 55, 128, NULL, 1, '2011-12-21 16:35:15', '2011-12-21 16:35:15', 1, '1'),
(76, 1, 57, 129, NULL, 1, '2011-12-21 16:41:14', '2011-12-21 16:41:14', 1, '1'),
(77, 1, 59, 130, NULL, 1, '2011-12-21 16:49:33', '2011-12-21 16:49:33', 1, 'Mặt trước ngôi nhà'),
(78, 1, 61, 131, NULL, 1, '2011-12-21 16:54:39', '2011-12-21 16:54:39', 1, 'Mặt trước ngôi nhà'),
(79, 1, 63, 132, NULL, 1, '2011-12-21 17:00:05', '2011-12-21 17:00:05', 1, 'Mặt trước ngôi nhà'),
(80, 1, 65, 133, NULL, 1, '2011-12-21 17:06:47', '2011-12-21 17:06:47', 1, 'Mặt trước ngôi nhà'),
(81, 1, 67, 134, NULL, 1, '2011-12-21 17:19:17', '2011-12-21 17:19:17', 1, 'Mặt sau ngôi nhà'),
(82, 1, 69, 135, NULL, 1, '2011-12-21 17:35:58', '2011-12-21 17:35:58', 1, 'Mặt trước'),
(83, 1, 71, 136, NULL, 1, '2011-12-21 17:50:45', '2011-12-21 17:50:45', 1, 'fgsdfgs'),
(84, 1, 73, 137, NULL, 1, '2011-12-21 18:04:01', '2011-12-21 18:04:01', 1, NULL),
(85, 1, 75, 138, NULL, 1, '2011-12-21 18:08:41', '2011-12-21 18:08:41', 1, 'etywertes'),
(86, 1, 75, 139, NULL, 1, '2011-12-21 18:13:01', '2011-12-21 18:13:01', 1, 'etywertes'),
(87, 1, 77, 140, NULL, 1, '2011-12-21 18:18:06', '2011-12-21 18:18:06', 1, NULL),
(88, 1, 77, 141, NULL, 1, '2011-12-21 18:19:28', '2011-12-21 18:19:28', 1, NULL),
(89, 1, 79, 142, NULL, 1, '2011-12-21 18:22:29', '2011-12-21 18:22:29', 1, NULL),
(90, 1, 81, 143, NULL, 1, '2011-12-21 18:25:08', '2011-12-21 18:25:08', 1, NULL),
(91, 1, 83, 144, NULL, 1, '2011-12-22 10:08:48', '2011-12-22 10:08:48', 1, 'Mặt trước ngôi nhà'),
(92, 1, 87, 145, NULL, 1, '2011-12-22 10:27:38', '2011-12-22 10:27:38', 1, 'Mặt trước ngôi nhà'),
(93, 1, 89, 146, NULL, 1, '2011-12-22 10:50:26', '2011-12-22 10:50:26', 1, 'Mặt trước ngôi nhà'),
(94, 1, 91, 147, NULL, 1, '2011-12-22 10:53:03', '2011-12-22 10:53:03', 1, 'Mặt trước ngôi nhà'),
(95, 1, 35, 148, NULL, 1, '2011-12-22 11:07:39', '2011-12-22 11:07:39', 1, NULL),
(96, 1, 35, 149, NULL, 1, '2011-12-22 11:09:32', '2011-12-22 11:09:32', 1, NULL),
(97, 1, 35, 150, NULL, 1, '2011-12-22 11:14:42', '2011-12-22 11:14:42', 1, NULL),
(98, 1, 35, 151, NULL, 1, '2011-12-22 11:17:15', '2011-12-22 11:17:15', 1, NULL),
(99, 1, 35, 152, NULL, 1, '2011-12-22 11:18:47', '2011-12-22 11:18:47', 1, NULL),
(100, 1, 35, 153, NULL, 1, '2011-12-22 11:21:05', '2011-12-22 11:21:05', 1, NULL),
(101, 1, 35, 154, NULL, 1, '2011-12-22 11:22:39', '2011-12-22 11:22:39', 1, NULL),
(102, 1, 35, 155, NULL, 1, '2011-12-22 11:25:07', '2011-12-22 11:25:07', 1, NULL),
(103, 1, 35, 156, NULL, 1, '2011-12-22 11:25:36', '2011-12-22 11:25:36', 1, NULL),
(104, 1, 35, 157, NULL, 1, '2011-12-22 11:25:50', '2011-12-22 11:25:50', 1, NULL),
(105, 1, 35, 158, NULL, 1, '2011-12-22 11:28:10', '2011-12-22 11:28:10', 1, NULL),
(106, 1, 35, 159, NULL, 1, '2011-12-22 11:28:24', '2011-12-22 11:28:24', 1, NULL),
(107, 1, 35, 160, NULL, 1, '2011-12-22 11:31:30', '2011-12-22 11:31:30', 1, NULL),
(108, 1, 35, 161, NULL, 1, '2011-12-22 11:31:48', '2011-12-22 11:31:48', 1, NULL),
(109, 1, 35, 162, NULL, 1, '2011-12-22 11:44:18', '2011-12-22 11:44:18', 1, NULL),
(110, 1, 35, 163, NULL, 1, '2011-12-22 11:44:32', '2011-12-22 11:44:32', 1, NULL),
(111, 1, 35, 164, NULL, 1, '2011-12-22 11:46:11', '2011-12-22 11:46:11', 1, NULL),
(112, 1, 35, 165, NULL, 1, '2011-12-22 11:48:40', '2011-12-22 11:48:40', 1, NULL),
(113, 1, 35, 166, NULL, 1, '2011-12-22 11:50:06', '2011-12-22 11:50:06', 1, NULL),
(114, 1, 35, 167, NULL, 1, '2011-12-22 11:53:47', '2011-12-22 11:53:47', 1, NULL),
(115, 1, 35, 168, NULL, 1, '2011-12-22 11:58:16', '2011-12-22 11:58:16', 1, NULL),
(116, 1, 35, 169, NULL, 1, '2011-12-22 14:12:19', '2011-12-22 14:12:19', 1, NULL),
(117, 1, 35, 170, NULL, 1, '2011-12-22 14:14:32', '2011-12-22 14:14:32', 1, NULL),
(118, 1, 35, 171, NULL, 1, '2011-12-22 14:15:40', '2011-12-22 14:15:40', 1, NULL),
(119, 1, 93, 172, NULL, 1, '2011-12-22 14:21:16', '2011-12-22 14:21:16', 1, NULL),
(120, 1, 95, 173, NULL, 1, '2011-12-22 14:31:12', '2011-12-22 14:31:12', 1, NULL),
(121, 1, 97, 174, NULL, 1, '2011-12-22 14:40:06', '2011-12-22 14:40:06', 1, NULL),
(122, 1, 99, 175, NULL, 1, '2011-12-22 14:57:40', '2011-12-22 14:57:40', 1, NULL),
(123, 1, 99, 176, NULL, 1, '2011-12-22 14:57:54', '2011-12-22 14:57:54', 1, NULL),
(124, 1, 101, 177, NULL, 1, '2011-12-22 15:30:29', '2011-12-22 15:30:30', 1, NULL),
(125, 1, 101, 178, NULL, 1, '2011-12-22 15:30:43', '2011-12-22 15:30:43', 1, NULL),
(126, 1, 103, 179, NULL, 1, '2011-12-22 15:34:28', '2011-12-22 15:34:28', 1, NULL),
(127, 1, 103, 180, NULL, 1, '2011-12-22 15:34:39', '2011-12-22 15:34:39', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_rent_house`
--

CREATE TABLE `pos_rent_house` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies posCategoryAtribute',
  `pos_id` int(11) NOT NULL COMMENT ' ',
  `price` varchar(50) collate utf8_unicode_ci default NULL COMMENT 'Giá cho thuê nhà',
  `unit_price` varchar(100) collate utf8_unicode_ci default NULL COMMENT 'đơn vị giá',
  `status` tinyint(4) default NULL COMMENT 'Trạng thái còn hết phòng',
  `area` varchar(50) collate utf8_unicode_ci default NULL COMMENT 'diện tích phòng ',
  `unit_area` varchar(100) collate utf8_unicode_ci default NULL COMMENT 'đơn vị diện tích',
  `num_room` tinyint(4) default NULL COMMENT 'Số phòng ',
  `direction` varchar(100) collate utf8_unicode_ci default NULL COMMENT 'hướng nhà ',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `contact_name` varchar(50) collate utf8_unicode_ci default NULL COMMENT 'Tên người liên hệ',
  `contact_email` varchar(50) collate utf8_unicode_ci default NULL COMMENT 'Email liên hệ',
  `contact_tel` varchar(20) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `pos_id_idx` (`pos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=70 ;

--
-- Dumping data for table `pos_rent_house`
--

INSERT INTO `pos_rent_house` (`id`, `pos_id`, `price`, `unit_price`, `status`, `area`, `unit_area`, `num_room`, `direction`, `created_at`, `updated_at`, `contact_name`, `contact_email`, `contact_tel`) VALUES
(1, 35, '2,5', 'triệu', 0, '40', 'm2', 3, 'Đông - Nam', '2011-12-02 15:00:32', '2011-12-15 10:52:06', 'C. Thanh', 'nguyenhue244@gmail.com', '0973956705'),
(2, 36, '10', 'triệu', 1, '200', 'm2', 7, 'Đông - Nam', '2011-12-16 11:08:15', '2011-12-16 11:08:21', 'A.Thái', 'sns@example.com', '0169282115'),
(3, 37, '2', 'triệu/tháng', 1, NULL, NULL, 1, NULL, '2011-12-20 10:13:13', '2011-12-20 10:13:13', 'c. Tuyết', 'nguyenhue244@gmail.com', '0973956705'),
(4, 38, '4', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-20 11:56:20', '2011-12-20 11:56:20', 'LifeMap', 'sns@example.com', '0975956705'),
(5, 39, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 15:30:35', '2011-12-21 15:30:35', 'LifeMap', 'sns@example.com', ''),
(6, 40, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 15:33:49', '2011-12-21 15:33:49', 'LifeMap', 'sns@example.com', ''),
(7, 41, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 15:36:35', '2011-12-21 15:36:36', 'LifeMap', 'sns@example.com', ''),
(8, 42, '5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:07:20', '2011-12-21 16:07:20', 'LifeMap', 'sns@example.com', ''),
(9, 43, '5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:07:24', '2011-12-21 16:07:24', 'LifeMap', 'sns@example.com', ''),
(10, 44, '4', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:11:41', '2011-12-21 16:11:41', 'LifeMap', 'sns@example.com', ''),
(11, 45, '4', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:11:45', '2011-12-21 16:11:45', 'LifeMap', 'sns@example.com', ''),
(12, 46, '10', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:20:05', '2011-12-21 16:20:05', 'LifeMap', 'sns@example.com', ''),
(13, 47, '10', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:20:08', '2011-12-21 16:20:08', 'LifeMap', 'sns@example.com', ''),
(14, 48, '20', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:23:57', '2011-12-21 16:23:57', 'LifeMap', 'sns@example.com', ''),
(15, 49, '20', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:24:00', '2011-12-21 16:24:00', 'LifeMap', 'sns@example.com', ''),
(16, 50, '3', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:28:15', '2011-12-21 16:28:15', 'LifeMap', 'sns@example.com', ''),
(17, 51, '3', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:28:19', '2011-12-21 16:28:19', 'LifeMap', 'sns@example.com', ''),
(18, 52, '5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:31:06', '2011-12-21 16:31:06', 'LifeMap', 'sns@example.com', ''),
(19, 53, '5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:31:27', '2011-12-21 16:31:27', 'LifeMap', 'sns@example.com', ''),
(20, 54, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:34:40', '2011-12-21 16:34:40', 'LifeMap', 'sns@example.com', ''),
(21, 55, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:34:43', '2011-12-21 16:34:43', 'LifeMap', 'sns@example.com', ''),
(22, 56, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:38:33', '2011-12-21 16:38:33', 'LifeMap', 'sns@example.com', ''),
(23, 57, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:38:40', '2011-12-21 16:38:40', 'LifeMap', 'sns@example.com', ''),
(24, 58, '1.5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:48:45', '2011-12-21 16:48:45', 'LifeMap', 'sns@example.com', ''),
(25, 59, '1.5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:48:49', '2011-12-21 16:48:49', 'LifeMap', 'sns@example.com', ''),
(26, 60, '6', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:53:58', '2011-12-21 16:53:58', 'LifeMap', 'sns@example.com', ''),
(27, 61, '6', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:54:01', '2011-12-21 16:54:01', 'LifeMap', 'sns@example.com', ''),
(28, 62, '7', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:59:22', '2011-12-21 16:59:22', 'LifeMap', 'sns@example.com', ''),
(29, 63, '7', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 16:59:25', '2011-12-21 16:59:25', 'LifeMap', 'sns@example.com', ''),
(30, 64, '4', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 17:06:19', '2011-12-21 17:06:19', 'LifeMap', 'sns@example.com', ''),
(31, 65, '4', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 17:06:23', '2011-12-21 17:06:23', 'LifeMap', 'sns@example.com', ''),
(32, 66, '5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 17:18:32', '2011-12-21 17:18:32', 'LifeMap', 'sns@example.com', ''),
(33, 67, '5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 17:18:36', '2011-12-21 17:18:36', 'LifeMap', 'sns@example.com', ''),
(34, 68, '7', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 17:35:23', '2011-12-21 17:35:23', 'LifeMap', 'sns@example.com', ''),
(35, 69, '7', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 17:35:26', '2011-12-21 17:35:26', 'LifeMap', 'sns@example.com', ''),
(36, 70, '4', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 17:50:19', '2011-12-21 17:50:19', 'LifeMap', 'sns@example.com', ''),
(37, 71, '4', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 17:50:23', '2011-12-21 17:50:23', 'LifeMap', 'sns@example.com', ''),
(38, 72, '3', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:03:28', '2011-12-21 18:03:28', '', '', ''),
(39, 73, '3', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:03:31', '2011-12-21 18:03:31', '', '', ''),
(40, 74, '3', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:08:18', '2011-12-21 18:08:18', '', '', ''),
(41, 75, '3', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:08:21', '2011-12-21 18:08:21', '', '', ''),
(42, 76, '12', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:17:47', '2011-12-21 18:17:47', '', '', ''),
(43, 77, '12', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:17:51', '2011-12-21 18:17:51', '', '', ''),
(44, 78, '12', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:22:05', '2011-12-21 18:22:05', '', '', ''),
(45, 79, '12', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:22:08', '2011-12-21 18:22:08', '', '', ''),
(46, 80, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:24:47', '2011-12-21 18:24:47', '', '', ''),
(47, 81, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-21 18:24:51', '2011-12-21 18:24:51', '', '', ''),
(48, 82, '3', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:07:58', '2011-12-22 10:07:58', 'LifeMap', 'sns@example.com', ''),
(49, 83, '3', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:08:01', '2011-12-22 10:08:01', 'LifeMap', 'sns@example.com', ''),
(50, 84, '3.5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:22:39', '2011-12-22 10:22:39', 'LifeMap', 'sns@example.com', ''),
(51, 85, '3.5', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:22:42', '2011-12-22 10:22:42', 'LifeMap', 'sns@example.com', ''),
(52, 86, '20', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:27:10', '2011-12-22 10:27:10', 'LifeMap', 'sns@example.com', ''),
(53, 87, '20', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:27:13', '2011-12-22 10:27:13', 'LifeMap', 'sns@example.com', ''),
(54, 88, '10', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:49:58', '2011-12-22 10:49:58', 'LifeMap', 'sns@example.com', ''),
(55, 89, '10', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:50:01', '2011-12-22 10:50:01', 'LifeMap', 'sns@example.com', ''),
(56, 90, '6', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:52:31', '2011-12-22 10:52:31', 'LifeMap', 'sns@example.com', ''),
(57, 91, '6', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 10:52:35', '2011-12-22 10:52:35', 'LifeMap', 'sns@example.com', ''),
(58, 92, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 14:20:57', '2011-12-22 14:20:57', 'LifeMap', 'sns@example.com', ''),
(59, 93, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 14:21:00', '2011-12-22 14:21:00', 'LifeMap', 'sns@example.com', ''),
(60, 94, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 14:30:53', '2011-12-22 14:30:53', 'LifeMap', 'sns@example.com', ''),
(61, 95, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 14:30:57', '2011-12-22 14:30:57', 'LifeMap', 'sns@example.com', ''),
(62, 96, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 14:39:46', '2011-12-22 14:39:46', 'LifeMap', 'sns@example.com', ''),
(63, 97, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 14:39:49', '2011-12-22 14:39:49', 'LifeMap', 'sns@example.com', ''),
(64, 98, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 14:53:36', '2011-12-22 14:53:36', 'LifeMap', 'sns@example.com', ''),
(65, 99, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 14:53:39', '2011-12-22 14:53:39', 'LifeMap', 'sns@example.com', ''),
(66, 100, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 15:30:13', '2011-12-22 15:30:13', 'LifeMap', 'sns@example.com', ''),
(67, 101, '1', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 15:30:16', '2011-12-22 15:30:16', 'LifeMap', 'sns@example.com', ''),
(68, 102, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 15:34:01', '2011-12-22 15:34:01', 'LifeMap', 'sns@example.com', ''),
(69, 103, '2', 'triệu/tháng', 1, NULL, NULL, NULL, NULL, '2011-12-22 15:34:04', '2011-12-22 15:34:04', 'LifeMap', 'sns@example.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `pos_rent_house_log`
--

CREATE TABLE `pos_rent_house_log` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies pos_log',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `log_name` varchar(10) collate utf8_unicode_ci NOT NULL,
  `log_value` varchar(10) collate utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pos_rent_house_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `pos_warn`
--

CREATE TABLE `pos_warn` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id identifies pos_warn',
  `pos_id` int(11) NOT NULL COMMENT 'id identifies pos',
  `member_id` int(11) NOT NULL COMMENT 'id is of poster',
  `content` text collate utf8_unicode_ci NOT NULL COMMENT 'content is of pos_warn',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pos_id_idx` (`pos_id`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `pos_warn`
--

INSERT INTO `pos_warn` (`id`, `pos_id`, `member_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Anh XYZ khong hop le', '2011-11-17 00:00:00', '2011-11-17 00:00:00'),
(2, 1, 1, '', '2011-11-17 11:43:56', '2011-11-17 11:43:56'),
(3, 1, 1, '', '2011-11-17 11:47:05', '2011-11-17 11:47:05'),
(4, 1, 1, 'Nội dung chia sẽ không đúng', '2011-11-17 11:49:06', '2011-11-17 11:49:06'),
(5, 1, 1, 'fhsghsdfhgs', '2011-11-17 11:50:35', '2011-11-17 11:50:35'),
(6, 1, 1, 'jkljfaklsjdlkfjádkldfffgfádfá', '2011-11-17 15:14:54', '2011-11-17 15:14:54'),
(7, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:03', '2011-12-01 14:50:03'),
(8, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:07', '2011-12-01 14:50:07'),
(9, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:15', '2011-12-01 14:50:15'),
(10, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:17', '2011-12-01 14:50:17'),
(11, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:19', '2011-12-01 14:50:19'),
(12, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:21', '2011-12-01 14:50:21'),
(13, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:22', '2011-12-01 14:50:22'),
(14, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:24', '2011-12-01 14:50:24'),
(15, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:26', '2011-12-01 14:50:26'),
(16, 34, 1, 'Nội dung chưa chính xác', '2011-12-01 14:50:27', '2011-12-01 14:50:27'),
(17, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 14:52:57', '2011-12-01 14:52:57'),
(18, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 14:59:13', '2011-12-01 14:59:13'),
(19, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:00:10', '2011-12-01 15:00:10'),
(20, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:35', '2011-12-01 15:01:35'),
(21, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:36', '2011-12-01 15:01:36'),
(22, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:38', '2011-12-01 15:01:38'),
(23, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:40', '2011-12-01 15:01:40'),
(24, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:42', '2011-12-01 15:01:42'),
(25, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:44', '2011-12-01 15:01:44'),
(26, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:45', '2011-12-01 15:01:45'),
(27, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:47', '2011-12-01 15:01:47'),
(28, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:49', '2011-12-01 15:01:49'),
(29, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:51', '2011-12-01 15:01:51'),
(30, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:52', '2011-12-01 15:01:52'),
(31, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:01:54', '2011-12-01 15:01:54'),
(32, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:03:37', '2011-12-01 15:03:37'),
(33, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:04:51', '2011-12-01 15:04:51'),
(34, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:05:08', '2011-12-01 15:05:08'),
(35, 34, 1, 'Nội dung cảnh báo ...', '2011-12-01 15:16:36', '2011-12-01 15:16:36'),
(36, 35, 1, 'Nội dung cảnh báo ...', '2011-12-02 16:13:08', '2011-12-02 16:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Identified profile name (ASCII)',
  `is_required` tinyint(1) NOT NULL default '0' COMMENT 'This is a required',
  `is_unique` tinyint(1) NOT NULL default '0' COMMENT 'Cannot select duplicate item',
  `is_edit_public_flag` tinyint(1) NOT NULL default '0' COMMENT 'Settable public flag',
  `default_public_flag` tinyint(4) NOT NULL default '1' COMMENT 'Default of public flag',
  `form_type` varchar(32) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Form type to input/select',
  `value_type` varchar(32) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Type of input value',
  `is_disp_regist` tinyint(1) NOT NULL default '0' COMMENT 'Shows when registeration',
  `is_disp_config` tinyint(1) NOT NULL default '0' COMMENT 'Shows when edit',
  `is_disp_search` tinyint(1) NOT NULL default '0' COMMENT 'Shows when searching',
  `is_public_web` tinyint(1) NOT NULL default '0' COMMENT 'Flag for adding public_flag for publishing to web',
  `value_regexp` text collate utf8_unicode_ci COMMENT 'Regular expression',
  `value_min` varchar(32) collate utf8_unicode_ci default NULL COMMENT 'Minimum value',
  `value_max` varchar(32) collate utf8_unicode_ci default NULL COMMENT 'Maximum value',
  `sort_order` int(11) default NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
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

CREATE TABLE `profile_option` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `profile_id` int(11) NOT NULL COMMENT 'Profile id',
  `sort_order` int(11) default NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `profile_id_idx` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves options of profile items' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `profile_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `profile_option_translation`
--

CREATE TABLE `profile_option_translation` (
  `id` int(11) NOT NULL default '0' COMMENT 'Serial number',
  `value` text collate utf8_unicode_ci COMMENT 'Choice',
  `lang` char(5) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_option_translation`
--


-- --------------------------------------------------------

--
-- Table structure for table `profile_translation`
--

CREATE TABLE `profile_translation` (
  `id` int(11) NOT NULL default '0' COMMENT 'Serial number',
  `caption` text collate utf8_unicode_ci NOT NULL COMMENT 'Item name to show',
  `info` text collate utf8_unicode_ci COMMENT 'Description',
  `lang` char(5) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_translation`
--


-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(128) collate utf8_unicode_ci NOT NULL default '',
  `session_data` text collate utf8_unicode_ci COMMENT 'Session information',
  `time` text collate utf8_unicode_ci COMMENT 'Timestamp of generated time',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves session data';

--
-- Dumping data for table `session`
--


-- --------------------------------------------------------

--
-- Table structure for table `skin_config`
--

CREATE TABLE `skin_config` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `plugin` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Plugin name',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Configuration name',
  `value` text collate utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `plugin_name_UNIQUE_idx` (`plugin`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of this SNS' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `skin_config`
--


-- --------------------------------------------------------

--
-- Table structure for table `sns_config`
--

CREATE TABLE `sns_config` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Configuration name',
  `value` text collate utf8_unicode_ci COMMENT 'Configuration value',
  PRIMARY KEY  (`id`),
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
(17, 'admin_mail_address', 'lifemapvn@gmail.com'),
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

CREATE TABLE `sns_term` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Serial number',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '' COMMENT 'Term name',
  `application` varchar(32) collate utf8_unicode_ci NOT NULL default 'pc_frontend' COMMENT 'Application name',
  PRIMARY KEY  (`id`),
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

CREATE TABLE `sns_term_translation` (
  `id` int(11) NOT NULL default '0' COMMENT 'Serial number',
  `value` text collate utf8_unicode_ci COMMENT 'Term value',
  `lang` char(5) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`,`lang`)
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
-- Constraints for table `pos_photo`
--
ALTER TABLE `pos_photo`
  ADD CONSTRAINT `pos_photo_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_rent_house`
--
ALTER TABLE `pos_rent_house`
  ADD CONSTRAINT `pos_rent_house_pos_id_pos_id` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_rent_house_log`
--
ALTER TABLE `pos_rent_house_log`
  ADD CONSTRAINT `pos_rent_house_log_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_rent_house_log_pos_id_pos_id` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`) ON DELETE CASCADE;

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
