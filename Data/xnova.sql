-- phpMyAdmin SQL Dump
-- version 4.1.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2019 at 02:40 AM
-- Server version: 5.1.62
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `xnova`
--

-- --------------------------------------------------------

--
-- Table structure for table `uni1_aks`
--

CREATE TABLE IF NOT EXISTS `uni1_aks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `teilnehmer` varchar(50) DEFAULT NULL,
  `ankunft` int(11) DEFAULT NULL,
  `galaxy` tinyint(3) unsigned DEFAULT NULL,
  `system` smallint(5) unsigned DEFAULT NULL,
  `planet` tinyint(3) unsigned DEFAULT NULL,
  `planet_type` enum('1','3') DEFAULT NULL,
  `eingeladen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_alliance`
--

CREATE TABLE IF NOT EXISTS `uni1_alliance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ally_name` varchar(50) DEFAULT '',
  `ally_tag` varchar(20) DEFAULT '',
  `ally_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `ally_register_time` int(11) NOT NULL DEFAULT '0',
  `ally_description` text,
  `ally_web` varchar(255) DEFAULT '',
  `ally_text` text,
  `ally_image` varchar(255) DEFAULT '10.png',
  `ally_request` varchar(1000) DEFAULT NULL,
  `ally_request_waiting` varchar(500) DEFAULT NULL,
  `ally_request_notallow` enum('0','1') NOT NULL DEFAULT '0',
  `ally_owner_range` varchar(32) DEFAULT '',
  `ally_ranks` text,
  `ally_members` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_stats` enum('0','1') NOT NULL DEFAULT '1',
  `ally_diplo` enum('0','1') NOT NULL DEFAULT '1',
  `ally_universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ally_tag` (`ally_tag`),
  KEY `ally_name` (`ally_name`),
  KEY `ally_universe` (`ally_universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_banned`
--

CREATE TABLE IF NOT EXISTS `uni1_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `who` varchar(64) NOT NULL DEFAULT '',
  `theme` varchar(500) NOT NULL,
  `who2` varchar(64) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `longer` int(11) NOT NULL DEFAULT '0',
  `author` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `universe` tinyint(3) unsigned NOT NULL,
  KEY `ID` (`id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_buddy`
--

CREATE TABLE IF NOT EXISTS `uni1_buddy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `text` varchar(255) DEFAULT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_chat`
--

CREATE TABLE IF NOT EXISTS `uni1_chat` (
  `messageid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(32) NOT NULL DEFAULT '',
  `message` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `ally_id` int(11) unsigned NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `timestamp` (`timestamp`),
  KEY `ally_id` (`ally_id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_config`
--

CREATE TABLE IF NOT EXISTS `uni1_config` (
  `uni` int(11) NOT NULL AUTO_INCREMENT,
  `VERSION` varchar(8) NOT NULL,
  `users_amount` int(11) NOT NULL,
  `game_speed` bigint(20) NOT NULL,
  `fleet_speed` bigint(11) NOT NULL,
  `resource_multiplier` int(11) NOT NULL,
  `halt_speed` int(11) NOT NULL,
  `Fleet_Cdr` tinyint(3) unsigned NOT NULL,
  `Defs_Cdr` tinyint(3) unsigned NOT NULL,
  `initial_fields` int(11) unsigned NOT NULL,
  `bgm_active` tinyint(1) unsigned NOT NULL,
  `bgm_file` varchar(100) NOT NULL,
  `uni_name` varchar(30) NOT NULL,
  `game_name` varchar(30) NOT NULL,
  `game_disable` tinyint(1) unsigned NOT NULL,
  `close_reason` text NOT NULL,
  `max_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '9',
  `max_system` smallint(5) unsigned NOT NULL DEFAULT '400',
  `max_planets` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `metal_basic_income` int(11) NOT NULL,
  `crystal_basic_income` int(11) NOT NULL,
  `deuterium_basic_income` int(11) NOT NULL,
  `norio_basic_income` int(11) NOT NULL,
  `energy_basic_income` int(11) NOT NULL,
  `planet_factor` float(2,1) NOT NULL DEFAULT '1.0',
  `LastSettedGalaxyPos` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `LastSettedSystemPos` smallint(5) unsigned NOT NULL DEFAULT '1',
  `LastSettedPlanetPos` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `noobprotection` int(11) NOT NULL,
  `noobprotectiontime` int(11) NOT NULL,
  `noobprotectionmulti` int(11) NOT NULL,
  `forum_url` varchar(128) NOT NULL,
  `adm_attack` tinyint(1) unsigned NOT NULL,
  `debug` tinyint(1) unsigned NOT NULL,
  `lang` varchar(2) NOT NULL,
  `stat` int(11) NOT NULL,
  `stat_level` int(11) NOT NULL,
  `stat_last_update` int(11) NOT NULL,
  `stat_settings` int(11) NOT NULL,
  `stat_update_time` int(11) NOT NULL,
  `stat_last_db_update` int(11) NOT NULL,
  `stats_fly_lock` int(11) NOT NULL,
  `stat_last_banner_update` int(11) NOT NULL,
  `stat_banner_update_time` int(11) NOT NULL,
  `cron_lock` int(11) NOT NULL,
  `ts_modon` tinyint(1) NOT NULL,
  `ts_server` varchar(64) NOT NULL,
  `ts_tcpport` smallint(5) NOT NULL,
  `ts_udpport` smallint(5) NOT NULL,
  `ts_timeout` tinyint(1) NOT NULL,
  `ts_version` tinyint(1) NOT NULL,
  `ts_cron_last` int(11) NOT NULL,
  `ts_cron_interval` smallint(5) NOT NULL,
  `ts_login` varchar(32) NOT NULL,
  `ts_password` varchar(32) NOT NULL,
  `reg_closed` tinyint(1) NOT NULL,
  `OverviewNewsFrame` tinyint(1) NOT NULL,
  `OverviewNewsText` text NOT NULL,
  `capaktiv` tinyint(1) NOT NULL,
  `cappublic` varchar(42) NOT NULL,
  `capprivate` varchar(42) NOT NULL,
  `min_build_time` tinyint(2) NOT NULL,
  `mail_active` tinyint(1) NOT NULL,
  `mail_use` tinyint(1) NOT NULL,
  `smtp_host` varchar(64) NOT NULL,
  `smtp_port` smallint(5) NOT NULL,
  `smtp_user` varchar(64) NOT NULL,
  `smtp_pass` varchar(32) NOT NULL,
  `smtp_ssl` enum('','ssl','tls') NOT NULL,
  `smtp_sendmail` varchar(64) NOT NULL,
  `smail_path` varchar(30) NOT NULL,
  `user_valid` tinyint(1) NOT NULL,
  `metal_start` int(11) unsigned NOT NULL DEFAULT '500',
  `crystal_start` int(11) unsigned NOT NULL DEFAULT '500',
  `deuterium_start` int(11) unsigned NOT NULL DEFAULT '0',
  `norio_start` int(11) unsigned NOT NULL DEFAULT '0',
  `darkmatter_start` int(11) unsigned NOT NULL DEFAULT '0',
  `ftp_server` varchar(64) NOT NULL,
  `ftp_user_name` varchar(64) NOT NULL,
  `ftp_user_pass` varchar(32) NOT NULL,
  `ftp_root_path` varchar(128) NOT NULL,
  `fb_on` tinyint(1) NOT NULL,
  `fb_apikey` varchar(42) NOT NULL,
  `fb_skey` varchar(42) NOT NULL,
  `ga_active` varchar(42) NOT NULL,
  `ga_key` varchar(42) NOT NULL,
  `moduls` varchar(100) NOT NULL,
  `trade_allowed_ships` varchar(255) NOT NULL,
  `trade_charge` varchar(5) NOT NULL,
  PRIMARY KEY (`uni`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `uni1_config`
--

INSERT INTO `uni1_config` (`uni`, `VERSION`, `users_amount`, `game_speed`, `fleet_speed`, `resource_multiplier`, `halt_speed`, `Fleet_Cdr`, `Defs_Cdr`, `initial_fields`, `bgm_active`, `bgm_file`, `uni_name`, `game_name`, `game_disable`, `close_reason`, `max_galaxy`, `max_system`, `max_planets`, `metal_basic_income`, `crystal_basic_income`, `deuterium_basic_income`, `norio_basic_income`, `energy_basic_income`, `planet_factor`, `LastSettedGalaxyPos`, `LastSettedSystemPos`, `LastSettedPlanetPos`, `noobprotection`, `noobprotectiontime`, `noobprotectionmulti`, `forum_url`, `adm_attack`, `debug`, `lang`, `stat`, `stat_level`, `stat_last_update`, `stat_settings`, `stat_update_time`, `stat_last_db_update`, `stats_fly_lock`, `stat_last_banner_update`, `stat_banner_update_time`, `cron_lock`, `ts_modon`, `ts_server`, `ts_tcpport`, `ts_udpport`, `ts_timeout`, `ts_version`, `ts_cron_last`, `ts_cron_interval`, `ts_login`, `ts_password`, `reg_closed`, `OverviewNewsFrame`, `OverviewNewsText`, `capaktiv`, `cappublic`, `capprivate`, `min_build_time`, `mail_active`, `mail_use`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_ssl`, `smtp_sendmail`, `smail_path`, `user_valid`, `metal_start`, `crystal_start`, `deuterium_start`, `norio_start`, `darkmatter_start`, `ftp_server`, `ftp_user_name`, `ftp_user_pass`, `ftp_root_path`, `fb_on`, `fb_apikey`, `fb_skey`, `ga_active`, `ga_key`, `moduls`, `trade_allowed_ships`, `trade_charge`) VALUES
(1, '5.9', 3, 250000, 250000, 100, 100, 30, 30, 250, 0, '', 'Jotunheim', 'Galaxy Conquest', 1, 'El juego se encuentra actualmente cerrado.', 9, 400, 20, 70, 45, 0, 0, 0, 1.0, 1, 1, 2, 0, 5000, 5, 'http://xnovarev.com/', 1, 0, 'de', 0, 2, 1558250588, 1000, 25, 1558224590, 0, 1288860107, 1440, 0, 0, '127.0.0.1', 8767, 32767, 1, 2, 0, 0, '', '', 0, 1, 'Erweiterte Version des Strategie Browser Game X-Nova Redesigned mit deutschem Support.', 0, '', '', 1, 0, 0, '0', 0, '0', '0', '', '0', '/usr/sbin/sendmail', 0, 500, 500, 0, 0, 0, '0', '0', '0', '0', 0, '', '', '0', '', '1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1', '202,208,206,207', '0.3');

-- --------------------------------------------------------

--
-- Table structure for table `uni1_diplo`
--

CREATE TABLE IF NOT EXISTS `uni1_diplo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_1` int(11) unsigned NOT NULL,
  `owner_2` int(11) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `accept` tinyint(1) unsigned NOT NULL,
  `accept_text` varchar(255) NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_1` (`owner_1`,`owner_2`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_fleets`
--

CREATE TABLE IF NOT EXISTS `uni1_fleets` (
  `fleet_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `fleet_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_mission` enum('1','2','3','4','5','6','7','8','9','10','11','15') NOT NULL DEFAULT '3',
  `fleet_amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fleet_array` text,
  `fleet_universe` tinyint(3) unsigned NOT NULL,
  `fleet_start_time` int(11) NOT NULL DEFAULT '0',
  `fleet_start_id` int(11) unsigned NOT NULL,
  `fleet_start_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_start_system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fleet_start_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_start_type` enum('1','2','3') NOT NULL DEFAULT '1',
  `fleet_end_time` int(11) NOT NULL DEFAULT '0',
  `fleet_end_stay` int(11) NOT NULL DEFAULT '0',
  `fleet_end_id` int(11) unsigned NOT NULL,
  `fleet_end_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_end_system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fleet_end_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_end_type` enum('1','2','3') NOT NULL DEFAULT '1',
  `fleet_target_obj` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_metal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_crystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_deuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_darkmatter` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_norio` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_target_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_group` varchar(15) NOT NULL DEFAULT '0',
  `fleet_mess` enum('0','1','2') NOT NULL DEFAULT '0',
  `start_time` int(11) DEFAULT NULL,
  `fleet_busy` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`fleet_id`),
  KEY `fleet_mess` (`fleet_mess`),
  KEY `fleet_target_owner` (`fleet_target_owner`),
  KEY `fleet_end_stay` (`fleet_end_stay`),
  KEY `fleet_end_time` (`fleet_end_time`),
  KEY `fleet_start_time` (`fleet_start_time`),
  KEY `fleet_start_id` (`fleet_start_id`),
  KEY `fleet_end_id` (`fleet_end_id`),
  KEY `fleet_universe` (`fleet_universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_fleettrades`
--

CREATE TABLE IF NOT EXISTS `uni1_fleettrades` (
  `fleettrade_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `trader_id` int(11) unsigned NOT NULL DEFAULT '0',
  `planet_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fleettrade_date` int(11) unsigned NOT NULL DEFAULT '0',
  `ship_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ship_ammount` int(11) unsigned NOT NULL DEFAULT '0',
  `metal_total` double(50,0) unsigned NOT NULL DEFAULT '0',
  `crystal_total` double(50,0) unsigned NOT NULL DEFAULT '0',
  `deuterium_total` double(50,0) unsigned NOT NULL DEFAULT '0',
  `norio_total` double(50,0) unsigned NOT NULL DEFAULT '0',
  `darkmatter_total` double(50,0) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fleettrade_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_messages`
--

CREATE TABLE IF NOT EXISTS `uni1_messages` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `message_sender` int(11) unsigned NOT NULL DEFAULT '0',
  `message_time` int(11) NOT NULL DEFAULT '0',
  `message_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `message_from` varchar(32) DEFAULT NULL,
  `message_subject` varchar(32) DEFAULT NULL,
  `message_text` text,
  `message_unread` enum('0','1') NOT NULL DEFAULT '1',
  `message_universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `message_owner` (`message_owner`),
  KEY `message_type` (`message_type`),
  KEY `message_sender` (`message_sender`),
  KEY `message_unread` (`message_unread`),
  KEY `message_universe` (`message_universe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `uni1_messages`
--

INSERT INTO `uni1_messages` (`message_id`, `message_owner`, `message_sender`, `message_time`, `message_type`, `message_from`, `message_subject`, `message_text`, `message_unread`, `message_universe`) VALUES
(1, 1, 1, 1558135337, 1, 'Administrator', 'Willkommenen', 'Willkommen beim xNova Revolution!<br>Baue zuerst ein Solarkraftwerk, denn Energie wird für die spätere Rohstoffproduktion benötigt. Um diese zu bauen, klicke links im Menu auf "Gebäude". Danach baue das 4. Gebäude von oben. Da du nun Energie hast, kannst du anfangen Minen zu bauen. Gehe dazu wieder im Menü auf Gebäude und baue eine Metallmine, danach wieder eine Kristallmine. Um Schiffe bauen zu können musst du zuerst eine Raumschiffswerft gebaut haben. Was dafür benötigt wird findest du links im Menüpunkt Technologie. Das Team wünscht dir viel Spaß beim Erkunden des Universums!', '1', 1),
(2, 2, 1, 1558155414, 1, 'Administrator', 'Willkommenen', 'Willkommen beim Galaxy Conquest!<br>Baue zuerst ein Solarkraftwerk, denn Energie wird für die spätere Rohstoffproduktion benötigt. Um diese zu bauen, klicke links im Menu auf "Gebäude". Danach baue das 4. Gebäude von oben. Da du nun Energie hast, kannst du anfangen Minen zu bauen. Gehe dazu wieder im Menü auf Gebäude und baue eine Metallmine, danach wieder eine Kristallmine. Um Schiffe bauen zu können musst du zuerst eine Raumschiffswerft gebaut haben. Was dafür benötigt wird findest du links im Menüpunkt Technologie. Das Team wünscht dir viel Spaß beim Erkunden des Universums!', '1', 1),
(3, 3, 1, 1558156487, 1, 'Administrator', 'Willkommenen', 'Willkommen beim Galaxy Conquest!<br>Baue zuerst ein Solarkraftwerk, denn Energie wird für die spätere Rohstoffproduktion benötigt. Um diese zu bauen, klicke links im Menu auf "Gebäude". Danach baue das 4. Gebäude von oben. Da du nun Energie hast, kannst du anfangen Minen zu bauen. Gehe dazu wieder im Menü auf Gebäude und baue eine Metallmine, danach wieder eine Kristallmine. Um Schiffe bauen zu können musst du zuerst eine Raumschiffswerft gebaut haben. Was dafür benötigt wird findest du links im Menüpunkt Technologie. Das Team wünscht dir viel Spaß beim Erkunden des Universums!', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uni1_news`
--

CREATE TABLE IF NOT EXISTS `uni1_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(64) NOT NULL,
  `date` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_notes`
--

CREATE TABLE IF NOT EXISTS `uni1_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `priority` enum('0','1','2') DEFAULT '1',
  `title` varchar(32) DEFAULT NULL,
  `text` text,
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_planets`
--

CREATE TABLE IF NOT EXISTS `uni1_planets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT 'Capital',
  `id_owner` int(11) unsigned DEFAULT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  `galaxy` tinyint(3) NOT NULL DEFAULT '0',
  `system` smallint(5) NOT NULL DEFAULT '0',
  `planet` tinyint(3) NOT NULL DEFAULT '0',
  `last_update` int(11) DEFAULT NULL,
  `planet_type` enum('1','3') NOT NULL DEFAULT '1',
  `destruyed` int(11) NOT NULL DEFAULT '0',
  `b_building` int(11) NOT NULL DEFAULT '0',
  `b_building_id` text NOT NULL,
  `b_hangar` int(11) NOT NULL DEFAULT '0',
  `b_hangar_id` text NOT NULL,
  `b_hangar_plus` int(11) NOT NULL DEFAULT '0',
  `image` varchar(32) NOT NULL DEFAULT 'dschjungelplanet05',
  `diameter` int(11) unsigned NOT NULL DEFAULT '12800',
  `field_current` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field_max` smallint(5) unsigned NOT NULL DEFAULT '163',
  `temp_min` int(3) NOT NULL DEFAULT '-17',
  `temp_max` int(3) NOT NULL DEFAULT '23',
  `metal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `metal_perhour` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `metal_max` bigint(20) unsigned DEFAULT '100000',
  `crystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `crystal_perhour` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `crystal_max` bigint(20) unsigned DEFAULT '100000',
  `deuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `deuterium_used` int(11) unsigned NOT NULL DEFAULT '0',
  `deuterium_perhour` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `deuterium_max` bigint(20) unsigned DEFAULT '100000',
  `norio` double(50,0) unsigned NOT NULL DEFAULT '0',
  `norio_perhour` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `norio_max` bigint(20) unsigned DEFAULT '100000',
  `energy_used` bigint(11) NOT NULL DEFAULT '0',
  `energy_max` bigint(20) unsigned NOT NULL DEFAULT '0',
  `metal_mine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_mine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_sintetizer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `solar_plant` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fusion_plant` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `robot_factory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nano_factory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hangar` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metal_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `norio_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `laboratory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `terraformer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `university` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `norio_mine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_deposit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `silo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mondbasis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `phalanx` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sprungtor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `small_ship_cargo` bigint(20) unsigned NOT NULL DEFAULT '0',
  `big_ship_cargo` bigint(20) unsigned NOT NULL DEFAULT '0',
  `light_hunter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `heavy_hunter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `crusher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `battle_ship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `colonizer` bigint(20) unsigned NOT NULL DEFAULT '0',
  `recycler` bigint(20) unsigned NOT NULL DEFAULT '0',
  `spy_sonde` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bomber_ship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `solar_satelit` bigint(20) unsigned NOT NULL DEFAULT '0',
  `destructor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dearth_star` bigint(20) unsigned NOT NULL DEFAULT '0',
  `battleship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lune_noir` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ev_transporter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `star_crasher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `giga_recykler` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dm_ship` bigint(20) NOT NULL DEFAULT '0',
  `orbital_station` bigint(20) unsigned NOT NULL DEFAULT '0',
  `misil_launcher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `small_laser` bigint(20) unsigned NOT NULL DEFAULT '0',
  `big_laser` bigint(20) unsigned NOT NULL DEFAULT '0',
  `gauss_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ionic_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `buster_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `small_protection_shield` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `planet_protector` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `big_protection_shield` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `graviton_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `interceptor_misil` int(11) unsigned NOT NULL DEFAULT '0',
  `interplanetary_misil` int(11) unsigned NOT NULL DEFAULT '0',
  `metal_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `crystal_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `deuterium_sintetizer_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `norio_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `solar_plant_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `fusion_plant_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `solar_satelit_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `last_jump_time` int(11) NOT NULL DEFAULT '0',
  `der_metal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `der_crystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `der_norio` double(50,0) unsigned NOT NULL DEFAULT '0',
  `id_luna` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_luna` (`id_luna`),
  KEY `galaxy` (`galaxy`,`system`,`planet`,`planet_type`),
  KEY `id_owner` (`id_owner`),
  KEY `destruyed` (`destruyed`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `uni1_planets`
--

INSERT INTO `uni1_planets` (`id`, `name`, `id_owner`, `universe`, `galaxy`, `system`, `planet`, `last_update`, `planet_type`, `destruyed`, `b_building`, `b_building_id`, `b_hangar`, `b_hangar_id`, `b_hangar_plus`, `image`, `diameter`, `field_current`, `field_max`, `temp_min`, `temp_max`, `metal`, `metal_perhour`, `metal_max`, `crystal`, `crystal_perhour`, `crystal_max`, `deuterium`, `deuterium_used`, `deuterium_perhour`, `deuterium_max`, `norio`, `norio_perhour`, `norio_max`, `energy_used`, `energy_max`, `metal_mine`, `crystal_mine`, `deuterium_sintetizer`, `solar_plant`, `fusion_plant`, `robot_factory`, `nano_factory`, `hangar`, `metal_store`, `crystal_store`, `deuterium_store`, `norio_store`, `laboratory`, `terraformer`, `university`, `norio_mine`, `ally_deposit`, `silo`, `mondbasis`, `phalanx`, `sprungtor`, `small_ship_cargo`, `big_ship_cargo`, `light_hunter`, `heavy_hunter`, `crusher`, `battle_ship`, `colonizer`, `recycler`, `spy_sonde`, `bomber_ship`, `solar_satelit`, `destructor`, `dearth_star`, `battleship`, `lune_noir`, `ev_transporter`, `star_crasher`, `giga_recykler`, `dm_ship`, `orbital_station`, `misil_launcher`, `small_laser`, `big_laser`, `gauss_canyon`, `ionic_canyon`, `buster_canyon`, `small_protection_shield`, `planet_protector`, `big_protection_shield`, `graviton_canyon`, `interceptor_misil`, `interplanetary_misil`, `metal_mine_porcent`, `crystal_mine_porcent`, `deuterium_sintetizer_porcent`, `norio_mine_porcent`, `solar_plant_porcent`, `fusion_plant_porcent`, `solar_satelit_porcent`, `last_jump_time`, `der_metal`, `der_crystal`, `der_norio`, `id_luna`) VALUES
(1, 'Valkyria', 1, 1, 1, 1, 8, 1558250850, '1', 0, 1558250857, 'a:1:{i:0;a:5:{i:0;i:4;i:1;i:11;i:2;d:11;i:3;d:1558250857;i:4;s:5:"build";}}', 1, 'a:1:{i:0;a:2:{i:0;i:204;i:1;d:19;}}', 0, 'dschjungelplanet01', 13038, 70, 250, 11, 51, 194253, '56591', 15300000, 229817, '37727', 15300000, 212356, 0, '22221', 8400000, 176991, '17538', 1200000, -91521, 107932, 15, 15, 15, 20, 0, 10, 0, 10, 10, 10, 10, 10, 10, 0, 0, 10, 0, 0, 0, 0, 0, 100, 0, 200, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '10', '10', '10', '10', '10', '10', '10', 0, 0, 0, 0, 0),
(2, 'Terroxa', 2, 1, 1, 1, 5, 1558155450, '1', 0, 0, '', 0, '', 0, 'dschjungelplanet10', 12529, 4, 250, 69, 109, 117, '2033', 600000, 371, '1355', 600000, 3, 0, '719', 600000, 0, '0', 600000, -5500, 4400, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '10', '10', '10', '10', '10', '10', '10', 0, 0, 0, 0, 0),
(3, 'SYRIUZ', 3, 1, 1, 1, 11, 1558157059, '1', 0, 0, '', 0, '', 0, 'normaltempplanet07', 13000, 11, 250, 15, 55, 225, '7986', 600000, 533, '8785', 600000, 63, 0, '3114', 600000, 0, '0', 600000, -13676, 15972, 2, 3, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '10', '10', '10', '10', '10', '10', '10', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uni1_rw`
--

CREATE TABLE IF NOT EXISTS `uni1_rw` (
  `owners` varchar(255) NOT NULL,
  `rid` varchar(32) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_session`
--

CREATE TABLE IF NOT EXISTS `uni1_session` (
  `sess_id` varchar(32) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `user_ua` varchar(100) NOT NULL,
  `user_ip` varchar(40) NOT NULL,
  `user_side` varchar(50) NOT NULL,
  `user_method` varchar(4) NOT NULL,
  `user_lastactivity` int(11) NOT NULL,
  PRIMARY KEY (`sess_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`,`user_lastactivity`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_statpoints`
--

CREATE TABLE IF NOT EXISTS `uni1_statpoints` (
  `id_owner` int(11) unsigned NOT NULL,
  `id_ally` int(11) unsigned NOT NULL,
  `stat_type` tinyint(1) unsigned NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  `tech_rank` int(11) unsigned NOT NULL,
  `tech_old_rank` int(11) unsigned NOT NULL,
  `tech_points` bigint(20) unsigned NOT NULL,
  `tech_count` int(11) unsigned NOT NULL,
  `build_rank` int(11) unsigned NOT NULL,
  `build_old_rank` int(11) unsigned NOT NULL,
  `build_points` bigint(20) unsigned NOT NULL,
  `build_count` int(11) unsigned NOT NULL,
  `defs_rank` int(11) unsigned NOT NULL,
  `defs_old_rank` int(11) unsigned NOT NULL,
  `defs_points` bigint(20) unsigned NOT NULL,
  `defs_count` int(11) unsigned NOT NULL,
  `fleet_rank` int(11) unsigned NOT NULL,
  `fleet_old_rank` int(11) unsigned NOT NULL,
  `fleet_points` bigint(20) unsigned NOT NULL,
  `fleet_count` int(11) unsigned NOT NULL,
  `total_rank` int(11) unsigned NOT NULL,
  `total_old_rank` int(11) unsigned NOT NULL,
  `total_points` bigint(20) unsigned NOT NULL,
  `total_count` int(11) unsigned NOT NULL,
  KEY `stat_type` (`stat_type`),
  KEY `id_owner` (`id_owner`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uni1_statpoints`
--

INSERT INTO `uni1_statpoints` (`id_owner`, `id_ally`, `stat_type`, `universe`, `tech_rank`, `tech_old_rank`, `tech_points`, `tech_count`, `build_rank`, `build_old_rank`, `build_points`, `build_count`, `defs_rank`, `defs_old_rank`, `defs_points`, `defs_count`, `fleet_rank`, `fleet_old_rank`, `fleet_points`, `fleet_count`, `total_rank`, `total_old_rank`, `total_points`, `total_count`) VALUES
(1, 0, 1, 1, 1, 1, 55, 11, 1, 1, 479, 57, 1, 1, 78, 39, 1, 1, 300, 41, 1, 1, 912, 148),
(2, 0, 1, 1, 2, 2, 0, 0, 3, 3, 1, 4, 2, 2, 0, 0, 2, 2, 0, 0, 3, 3, 1, 4),
(3, 0, 1, 1, 3, 3, 0, 0, 2, 2, 4, 11, 3, 3, 0, 0, 3, 3, 0, 0, 2, 2, 4, 11);

-- --------------------------------------------------------

--
-- Table structure for table `uni1_supp`
--

CREATE TABLE IF NOT EXISTS `uni1_supp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) unsigned NOT NULL,
  `time` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `player_id` (`player_id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_topkb`
--

CREATE TABLE IF NOT EXISTS `uni1_topkb` (
  `id_owner1` int(11) unsigned NOT NULL,
  `angreifer` varchar(64) NOT NULL DEFAULT '',
  `id_owner2` int(11) unsigned NOT NULL,
  `defender` varchar(64) NOT NULL DEFAULT '',
  `gesamtunits` bigint(20) unsigned NOT NULL,
  `rid` varchar(32) NOT NULL,
  `fleetresult` enum('r','a','w') NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `gesamtunits` (`gesamtunits`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uni1_users`
--

CREATE TABLE IF NOT EXISTS `uni1_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `email_2` varchar(64) NOT NULL DEFAULT '',
  `lang` varchar(2) NOT NULL DEFAULT 'es',
  `authlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `authattack` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `rights` text NOT NULL,
  `id_planet` int(11) unsigned NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL,
  `galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `darkmatter` int(11) NOT NULL DEFAULT '0',
  `user_lastip` varchar(40) NOT NULL DEFAULT '',
  `ip_at_reg` varchar(40) NOT NULL DEFAULT '',
  `register_time` int(11) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `dpath` varchar(255) NOT NULL DEFAULT 'gow',
  `design` tinyint(4) NOT NULL DEFAULT '1',
  `noipcheck` tinyint(4) NOT NULL DEFAULT '1',
  `planet_sort` tinyint(1) NOT NULL DEFAULT '0',
  `planet_sort_order` tinyint(1) NOT NULL DEFAULT '0',
  `spio_anz` tinyint(2) NOT NULL DEFAULT '1',
  `settings_tooltiptime` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `settings_fleetactions` tinyint(2) unsigned NOT NULL DEFAULT '3',
  `settings_planetmenu` enum('0','1') NOT NULL DEFAULT '1',
  `settings_esp` enum('0','1') NOT NULL DEFAULT '1',
  `settings_wri` enum('0','1') NOT NULL DEFAULT '1',
  `settings_bud` enum('0','1') NOT NULL DEFAULT '1',
  `settings_mis` enum('0','1') NOT NULL DEFAULT '1',
  `settings_rep` enum('0','1') NOT NULL DEFAULT '0',
  `settings_tnstor` enum('0','1') NOT NULL DEFAULT '1',
  `settings_gview` enum('0','1') NOT NULL DEFAULT '1',
  `urlaubs_modus` enum('0','1') NOT NULL DEFAULT '0',
  `urlaubs_until` int(11) NOT NULL DEFAULT '0',
  `db_deaktjava` int(11) NOT NULL DEFAULT '0',
  `new_message` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `new_gmessage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_shortcut` text,
  `b_tech_planet` int(11) unsigned NOT NULL DEFAULT '0',
  `b_tech` int(11) unsigned NOT NULL DEFAULT '0',
  `b_tech_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `b_tech_queue` text NOT NULL,
  `spy_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `computer_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `military_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `defence_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shield_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `energy_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hyperspace_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combustion_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `impulse_motor_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hyperspace_motor_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `laser_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ionic_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `buster_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `intergalactic_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expedition_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metal_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `norio_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `darkmatter_moon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `graviton_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ally_name` varchar(32) DEFAULT '',
  `ally_request` int(11) NOT NULL DEFAULT '0',
  `ally_request_text` text,
  `ally_register_time` int(11) NOT NULL DEFAULT '0',
  `ally_rank_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bana` enum('0','1') DEFAULT '0',
  `banaday` int(11) NOT NULL DEFAULT '0',
  `hof` enum('0','1') NOT NULL DEFAULT '1',
  `wons` int(11) unsigned NOT NULL DEFAULT '0',
  `raza` varchar(2) NOT NULL,
  `commander` varchar(11) NOT NULL DEFAULT '0',
  `commander_time` varchar(11) NOT NULL DEFAULT '0',
  `admiral` varchar(11) NOT NULL DEFAULT '0',
  `admiral_time` varchar(11) NOT NULL DEFAULT '0',
  `technocratic` varchar(11) NOT NULL DEFAULT '0',
  `technocratic_time` varchar(11) NOT NULL DEFAULT '0',
  `engineer` varchar(11) NOT NULL DEFAULT '0',
  `engineer_time` varchar(11) NOT NULL DEFAULT '0',
  `geologe` varchar(11) NOT NULL DEFAULT '0',
  `geologe_time` varchar(11) NOT NULL DEFAULT '0',
  `loos` int(11) unsigned NOT NULL DEFAULT '0',
  `draws` int(11) unsigned NOT NULL DEFAULT '0',
  `kbmetal` bigint(20) unsigned NOT NULL DEFAULT '0',
  `kbcrystal` bigint(20) unsigned NOT NULL DEFAULT '0',
  `kbnorio` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lostunits` bigint(20) unsigned NOT NULL DEFAULT '0',
  `desunits` bigint(20) unsigned NOT NULL DEFAULT '0',
  `uctime` int(11) NOT NULL DEFAULT '0',
  `setmail` int(11) NOT NULL DEFAULT '0',
  `fb_id` bigint(15) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fb_id` (`fb_id`),
  KEY `authlevel` (`authlevel`),
  KEY `onlinetime` (`onlinetime`),
  KEY `username` (`username`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `uni1_users`
--

INSERT INTO `uni1_users` (`id`, `username`, `password`, `email`, `email_2`, `lang`, `authlevel`, `authattack`, `rights`, `id_planet`, `universe`, `galaxy`, `system`, `planet`, `darkmatter`, `user_lastip`, `ip_at_reg`, `register_time`, `onlinetime`, `dpath`, `design`, `noipcheck`, `planet_sort`, `planet_sort_order`, `spio_anz`, `settings_tooltiptime`, `settings_fleetactions`, `settings_planetmenu`, `settings_esp`, `settings_wri`, `settings_bud`, `settings_mis`, `settings_rep`, `settings_tnstor`, `settings_gview`, `urlaubs_modus`, `urlaubs_until`, `db_deaktjava`, `new_message`, `new_gmessage`, `fleet_shortcut`, `b_tech_planet`, `b_tech`, `b_tech_id`, `b_tech_queue`, `spy_tech`, `computer_tech`, `military_tech`, `defence_tech`, `shield_tech`, `energy_tech`, `hyperspace_tech`, `combustion_tech`, `impulse_motor_tech`, `hyperspace_motor_tech`, `laser_tech`, `ionic_tech`, `buster_tech`, `intergalactic_tech`, `expedition_tech`, `metal_proc_tech`, `crystal_proc_tech`, `deuterium_proc_tech`, `norio_proc_tech`, `darkmatter_moon`, `graviton_tech`, `ally_id`, `ally_name`, `ally_request`, `ally_request_text`, `ally_register_time`, `ally_rank_id`, `bana`, `banaday`, `hof`, `wons`, `raza`, `commander`, `commander_time`, `admiral`, `admiral_time`, `technocratic`, `technocratic_time`, `engineer`, `engineer_time`, `geologe`, `geologe_time`, `loos`, `draws`, `kbmetal`, `kbcrystal`, `kbnorio`, `lostunits`, `desunits`, `uctime`, `setmail`, `fb_id`) VALUES
(1, 'YggDraz1l', '43d5b67748545f8d2daead94b1831ee0', 'yggdrazil@hotmail.de', 'yggdrazil@hotmail.de', 'de', '3', '3', '', 1, 1, 1, 1, 8, 525000, '91.66.97.253', '::1', 1558135337, 1558250850, 'gow', 1, 1, 0, 0, 1, 5, 3, '1', '1', '1', '1', '1', '0', '1', '1', '0', 0, 0, 0, 0, NULL, 1, 1558251412, 120, 'a:2:{i:0;a:5:{i:0;i:120;i:1;i:1;i:2;d:702;i:3;d:1558251412;i:4;s:1:"1";}i:1;a:5:{i:0;i:109;i:1;i:1;i:2;d:703;i:3;d:1558252115;i:4;s:1:"1";}}', 2, 1, 0, 0, 3, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, NULL, 0, 0, '0', 0, '1', 0, '0', '1', '1565957312', '0', '0', '1', '1565957331', '1', '1565957339', '1', '1565957296', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Mav3riX', '43d5b67748545f8d2daead94b1831ee0', 'kabiene23@gmail.com', 'kabiene23@gmail.com', 'de', '0', '0', '', 2, 1, 1, 1, 5, 0, '91.66.97.253', '91.66.97.253', 1558155414, 1558155450, 'gow', 1, 1, 0, 0, 1, 5, 3, '1', '1', '1', '1', '1', '0', '1', '1', '0', 0, 0, 1, 0, NULL, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, NULL, 0, 0, '0', 0, '1', 0, '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Kyrian', '43d5b67748545f8d2daead94b1831ee0', 'emuzone@outlook.com', 'emuzone@outlook.com', 'de', '0', '0', '', 3, 1, 1, 1, 11, 0, '66.249.81.63', '46.114.33.159', 1558156487, 1558157059, 'gow', 1, 1, 0, 0, 1, 5, 3, '1', '1', '1', '1', '1', '0', '1', '1', '0', 0, 0, 1, 0, NULL, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, NULL, 0, 0, '0', 0, '1', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uni1_users_valid`
--

CREATE TABLE IF NOT EXISTS `uni1_users_valid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `cle` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `planet` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `raza` varchar(2) NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cle` (`cle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
