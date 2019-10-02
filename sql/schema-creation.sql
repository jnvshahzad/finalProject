#drop schema if already exists and create new one
DROP SCHEMA trainer_pool;
CREATE SCHEMA trainer_pool;
USE trainer_pool;

SET FOREIGN_KEY_CHECKS = 0;

#role table
CREATE TABLE role(
    role_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    role_name VARCHAR(100)
)AUTO_INCREMENT = 100001;


#user table
CREATE TABLE `user` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_first_name` varchar(45) NOT NULL,
  `usr_last_name` varchar(45) NOT NULL,
  `usr_age` int(11) NOT NULL,
  `usr_gender` varchar(10) NOT NULL,
  `usr_contact_number` bigint(10) DEFAULT NULL,
  `usr_address` varchar(200) NOT NULL,
  `usr_userId` int(11) NOT NULL,
  `usr_password` varchar(10) NOT NULL,
  `usr_role` int(11) NOT NULL,
  `usr_start_avail` date DEFAULT NULL,
  `usr_end_avail` date DEFAULT NULL,
  PRIMARY KEY (`usr_id`),
  KEY `fk_role` (`usr_role`),
  CONSTRAINT `fk_role` FOREIGN KEY (`usr_role`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)AUTO_INCREMENT=3000001;

#skills table
CREATE TABLE skills(
    skill_id INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
    skill_name VARCHAR(50),
    skill_duration INT
)AUTO_INCREMENT = 20001;

#linking users with the skills
CREATE TABLE `user_skills` (
  `user_id` int(11) NOT NULL,
  `skill_id` varchar(200) NOT NULL,
  PRIMARY KEY (`user_id`,`skill_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `fk_user_id` (`user_id`)
);

#request table
CREATE TABLE `request` (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_requestorId` int(11) NOT NULL,
  `req_subject` varchar(50) NOT NULL,
  `req_start_date` date NOT NULL,
  `req_end_date` date NOT NULL,
  `req_city` varchar(50) NOT NULL,
  `req_batch_size` int(11) NOT NULL,
  `req_amount` int(11) DEFAULT NULL,
  `req_status` varchar(45) NOT NULL DEFAULT 'Approval Pending',
  PRIMARY KEY (`req_id`)
)AUTO_INCREMENT=500001;

#LINKING USER WITH REQUESTS
CREATE TABLE `user_requests` (
  `user_id` int(11) NOT NULL,
  `req_id` int(200) NOT NULL,
  PRIMARY KEY (`user_id`,`req_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `fk_usr_id` (`user_id`),
  KEY `fk_req_id` (`req_id`),
  CONSTRAINT `fk_usr_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

#LINKING SKILL WITH REQUESTS
CREATE TABLE `skill_requests` (
  `skill_id` int(11) NOT NULL ,
  `req_id` varchar(200) NOT NULL,
  PRIMARY KEY (`skill_id`,`req_id`),
  UNIQUE KEY `skill_id_UNIQUE` (`skill_id`),
  KEY `fk_reqt_id` (`req_id`),
  KEY `fk_skills_id` (`skill_id`)
);
