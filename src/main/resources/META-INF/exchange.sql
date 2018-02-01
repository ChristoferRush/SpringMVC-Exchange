-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: exchange
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','US Dollar'),(2,'EUR','Euro'),(3,'CHF','Swiss Franc'),(4,'RUB','Russian Ruble'),(5,'CZK','Chech Koruna'),(6,'GBP','Pound Sterling');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies_wallet_currency`
--

DROP TABLE IF EXISTS `currencies_wallet_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies_wallet_currency` (
  `Currency_id` bigint(20) NOT NULL,
  `walletCurrencyList_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_l6m028pj7f45d6oe047bdd54e` (`walletCurrencyList_id`),
  KEY `FK8ufljis3hdq82440ow2hkt4r1` (`Currency_id`),
  CONSTRAINT `FK2ecppvx2kmrfm2hi6k5esnj6j` FOREIGN KEY (`walletCurrencyList_id`) REFERENCES `wallet_currency` (`id`),
  CONSTRAINT `FK8ufljis3hdq82440ow2hkt4r1` FOREIGN KEY (`Currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies_wallet_currency`
--

LOCK TABLES `currencies_wallet_currency` WRITE;
/*!40000 ALTER TABLE `currencies_wallet_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies_wallet_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (3),(3),(3),(3);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `wallet_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcf6cgic6n7ek155uj81npsbcm` (`wallet_id`),
  CONSTRAINT `FKcf6cgic6n7ek155uj81npsbcm` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'exchange','office',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_currency`
--

DROP TABLE IF EXISTS `wallet_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_currency` (
  `id` bigint(20) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `wallet_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo3bcng9vblchn2urysg0l7pkk` (`currency_id`),
  KEY `FKar5cxr2ve52e9uj3ca5y6agqa` (`wallet_id`),
  CONSTRAINT `FKar5cxr2ve52e9uj3ca5y6agqa` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`),
  CONSTRAINT `FKo3bcng9vblchn2urysg0l7pkk` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_currency`
--

LOCK TABLES `wallet_currency` WRITE;
/*!40000 ALTER TABLE `wallet_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc1foyisidw7wqqrkamafuwn4e` (`user_id`),
  CONSTRAINT `FKc1foyisidw7wqqrkamafuwn4e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (2,1);
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets_wallet_currency`
--

DROP TABLE IF EXISTS `wallets_wallet_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets_wallet_currency` (
  `Wallet_id` bigint(20) NOT NULL,
  `walletCurrencyList_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_nfl1i5rgnet0aojb2cib41046` (`walletCurrencyList_id`),
  KEY `FKjqvbsull3leybdieqogy85mjw` (`Wallet_id`),
  CONSTRAINT `FKjqvbsull3leybdieqogy85mjw` FOREIGN KEY (`Wallet_id`) REFERENCES `wallets` (`id`),
  CONSTRAINT `FKs1fafivojerdm7womb6iht2ct` FOREIGN KEY (`walletCurrencyList_id`) REFERENCES `wallet_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets_wallet_currency`
--

LOCK TABLES `wallets_wallet_currency` WRITE;
/*!40000 ALTER TABLE `wallets_wallet_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets_wallet_currency` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-01 18:17:39
