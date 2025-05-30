/*
SQLyog Ultimate v9.01 
MySQL - 5.0.22-community-nt : Database - mona
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mona` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mona`;

/*Table structure for table `adminlogin` */

DROP TABLE IF EXISTS `adminlogin`;

CREATE TABLE `adminlogin` (
  `UserName` varchar(20) default NULL,
  `Password` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `adminlogin` */

insert  into `adminlogin`(`UserName`,`Password`) values ('sen','sen');

/*Table structure for table `groupname` */

DROP TABLE IF EXISTS `groupname`;

CREATE TABLE `groupname` (
  `groupname` varchar(50) NOT NULL default '',
  `product` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `groupname` */

insert  into `groupname`(`groupname`,`product`) values ('san','TheBestSecretKey'),('sen','TheBestSuperKeys'),('Thamas','TheBestSuperMens');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(20) default NULL,
  `Email` varchar(25) default NULL,
  `groupname` varchar(50) default NULL,
  PRIMARY KEY  (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`UserName`,`Password`,`Email`,`groupname`) values ('jegan','jegan','java@pantechmail.com','sen'),('sakthi','sakthi','java@pantechmail.com','Thamas'),('tamil','tamil','java@pantechmail.com','sen'),('vijay','vijay','java@pantechmail.com','san');

/*Table structure for table `othergroup` */

DROP TABLE IF EXISTS `othergroup`;

CREATE TABLE `othergroup` (
  `UserName` varchar(25) default NULL,
  `groupname` varchar(25) default NULL,
  `Requestgroup` varchar(25) default NULL,
  `filename` varchar(50) default NULL,
  `Status` varchar(50) default NULL,
  `count` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `othergroup` */

insert  into `othergroup`(`UserName`,`groupname`,`Requestgroup`,`filename`,`Status`,`count`) values ('vijay','san','Thamas','12.jpg','pending',NULL);

/*Table structure for table `userprofile` */

DROP TABLE IF EXISTS `userprofile`;

CREATE TABLE `userprofile` (
  `UserName` varchar(50) default NULL,
  `groupname` varchar(30) default NULL,
  `filename` varchar(150) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userprofile` */

insert  into `userprofile`(`UserName`,`groupname`,`filename`) values ('tamil','sen','1.jpg'),('sakthi','Thamas','12.jpg'),('sakthi','Thamas','8.jpg'),('vijay','san','3.jpg'),('vijay','san','12.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
