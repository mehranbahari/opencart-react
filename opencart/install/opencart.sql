-- --------------------------------------------------------

--
-- Database: `www.OpenCart.ir`
--

-- --------------------------------------------------------

SET sql_mode = '';
--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 2, 'توضیحات'),
(2, 2, 'تعداد هسته'),
(4, 2, 'تست 1'),
(5, 2, 'تست 2'),
(6, 2, 'تست 3'),
(7, 2, 'تست 4'),
(8, 2, 'تست 5'),
(9, 2, 'تست 6'),
(10, 2, 'تست 7'),
(11, 2, 'تست 8'),
(3, 2, 'سرعت کلاک'),
(3, 1, 'Clockspeed'),
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(4, 1, 'Technical'),
(3, 2, 'حافظه'),
(4, 2, 'فنی'),
(5, 2, 'مادربرد'),
(6, 2, 'پردازنده'),
(3, 1, 'Memory'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'محصولات اچ پی', 1),
(7, 'اسلایدشو صفحه اصلی', 1),
(8, 'تولیدکنندگان', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(112, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(121, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(120, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(119, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(118, 8, 'http://shop.opencart.ir', 'catalog/demo/manufacturer/burgerking.png', 0),
(117, 8, 'http://temp4u.net', 'catalog/demo/manufacturer/canon.png', 0),
(113, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(116, 8, 'http://opencart.ir', 'catalog/demo/manufacturer/harley.png', 0),
(115, 8, 'http://asanwebhost.com', 'catalog/demo/manufacturer/dell.png', 0),
(114, 7, 'http://opencart.ir', 'catalog/demo/banners/MacBookAir.jpg', 0),
(122, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(123, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(124, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(125, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(114, 2, 7, 'مک بوک ایر'),
(122, 1, 8, 'NFL'),
(122, 2, 8, 'NFL'),
(121, 1, 8, 'RedBull'),
(113, 1, 7, 'iPhone 6'),
(121, 2, 8, 'ردبول'),
(120, 1, 8, 'Sony'),
(120, 2, 8, 'سونی'),
(119, 1, 8, 'Coca Cola'),
(112, 2, 6, 'بنر اچ پی'),
(119, 2, 8, 'کوکا کولا'),
(118, 1, 8, 'Burger King'),
(118, 2, 8, 'Burger King'),
(117, 1, 8, 'Canon'),
(113, 2, 7, 'آیفون 6'),
(117, 2, 8, 'کانن'),
(116, 1, 8, 'Harley Davidson'),
(116, 2, 8, 'Harley Davidson'),
(115, 1, 8, 'Dell'),
(115, 2, 8, 'دل'),
(112, 1, 6, 'HP Banner'),
(114, 1, 7, 'MacBookAir'),
(123, 2, 8, 'دیزنی'),
(123, 1, 8, 'Disney'),
(124, 2, 8, 'استار باکس'),
(124, 1, 8, 'Starbucks'),
(125, 2, 8, 'نینتندو'),
(125, 1, 8, 'Nintendo');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2015-04-09 04:38:35'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2015-04-09 04:25:11'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2015-04-09 04:18:29'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2015-04-09 04:30:05'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2015-04-09 04:34:57'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2015-04-09 04:28:40'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2015-04-09 04:59:10'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2015-04-09 04:26:42'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2015-04-09 05:00:00'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2015-04-09 04:58:41'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2015-04-09 04:57:45'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2015-04-09 04:57:07'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2015-04-09 04:16:28'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2015-04-09 04:22:54'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2015-04-09 05:00:56'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2015-04-09 05:01:31'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2015-04-09 05:09:03'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2015-04-09 05:08:38'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2015-04-09 05:09:39'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2015-04-09 05:10:01'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2015-04-09 05:10:24'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2015-04-09 05:10:47'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2015-04-09 05:02:38'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2015-04-09 05:03:05'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2015-04-09 04:37:25'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2015-04-09 04:35:51'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2015-04-09 05:11:23'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2015-04-09 05:11:35'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2015-04-09 05:11:53'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2015-04-09 05:05:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2015-04-09 05:05:26'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2015-04-09 05:05:50'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2015-04-09 05:06:39'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2015-04-09 05:07:06'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2015-04-09 05:07:33'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2015-04-09 05:08:14'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2015-04-09 04:27:47'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2015-04-09 05:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(18, 2, 'لپ تاپ ها و نوت بوک ها', '&lt;p&gt;از لحاظ تاریخی، لپ‌تاپ کمی بزرگتر و ساخته شده برای گذاشتن بر روی ران (lap) بود و می‌توانستید یکجا بنشینید و آن را بر روی پایتان بگذارید؛ برای همین هم به آن لپ‌تاپ می‌گویند. اما نوت‌بوک‌ها در واقع کمی کوچکتر بودند، با قابلیت حمل بیشتر، مانند یک دفترچه (Notebook) کاغذ! اما حالا فرقی بین نوت‌بوک و لپ‌تاپ قایل نمی‌شوند سازندگان رایانه معمولا این دو کلمه را برای یک دستگاه استفاده می‌کنند. البته باید بدانید که دیگر استفاده از کلمه‌ی لپ‌تاپ بسیار کمتر شده‌است.&lt;br&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'لپ تاپ ها و نوت بوک ها و الترا بوک ها', '', ''),
(47, 1, 'test 15', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 15', '', ''),
(48, 1, 'test 16', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 16', '', ''),
(49, 1, 'test 17', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 17', '', ''),
(28, 2, 'مانیتورها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'مانیتورها', '', ''),
(33, 2, 'دوربین ها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', ' دوربین ها', '', ''),
(32, 2, 'وبکم ها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'وبکم ها', '', ''),
(31, 2, 'اسکنرها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'اسکنرها', '', ''),
(30, 2, 'پرینترها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'پرینترها', '', ''),
(29, 2, 'میکروفن ها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'میکروفن ها', '', ''),
(27, 2, 'مک', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'مک بوک ها', '', ''),
(26, 2, 'کامپیوتر', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'کامپیوتر ها', '', ''),
(17, 2, 'نرم افزار', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'نرم افزار ها', '', ''),
(25, 2, 'تجهیزات جانبی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تجهیزات جانبی', '', ''),
(24, 2, 'گوشی ها و کامپیوترهای دستی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'گوشی ها و کامپیوترهای دستی', '', ''),
(20, 2, 'رومیزی ها', '&lt;p&gt;در این بخش انواع رومیزی های مدرن با قیمت باورنکردنی قرار دارد.&lt;br&gt;&lt;/p&gt;\r\n', 'رومیزی ها', 'انواع متنوع از رومیزی های مدرن با بهترین قیمت', ''),
(35, 2, 'تست1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست1', '', ''),
(36, 2, 'تست 2', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 2', '', ''),
(37, 2, 'تست 5', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 5', '', ''),
(38, 2, 'تست 4', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 4', '', ''),
(39, 2, 'تست 6', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 6', '', ''),
(40, 2, 'تست 7', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 7', '', ''),
(41, 2, 'تست 8', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 8', '', ''),
(42, 2, 'تست 9', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 9', '', ''),
(43, 2, 'تست11', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست11', '', ''),
(34, 2, 'پخش کننده های صوتی', 'پخش کننده های دارای هارد درایو: ‏ این ام پی تری پلیرها ظرفیت بالایی دارند و می توانید بیشتر آرشیو موسیقی تان را به همراه داشته باشید. ظرفیت آنها معمولا بین ۲۰ تا ۱۶۰ گیگابایت است. آی پاد کلاسیک مثال خوبی از یک پخش کننده موسیقی دارای هارد درایو است. ‏&lt;br&gt;‏&lt;br&gt;‏مزایا: ‏ با داشتن ظرفیت بالا می توانید یک عالمه موسیقی و کتاب صوتی به همراه داشته باشید. این پخش کننده ها امکانات زیادی دارند و معمولا یک نمایشگر بزرگ هم آنها را همراهی می کند. به خاطر ظرفیت بالا، هنگام خرید آنها حس خوبی پیدا می کنید چون نسبت به پولی که میدهید ظرفیت بالایی دریافت می کنید! ‏', 'پخش کننده های صوتی', '', ''),
(18, 1, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', ''),
(44, 2, 'تست 12', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 12', '', ''),
(45, 2, 'ویندوزی ها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'لپ تاپ ها و نوت بوک ها و الترا بوک های ویندوزی', '', ''),
(46, 2, 'مک ها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'مک ها', '', ''),
(50, 2, 'تست 18', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 18', '', ''),
(51, 2, 'تست 19', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 19', '', ''),
(52, 2, 'تست 20', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 20', '', ''),
(53, 2, 'تست 21', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 21', '', ''),
(54, 2, 'تست 22', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 22', '', ''),
(55, 2, 'تست 23', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 23', '', ''),
(56, 2, 'تست 24', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 24', '', ''),
(57, 2, 'تبلت ها', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تبلت ها', '', ''),
(58, 2, 'تست 25', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست 25', '', ''),
(33, 1, 'Cameras', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Cameras', '', ''),
(20, 1, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Desktops', 'Example of category description', ''),
(34, 1, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', ''),
(27, 1, 'Mac', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Mac', '', ''),
(26, 1, 'PC', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Personal Camputers', '', ''),
(57, 1, 'Tablets', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Tablets', '', ''),
(17, 1, 'Software', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Software', '', ''),
(24, 1, 'Phones &amp; PDAs', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Phones &amp; PDAs', '', ''),
(46, 1, 'Macs', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Macs', '', ''),
(45, 1, 'Windows', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Windows', '', ''),
(25, 1, 'Components', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Components', '', ''),
(32, 1, 'Web Cameras', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Web Cameras', '', ''),
(31, 1, 'Scanners', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Scanners', '', ''),
(30, 1, 'Printers', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Printers', '', ''),
(28, 1, 'Monitors', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Monitors', '', ''),
(29, 1, 'Mice and Trackballs', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Mice and Trackballs', '', ''),
(35, 1, 'test 1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 1', '', ''),
(36, 1, 'test 2', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 2', '', ''),
(43, 1, 'test 11', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 11', '', ''),
(44, 1, 'test 12', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 12', '', ''),
(47, 2, 'تست 15', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست15', '', ''),
(48, 2, 'تست 16', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست16', '', ''),
(49, 2, 'تست 17', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'تست17', '', ''),
(50, 1, 'test 18', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 18', '', ''),
(51, 1, 'test 19', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 19', '', ''),
(52, 1, 'test 20', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 20', '', ''),
(53, 1, 'test 21', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 21', '', ''),
(54, 1, 'test 22', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 22', '', ''),
(55, 1, 'test 23', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 23', '', ''),
(56, 1, 'test 24', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 24', '', ''),
(38, 1, 'test 4', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 4', '', ''),
(37, 1, 'test 5', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 5', '', ''),
(39, 1, 'test 6', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 6', '', ''),
(40, 1, 'test 7', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 7', '', ''),
(41, 1, 'test 8', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 8', '', ''),
(42, 1, 'test 9', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 9', '', ''),
(58, 1, 'test 25', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'test 25', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 28, 1),
(35, 25, 0),
(35, 35, 2),
(36, 28, 1),
(36, 25, 0),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 52, 1),
(58, 34, 0),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(33, 0, 0),
(20, 0, 0),
(34, 0, 0),
(27, 0, 0),
(26, 0, 0),
(57, 0, 0),
(17, 0, 0),
(24, 0, 0),
(18, 0, 0),
(46, 0, 0),
(45, 0, 0),
(25, 0, 0),
(32, 0, 0),
(31, 0, 0),
(30, 0, 0),
(28, 0, 0),
(29, 0, 0),
(35, 0, 0),
(36, 0, 0),
(43, 0, 0),
(44, 0, 0),
(47, 0, 0),
(48, 0, 0),
(49, 0, 0),
(50, 0, 0),
(51, 0, 0),
(52, 0, 0),
(53, 0, 0),
(54, 0, 0),
(55, 0, 0),
(56, 0, 0),
(38, 0, 0),
(37, 0, 0),
(39, 0, 0),
(40, 0, 0),
(41, 0, 0),
(42, 0, 0),
(58, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(101, 'جمهوری اسلامی ایران', 'IR', 'IRN', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '10% تخفیف', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'حمل و نقل رایگان', '3333', 'P', '0.0000', 0, 1, '100000.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 تخفیف', '1111', 'F', '10000.0000', 0, 0, '100000.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'تومان', 'TOM', '', ' تومان', '', 1.00000000, 1, '2015-04-09 05:42:00'),
(2, 'ریال', 'RLS', '', ' ریال', '', 10.00000000, 1, '2015-04-09 05:42:40');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 2, 'پیش فرض', 'گروه پیش فرض مشتریان'),
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow'),
(428, 'feed', 'google_base'),
(429, 'feed', 'google_sitemap');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'حمل و نقل  جمهوری اسلامی ایران', 'کلیه مناطق جمهوری اسلامی ایران', '2015-04-09 11:28:09', '2009-01-06 23:26:25'),
(4, 'مناطق پستی تهران', 'مناطق پستی صرفا تهران', '2015-04-09 11:31:47', '2009-06-23 01:14:53'),
(5, 'مناطق مالیاتی  ایران', 'مناطق مالیاتی جمهوری اسلامی ایران', '0000-00-00 00:00:00', '2015-04-09 11:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(4, 2, 'درباره ما', '&lt;p&gt;درباره اپن کارت فارسی www.OpenCart.ir&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;OpenCartچیست؟ &lt;br&gt;&lt;br&gt;اپن کارت (OpenCart) یک سیستم فروشگاه ساز حرفه ای و متن باز (Open-Source) می باشد که براساس ویژگی های بسیار غنی و کاربردی و همچنین ظاهری بسیار جذاب و کاربرپسند طراحی شده که باعث می شود فروشنده بتواند یک فروشگاه اینترنتی کامل و منحصر به فرد را ایجاد نموده و از آن برای کار و تجارت خود در اینترنت استفاده نماید. علاوه بر این می توان به جرات اظهار نمود که این سیستم فروشگاه ساز امروزه یکی از پرطرفدار ترین سیستم های مورد استفاده در فروشگاه های آنلاین ایران و دنیا می باشد که به سبب داشتن ویژگی های خارق العاده ای همچون داشتن سئوی فوق العاده قدرتمند، ماژول ها و الگو های مختلف و کاربردی، چند زبانه بودن، پشتیبانی از انواع درگاه های پرداخت محلی و جهانی و هزاران ویژگی و قابلیت دیگر که در ادامه به توضیح برخی از آن ها پرداخته شده است، به این محبوبیت و شهرت دست یافته است. از طرفی با توجه به توسعه این سیستم در ایران امروزه اتصال به کلیه درگاه های پرداخت ایرانی نیز فرآهم شده است.&lt;br&gt;&lt;br&gt;توضیح و معرفی برخی از ویژگی های سیستم این فروشگاه ساز قدرتمند:&lt;br&gt;&lt;br&gt;- قالب ها و الگوها:&lt;br&gt;سیستم فروشگاه ساز اپن کارت (OpenCart) دارای انواع تمپلیت ها و الگوهای از پیش آماده بوده که کاربر را قادر می سازد تا به راحتی بتواند از آن ها استفاده کند و به سوئیچ بین آن ها پرداخته یا حتی نسخه ی فعلی سایت و فروشگاه خود را به راحتی بر روی این سیستم فروشگاه ساز انتقال دهد.&lt;br&gt;- چند زبانه بودن :&lt;br&gt;یکی دیگر از ویژگی های مهم سیستم فروشگاه ساز اپن کارت (OpenCart) چند زبانه بودن آن می باشد که امروزه برای بیش از صدها زبان زنده ی دنیا از جمله زبان شیرین فارسی نیز ارائه شده و در اختیار کاربران قرار گرفته که می توانند فروشگاه ساز خویش را به زبان های دلخواه ایجاد نموده و از آن ها استفاده نمایند.&lt;br&gt;- چند فروشگاهی بودن :&lt;br&gt;از آنجایی که امروزه مزایای بسیاری در رابطه با (Multi-Store) بودن فروشگاه ها وجود دارد سیستم فروشگاه ساز اپن کارت (OpenCart) نیز این قابلیت مفید را در خود جای داده تا این امکان را برای کاربر ایجاد نماید تا بتواند به مدیریت فروشگاه های متعدد از یک پنل مدیریت پرداخته و مواردی همچون امکان تنظیم یک محصول برای نمایش در یک فروشگاه خاص، امکان محلی نمودن هر فروشگاه با استفاده از تنظیم نمودن زبان های مختلف پیش فرض؛ واحد ارز و طبقه ی مالیاتی، امکان تنظیم قیمت های مختلف برای هر فروشگاه، امکان تنظیم تم برای هر فروشگاه برای مطابقت با محصولات فروخته شده، امکان راه اندازی یک گروه پیش فرض برای مشتریان هر فروشگاه و راه اندازی یک فروشگاه برای مشتریان خرده فروش و عمده فروش و ... بپردازد. &lt;br&gt;- درگاه های پرداخت :&lt;br&gt;یکی دیگر از ویژگی های سیستم فروشگاه ساز اپن کارت (OpenCart) که بسیار مهم بوده و باعث شده افراد زیادی از آن استفاده نمایند ساپورت آن به وسیله ی درگاه های پرداخت متفاوت و فراوانی می باشد که به طور پیش فرض در آن گنجانده شده و به فروشنده اجازه می دهد تا به راحتی فروشگاه خود را به درگاه های پرداخت محلی نیز متصل نماید. به طور کلی کلیه درگاه های پرداخت جهانی معتبر در این سیستم گنجانده شده است و در نسخه فارسی این فروشگاه ساز، درگاه های پرداخت ایرانی همچون پاسارگاد، پارسیان، ملی، ملت، اقتصاد نوین و ... نیز تعریف شده است.&lt;br&gt;&lt;/p&gt;\r\n', 'درباره اپن کارت فارسی www.OpenCart.ir', '', ''),
(5, 2, 'شرایط و قوانین', '&lt;p&gt;شرایط و قوانین اپن کارت فارسی &lt;/p&gt;&lt;p&gt;www.OpenCart.ir&lt;br&gt;&lt;/p&gt;\r\n', 'شرایط و قوانین اپن کارت فارسی', '', ''),
(3, 2, 'حفظ حریم شخصی', 'حفظ حریم شخصی مشتریان', 'حفظ حریم شخصی مشتریان', '', ''),
(6, 2, 'گزارش تحویل', 'گزارش تحویل', 'گزارش تحویل', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(5, 0, 0),
(3, 0, 0),
(6, 0, 0),
(4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English (انگلیسی)', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 2, 1),
(2, 'Persian (فارسی)', 'fa', 'fa_IR.UTF-8', 'ir.png', 'persian', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'صفحه اصلی (Home)'),
(2, 'کالا (Product)'),
(3, 'دسته بندی (Category)'),
(4, 'پیش فرض (Default)'),
(5, 'تولیدکنندگان (Manufacturer)'),
(6, 'حساب کاربری (Account)'),
(7, 'تسویه حساب (Checkout)'),
(8, 'تماس با ما (Contact)'),
(9, 'نقشه سایت (Sitemap)'),
(10, 'بازاریابی (Affiliate)'),
(11, 'اطلاعات (Information)'),
(12, 'مقایسه (Compare)'),
(13, 'جستجو (Search)');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(85, 5, 'account', 'column_left', 2),
(84, 10, 'account', 'column_left', 1),
(86, 6, 'account', 'column_left', 1),
(80, 1, 'featured.28', 'content_top', 2),
(79, 1, 'slideshow.27', 'content_top', 1),
(78, 1, 'carousel.29', 'content_top', 3),
(88, 3, 'category', 'column_left', 1),
(87, 3, 'banner.30', 'column_left', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(69, 6, 0, 'account/%'),
(67, 10, 0, 'affiliate/%'),
(70, 3, 0, 'product/category'),
(60, 1, 0, 'common/home'),
(65, 2, 0, 'product/product'),
(59, 11, 0, 'information/information'),
(61, 7, 0, 'checkout/%'),
(62, 8, 0, 'information/contact'),
(56, 9, 0, 'information/sitemap'),
(71, 4, 0, ''),
(68, 5, 0, 'product/manufacturer'),
(66, 12, 0, 'product/compare'),
(57, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'سانتی متر', 'cm'),
(2, 2, 'میلی متر', 'mm'),
(3, 2, 'اینچ', 'in'),
(3, 1, 'Inch', 'in'),
(2, 1, 'Millimeter', 'mm'),
(1, 1, 'Centimeter', 'cm');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'اچ تی سی', 'catalog/demo/htc_logo.jpg', 0),
(6, 'پالم', 'catalog/demo/palm_logo.jpg', 0),
(7, 'اچ پی', 'catalog/demo/hp_logo.jpg', 0),
(8, 'اپل', 'catalog/demo/apple_logo.jpg', 0),
(9, 'کانن', 'catalog/demo/canon_logo.jpg', 0),
(10, 'سونی', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 'Shamsi Date For Persian OpenCart', 'ocjdf', 'Persian OpenCart', '1.0', 'http://www.opencart.ir', '<?xml version="1.0" encoding="utf-8"?>\r\n<modification>\r\n  <name>Shamsi Date For Persian OpenCart</name>\r\n  <code>ocjdf</code>\r\n  <version>1.0</version>\r\n  <author>Persian OpenCart</author>\r\n  <link>http://www.opencart.ir</link>\r\n  <file path="system/startup.php">\r\n	<operation>\r\n	  <search><![CDATA[date_default_timezone_set(''UTC'');]]></search>\r\n	  <add position="replace"><![CDATA[date_default_timezone_set(''Asia/Tehran'');]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[error_reporting(E_ALL);]]></search>\r\n	  <add position="after"><![CDATA[date_default_timezone_set(''Asia/Tehran'');]]></add>\r\n	</operation>	\r\n  </file>\r\n  \r\n  <file path="admin/language/persian/persian.php">\r\n	<operation>\r\n	  <search><![CDATA[// Text]]></search>\r\n	  <add  position="before"><![CDATA[\r\n				$_[''function_date'']			  = ''jdate'';\r\n                $_[''function_jtg'']			  = ''jtg'';\r\n                $_[''function_gtj'']			  = ''gtj'';\r\n                $_[''date_format_custom_1'']    = ''l d F Y - H:i:s'';\r\n                $_[''date_format_custom_2'']    = ''Y/m/d'';]]></add>\r\n	</operation>\r\n  </file>	\r\n\r\n  <file path="admin/language/english/english.php">\r\n	<operation>\r\n	  <search><![CDATA[// Text]]></search>\r\n	  <add  position="before"><![CDATA[\r\n				$_[''function_date'']	= ''date'';\r\n				$_[''function_jtg'']	= ''call_empty'';\r\n				$_[''function_gtj''] 	= ''call_empty'';\r\n				$_[''date_format_custom_1''] = ''d/m/Y H:i:s'';\r\n				$_[''date_format_custom_2''] = ''d/m/y'';]]></add>\r\n	</operation>\r\n  </file>\r\n  \r\n  <file path="admin/language/persian/common/footer.php">\r\n	<operation>\r\n	  <search><![CDATA[JF9bJ3RleHRfZm9vdGVyJ10gCT0gJ9qp2YTbjNmHINit2YLZiNmCINmG2LLYryA8YSBocmVmPSJodHRwOi8vd3d3Lm9wZW5jYXJ0LmlyIj7Yp9m+2YYg2qnYp9ix2Kog2YHYp9ix2LPbjDwvYT4g2YXYrdmB2YjYuCDYp9iz2KouICZjb3B5OyAxMzg4LScgLiBkYXRlKCdZJykgLiAnJzsNCiRfWyd0ZXh0X3ZlcnNpb24nXSAJPSAn2YbYs9iu2YcgJXMnOw==]]></search>\r\n	  <add position="replace"><![CDATA[JF9bJ3RleHRfZm9vdGVyJ10gCT0gJ9qp2YTbjNmHINit2YLZiNmCINmG2LLYryA8YSBocmVmPSJodHRwOi8vd3d3Lm9wZW5jYXJ0LmlyIj7Yp9m+2YYg2qnYp9ix2Kog2YHYp9ix2LPbjDwvYT4g2YXYrdmB2YjYuCDYp9iz2KouICZjb3B5OyAxMzg4LScgLiBqZGF0ZSgnWScpIC4gJyc7DQokX1sndGV4dF92ZXJzaW9uJ10gCT0gJ9mG2LPYrtmHICVzJzs=]]></add>\r\n		</operation>\r\n  </file>\r\n	\r\n  <file path="admin/view/template/common/header.tpl">\r\n	<operation>\r\n	  <search><![CDATA[view/javascript/jquery/datetimepicker/moment.js]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo $direction == ''rtl'' ? ''view/javascript/jquery/datetimepicker/moment.fa.js'' : ''view/javascript/jquery/datetimepicker/moment.js''; ?>]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo $direction == ''rtl'' ? ''view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.fa.min.js'' : ''view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js''; ?>]]></add>\r\n	</operation>		\r\n	<operation>\r\n	  <search><![CDATA[view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo $direction == ''rtl'' ? ''view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.fa.min.css'' : ''view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css''; ?>]]></add>\r\n	</operation>\r\n  </file>	\r\n\r\n  <file path="admin/model/catalog/product.php">\r\n	<operation>\r\n	  <search><![CDATA[$this->db->escape($data[''date_available''])]]></search>\r\n	  <add position="replace"><![CDATA[call_function($this->language->get(''function_jtg''), $this->db->escape($data[''date_available'']))]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[$this->db->escape($product_discount[''date_start''])]]></search>\r\n	  <add position="replace"><![CDATA[call_function($this->language->get(''function_jtg''), $this->db->escape($product_discount[''date_start'']))]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[date_end = ''" . $this->db->escape($product_discount[''date_end'']) . "'']]></search>\r\n	  <add position="replace"><![CDATA[date_end = ''" . call_function($this->language->get(''function_jtg''), $this->db->escape($product_discount[''date_end''])) . "'']]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[date_start = ''" . $this->db->escape($product_special[''date_start'']) . "'']]></search>\r\n	  <add position="replace"><![CDATA[date_start = ''" . call_function($this->language->get(''function_jtg''), $this->db->escape($product_special[''date_start''])) . "'']]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[date_end = ''" . $this->db->escape($product_special[''date_end'']) . "'']]></search>\r\n	  <add position="replace"><![CDATA[date_end = ''" . call_function($this->language->get(''function_jtg''), $this->db->escape($product_special[''date_end''])) . "'']]></add>\r\n	</operation>\r\n  </file>	\r\n	  \r\n  <file path="admin/controller/catalog/product.php">\r\n	<operation>\r\n	  <search><![CDATA[$data[''heading_title''] = $this->language->get(''heading_title'');]]></search>\r\n	  <add position="after"><![CDATA[$data[''lang''] = $this->language->get(''code'');]]></add>\r\n	</operation>\r\n  </file>	\r\n	\r\n  <file path="admin/view/template/catalog/product_form.tpl">\r\n	<operation>\r\n	  <search><![CDATA[<?php echo $date_available; ?>]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo !isset($this->request->post[''date_available'']) ? ($lang == ''fa'' ? gtj($date_available) : $date_available) : $date_available; ?>]]></add>\r\n	</operation>	\r\n	<operation>\r\n	  <search><![CDATA[<?php echo $product_discount[''date_start'']; ?>]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo !isset($this->request->post[''product_discount'']) ? ($lang == ''fa'' ? gtj($product_discount[''date_start'']) : $product_discount[''date_start'']) : $product_discount[''date_start'']; ?>]]></add>\r\n	</operation>\r\n    <operation>\r\n	  <search><![CDATA[<?php echo $product_discount[''date_end'']; ?>]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo !isset($this->request->post[''product_discount'']) ? ($lang == ''fa'' ? gtj($product_discount[''date_end'']) : $product_discount[''date_end'']) : $product_discount[''date_end'']; ?>]]></add>\r\n	</operation>	\r\n    <operation>\r\n	  <search><![CDATA[<?php echo $product_special[''date_start'']; ?>]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo !isset($this->request->post[''product_special'']) ? ($lang == ''fa'' ? gtj($product_special[''date_start'']) : $product_special[''date_start'']) : $product_special[''date_start'']; ?>]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[<?php echo $product_special[''date_end'']; ?>]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo !isset($this->request->post[''product_special'']) ? ($lang == ''fa'' ? gtj($product_special[''date_end'']) : $product_special[''date_end'']) : $product_special[''date_end'']; ?>]]></add>\r\n	</operation>\r\n  </file>	  \r\n  \r\n	<!--\r\n	    admin/controller/catalog/download.php\r\n		admin/controller/catalog/review.php\r\n		admin/controller/dashboard/recent.php\r\n		admin/controller/extension/modification.php\r\n		admin/controller/localisation/currency.php\r\n		admin/controller/localisation/tax_rate.php	\r\n		admin/controller/marketing/affiliate.php\r\n		admin/controller/marketing/marketing.php\r\n		admin/controller/report/sale_order.php\r\n		admin/controller/report/sale_return.php		\r\n		admin/controller/report/sale_shipping.php\r\n		admin/controller/report/sale_tax.php\r\n		admin/controller/sale/customer.php\r\n		admin/controller/sale/order.php\r\n		admin/controller/sale/recurring.php		\r\n		admin/controller/sale/return.php\r\n		admin/controller/sale/voucher.php\r\n		admin/controller/tool/upload.php\r\n		admin/controller/user/api.php\r\n		admin/controller/user/user.php\r\n		admin/model/sale/return.php\r\n		catalog/controller/account/download.php\r\n		catalog/controller/account/order.php\r\n		catalog/controller/account/recurring.php\r\n		catalog/controller/account/return.php		\r\n		catalog/controller/account/reward.php\r\n		catalog/controller/account/transaction.php\r\n		catalog/controller/affiliate/transaction.php\r\n		catalog/controller/product/product.php\r\n	-->\r\n	\r\n  <file path="admin/controller/catalog/download.php,admin/controller/catalog/review.php,admin/controller/dashboard/recent.php,admin/controller/extension/modification.php,admin/controller/localisation/currency.php,admin/controller/localisation/tax_rate.php,admin/controller/marketing/affiliate.php,admin/controller/marketing/marketing.php,admin/controller/report/sale_order.php,admin/controller/report/sale_return.php,admin/controller/report/sale_shipping.php,admin/controller/report/sale_tax.php,admin/controller/sale/customer.php,admin/controller/sale/order.php,admin/controller/sale/recurring.php,admin/controller/sale/return.php,admin/controller/sale/voucher.php,admin/controller/tool/upload.php,admin/controller/user/api.php,admin/controller/user/user.php,admin/model/sale/return.php,catalog/controller/account/download.php,catalog/controller/account/order.php,catalog/controller/account/recurring.php,catalog/controller/account/return.php,catalog/controller/account/reward.php,catalog/controller/account/transaction.php,catalog/controller/affiliate/transaction.php,catalog/controller/product/product.php">\r\n	<operation>\r\n	  <search position="replace"><![CDATA[date($this->language->get(''date_format_short'')]]></search>\r\n	  <add><![CDATA[call_function($this->language->get(''function_date''), $this->language->get(''date_format_custom_1'')]]></add>\r\n	</operation>\r\n  </file>\r\n\r\n  <file path="admin/controller/sale/customer.php">\r\n	<operation>\r\n	  <search><![CDATA[''date_added'' => date(''d/m/y'', strtotime($result[''date_added''])),]]></search>\r\n	  <add position="replace"><![CDATA[''date_added'' => call_function($this->language->get(''function_date''), $this->language->get(''date_format_custom_2''), strtotime($result[''date_added''])),]]></add>\r\n	</operation>\r\n  </file>	\r\n  \r\n	<!--\r\n        admin/controller/catalog/review.php	\r\n		admin/controller/sale/order.php\r\n		admin/controller/sale/recurring.php\r\n		admin/controller/sale/return.php\r\n		admin/controller/sale/customer.php\r\n		admin/controller/marketing/affiliate.php\r\n		admin/controller/marketing/marketing.php\r\n		admin/controller/tool/upload.php\r\n		\r\n	-->\r\n	\r\n  <file path="admin/controller/catalog/review.php,admin/controller/sale/order.php,admin/controller/sale/recurring.php,admin/controller/sale/return.php,admin/controller/sale/customer.php,admin/controller/marketing/affiliate.php,admin/controller/marketing/marketing.php,admin/controller/tool/upload.php">\r\n	<operation>\r\n	  <search regex="true"><![CDATA[~\\''filter_date_added\\''\\s+\\=\\>\\s+\\$filter_date_added\\,~]]></search>\r\n	  <add position="replace"><![CDATA[''filter_date_added'' => call_function($this->language->get(''function_jtg''), $filter_date_added),]]></add>\r\n	</operation>\r\n  </file> \r\n\r\n	<!--\r\n		admin/controller/sale/order.php\r\n		admin/controller/sale/return.php\r\n	-->\r\n	\r\n  <file path="admin/controller/sale/order.php,admin/controller/sale/return.php">\r\n	<operation>\r\n	  <search regex="true"><![CDATA[~\\''filter_date_modified\\''\\s+\\=\\>\\s+\\$filter_date_modified\\,~]]></search>\r\n	  <add position="replace"><![CDATA[''filter_date_modified'' => call_function($this->language->get(''function_jtg''), $filter_date_modified),]]></add>\r\n	</operation>\r\n  </file>	  \r\n  \r\n  <file path="admin/model/marketing/coupon.php">\r\n	<operation>\r\n	  <search><![CDATA[date_start = ''" . $this->db->escape($data[''date_start'']) . "'', date_end = ''" . $this->db->escape($data[''date_end'']) . "'']]></search>\r\n	  <add position="replace"><![CDATA[date_start = ''" . call_function($this->language->get(''function_jtg''), $this->db->escape($data[''date_start''])) . "'', date_end = ''" . call_function($this->language->get(''function_jtg''), $this->db->escape($data[''date_end''])) . "'']]></add>\r\n	</operation>\r\n  </file>	\r\n  \r\n  <file path="admin/controller/marketing/coupon.php">\r\n	<operation>\r\n	  <search><![CDATA[$data[''heading_title''] = $this->language->get(''heading_title'');]]></search>\r\n	  <add position="after"><![CDATA[$data[''lang''] = $this->language->get(''code'');]]></add>\r\n	</operation>\r\n	<operation>		\r\n	  <search position="replace"><![CDATA[date($this->language->get(''date_format_short'')]]></search>\r\n	  <add><![CDATA[call_function($this->language->get(''function_date''), $this->language->get(''l d F Y'')]]></add>	\r\n	</operation>			\r\n  </file>		\r\n	\r\n  <file path="admin/view/template/marketing/coupon_form.tpl">\r\n	<operation>\r\n	  <search><![CDATA[<?php echo $date_start; ?>]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo !isset($this->request->post[''date_start'']) ? ($lang == ''fa'' ? gtj($date_start) : $date_start) : $date_start; ?>]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[<?php echo $date_end; ?>]]></search>\r\n	  <add position="replace"><![CDATA[<?php echo !isset($this->request->post[''date_end'']) ? ($lang == ''fa'' ? gtj($date_end) : $date_end) : $date_end; ?>]]></add>\r\n	</operation>\r\n  </file>	\r\n  \r\n	<!--\r\n		admin/controller/report/sale_tax.php\r\n		admin/controller/report/sale_shipping.php\r\n		admin/controller/report/sale_return.php\r\n		admin/controller/report/product_purchased.php\r\n		admin/controller/report/customer_order.php\r\n		admin/controller/report/customer_reward.php\r\n		admin/controller/report/customer_credit.php\r\n		admin/controller/report/sale_coupon.php\r\n		admin/controller/report/sale_order.php\r\n		admin/controller/report/affiliate.php\r\n		admin/controller/report/affiliate_activity.php\r\n		admin/controller/report/customer_activity.php\r\n		admin/controller/report/marketing.php\r\n	-->\r\n	\r\n  <file path="admin/controller/report/sale_tax.php,admin/controller/report/sale_shipping.php,admin/controller/report/sale_return.php,admin/controller/report/product_purchased.php,admin/controller/report/customer_order.php,admin/controller/report/customer_reward.php,admin/controller/report/customer_credit.php,admin/controller/report/sale_coupon.php,admin/controller/report/sale_order.php,admin/controller/report/affiliate.php,admin/controller/report/affiliate_activity.php,admin/controller/report/customer_activity.php,admin/controller/report/marketing.php">\r\n	<operation>\r\n	  <search regex="true"><![CDATA[~\\''filter_date_start\\''\\s+\\=\\>\\s+\\$filter_date_start\\,~i]]></search>\r\n	  <add position="replace"><![CDATA[''filter_date_start'' => call_function($this->language->get(''function_jtg''), $filter_date_start), ]]></add>\r\n	</operation>\r\n  </file>	\r\n  \r\n	<!--\r\n		admin/controller/report/sale_tax.php\r\n		admin/controller/report/sale_shipping.php\r\n		admin/controller/report/sale_return.php\r\n		admin/controller/report/product_purchased.php\r\n		admin/controller/report/customer_order.php\r\n		admin/controller/report/customer_reward.php\r\n		admin/controller/report/customer_credit.php\r\n		admin/controller/report/sale_coupon.php\r\n		admin/controller/report/sale_order.php\r\n		admin/controller/report/affiliate.php\r\n		admin/controller/report/affiliate_activity.php\r\n		admin/controller/report/customer_activity.php\r\n		admin/controller/report/marketing.php		\r\n	-->\r\n	\r\n  <file path="admin/controller/report/sale_tax.php,admin/controller/report/sale_shipping.php,admin/controller/report/sale_return.php,admin/controller/report/product_purchased.php,admin/controller/report/customer_order.php,admin/controller/report/customer_reward.php,admin/controller/report/customer_credit.php,admin/controller/report/sale_coupon.php,admin/controller/report/sale_order.php,admin/controller/report/affiliate.php,admin/controller/report/affiliate_activity.php,admin/controller/report/customer_activity.php,admin/controller/report/marketing.php">\r\n	<operation>\r\n	  <search regex="true"><![CDATA[~\\''filter_date_end\\''\\s+\\=\\>\\s+\\$filter_date_end\\,~i]]></search>\r\n	  <add position="replace"><![CDATA[''filter_date_end''	=> call_function($this->language->get(''function_jtg''), $filter_date_end),]]></add>\r\n	</operation>\r\n  </file>	\r\n\r\n  <file path="admin/controller/report/sale_order.php">\r\n	<operation>\r\n	  <search><![CDATA[$filter_date_start = date(''Y-m-d'', strtotime(date(''Y'') . ''-'' . date(''m'') . ''-01''));]]></search>\r\n	  <add position="replace"><![CDATA[$filter_date_start = call_function($this->language->get(''function_date''), ''Y-m-d'', strtotime(date(''Y'') . ''-'' . date(''m'') . ''-01''));]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[$filter_date_end = date(''Y-m-d'');]]></search>\r\n	  <add position="replace"><![CDATA[$filter_date_end = call_function($this->language->get(''function_date''), ''Y-m-d'');]]></add>\r\n	</operation>\r\n  </file>	\r\n\r\n	<!--\r\n		admin/controller/dashboard/activity.php\r\n		admin/controller/report/affiliate_activity.php\r\n		admin/controller/report/customer_activity.php\r\n        admin/controller/report/customer_online.php		\r\n	-->  \r\n	\r\n  <file path="admin/controller/dashboard/activity.php,admin/controller/report/affiliate_activity.php,admin/controller/report/customer_activity.php,admin/controller/report/customer_online.php">\r\n	<operation>\r\n	  <search><![CDATA[date($this->language->get(''datetime_format''), strtotime($result[''date_added'']))]]></search>\r\n	  <add position="replace"><![CDATA[$this->language->get(''code'') == ''fa'' ? call_function($this->language->get(''function_date''), $this->language->get(''Y/m/d - H:i:s''), strtotime($result[''date_added''])) : date($this->language->get(''datetime_format''), strtotime($result[''date_added'']))]]></add>\r\n	</operation>\r\n  </file>		\r\n	\r\n  <file path="admin/controller/dashboard/chart.php">\r\n	<operation info="Chart For Week">\r\n	  <search><![CDATA[$json[''xaxis''][] = array(date(''w'', strtotime($date)), date(''D'', strtotime($date)));]]></search>\r\n	  <add position="replace"><![CDATA[$json[''xaxis''][] = $this->language->get(''code'') == ''fa'' ? array(date(''w'', strtotime($date)), call_function($this->language->get(''function_date''), ''l'', strtotime($date))) : array(date(''w'', strtotime($date)), date(''D'', strtotime($date)));]]></add>\r\n	</operation>\r\n	<operation info="Chart For Month">\r\n	  <search><![CDATA[for ($i = 1; $i <= date(''t''); $i++) {]]></search>\r\n	  <add position="replace" offset="4"><![CDATA[for ($i = 1; $i <= call_function($this->language->get(''function_date''), ''t''); $i++) {\r\n				if ($this->language->get(''code'') == ''fa'') {\r\n						$jdate = jdate(''Y'') . ''-'' . jdate(''m'') . ''-'' . $i;\r\n						$date = jtg($jdate);\r\n				}  else {\r\n\r\n						$date = date(''Y'') . ''-'' . date(''m'') . ''-'' . $i;\r\n				}\r\n				$json[''xaxis''][] = array(call_function($this->language->get(''function_date''), ''j'', strtotime($date)), call_function($this->language->get(''function_date''), ''d'', strtotime($date)));	\r\n              }]]></add>\r\n	</operation>\r\n	<operation info="Chart For Year">\r\n	  <search><![CDATA[$json[''xaxis''][] = array($i, date(''M'', mktime(0, 0, 0, $i)));]]></search>\r\n	  <add position="replace"><![CDATA[$json[''xaxis''][] = $this->language->get(''code'') == ''fa'' ? array($i, call_function($this->language->get(''function_date''),''F'', jmktime(0, 0, 0, $i, 1, call_function($this->language->get(''function_date''), ''Y'')))) : array($i, date(''M'', mktime(0, 0, 0, $i)));]]></add>\r\n	</operation>\r\n  </file>\r\n  \r\n	<!--\r\n	    admin/controller/dashboard/customer.php\r\n		admin/controller/dashboard/order.php\r\n		admin/controller/dashboard/sale.php\r\n	-->\r\n	\r\n  <file path="admin/controller/dashboard/sale.php,admin/controller/dashboard/customer.php,admin/controller/dashboard/order.php">\r\n	<operation>\r\n	  <search><![CDATA[date(''Y-m-d'', strtotime(''-1 day''))]]></search>\r\n	  <add position="replace"><![CDATA[call_function($this->language->get(''function_date''), ''Y-m-d'', strtotime(''-1 day''))]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[date(''Y-m-d'', strtotime(''-2 day''))]]></search>\r\n	  <add position="replace"><![CDATA[call_function($this->language->get(''function_date''),''Y-m-d'', strtotime(''-2 day''))]]></add>\r\n	</operation>\r\n  </file>	\r\n\r\n  <file path="catalog/language/persian/persian.php">\r\n	<operation>\r\n	  <search><![CDATA[// Text]]></search>\r\n	  <add position="before"><![CDATA[\r\n                $_[''function_date'']			= ''jdate'';\r\n                $_[''function_jtg'']			= ''jtg'';\r\n                $_[''function_gtj'']			= ''gtj'';\r\n                $_[''date_format_custom_1'']  = ''l d F Y - H:i:s'';\r\n                $_[''date_format_custom_2'']  = ''Y/m/d'';]]></add>\r\n	</operation>\r\n  </file>		\r\n\r\n  <file path="catalog/language/english/english.php">\r\n	<operation>\r\n	  <search><![CDATA[// Text]]></search>\r\n	  <add position="before"><![CDATA[\r\n				$_[''function_date'']	= ''date'';\r\n				$_[''function_jtg'']	= ''call_empty'';\r\n				$_[''function_gtj''] 	= ''call_empty'';\r\n				$_[''date_format_custom_1''] = ''d/m/Y H:i:s'';\r\n				$_[''date_format_custom_2''] = ''d/m/y'';]]></add>\r\n	</operation>\r\n  </file>\r\n  \r\n	<!--\r\n		catalog/controller/product/product.php\r\n		catalog/controller/account/address.php\r\n		catalog/controller/account/edit.php\r\n		catalog/controller/account/return.php\r\n		catalog/controller/account/register.php\r\n		catalog/controller/checkout/checkout.php\r\n	-->\r\n	\r\n  <file path="catalog/controller/product/product.php,catalog/controller/account/address.php,catalog/controller/account/edit.php,catalog/controller/account/return.php,catalog/controller/account/register.php,catalog/controller/checkout/checkout.php">\r\n	<operation>\r\n	  <search><![CDATA[$data[''heading_title'']]]></search> \r\n	  <add position="before"><![CDATA[$data[''direction''] = $this->language->get(''direction'');]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[$this->document->addScript(''catalog/view/javascript/jquery/datetimepicker/moment.js'');]]></search>\r\n	  <add position="replace"><![CDATA[ if ($this->language->get(''direction'') == ''rtl'') {$this->document->addScript(''catalog/view/javascript/jquery/datetimepicker/moment.fa.js'');}	else{$this->document->addScript(''catalog/view/javascript/jquery/datetimepicker/moment.js'');}]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[$this->document->addScript(''catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js'');]]></search>\r\n	  <add position="replace"><![CDATA[ if ($this->language->get(''direction'') == ''rtl'') {$this->document->addScript(''catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.fa.min.js'');} else { $this->document->addScript(''catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js'');}]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[$this->document->addStyle(''catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css'');]]></search>\r\n	  <add position="replace"><![CDATA[ if ($this->language->get(''direction'') == ''rtl'') {$this->document->addStyle(''catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.fa.min.css'');} else { $this->document->addStyle(''catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css'');}]]></add>\r\n	</operation>\r\n  </file>\r\n	\r\n  <file path="catalog/model/checkout/order.php">\r\n	<operation>\r\n	  <search><![CDATA[date($language->get(''date_format_short'')]]></search>\r\n	  <add position="replace"><![CDATA[call_function($language->get(''function_date''), $language->get(''date_format_short'')]]></add>\r\n	</operation>\r\n  </file>	\r\n\r\n  <file path="admin/model/report/customer.php">\r\n	<operation info="getTotalCustomersByMonth">\r\n	  <search><![CDATA[for ($i = 1; $i <= date(''t''); $i++) {]]></search>\r\n	  <add position="before"><![CDATA[if ($this->language->get(''code'') == ''fa'') {\r\n			for ($i = 1; $i <= jdate(''t''); $i++) {\r\n				$jdate = jdate(''Y'') . ''-'' . jdate(''m'') . ''-'' . $i;\r\n				$date = jtg($jdate);\r\n\r\n				$customer_data[jdate(''j'', strtotime($date))] = array(\r\n					''day''   => jdate(''d'', strtotime($date)),\r\n					''total'' => 0\r\n				);\r\n			}\r\n			\r\n			$jmdate = jdate(''Y'') . ''-'' . jdate(''m'') . ''-1'';\r\n			$gmdate = jtg($jmdate);\r\n			$query = $this->db->query("SELECT COUNT(*) AS total, date_added FROM `" . DB_PREFIX . "customer` WHERE DATE(date_added) >= ''" . $this->db->escape($gmdate) . "'' GROUP BY DATE(date_added)");\r\n\r\n			foreach ($query->rows as $result) {\r\n				$customer_data[jdate(''j'', strtotime($result[''date_added'']))] = array(\r\n					''day''   => jdate(''d'', strtotime($result[''date_added''])),\r\n					''total'' => $result[''total'']\r\n				);\r\n			}\r\n		} else {]]></add>\r\n	</operation>\r\n	<operation info="getTotalCustomersByMonth">\r\n	  <search><![CDATA[$customer_data[date(''j'', strtotime($result[''date_added'']))] = array(]]></search>\r\n	  <add position="after" offset="4"><![CDATA[}//Added]]></add>\r\n	</operation>\r\n	<operation info="getTotalCustomersByYear">\r\n	  <search><![CDATA[for ($i = 1; $i <= 12; $i++) {]]></search>\r\n	  <add position="before"><![CDATA[if ($this->language->get(''code'') == ''fa'') {\r\n			for ($i = 1; $i <= 12; $i++) {\r\n				$jmonth = gregorian_to_jalali(date(''Y''), $i, date(''d'')); \r\n				$jmonth = $jmonth[1];\r\n				$jyear = jdate(''Y'');\r\n				\r\n				$customer_data[$jmonth] = array(\r\n					''month'' => jdate(''F'', jmktime(0, 0, 0, $jmonth)),\r\n					''total'' => 0\r\n				);\r\n\r\n				$jmdate = jdate(''Y'') . ''-'' . $jmonth . ''-1'';\r\n				$gmdate = jtg($jmdate);\r\n				$query = $this->db->query("SELECT YEAR(date_added) AS year, MONTH(date_added) AS month, DAY(date_added) AS day, date_added FROM `" . DB_PREFIX . "customer` WHERE DATE(date_added) >= ''" . $this->db->escape($gmdate) . "'' GROUP BY DATE(date_added)");\r\n				$total_rows = 0;\r\n				$date_add = '''';\r\n\r\n				if ($query->num_rows) {\r\n					foreach ($query->rows as $result) {\r\n						$customer_jdate = gregorian_to_jalali($result[''year''], $result[''month''], $result[''day'']);\r\n						\r\n						if ($customer_jdate[0] == $jyear && $customer_jdate[1] == $jmonth) {\r\n							if($total_rows == 0) {$date_add = $result[''date_added''];}\r\n							$total_rows = $total_rows + 1;\r\n						}\r\n					}\r\n					\r\n					$customer_data[jdate(''n'', strtotime($date_add))] = array(\r\n						''month'' => jdate(''F'', strtotime($date_add)),\r\n						''total'' => $total_rows\r\n					);\r\n				}\r\n			}\r\n		} else {]]></add>\r\n	</operation>\r\n	<operation info="getTotalCustomersByYear">\r\n	  <search><![CDATA[$customer_data[date(''n'', strtotime($result[''date_added'']))] = array(]]></search>\r\n	  <add position="after" offset="4"><![CDATA[}//Added]]></add>\r\n	</operation>\r\n  </file>\r\n  \r\n  <file path="admin/model/report/sale.php">\r\n	<operation info="getTotalOrdersByMonth">\r\n	  <search><![CDATA[for ($i = 1; $i <= date(''t''); $i++) {]]></search>\r\n	  <add position="before"><![CDATA[if ($this->language->get(''code'') == ''fa'') {\r\n			for ($i = 1; $i <= jdate(''t''); $i++) {\r\n				$jdate = jdate(''Y'') . ''-'' . jdate(''m'') . ''-'' . $i;\r\n				$date = jtg($jdate);\r\n\r\n				$order_data[jdate(''j'', strtotime($date))] = array(\r\n					''day''   => jdate(''d'', strtotime($date)),\r\n					''total'' => 0\r\n				);\r\n			}\r\n\r\n			$jmdate = jdate(''Y'') . ''-'' . jdate(''m'') . ''-1'';\r\n			$gmdate = jtg($jmdate);\r\n			$query = $this->db->query("SELECT COUNT(*) AS total, date_added FROM `" . DB_PREFIX . "order` WHERE order_status_id > ''0'' AND DATE(date_added) >= ''" . $this->db->escape($gmdate) . "'' GROUP BY DATE(date_added)");\r\n\r\n			foreach ($query->rows as $result) {\r\n				$order_data[jdate(''j'', strtotime($result[''date_added'']))] = array(\r\n					''day''   => jdate(''d'', strtotime($result[''date_added''])),\r\n					''total'' => $result[''total'']\r\n				);\r\n			}\r\n		} else {]]></add>\r\n	</operation>\r\n	<operation info="getTotalOrdersByMonth">\r\n	  <search><![CDATA[$order_data[date(''j'', strtotime($result[''date_added'']))] = array(]]></search>\r\n	  <add position="after" offset="4"><![CDATA[}//Added]]></add>\r\n	</operation>\r\n	<operation info="getTotalOrdersByYear">\r\n	  <search><![CDATA[for ($i = 1; $i <= 12; $i++) {]]></search>\r\n	  <add position="before"><![CDATA[if ($this->language->get(''code'') == ''fa'') {\r\n			for ($i = 1; $i <= 12; $i++) {\r\n				$jmonth = gregorian_to_jalali(date(''Y''), $i, date(''d'')); \r\n				$jmonth = $jmonth[1];\r\n				$jyear = jdate(''Y'');\r\n				\r\n				$order_data[$jmonth] = array(\r\n					''month'' => jdate(''F'', jmktime(0, 0, 0, $jmonth)),\r\n					''total'' => 0\r\n				);\r\n\r\n				$jmdate = jdate(''Y'') . ''-'' . $jmonth . ''-1'';\r\n				$gmdate = jtg($jmdate);\r\n				$query = $this->db->query("SELECT YEAR(date_added) AS year, MONTH(date_added) AS month, DAY(date_added) AS day, date_added FROM `" . DB_PREFIX . "order` WHERE order_status_id > ''0'' AND DATE(date_added) >= ''" . $this->db->escape($gmdate) . "'' GROUP BY DATE(date_added)");\r\n				$total_rows = 0;\r\n				$date_add = '''';\r\n						\r\n				if ($query->num_rows) {\r\n					foreach ($query->rows as $result) {\r\n						$order_jdate = gregorian_to_jalali($result[''year''], $result[''month''], $result[''day'']);\r\n						\r\n						if ($order_jdate[0] == $jyear && $order_jdate[1] == $jmonth) {\r\n							if($total_rows == 0) {$date_add = $result[''date_added''];}\r\n							$total_rows = $total_rows + 1;\r\n						}\r\n					}\r\n					\r\n					$order_data[jdate(''n'', strtotime($date_add))] = array(\r\n						''month'' => jdate(''F'', strtotime($date_add)),\r\n						''total'' => $total_rows\r\n					);\r\n				}\r\n			}\r\n		} else {]]></add>\r\n	</operation>\r\n	<operation info="getTotalOrdersByYear">\r\n	  <search><![CDATA[$order_data[date(''n'', strtotime($result[''date_added'']))] = array(]]></search>\r\n	  <add position="after" offset="4"><![CDATA[}//Added]]></add>\r\n	</operation>\r\n	<operation>\r\n	  <search><![CDATA[order_status_id IN(" . implode(",", $implode) . ")]]></search>\r\n	  <add position="replace"><![CDATA[order_status_id > ''0'']]></add>\r\n	</operation>\r\n  </file>	\r\n</modification>', 1, '2015-07-10 00:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'دسته بندی', 'banner', 'a:5:{s:4:"name";s:17:"دسته بندی";s:9:"banner_id";s:1:"6";s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:6:"status";s:1:"1";}'),
(29, 'صفحه اصلی', 'carousel', 'a:5:{s:4:"name";s:17:"صفحه اصلی";s:9:"banner_id";s:1:"8";s:5:"width";s:3:"130";s:6:"height";s:3:"100";s:6:"status";s:1:"1";}'),
(28, 'صفحه اصلی', 'featured', 'a:6:{s:4:"name";s:17:"صفحه اصلی";s:7:"product";a:4:{i:0;s:2:"43";i:1;s:2:"40";i:2;s:2:"42";i:3;s:2:"30";}s:5:"limit";s:1:"4";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(27, 'صفحه اصلی', 'slideshow', 'a:5:{s:4:"name";s:17:"صفحه اصلی";s:9:"banner_id";s:1:"7";s:5:"width";s:4:"1140";s:6:"height";s:3:"380";s:6:"status";s:1:"1";}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(1, 2, ' دکمه رادیو'),
(2, 2, 'چک باکس '),
(4, 2, 'متن'),
(6, 2, 'Textarea'),
(8, 2, 'تاریخ'),
(7, 2, 'فایل'),
(5, 2, 'انتخاب'),
(9, 2, 'زمان'),
(10, 2, 'تاریخ و زمان'),
(12, 2, 'تاریخ تحویل'),
(11, 2, 'اندازه'),
(2, 1, 'Checkbox'),
(9, 1, 'Time'),
(8, 1, 'Date'),
(10, 1, 'Date &amp; Time'),
(7, 1, 'File'),
(5, 1, 'Select'),
(11, 1, 'Size'),
(12, 1, 'Delivery Date'),
(1, 1, 'Radio');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(31, 1, '', 2),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(40, 5, '', 2),
(39, 5, '', 1),
(32, 1, '', 1),
(24, 2, '', 2),
(23, 2, '', 1),
(48, 11, '', 3),
(47, 11, '', 2),
(46, 11, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(31, 1, 1, 'Medium'),
(44, 2, 2, 'چک باکس 3'),
(31, 2, 1, 'متوسط'),
(41, 1, 5, 'Green'),
(41, 2, 5, 'سبز'),
(40, 1, 5, 'Blue'),
(24, 1, 2, 'Checkbox 2'),
(47, 1, 11, 'Medium'),
(47, 2, 11, 'متوسط'),
(32, 1, 1, 'Small'),
(24, 2, 2, 'چک باکس 2'),
(23, 1, 2, 'Checkbox 1'),
(32, 2, 1, 'کوچک'),
(40, 2, 5, 'آبی'),
(39, 1, 5, 'Red'),
(39, 2, 5, 'قرمز'),
(23, 2, 2, 'چک باکس 1'),
(46, 1, 11, 'Small'),
(46, 2, 11, 'کوچک'),
(44, 1, 2, 'Checkbox 3'),
(45, 2, 2, 'چک باکس 4'),
(45, 1, 2, 'Checkbox 4'),
(42, 2, 5, 'زرد'),
(42, 1, 5, 'Yellow'),
(48, 2, 11, 'بزرگ'),
(48, 1, 11, 'Large'),
(43, 2, 1, 'بزرگ'),
(43, 1, 1, 'Large');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 2, 'در دست اقدام'),
(3, 2, 'حمل شده'),
(7, 2, 'لغو شده'),
(5, 2, 'کامل شده'),
(8, 2, 'امتناع شده'),
(9, 2, 'برگشت لغو شده'),
(10, 2, 'ناموفق'),
(11, 2, 'بازپرداخت شده'),
(12, 2, 'برگشت خورده'),
(13, 2, 'وجه برگشت خورده توسط بانک'),
(1, 2, 'در حال بررسی'),
(16, 2, 'باطل شده'),
(15, 2, 'اقدام شده'),
(14, 2, 'منقضی شده'),
(7, 1, 'Canceled'),
(10, 1, 'Failed'),
(14, 1, 'Expired'),
(5, 1, 'Complete'),
(13, 1, 'Chargeback'),
(8, 1, 'Denied'),
(3, 1, 'Shipped'),
(12, 1, 'Reversed'),
(16, 1, 'Voided'),
(11, 1, 'Refunded'),
(9, 1, 'Canceled Reversal'),
(2, 1, 'Processing'),
(15, 1, 'Processed'),
(1, 1, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'محصول 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '680000.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2015-04-09 09:59:07'),
(30, 'محصول 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '255000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:59:00', '2015-04-09 09:41:04'),
(31, 'محصول 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '900000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2015-04-09 10:02:59'),
(32, 'محصول 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '670000.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2015-04-09 09:19:05'),
(33, 'محصول 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '700000.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2015-04-09 09:48:41'),
(34, 'محصول 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100000.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2015-04-09 05:33:16'),
(35, 'محصول 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '108000.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2015-04-09 10:04:20'),
(36, 'محصول 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '580000.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2015-04-09 09:20:55'),
(40, 'محصول 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '3000000.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:12', '2015-04-09 05:40:43'),
(41, 'محصول 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '1500000.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:26', '2015-04-09 05:20:03'),
(42, 'محصول 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '1800000.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 0, '2009-02-03 21:07:37', '2015-07-10 20:30:05'),
(43, 'محصول  16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '7800000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2015-04-09 09:52:00'),
(44, 'محصول 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '6500000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2015-04-09 09:56:44'),
(45, 'محصول 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '8800000.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2015-04-09 09:53:52'),
(46, 'محصول 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '2300000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2015-04-09 09:23:30'),
(47, 'محصول 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '4100000.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 0, '2009-02-03 21:08:40', '2015-04-09 09:25:35'),
(48, 'محصول 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '120000.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2015-04-09 05:37:52'),
(49, 'سامسونگ 1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '870000.0000', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2011-04-26 08:57:34', '2015-04-09 09:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(47, 2, 1, '4'),
(43, 2, 1, '1'),
(42, 3, 1, '100mhz'),
(43, 4, 2, '8gb'),
(47, 2, 2, '4'),
(43, 2, 2, '1'),
(42, 3, 2, '100mhz'),
(47, 4, 2, '16GB'),
(47, 4, 1, '16GB'),
(43, 4, 1, '8gb');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm® MSM 7201A™ 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile® 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO™ 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi®: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB™ (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD™ memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'HTC Touch HD', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', ''),
(36, 2, 'آی پاد نانو', 'آی پاد نانو (iPod Nano) نسل هفتم یکی از محصولات پیشرفته اپل در زمینه پخش موسیقی است. این مدل در کنار سادگی، زیبایی و تنوع رنگهای جذاب، امکان پخش موسیقی، فیلم و نمایش عکس را دارد و حتی امکان فیلم برداری و عکاسی نیز به شما میدهد!&lt;br&gt;&lt;br&gt;Video in your pocket.&lt;br&gt;&lt;br&gt;Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;br&gt;&lt;br&gt;Cover Flow.&lt;br&gt;&lt;br&gt;Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;br&gt;&lt;br&gt;Enhanced interface.&lt;br&gt;&lt;br&gt;Experience a whole new way to browse and view your music and video.&lt;br&gt;&lt;br&gt;Sleek and colorful.&lt;br&gt;&lt;br&gt;With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;br&gt;&lt;br&gt;iTunes.', '', 'آی پاد نانو', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most \r\npopular music player now lets you enjoy movies, TV shows, and more on a \r\ntwo-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy \r\nmillions of songs, movies, TV shows, audiobooks, and games and download \r\nfree podcasts all at the iTunes Store. And you can import your own \r\nmusic, manage your whole media library, and sync your iPod or iPhone \r\nwith ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', 'iPod Touch', '', ''),
(33, 2, 'سامسونگ سینک مستر S27A950D ', 'کمپانی سامسونگ نسل جدید نمایشگرهای سه بعدی LED خودش را در اروپا عرضه کرد تا بزودی در دیگر نقاط دنیا هم عرضه شان آغاز شود . نمایشگر سینک مستر S27A950D یک نمایشگر 27 اینچی سه بعدی است که دارای روشنایی 300cd/m2 و نرخ کنتراست دینامیک 5,000,000:1 است . این نمایشگر 120Hz دارای موتور 3D HyperReal برای نمایش عکس های سه بعدی است . قطر این نمایشگر 11.4mm است و با قیمت $567.24 ( باید به یورو تبدیل شود ) در اروپا عرضه شده است . همراه با این نمایشگر یک عینک سه بعدی هم به خریدار داده می شود . &lt;br&gt;&lt;br&gt;Imagine the advantages of going big without slowing down. The big 19&quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it''s not hard to imagine.', '', 'سامسونگ سینک مستر S27A950D ', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', 'پخش کننده موزیک آی پاد شافل', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon''s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br&gt;\r\n		&lt;br&gt;\r\n		Similar to the D3, the D300 features Nikon''s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera''s new features. The D300 features a new 51-point autofocus system with Nikon''s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera''s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br&gt;\r\n		&lt;br&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br&gt;\r\n		&lt;br&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon''s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 – includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick – a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader’s Hub, Music Hub and Samsung Mini Apps Tray – which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;äö&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30&quot;', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'Canon EOS 5D', '', ''),
(35, 2, 'محصول 8', '&lt;p&gt;محصول 8&lt;br&gt;&lt;/p&gt;\r\n', '', 'محصول 8', '', ''),
(48, 2, 'آی پاد کلاسیک', '&lt;p&gt; همانطور که احتمالا بدانید، اپل چند ماه پیش تولید آیپاد کلاسیک خود را متوقف کرد. در همان زمان بسیاری از طرفداران اپل نسبت به این خبر واکنش منفی نشان دادند و این محصول به سرعت تبدیل به یک کالای کم یاب شد.عدم عرضه و از طرفی تقاضای بالا باعث شده که این محصول قدیمی اپل، تا ۱۰۰۰ دلار هم به فروش برسد که رقمی بسیار بالاتر از قیمت واقعی آن است.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;div class=&quot;cpt_product_description &quot;&gt;	&lt;div&gt;		&lt;p&gt;			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;		&lt;p&gt;			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;		&lt;p&gt;			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;		&lt;p&gt;			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;		&lt;p&gt;			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;		&lt;p&gt;			Experience a whole new way to browse and view your music and video.&lt;/p&gt;		&lt;p&gt;			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;		&lt;p&gt;			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;	&lt;/div&gt;&lt;/div&gt;&lt;!-- cpt_container_end --&gt;&lt;p&gt;&lt;/p&gt;', '', 'آی پاد کلاسیک', '', ''),
(40, 2, 'آیفون 6', '&lt;p class=&quot;intro&quot;&gt;گوشی هوشمند iPhone 5 از نظر ظاهری شباهت زیادی به دستگاه چندرسانه‌ای قابل‌حمل iPod Touch دارد و برخلاف آنچه که در سایت‌ها خبری آورده می‌شود، چندان شبیه به iPad 2 نیست.&lt;br&gt;شکل ظاهری کلید Home در این گوشی تغییرکرده و فضای اطراف آن کمی فرورفته شده است تا کاربر آسان‌تر از قبل بتواند با حرکات انگشتان خود کنترل سیستم داخلی گوشی را در دست بگیرد. در این گزارش تایید شده است که iPhone 5 نسبت به مدل قبلی خود نمایشگر بزرگ‌تری دارد. طبق گفته‌های منابع آگاه، قرار است در این گوشی از نمایشگر لمسی ۷/۳ اینچی استفاده شود که این نمایشگر تا کنار بدنه گوشی آمده است و کاربر هیچ فضای اضاغی را اطراف آن نمی‌بیند.&lt;br&gt;روی مدل&amp;nbsp; آتی گوشی هوشمند اپل پردازنده پرسرعت A5 نصب شده است و کاربران به کمک دوربین دیجیتالی ۸ مگاپیکسلی آن&amp;nbsp;&amp;nbsp; می‌توانند تصاویر باکیفیتی را تهیه کنند.&lt;br&gt;&lt;br&gt;iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'آیفون 6', '', ''),
(28, 2, 'اچ تی سی تاچ اچ دی', 'گوشی دیگری که در سپتامبر 2008 میلادی به بازار کامپیوترهای جیبی معرفی شد گوشی HTC مدل Touch HD است که طراحی زیبایی دارد. این گوشی با ابعادی در اندازه‌های 12×62.8×115 میلی‌متر طراحی شده و وزن آن نیز برابر است با 146 گرم. همان طور که از این ابعاد پیدا ست با گوشی باریکی رو به رو هستیم که امکانات خوبی را در اختیار کاربر خود قرار می‌دهد.&lt;br&gt;صفحه نمایش به کار رفته در Touch HD یک نمایش‌گر 65.000 رنگی لمسی TFT است که با رزولوشنی برابر با 800×480 پیکسل، 3.8 اینچ اندازه دارد.&lt;br&gt;&amp;nbsp;HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;br&gt;&lt;br&gt;Features&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Processor Qualcomm® MSM 7201A™ 528 MHz&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Windows Mobile® 6.1 Professional Operating System&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Memory: 512 MB ROM, 288 MB RAM&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Device Control via HTC TouchFLO™ 3D &amp;amp; Touch-sensitive front panel buttons&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; GPS and A-GPS ready&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Wi-Fi®: IEEE 802.11 b/g&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; HTC ExtUSB™ (11-pin mini-USB 2.0)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 5 megapixel color camera with auto focus&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; VGA CMOS color camera&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Expansion Slot: microSD™ memory card (SD 2.0 compatible)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Special Features: FM Radio, G-Sensor&lt;br&gt;', '', 'اچ تی سی تاچ اچ دی', '', ''),
(44, 2, 'مک بوک ایر', 'مطمئن از بدنه‌ای که 4 سال از تاریخ طراحیش می‌گذرد، کمپانی اپل اوایل بهار 93 و بدون برگزاری هیچ‌گونه مراسم خاصی، نسل جدید لپ‌تاپ‌های MacBook Air را با همان ظاهر مدل‌های سال گذشته معرفی نمود. اما این موضوع فقط مربوط به ظاهر دستگاه نمی‌باشد و داخل سری جدید MacBook Air هم، به جز ارتقایی ناچیز در مورد پردازنده‌ی مرکزی، دستخوش تغییر خاصی نشده است. همانند سال‌های گذشته، نسل جدید MacBook Air نیز در دو مدل 11 و 13 اینچی تولید و عرضه گشته‌اند. با ورود این لپ‌تاپ‌ها به بازار ایران، فرصتی یافتیم تا به نقد و بررسی آن‌ها بپردازیم.&lt;br&gt;&lt;br&gt;&amp;nbsp;MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don’t lose inches and pounds overnight. It’s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;br&gt;', '', 'مک بوک ایر', '', ''),
(45, 2, 'مک بوک پرو', 'در اوایل سال 2012 بود که اپل، نسخه‌ی جدید Macbook Pro ی خود را با نمایشگر 15 اینچی Retina معرفی کرد. از همان زمان منتظر معرفی نسخه‌ی 13 اینچی آن نیز بودیم. اکنون پس از چندین ماه انتظار، شاهد Macbook Pro 13 Retina هستیم. این نوت بوک اندکی سبک‌تر و باریک‌تر از Pro 13 پیشین است. ظاهرا که شارژدهی باتری آن نیز در حد 13 Air می‌باشد. به هر صورت بارزترین ویژگی که در مورد هر دو مک بوک خود نمایی می‌کند همین نمایشگر Retina است. رتینایی که نخستین بار نام آن را همزمان با معرفی iPhone 4 شنیدیم و قرار بود که رزولوشن آن از قدرت تفکیک چشم انسان بالاتر باشد. بر روی iPhone دقیقا همان‌طور بود و تراکم پیکسلی بالا همین نتیجه را در بر داشت. سپس رتینا بر روی iPad به کار گرفته شد که همان نام را داشت ولی تراکم پیکسلی پایین‌تری را ارائه می‌داد.&lt;br&gt;&lt;br&gt;&lt;br&gt;Latest Intel mobile architecture&lt;br&gt;&lt;br&gt;Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;br&gt;&lt;br&gt;Leading-edge graphics&lt;br&gt;&lt;br&gt;The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;br&gt;&lt;br&gt;Designed for life on the road&lt;br&gt;&lt;br&gt;Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;br&gt;&lt;br&gt;Connect. Create. Communicate.&lt;br&gt;&lt;br&gt;Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;br&gt;&lt;br&gt;Next-generation wireless&lt;br&gt;&lt;br&gt;Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;br&gt;', '', 'مک بوک پرو', '', ''),
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', ''),
(46, 2, 'سونی وایو CW', 'از ویژگی‌های مهم نوت‌بوک‌های سری CW تنوع رنگ، زیبایی، کیفیت ساخت و قیمت مناسب در مقابل ارایه‌ی امکانات خوب در ضمن کاربری راحت و بسیار آسان است. CW مجهز به پردازنده‌ی بسیار کارآمد و خوب اینتل از نوع Core i3 است. صفحه نمایش این نوت‌بوک‌ها در اندازه‌ی 14 اینچ ساخته شده، که به عقیده‌ی بسیاری سایز بسیار مناسب و میانی می‌باشد و فضای خالی بین لپ‌تاپ‌های 13 و 15 اینچ را به خوبی پر کرده است، به همین دلیل نیز از وزن مناسبی برخوردار است و فقط 2.4 کیلوگرم سنگینی دارد. این درحالی است که در حالت کلی نوت‌بوک‌های رده‌ی 15 اینچ حدود 2.6 تا 2.8 کیلوگرم سنگینی دارند.&lt;br&gt;&lt;br&gt;Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel''s latest, most powerful innovation yet: Intel® Centrino® 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;br&gt;&lt;br&gt;', '', 'سونی وایو CW', '', ''),
(47, 2, 'لپ تاپ اچ پی 4530s', 'لپ‌تاپ 4530s HP ProBook محصول دیگری از سری بیزینسی ProBook این شرکت می‌باشد که در رده‌ی کاربری مشاغل کوچک قرار می‌گیرد. لپ‌تاپ‌های بیزینسی اصولا دارای ویژگی‌های خاصی هستند که آن‌ها را برای استفاده کردن در محیط‌های شغلی متناسب می‌سازد. از جمله‌ی این ویژگی‌ها می‌توان به بدنه‌ی پر دوام، قدرت سخت‌افزاری بالا، ویژگی‌های امنیتی پیشرفته و نمایشگر با سطح غیر براق اشاره کرد. در ضمن معمولا در ساخت آن‌ها از خصوصیات تجملی و تزئینی هم استفاده نمی‌شود و ظاهر جدی‌تری دارند. 4530s نیز چنین نوت‌بوکی می‌باشد که از نمایشگر 15.6 اینچی مات و بدنه‌ی آلومینیومی بسیار مستحکم خش‌دار بهره می‌برد.&lt;br&gt;&lt;br&gt;Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you''re at the office', '', 'لپ تاپ اچ پی 4530s', '', ''),
(32, 2, 'آی پاد تاچ', 'آی پاد مالتی تاچ با تکنولوژی مشابه آیفون یکی از برترین انتخاب های شما خواهد بود. این دستگاه&amp;nbsp; با یک تلنگر کوچک به راختی در میان آهنگ ها و ویدئوها گشت و گذار می زند. همچنین این دستگاه با یک صفحه 3.5 اینچی واید، کلیه نیاز های شما را برای یک دستگاه مالتی مدیای پیشرفته فرآهم می سازد.&lt;br&gt;&lt;br&gt;Revolutionary multi-touch interface.&lt;br&gt;iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;br&gt;&lt;br&gt;Gorgeous 3.5-inch widescreen display.&lt;br&gt;Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;br&gt;&lt;br&gt;Music downloads straight from iTunes.&lt;br&gt;Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;br&gt;&lt;br&gt;Surf the web with Wi-Fi.&lt;br&gt;Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in', '', 'آی پاد تاچ', 'آی پاد تاچ حرفه ای', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', ''),
(43, 2, 'مک بوک', 'مک‌بوک (به انگلیسی: MacBook) یکی از سری لپ تاپ‌های تولیدی شرکت اپل بوده است. مک‌بوک که در ماه مه سال ۲۰۰۶ توسط شرکت اپل معرفی شد، در واقع جایگزینی برای لپ تاپ‌های iBook G4 و لپ تاپ‌های ۱۲ اینچی سری پاوربوک همین شرکت بود که وجه تشابه آن‌ها استفاده از پردازنده‌های ساخت شرکت اینتل می‌باشد. شرکت اپل، مک‌بوک را در راستای اهدافی مانند آموزش و فروش در بازارهای مصرف ارائه نمود و در اکتبر سال ۲۰۰۸ با معرفی این برند بعنوان یکی از پرفروشترین لپ تاپ‌های آمریکا توسط گروه ان‌پی‌دی، شرکت اپل به یکی از عمده اهداف خود در ارائه این سری از لپ تاپ‌ها نایل شد.&lt;br&gt;&lt;br&gt;Intel Core 2 Duo processor&lt;br&gt;&lt;br&gt;Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;br&gt;&lt;br&gt;1GB memory, larger hard drives&lt;br&gt;&lt;br&gt;The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;br&gt;&lt;br&gt;Sleek, 1.08-inch-thin design&lt;br&gt;&lt;br&gt;MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;br&gt;&lt;br&gt;Built-in iSight camera&lt;br&gt;&lt;br&gt;Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;br&gt;', '', 'مک بوک', '', ''),
(31, 2, 'نیکون دی 300 اس', 'عرضه‌ی نیکون D300s در بازار بسیار تاثیرگذار بود و به عقیده‌ی بسیاری بهترین دوربین نیمه حرفه‌ای است که می‌توان در بازار یافت. تعداد بسیاری از ویژگی‌ها، که ما اکنون در دوربین D300s می‌بینیم همان‌هایی هستند که به مدل D300 اضافه شده‌اند. یکی از این ویژگی‌های بسیار خوب که به این دوربین اضافه شده است فوکوس خودکار کنتراست‌یاب (Contrast-Detection Autofocus) است که در زمانی که بر روی مود فیلم‌برداری قرار دارد فعال می‌شود و این در DSLR نیکون ویژگی کاملا جدیدی محسوب می‌شود. البته فوکوس خودکار چندان سریعی ندارد همچنین لازم است شما برای ضبط صدای فاصله‌ی دور از یک میکروفون خارجی استفاده کنید چرا که میکروفون داخلی قویی ندارد.&lt;br&gt;&lt;br&gt;Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon''s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br&gt;&lt;br&gt;Similar to the D3, the D300 features Nikon''s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera''s new features. The D300 features a new 51-point autofocus system with Nikon''s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera''s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br&gt;&lt;br&gt;The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br&gt;&lt;br&gt;The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon''s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;br&gt;', '', 'نیکون دی 300 اس', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(49, 2, 'سامسونگ Galaxy Tab 7.7', 'صفحه نمایش AMOLED این تبلت عمق رنگ مشکی بسیار خوبی را فراهم می آورد و رنگ ها را بسیار درخشان و شفاف به نمایش می گذارد. گلکسی تب 7.7 نازکترین تبلت در رده هفت اینچی ها بوده و دارای قابلیت هایی چون امکان افزایش حافظه، کارایی بسیار خوب بازی ها، سنسور IR برای تبدیل تبلت به یک کنترل از راه دور هوشمند است. &lt;br&gt;&lt;br&gt;نکات منفی: مهمترین نکته قیمت بالای این تبلت است که بیش از یک میلیون تومان برای یک تبلت هفت اینچی باید هزینه کنید. و البته عدم وجود پورت های مهمی چون HDMI و USB را هم به این داستان اضافه کنید. &lt;br&gt;&lt;br&gt;قیمت: مدل ۱۶ گیگابایتی، یک میلیون و پنجاه هزار تومان &lt;br&gt;&lt;br&gt;نتیجه گیری: این تبلت صفحه نمایشی زیبا و کارایی بسیار خوبی را برای تان به ارمغان می آورد و اگر هزینه آن برای تان سنگین نباشد، می تواند انتخاب کاملا مناسبی باشد.&lt;br&gt;&lt;br&gt;Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;br&gt;&lt;br&gt;Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 – includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick – a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;br&gt;&lt;br&gt;Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader’s Hub, Music Hub and Samsung Mini Apps Tray – which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time. äö', '', 'سامسونگ Galaxy Tab 7.7', 'سامسونگ Galaxy Tab 7.7 با صفحه نمایش AMOLED', ''),
(42, 2, 'سینما  30 اینچی اپل', 'سینما سی اینچی اپل با رزولوشن بسیار عالی HD 2560 x 1600&amp;nbsp; است. این سینما با این ابعاد جالب محیطی مناسب برای دسترسی راحت تر به امکانات را به همراه داشته است. همراه شدن این دستگاه با مک، هر آنچه که نیاز شماست را به همراه خواهد داشت.&lt;br&gt;&lt;br&gt;&amp;nbsp;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;Features:&lt;br&gt;&lt;br&gt;Unrivaled display performance&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Wide-format design for simultaneous display of two full pages of text and graphics.&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Lightning-fast pixel response for full-motion digital video playback.&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;br&gt;&lt;br&gt;Simple setup and operation&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Two FireWire 400 ports to support iSight and other desktop peripherals&lt;br&gt;&lt;br&gt;Sleek, elegant design&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Huge virtual workspace, very small footprint.&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Narrow Bezel design to minimize visual impact of using dual displays&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Unique hinge design for effortless adjustment&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;br&gt;&lt;br&gt;Technical specifications&lt;br&gt;&lt;br&gt;Screen size (diagonal viewable image size)&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;br&gt;&lt;br&gt;Screen type&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;br&gt;&lt;br&gt;Resolutions&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 2560 x 1600 pixels (optimum resolution)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 2048 x 1280&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 1920 x 1200&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 1280 x 800&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 1024 x 640&lt;br&gt;&lt;br&gt;Display colors (maximum)&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 16.7 million&lt;br&gt;&lt;br&gt;Viewing angle (typical)&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 170° horizontal; 170° vertical&lt;br&gt;&lt;br&gt;Brightness (typical)&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 30-inch Cinema HD Display: 400 cd/m2&lt;br&gt;&lt;br&gt;Contrast ratio (typical)&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 700:1&lt;br&gt;&lt;br&gt;Response time (typical)&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 16 ms&lt;br&gt;&lt;br&gt;Pixel pitch&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 30-inch Cinema HD Display: 0.250 mm&lt;br&gt;&lt;br&gt;Screen treatment&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Antiglare hardcoat&lt;br&gt;&lt;br&gt;User controls (hardware and software)&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Display Power,&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; System sleep, wake&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Brightness&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Monitor tilt&lt;br&gt;&lt;br&gt;Connectors and cables&lt;br&gt;Cable&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; DVI (Digital Visual Interface)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; FireWire 400&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; USB 2.0&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; DC power (24 V)&lt;br&gt;&lt;br&gt;Connectors&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Two-port, self-powered USB 2.0 hub&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Two FireWire 400 ports&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Kensington security port&lt;br&gt;&lt;br&gt;VESA mount adapter&lt;br&gt;Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;br&gt;&lt;br&gt;Electrical requirements&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Input voltage: 100-240 VAC 50-60Hz&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Maximum power when operating: 150W&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Energy saver mode: 3W or less&lt;br&gt;&lt;br&gt;Environmental requirements&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Operating temperature: 50° to 95° F (10° to 35° C)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Storage temperature: -40° to 116° F (-40° to 47° C)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Operating humidity: 20% to 80% noncondensing&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Maximum operating altitude: 10,000 feet&lt;br&gt;&lt;br&gt;Agency approvals&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; FCC Part 15 Class B&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; EN55022 Class B&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; EN55024&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; VCCI Class B&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; AS/NZS 3548 Class B&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; CNS 13438 Class B&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; ICES-003 Class B&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; ISO 13406 part 2&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; MPR II&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; IEC 60950&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; UL 60950&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; CSA 60950&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; EN60950&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; ENERGY STAR&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; TCO ''03&lt;br&gt;&lt;br&gt;Size and weight&lt;br&gt;30-inch Apple Cinema HD Display&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Height: 21.3 inches (54.3 cm)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Width: 27.2 inches (68.8 cm)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Depth: 8.46 inches (21.5 cm)&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Weight: 27.5 pounds (12.5 kg)&lt;br&gt;&lt;br&gt;System Requirements&lt;br&gt;&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Mac Pro, all graphic options&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; MacBook Pro&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Power Mac G5 (PCI Express), all graphics options&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; PowerBook G4 with dual-link DVI support&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup', '', 'سینما  30 اینچی اپل', 'سینما 30 اینچی اپل با رزولوشن باورنکردنی', ''),
(30, 2, 'کانن EOS 5D', 'دوربین بسیار قدرتمند کانن با امکانات بسیار عالی، هر آنچه را که نیاز شماست، برآورده می کند. این دوربین با رزولوشن 12.9 مگاپیکسل واقعی، بهترین تصاویر را به همراه خواهد داشت.&lt;br&gt;&lt;br&gt;&amp;nbsp;Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;br&gt;', '', 'کانن EOS 5D', 'دوربین canon کانن EOS 5D', ''),
(41, 2, 'آی مک MB420LL/A', '&lt;div style=&quot;text-align: justify;&quot;&gt;محصول آی مک یکی از تکنولوژی های پیشرفته و گران قیمت اپن این بار، با سی \r\nپی یو &amp;nbsp; Intel® Centrino2 3.06 GHz، رم 4096 MB DDR3 SDRAM و هاردديسكي با \r\nظرفيت 1TB HDD مجهز است. تجهيز به اپتيكال درايو DVD±R Super Drive Double \r\nLayer، صفحه نمايش 24 اينچ از نوع WUXGA glossy TFT active-matrix LCD \r\ndisplay با وضوح تصوير 1920×1200، كارت گرافيك NVIDIA GeForce GT 130 with \r\n512MB of GDDR3 memory، اسپيكر، چهار پورت usb و.... از ساير ويژگي هاي اين\r\n imac است.&lt;/div&gt;', '', 'آی مک MB420LL/A', '', ''),
(34, 2, 'آی پاد شافل', '&lt;p&gt;آی ‌پاد شافل نام كوچك‌ترین پخش‌كننده موسیقی دیجیتال شركت اپل است كه نخستین بار سال 2005 میلادی معرفی شد. نسخه اولیه آی‌ پاد شافل به شكل یو‌اس‌بی فلش بود اما نسل‌های بعدی شبیه آی‌پاد نانو و آی‌پاد مینی طراحی و ساخته شد. نسل دوم آی‌ پاد شافل دو مدل یك و دو گیگابایت دارد. نسل سوم آن نیز فناوری VoiceOver دارد كه نام آهنگ، خواننده و آلبوم را به 20 زبان مختلف به کاربر اعلام می‌کند. این قابلیت در نسل چهارم&amp;nbsp; از 25 زبان پشتیبانی می‌کند و کلید فیزیکی هم دارد.&lt;br&gt;&lt;br&gt;Born to be worn.&lt;br&gt;&lt;br&gt;Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;br&gt;&lt;br&gt;Random meets rhythm.&lt;br&gt;&lt;br&gt;With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;br&gt;Everything is easy.&lt;br&gt;&lt;br&gt;Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;br&gt;&lt;/p&gt;', '', 'آی پاد شافل', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel''s latest, most powerful innovation yet: Intel® Centrino® 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you''re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it''s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don’t lose inches and pounds overnight. It’s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', 'MacBook Air', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(449, 42, 1, 30, 1, '66000.0000', '0000-00-00', '0000-00-00'),
(448, 42, 1, 20, 1, '77000.0000', '0000-00-00', '0000-00-00'),
(447, 42, 1, 10, 1, '88000.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2403, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2391, 47, 'catalog/demo/hp_2.jpg', 0),
(2421, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2355, 41, 'catalog/demo/imac_3.jpg', 0),
(2371, 40, 'catalog/demo/iphone_4.jpg', 0),
(2385, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2384, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2363, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2362, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2381, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(2380, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2379, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2413, 43, 'catalog/demo/macbook_3.jpg', 0),
(2412, 43, 'catalog/demo/macbook_2.jpg', 0),
(2419, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(2418, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(2416, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(2415, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(2424, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(2425, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(2389, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2388, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(2366, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(2365, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(2370, 40, 'catalog/demo/iphone_3.jpg', 0),
(2369, 40, 'catalog/demo/iphone_5.jpg', 0),
(2402, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2390, 47, 'catalog/demo/hp_3.jpg', 0),
(2420, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2354, 41, 'catalog/demo/imac_2.jpg', 0),
(2368, 40, 'catalog/demo/iphone_2.jpg', 0),
(2367, 40, 'catalog/demo/iphone_6.jpg', 0),
(2364, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(2383, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(2382, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2361, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2360, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2378, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(2377, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2376, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2411, 43, 'catalog/demo/macbook_4.jpg', 0),
(2410, 43, 'catalog/demo/macbook_5.jpg', 0),
(2417, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(2414, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(2422, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(2423, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(2387, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(2386, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(2409, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2408, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2407, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2406, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2405, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2404, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2429, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2428, 42, 'catalog/demo/hp_1.jpg', 0),
(2427, 42, 'catalog/demo/canon_logo.jpg', 0),
(2426, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2430, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(222, 42, 7, '', 1),
(219, 42, 8, '1394-04-19', 1),
(208, 42, 4, 'تست', 1),
(226, 30, 5, '', 1),
(218, 42, 1, '', 1),
(209, 42, 6, '', 1),
(217, 42, 5, '', 1),
(223, 42, 2, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '1393-01-94  00:29:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(7, 218, 42, 1, 43, 300, 1, '30000.0000', '+', 3, '+', '30.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20000.0000', '+', 2, '-', '20.00000000', '+'),
(3, 217, 42, 5, 40, 300, 0, '300.0000', '+', 0, '+', '3.00000000', '+'),
(2, 217, 42, 5, 42, 200, 1, '200.0000', '+', 0, '+', '2.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '400.0000', '+', 0, '+', '4.00000000', '+'),
(1, 217, 42, 5, 41, 100, 0, '100.0000', '+', 0, '+', '1.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(15, 226, 30, 5, 39, 2, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(16, 226, 30, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '100.0000', '+', 0, '+', '10.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '300.0000', '+', 0, '+', '30.00000000', '+'),
(9, 223, 42, 2, 24, 194, 1, '200.0000', '+', 0, '+', '20.00000000', '+'),
(11, 223, 42, 2, 45, 3998, 1, '400.0000', '+', 0, '+', '40.00000000', '+'),
(5, 218, 42, 1, 32, 96, 1, '10000.0000', '+', 1, '+', '10.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(555, 42, 1, 100),
(546, 47, 1, 300),
(554, 28, 1, 400),
(551, 43, 1, 600),
(549, 30, 1, 200),
(553, 44, 1, 700),
(552, 45, 1, 800),
(550, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(444, 42, 1, 1, '1520000.0000', '0000-00-00', '0000-00-00'),
(443, 30, 1, 2, '90000.0000', '0000-00-00', '0000-00-00'),
(442, 30, 1, 1, '80000.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(41, 0, 0),
(34, 0, 0),
(48, 0, 0),
(40, 0, 0),
(36, 0, 0),
(32, 0, 0),
(46, 0, 0),
(47, 0, 0),
(42, 0, 0),
(30, 0, 0),
(49, 0, 0),
(33, 0, 0),
(43, 0, 0),
(45, 0, 0),
(44, 0, 0),
(28, 0, 0),
(31, 0, 0),
(35, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 2, 'برگردانده شد'),
(2, 2, 'اعتبار صادر شد'),
(3, 2, 'جایگزین ارسال شد'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 1, 'Refunded');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(2, 2, 'دریافت کالای اشتباه'),
(3, 2, 'اشتباه در سفارش'),
(4, 2, 'معیوب، جزئیات را بیان نمایید'),
(5, 2, 'سایر، جزئیات را بیان نمایید'),
(3, 1, 'Order Error'),
(2, 1, 'Received Wrong Item'),
(5, 1, 'Other, please supply details'),
(4, 1, 'Faulty, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 2, 'در حال بررسی'),
(3, 2, 'کامل شده'),
(2, 2, 'در انتظار کالا'),
(3, 1, 'Complete'),
(1, 1, 'Pending'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(654, 0, 'total', 'total_sort_order', '8', 0),
(653, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(1265, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(1139, 0, 'flat', 'flat_sort_order', '1', 0),
(1138, 0, 'flat', 'flat_status', '1', 0),
(1137, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(1136, 0, 'flat', 'flat_tax_class_id', '0', 0),
(1135, 0, 'flat', 'flat_cost', '10000', 0),
(650, 0, 'credit', 'credit_sort_order', '6', 0),
(649, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(1356, 0, 'config', 'config_ftp_password', '', 0),
(1357, 0, 'config', 'config_ftp_root', '', 0),
(1358, 0, 'config', 'config_ftp_status', '0', 0),
(1359, 0, 'config', 'config_mail_protocol', 'mail', 0),
(1360, 0, 'config', 'config_mail_parameter', '', 0),
(1361, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(1362, 0, 'config', 'config_mail_smtp_username', '', 0),
(1363, 0, 'config', 'config_mail_smtp_password', '', 0),
(1364, 0, 'config', 'config_mail_smtp_port', '25', 0),
(1365, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(1366, 0, 'config', 'config_mail_alert', '', 0),
(1367, 0, 'config', 'config_secure', '0', 0),
(1368, 0, 'config', 'config_shared', '0', 0),
(1369, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(652, 0, 'voucher', 'voucher_sort_order', '7', 0),
(651, 0, 'voucher', 'voucher_status', '1', 0),
(1264, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(1263, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(1355, 0, 'config', 'config_ftp_username', '', 0),
(1354, 0, 'config', 'config_ftp_port', '21', 0),
(1353, 0, 'config', 'config_ftp_hostname', '127.0.0.1', 0),
(1352, 0, 'config', 'config_image_location_height', '50', 0),
(1351, 0, 'config', 'config_image_location_width', '268', 0),
(1350, 0, 'config', 'config_image_cart_height', '47', 0),
(1349, 0, 'config', 'config_image_cart_width', '47', 0),
(1348, 0, 'config', 'config_image_wishlist_height', '47', 0),
(1347, 0, 'config', 'config_image_wishlist_width', '47', 0),
(1346, 0, 'config', 'config_image_compare_height', '90', 0),
(1345, 0, 'config', 'config_image_compare_width', '90', 0),
(1344, 0, 'config', 'config_image_related_height', '200', 0),
(1343, 0, 'config', 'config_image_related_width', '200', 0),
(1342, 0, 'config', 'config_image_additional_height', '74', 0),
(1341, 0, 'config', 'config_image_additional_width', '74', 0),
(1340, 0, 'config', 'config_image_product_height', '228', 0),
(1339, 0, 'config', 'config_image_product_width', '228', 0),
(1338, 0, 'config', 'config_image_popup_height', '500', 0),
(1337, 0, 'config', 'config_image_popup_width', '500', 0),
(1336, 0, 'config', 'config_image_thumb_height', '228', 0),
(1335, 0, 'config', 'config_image_thumb_width', '228', 0),
(1334, 0, 'config', 'config_image_category_height', '80', 0),
(1333, 0, 'config', 'config_image_category_width', '80', 0),
(1332, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(1331, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(1330, 0, 'config', 'config_return_status_id', '2', 0),
(1329, 0, 'config', 'config_return_id', '0', 0),
(1328, 0, 'config', 'config_affiliate_mail', '0', 0),
(1327, 0, 'config', 'config_affiliate_id', '4', 0),
(1326, 0, 'config', 'config_affiliate_commission', '5', 0),
(1325, 0, 'config', 'config_affiliate_auto', '0', 0),
(1324, 0, 'config', 'config_affiliate_approval', '0', 0),
(1323, 0, 'config', 'config_stock_checkout', '0', 0),
(1322, 0, 'config', 'config_stock_warning', '0', 0),
(1321, 0, 'config', 'config_stock_display', '0', 0),
(1320, 0, 'config', 'config_order_mail', '0', 0),
(1319, 0, 'config', 'config_complete_status', 'a:1:{i:0;s:1:"5";}', 1),
(1318, 0, 'config', 'config_processing_status', 'a:1:{i:0;s:1:"2";}', 1),
(1317, 0, 'config', 'config_order_status_id', '1', 0),
(1316, 0, 'config', 'config_checkout_id', '5', 0),
(1315, 0, 'config', 'config_checkout_guest', '1', 0),
(1314, 0, 'config', 'config_cart_weight', '1', 0),
(1313, 0, 'config', 'config_api_id', '1', 0),
(1312, 0, 'config', 'config_invoice_prefix', 'INV-2015-00', 0),
(1311, 0, 'config', 'config_account_mail', '0', 0),
(1310, 0, 'config', 'config_account_id', '3', 0),
(1309, 0, 'config', 'config_login_attempts', '5', 0),
(1308, 0, 'config', 'config_customer_price', '0', 0),
(1307, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(1306, 0, 'config', 'config_customer_group_id', '1', 0),
(1305, 0, 'config', 'config_customer_online', '0', 0),
(1304, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1300, 0, 'config', 'config_voucher_min', '1000', 0),
(1301, 0, 'config', 'config_voucher_max', '10000', 0),
(1302, 0, 'config', 'config_tax', '1', 0),
(1303, 0, 'config', 'config_tax_default', 'shipping', 0),
(1299, 0, 'config', 'config_review_mail', '0', 0),
(1298, 0, 'config', 'config_review_guest', '1', 0),
(1297, 0, 'config', 'config_review_status', '1', 0),
(1296, 0, 'config', 'config_limit_admin', '20', 0),
(1295, 0, 'config', 'config_product_description_length', '150', 0),
(1292, 0, 'config', 'config_weight_class_id', '1', 0),
(1293, 0, 'config', 'config_product_count', '1', 0),
(1294, 0, 'config', 'config_product_limit', '15', 0),
(1291, 0, 'config', 'config_length_class_id', '1', 0),
(1290, 0, 'config', 'config_currency_auto', '0', 0),
(1289, 0, 'config', 'config_currency', 'TOM', 0),
(1288, 0, 'config', 'config_admin_language', 'fa', 0),
(1285, 0, 'config', 'config_country_id', '101', 0),
(1286, 0, 'config', 'config_zone_id', '1538', 0),
(1287, 0, 'config', 'config_language', 'fa', 0),
(1279, 0, 'config', 'config_comment', '', 0),
(1280, 0, 'config', 'config_meta_title', 'فروشگاه شما قدرت گرفته از اپن کارت فارسی', 0),
(1281, 0, 'config', 'config_meta_description', 'توضیحی مختصر در مورد فروشگاه در این بخش نوشته شود. این توضیحات در جستجوی گوگل خیلی موثر می باشد.', 0),
(1282, 0, 'config', 'config_meta_keyword', '', 0),
(1283, 0, 'config', 'config_template', 'default', 0),
(1284, 0, 'config', 'config_layout_id', '4', 0),
(1278, 0, 'config', 'config_open', '9 - 13 و 15.30- 18', 0),
(1277, 0, 'config', 'config_image', '', 0),
(1276, 0, 'config', 'config_fax', '', 0),
(1275, 0, 'config', 'config_telephone', '123456789', 0),
(1274, 0, 'config', 'config_email', 'ha.ahmadi92@gmail.com', 0),
(1273, 0, 'config', 'config_geocode', 'TEH', 0),
(1272, 0, 'config', 'config_address', 'آدرس فروشگاه در این محل درج شود. \r\n(قدرت گرفته از اپن کارت فارسی)', 0),
(1271, 0, 'config', 'config_owner', 'نام شما', 0),
(1270, 0, 'config', 'config_name', 'فروشگاه شما', 0),
(1370, 0, 'config', 'config_seo_url', '0', 0),
(1371, 0, 'config', 'config_file_max_size', '300000', 0),
(1372, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(1373, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(1374, 0, 'config', 'config_maintenance', '0', 0),
(1375, 0, 'config', 'config_password', '1', 0),
(1376, 0, 'config', 'config_encryption', '71df6dcb3532d5f1458860236001c5c6', 0),
(1377, 0, 'config', 'config_compression', '0', 0),
(1378, 0, 'config', 'config_error_display', '1', 0),
(1379, 0, 'config', 'config_error_log', '1', 0),
(1380, 0, 'config', 'config_error_filename', 'error.log', 0),
(1381, 0, 'config', 'config_google_analytics', '', 0),
(1382, 0, 'config', 'config_google_analytics_status', '0', 0),
(1383, 0, 'config', 'config_google_captcha_public', '', 0),
(1384, 0, 'config', 'config_google_captcha_secret', '', 0),
(1385, 0, 'config', 'config_google_captcha_status', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(5, 1, 'Out Of Stock'),
(7, 2, 'موجود'),
(8, 2, 'پیش سفارش'),
(5, 2, 'ناموجود'),
(6, 2, '2 تا 3 روز آینده'),
(8, 1, 'Pre-Order'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'کالاهای مشمول مالیات', 'کالاهایی که مالیات به آنها تعلق می گیرد.', '2009-01-06 23:21:53', '2015-04-09 11:34:36'),
(10, 'کالاهای دانلودی', 'قابل دانلود', '2011-09-21 22:19:39', '2015-04-09 11:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 5, '9 درصد مالیات ارزش افزوده', '9.0000', 'P', '2011-03-09 21:17:10', '2015-07-10 20:25:32'),
(87, 5, 'نرخ ثابت مالیاتی', '200.0000', 'F', '2011-09-21 21:49:23', '2015-04-09 11:33:14');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(129, 10, 86, 'payment', 1),
(132, 9, 87, 'shipping', 2),
(131, 9, 86, 'shipping', 1),
(130, 10, 87, 'store', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(890, 'product_id=48', 'آی-پاد-کلاسیک'),
(845, 'category_id=20', 'رومیزی-ها'),
(848, 'category_id=26', 'کامپیوتر'),
(847, 'category_id=27', 'مک'),
(909, 'manufacturer_id=8', 'اپل'),
(918, 'information_id=4', 'درباره-اپن-کارت-فارسی-OpenCart.ir'),
(846, 'category_id=34', 'پخش-کننده-های-صوتی'),
(863, 'category_id=36', 'ال-ای-دی'),
(854, 'category_id=46', 'مک-ها'),
(855, 'category_id=45', 'ویندوزی-ها'),
(856, 'category_id=25', 'تجهیزات-جانبی'),
(861, 'category_id=29', 'میکروفن-ها'),
(860, 'category_id=28', 'مانیتورها'),
(862, 'category_id=35', 'ال-سی-دی'),
(859, 'category_id=30', 'پرینترها'),
(858, 'category_id=31', 'اسکنرها'),
(857, 'category_id=32', 'وبکم-ها'),
(849, 'category_id=57', 'تبلت'),
(850, 'category_id=17', 'نرم-افزار'),
(851, 'category_id=24', 'تلفن-های-هوشمند'),
(844, 'category_id=33', 'camera'),
(864, 'category_id=43', 'test11'),
(865, 'category_id=44', 'test12'),
(882, 'category_id=47', 'test15'),
(883, 'category_id=48', 'test16'),
(884, 'category_id=49', 'test17'),
(869, 'category_id=50', 'test18'),
(870, 'category_id=51', 'test19'),
(871, 'category_id=52', 'test20'),
(885, 'category_id=58', 'test25'),
(872, 'category_id=53', 'test21'),
(873, 'category_id=54', 'test22'),
(874, 'category_id=55', 'test23'),
(875, 'category_id=56', 'test24'),
(876, 'category_id=38', 'test4'),
(877, 'category_id=37', 'test5'),
(878, 'category_id=39', 'test6'),
(879, 'category_id=40', 'test7'),
(880, 'category_id=41', 'test8'),
(881, 'category_id=42', 'test9'),
(899, 'product_id=30', 'کانن-EOS-5D'),
(896, 'product_id=47', ' اچ-پی-4530s'),
(906, 'product_id=28', 'اچ-تی-سی- تاچ-اچ-دی'),
(903, 'product_id=43', 'مک-بوک-450'),
(905, 'product_id=44', 'مک-بوک-ایر'),
(904, 'product_id=45', 'مک-بوک-پرو'),
(907, 'product_id=31', 'نیکون-دی-300-اس'),
(908, 'product_id=35', 'محصول-8'),
(900, 'product_id=49', 'سامسونگ-گلکسی-تب-10.1'),
(895, 'product_id=46', 'سونی-وایو'),
(891, 'product_id=40', 'آیفون -6'),
(894, 'product_id=36', 'ipod-nano'),
(893, 'product_id=32', 'آی-پاد-تاچ'),
(910, 'manufacturer_id=9', 'کانن'),
(912, 'manufacturer_id=5', 'اچ-تی-سی'),
(914, 'manufacturer_id=7', 'اچ-پی'),
(913, 'manufacturer_id=6', 'پالم'),
(911, 'manufacturer_id=10', 'سونی'),
(917, 'information_id=6', 'گزارش-تحویل'),
(916, 'information_id=3', 'حفظ-حریم-شخصی'),
(915, 'information_id=5', 'شرایط-و-قوانین'),
(853, 'category_id=18', 'لپ-تاپ-و-نوت-بوک-ها'),
(887, 'product_id=41', 'آی-مک'),
(889, 'product_id=34', 'آی-پاد-شافل'),
(919, 'product_id=42', 'سینما-30-اینچی-اپل'),
(902, 'product_id=33', 'سامسونگ-سینک-مستر-S27A950D ');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'مدیریت', 'a:2:{s:6:"access";a:182:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:13:"design/banner";i:17;s:13:"design/layout";i:18;s:14:"extension/feed";i:19;s:15:"extension/fraud";i:20;s:19:"extension/installer";i:21;s:22:"extension/modification";i:22;s:16:"extension/module";i:23;s:17:"extension/openbay";i:24;s:17:"extension/payment";i:25;s:18:"extension/shipping";i:26;s:15:"extension/total";i:27;s:16:"feed/google_base";i:28;s:19:"feed/google_sitemap";i:29;s:15:"feed/openbaypro";i:30;s:18:"fraud/fraudlabspro";i:31;s:13:"fraud/maxmind";i:32;s:20:"localisation/country";i:33;s:21:"localisation/currency";i:34;s:21:"localisation/geo_zone";i:35;s:21:"localisation/language";i:36;s:25:"localisation/length_class";i:37;s:21:"localisation/location";i:38;s:25:"localisation/order_status";i:39;s:26:"localisation/return_action";i:40;s:26:"localisation/return_reason";i:41;s:26:"localisation/return_status";i:42;s:25:"localisation/stock_status";i:43;s:22:"localisation/tax_class";i:44;s:21:"localisation/tax_rate";i:45;s:25:"localisation/weight_class";i:46;s:17:"localisation/zone";i:47;s:19:"marketing/affiliate";i:48;s:17:"marketing/contact";i:49;s:16:"marketing/coupon";i:50;s:19:"marketing/marketing";i:51;s:14:"module/account";i:52;s:16:"module/affiliate";i:53;s:20:"module/amazon_button";i:54;s:19:"module/amazon_login";i:55;s:17:"module/amazon_pay";i:56;s:13:"module/banner";i:57;s:17:"module/bestseller";i:58;s:15:"module/carousel";i:59;s:15:"module/category";i:60;s:19:"module/ebay_listing";i:61;s:15:"module/featured";i:62;s:13:"module/filter";i:63;s:22:"module/google_hangouts";i:64;s:11:"module/html";i:65;s:18:"module/information";i:66;s:13:"module/latest";i:67;s:16:"module/pp_button";i:68;s:15:"module/pp_login";i:69;s:16:"module/slideshow";i:70;s:14:"module/special";i:71;s:12:"module/store";i:72;s:14:"openbay/amazon";i:73;s:22:"openbay/amazon_listing";i:74;s:22:"openbay/amazon_product";i:75;s:16:"openbay/amazonus";i:76;s:24:"openbay/amazonus_listing";i:77;s:24:"openbay/amazonus_product";i:78;s:12:"openbay/ebay";i:79;s:20:"openbay/ebay_profile";i:80;s:21:"openbay/ebay_template";i:81;s:12:"openbay/etsy";i:82;s:20:"openbay/etsy_product";i:83;s:21:"openbay/etsy_shipping";i:84;s:17:"openbay/etsy_shop";i:85;s:23:"payment/amazon_checkout";i:86;s:24:"payment/amazon_login_pay";i:87;s:24:"payment/authorizenet_aim";i:88;s:24:"payment/authorizenet_sim";i:89;s:21:"payment/bank_transfer";i:90;s:22:"payment/bluepay_hosted";i:91;s:24:"payment/bluepay_redirect";i:92;s:14:"payment/cheque";i:93;s:11:"payment/cod";i:94;s:17:"payment/firstdata";i:95;s:24:"payment/firstdata_remote";i:96;s:21:"payment/free_checkout";i:97;s:14:"payment/g2apay";i:98;s:17:"payment/globalpay";i:99;s:24:"payment/globalpay_remote";i:100;s:22:"payment/klarna_account";i:101;s:22:"payment/klarna_invoice";i:102;s:14:"payment/liqpay";i:103;s:14:"payment/nochex";i:104;s:15:"payment/paymate";i:105;s:16:"payment/paypoint";i:106;s:13:"payment/payza";i:107;s:26:"payment/perpetual_payments";i:108;s:18:"payment/pp_express";i:109;s:18:"payment/pp_payflow";i:110;s:25:"payment/pp_payflow_iframe";i:111;s:14:"payment/pp_pro";i:112;s:21:"payment/pp_pro_iframe";i:113;s:19:"payment/pp_standard";i:114;s:14:"payment/realex";i:115;s:21:"payment/realex_remote";i:116;s:22:"payment/sagepay_direct";i:117;s:22:"payment/sagepay_server";i:118;s:18:"payment/sagepay_us";i:119;s:24:"payment/securetrading_pp";i:120;s:24:"payment/securetrading_ws";i:121;s:14:"payment/skrill";i:122;s:19:"payment/twocheckout";i:123;s:28:"payment/web_payment_software";i:124;s:16:"payment/worldpay";i:125;s:16:"report/affiliate";i:126;s:25:"report/affiliate_activity";i:127;s:22:"report/affiliate_login";i:128;s:24:"report/customer_activity";i:129;s:22:"report/customer_credit";i:130;s:21:"report/customer_login";i:131;s:22:"report/customer_online";i:132;s:21:"report/customer_order";i:133;s:22:"report/customer_reward";i:134;s:16:"report/marketing";i:135;s:24:"report/product_purchased";i:136;s:21:"report/product_viewed";i:137;s:18:"report/sale_coupon";i:138;s:17:"report/sale_order";i:139;s:18:"report/sale_return";i:140;s:20:"report/sale_shipping";i:141;s:15:"report/sale_tax";i:142;s:17:"sale/custom_field";i:143;s:13:"sale/customer";i:144;s:20:"sale/customer_ban_ip";i:145;s:19:"sale/customer_group";i:146;s:10:"sale/order";i:147;s:14:"sale/recurring";i:148;s:11:"sale/return";i:149;s:12:"sale/voucher";i:150;s:18:"sale/voucher_theme";i:151;s:15:"setting/setting";i:152;s:13:"setting/store";i:153;s:16:"shipping/auspost";i:154;s:17:"shipping/citylink";i:155;s:14:"shipping/fedex";i:156;s:13:"shipping/flat";i:157;s:13:"shipping/free";i:158;s:13:"shipping/item";i:159;s:23:"shipping/parcelforce_48";i:160;s:15:"shipping/pickup";i:161;s:19:"shipping/royal_mail";i:162;s:12:"shipping/ups";i:163;s:13:"shipping/usps";i:164;s:15:"shipping/weight";i:165;s:11:"tool/backup";i:166;s:14:"tool/error_log";i:167;s:11:"tool/upload";i:168;s:12:"total/coupon";i:169;s:12:"total/credit";i:170;s:14:"total/handling";i:171;s:16:"total/klarna_fee";i:172;s:19:"total/low_order_fee";i:173;s:12:"total/reward";i:174;s:14:"total/shipping";i:175;s:15:"total/sub_total";i:176;s:9:"total/tax";i:177;s:11:"total/total";i:178;s:13:"total/voucher";i:179;s:8:"user/api";i:180;s:9:"user/user";i:181;s:20:"user/user_permission";}s:6:"modify";a:182:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:13:"design/banner";i:17;s:13:"design/layout";i:18;s:14:"extension/feed";i:19;s:15:"extension/fraud";i:20;s:19:"extension/installer";i:21;s:22:"extension/modification";i:22;s:16:"extension/module";i:23;s:17:"extension/openbay";i:24;s:17:"extension/payment";i:25;s:18:"extension/shipping";i:26;s:15:"extension/total";i:27;s:16:"feed/google_base";i:28;s:19:"feed/google_sitemap";i:29;s:15:"feed/openbaypro";i:30;s:18:"fraud/fraudlabspro";i:31;s:13:"fraud/maxmind";i:32;s:20:"localisation/country";i:33;s:21:"localisation/currency";i:34;s:21:"localisation/geo_zone";i:35;s:21:"localisation/language";i:36;s:25:"localisation/length_class";i:37;s:21:"localisation/location";i:38;s:25:"localisation/order_status";i:39;s:26:"localisation/return_action";i:40;s:26:"localisation/return_reason";i:41;s:26:"localisation/return_status";i:42;s:25:"localisation/stock_status";i:43;s:22:"localisation/tax_class";i:44;s:21:"localisation/tax_rate";i:45;s:25:"localisation/weight_class";i:46;s:17:"localisation/zone";i:47;s:19:"marketing/affiliate";i:48;s:17:"marketing/contact";i:49;s:16:"marketing/coupon";i:50;s:19:"marketing/marketing";i:51;s:14:"module/account";i:52;s:16:"module/affiliate";i:53;s:20:"module/amazon_button";i:54;s:19:"module/amazon_login";i:55;s:17:"module/amazon_pay";i:56;s:13:"module/banner";i:57;s:17:"module/bestseller";i:58;s:15:"module/carousel";i:59;s:15:"module/category";i:60;s:19:"module/ebay_listing";i:61;s:15:"module/featured";i:62;s:13:"module/filter";i:63;s:22:"module/google_hangouts";i:64;s:11:"module/html";i:65;s:18:"module/information";i:66;s:13:"module/latest";i:67;s:16:"module/pp_button";i:68;s:15:"module/pp_login";i:69;s:16:"module/slideshow";i:70;s:14:"module/special";i:71;s:12:"module/store";i:72;s:14:"openbay/amazon";i:73;s:22:"openbay/amazon_listing";i:74;s:22:"openbay/amazon_product";i:75;s:16:"openbay/amazonus";i:76;s:24:"openbay/amazonus_listing";i:77;s:24:"openbay/amazonus_product";i:78;s:12:"openbay/ebay";i:79;s:20:"openbay/ebay_profile";i:80;s:21:"openbay/ebay_template";i:81;s:12:"openbay/etsy";i:82;s:20:"openbay/etsy_product";i:83;s:21:"openbay/etsy_shipping";i:84;s:17:"openbay/etsy_shop";i:85;s:23:"payment/amazon_checkout";i:86;s:24:"payment/amazon_login_pay";i:87;s:24:"payment/authorizenet_aim";i:88;s:24:"payment/authorizenet_sim";i:89;s:21:"payment/bank_transfer";i:90;s:22:"payment/bluepay_hosted";i:91;s:24:"payment/bluepay_redirect";i:92;s:14:"payment/cheque";i:93;s:11:"payment/cod";i:94;s:17:"payment/firstdata";i:95;s:24:"payment/firstdata_remote";i:96;s:21:"payment/free_checkout";i:97;s:14:"payment/g2apay";i:98;s:17:"payment/globalpay";i:99;s:24:"payment/globalpay_remote";i:100;s:22:"payment/klarna_account";i:101;s:22:"payment/klarna_invoice";i:102;s:14:"payment/liqpay";i:103;s:14:"payment/nochex";i:104;s:15:"payment/paymate";i:105;s:16:"payment/paypoint";i:106;s:13:"payment/payza";i:107;s:26:"payment/perpetual_payments";i:108;s:18:"payment/pp_express";i:109;s:18:"payment/pp_payflow";i:110;s:25:"payment/pp_payflow_iframe";i:111;s:14:"payment/pp_pro";i:112;s:21:"payment/pp_pro_iframe";i:113;s:19:"payment/pp_standard";i:114;s:14:"payment/realex";i:115;s:21:"payment/realex_remote";i:116;s:22:"payment/sagepay_direct";i:117;s:22:"payment/sagepay_server";i:118;s:18:"payment/sagepay_us";i:119;s:24:"payment/securetrading_pp";i:120;s:24:"payment/securetrading_ws";i:121;s:14:"payment/skrill";i:122;s:19:"payment/twocheckout";i:123;s:28:"payment/web_payment_software";i:124;s:16:"payment/worldpay";i:125;s:16:"report/affiliate";i:126;s:25:"report/affiliate_activity";i:127;s:22:"report/affiliate_login";i:128;s:24:"report/customer_activity";i:129;s:22:"report/customer_credit";i:130;s:21:"report/customer_login";i:131;s:22:"report/customer_online";i:132;s:21:"report/customer_order";i:133;s:22:"report/customer_reward";i:134;s:16:"report/marketing";i:135;s:24:"report/product_purchased";i:136;s:21:"report/product_viewed";i:137;s:18:"report/sale_coupon";i:138;s:17:"report/sale_order";i:139;s:18:"report/sale_return";i:140;s:20:"report/sale_shipping";i:141;s:15:"report/sale_tax";i:142;s:17:"sale/custom_field";i:143;s:13:"sale/customer";i:144;s:20:"sale/customer_ban_ip";i:145;s:19:"sale/customer_group";i:146;s:10:"sale/order";i:147;s:14:"sale/recurring";i:148;s:11:"sale/return";i:149;s:12:"sale/voucher";i:150;s:18:"sale/voucher_theme";i:151;s:15:"setting/setting";i:152;s:13:"setting/store";i:153;s:16:"shipping/auspost";i:154;s:17:"shipping/citylink";i:155;s:14:"shipping/fedex";i:156;s:13:"shipping/flat";i:157;s:13:"shipping/free";i:158;s:13:"shipping/item";i:159;s:23:"shipping/parcelforce_48";i:160;s:15:"shipping/pickup";i:161;s:19:"shipping/royal_mail";i:162;s:12:"shipping/ups";i:163;s:13:"shipping/usps";i:164;s:15:"shipping/weight";i:165;s:11:"tool/backup";i:166;s:14:"tool/error_log";i:167;s:11:"tool/upload";i:168;s:12:"total/coupon";i:169;s:12:"total/credit";i:170;s:14:"total/handling";i:171;s:16:"total/klarna_fee";i:172;s:19:"total/low_order_fee";i:173;s:12:"total/reward";i:174;s:14:"total/shipping";i:175;s:15:"total/sub_total";i:176;s:9:"total/tax";i:177;s:11:"total/total";i:178;s:13:"total/voucher";i:179;s:8:"user/api";i:180;s:9:"user/user";i:181;s:20:"user/user_permission";}}'),
(10, 'نمایشی - دمو', 'a:1:{s:6:"access";a:180:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:11:"common/menu";i:13;s:14:"common/profile";i:14;s:12:"common/stats";i:15;s:13:"design/banner";i:16;s:13:"design/layout";i:17;s:14:"extension/feed";i:18;s:19:"extension/installer";i:19;s:22:"extension/modification";i:20;s:16:"extension/module";i:21;s:17:"extension/openbay";i:22;s:17:"extension/payment";i:23;s:18:"extension/shipping";i:24;s:15:"extension/total";i:25;s:16:"feed/google_base";i:26;s:19:"feed/google_sitemap";i:27;s:15:"feed/openbaypro";i:28;s:18:"fraud/fraudlabspro";i:29;s:13:"fraud/maxmind";i:30;s:20:"localisation/country";i:31;s:21:"localisation/currency";i:32;s:21:"localisation/geo_zone";i:33;s:21:"localisation/language";i:34;s:25:"localisation/length_class";i:35;s:21:"localisation/location";i:36;s:25:"localisation/order_status";i:37;s:26:"localisation/return_action";i:38;s:26:"localisation/return_reason";i:39;s:26:"localisation/return_status";i:40;s:25:"localisation/stock_status";i:41;s:22:"localisation/tax_class";i:42;s:21:"localisation/tax_rate";i:43;s:25:"localisation/weight_class";i:44;s:17:"localisation/zone";i:45;s:19:"marketing/affiliate";i:46;s:17:"marketing/contact";i:47;s:16:"marketing/coupon";i:48;s:19:"marketing/marketing";i:49;s:14:"module/account";i:50;s:16:"module/affiliate";i:51;s:20:"module/amazon_button";i:52;s:19:"module/amazon_login";i:53;s:17:"module/amazon_pay";i:54;s:13:"module/banner";i:55;s:17:"module/bestseller";i:56;s:15:"module/carousel";i:57;s:15:"module/category";i:58;s:19:"module/ebay_listing";i:59;s:15:"module/featured";i:60;s:13:"module/filter";i:61;s:22:"module/google_hangouts";i:62;s:11:"module/html";i:63;s:18:"module/information";i:64;s:13:"module/latest";i:65;s:16:"module/pp_button";i:66;s:15:"module/pp_login";i:67;s:16:"module/slideshow";i:68;s:14:"module/special";i:69;s:12:"module/store";i:70;s:14:"openbay/amazon";i:71;s:22:"openbay/amazon_listing";i:72;s:22:"openbay/amazon_product";i:73;s:16:"openbay/amazonus";i:74;s:24:"openbay/amazonus_listing";i:75;s:24:"openbay/amazonus_product";i:76;s:12:"openbay/ebay";i:77;s:20:"openbay/ebay_profile";i:78;s:21:"openbay/ebay_template";i:79;s:12:"openbay/etsy";i:80;s:20:"openbay/etsy_product";i:81;s:21:"openbay/etsy_shipping";i:82;s:17:"openbay/etsy_shop";i:83;s:23:"payment/amazon_checkout";i:84;s:24:"payment/amazon_login_pay";i:85;s:24:"payment/authorizenet_aim";i:86;s:24:"payment/authorizenet_sim";i:87;s:21:"payment/bank_transfer";i:88;s:22:"payment/bluepay_hosted";i:89;s:24:"payment/bluepay_redirect";i:90;s:14:"payment/cheque";i:91;s:11:"payment/cod";i:92;s:17:"payment/firstdata";i:93;s:24:"payment/firstdata_remote";i:94;s:21:"payment/free_checkout";i:95;s:14:"payment/g2apay";i:96;s:17:"payment/globalpay";i:97;s:24:"payment/globalpay_remote";i:98;s:22:"payment/klarna_account";i:99;s:22:"payment/klarna_invoice";i:100;s:14:"payment/liqpay";i:101;s:14:"payment/nochex";i:102;s:15:"payment/paymate";i:103;s:16:"payment/paypoint";i:104;s:13:"payment/payza";i:105;s:26:"payment/perpetual_payments";i:106;s:18:"payment/pp_express";i:107;s:18:"payment/pp_payflow";i:108;s:25:"payment/pp_payflow_iframe";i:109;s:14:"payment/pp_pro";i:110;s:21:"payment/pp_pro_iframe";i:111;s:19:"payment/pp_standard";i:112;s:14:"payment/realex";i:113;s:21:"payment/realex_remote";i:114;s:22:"payment/sagepay_direct";i:115;s:22:"payment/sagepay_server";i:116;s:18:"payment/sagepay_us";i:117;s:24:"payment/securetrading_pp";i:118;s:24:"payment/securetrading_ws";i:119;s:14:"payment/skrill";i:120;s:19:"payment/twocheckout";i:121;s:28:"payment/web_payment_software";i:122;s:16:"payment/worldpay";i:123;s:16:"report/affiliate";i:124;s:25:"report/affiliate_activity";i:125;s:22:"report/affiliate_login";i:126;s:24:"report/customer_activity";i:127;s:22:"report/customer_credit";i:128;s:21:"report/customer_login";i:129;s:22:"report/customer_online";i:130;s:21:"report/customer_order";i:131;s:22:"report/customer_reward";i:132;s:16:"report/marketing";i:133;s:24:"report/product_purchased";i:134;s:21:"report/product_viewed";i:135;s:18:"report/sale_coupon";i:136;s:17:"report/sale_order";i:137;s:18:"report/sale_return";i:138;s:20:"report/sale_shipping";i:139;s:15:"report/sale_tax";i:140;s:17:"sale/custom_field";i:141;s:13:"sale/customer";i:142;s:20:"sale/customer_ban_ip";i:143;s:19:"sale/customer_group";i:144;s:10:"sale/order";i:145;s:14:"sale/recurring";i:146;s:11:"sale/return";i:147;s:12:"sale/voucher";i:148;s:18:"sale/voucher_theme";i:149;s:15:"setting/setting";i:150;s:13:"setting/store";i:151;s:16:"shipping/auspost";i:152;s:17:"shipping/citylink";i:153;s:14:"shipping/fedex";i:154;s:13:"shipping/flat";i:155;s:13:"shipping/free";i:156;s:13:"shipping/item";i:157;s:23:"shipping/parcelforce_48";i:158;s:15:"shipping/pickup";i:159;s:19:"shipping/royal_mail";i:160;s:12:"shipping/ups";i:161;s:13:"shipping/usps";i:162;s:15:"shipping/weight";i:163;s:11:"tool/backup";i:164;s:14:"tool/error_log";i:165;s:11:"tool/upload";i:166;s:12:"total/coupon";i:167;s:12:"total/credit";i:168;s:14:"total/handling";i:169;s:16:"total/klarna_fee";i:170;s:19:"total/low_order_fee";i:171;s:12:"total/reward";i:172;s:14:"total/shipping";i:173;s:15:"total/sub_total";i:174;s:9:"total/tax";i:175;s:11:"total/total";i:176;s:13:"total/voucher";i:177;s:8:"user/api";i:178;s:9:"user/user";i:179;s:20:"user/user_permission";}}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(7, 1, 'Birthday'),
(6, 2, 'کریسمس'),
(7, 2, 'تولد'),
(8, 2, 'عمومی'),
(8, 1, 'General'),
(6, 1, 'Christmas');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'کیلوگرم', 'kg'),
(2, 2, 'گرم', 'g'),
(5, 2, 'پوند', 'lb'),
(6, 2, 'انس', 'oz'),
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1538, 101, 'تهران', 'TEH', 1),
(1539, 101, 'قم ', 'QOM', 1),
(1540, 101, 'مرکزی', 'MKZ', 1),
(1541, 101, 'قزوین', 'QAZ', 1),
(1542, 101, 'گیلان', 'GIL', 1),
(1543, 101, 'اردبیل', 'ARD', 1),
(1544, 101, 'زنجان', 'ZAN', 1),
(1545, 101, 'آذربایجان شرقی', 'EAZ', 1),
(1546, 101, 'آذربایجان غربی', 'WEZ', 1),
(1547, 101, 'کردستان', 'KRD', 1),
(1548, 101, 'همدان', 'HMD', 1),
(1549, 101, 'کرمانشاه', 'KRM', 1),
(1550, 101, 'ایلام', 'ILM', 1),
(1551, 101, 'لرستان', 'LRS', 1),
(1552, 101, 'خوزستان', 'KZT', 1),
(1553, 101, 'چهارمحال و بختیاری', 'CMB', 1),
(1554, 101, 'کهگیلویه و بویر احمد', 'KBA', 1),
(1555, 101, 'بوشهر', 'BSH', 1),
(1556, 101, 'فارس', 'FAR', 1),
(1557, 101, 'هرمزگان', 'HRM', 1),
(1558, 101, 'سیستان و بلوچستان', 'SBL', 1),
(1559, 101, 'کرمان', 'KRB', 1),
(1560, 101, 'یزد', 'YZD', 1),
(1561, 101, 'اصفهان', 'EFH', 1),
(1562, 101, 'سمنان', 'SMN', 1),
(1563, 101, 'مازندران', 'MZD', 1),
(1564, 101, 'گلستان', 'GLS', 1),
(1565, 101, 'خراسان شمالی', 'NKH', 1),
(1566, 101, 'خراسان رضوی', 'RKH', 1),
(1567, 101, 'خراسان جنوبی', 'SKH', 1),
(3969, 101, 'البرز', 'ALB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(114, 101, 1538, 4, '2015-04-09 11:31:47', '0000-00-00 00:00:00'),
(113, 101, 0, 5, '2015-04-09 11:31:17', '0000-00-00 00:00:00'),
(111, 101, 0, 3, '2015-04-09 11:28:09', '0000-00-00 00:00:00');
