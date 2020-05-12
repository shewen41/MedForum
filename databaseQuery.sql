CREATE DATABASE forumshewendb;

Use forumshewendb;


CREATE TABLE `she_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

INSERT INTO `she_categories` (`category_name`) VALUES ('Sexual');
INSERT INTO `she_categories` (`category_name`) VALUES ('Allergies');
INSERT INTO `she_categories` (`category_name`) VALUES ('Heart Health');
INSERT INTO `she_categories` (`category_name`) VALUES ('Bones Joint and Muscle');
INSERT INTO `she_categories` (`category_name`) VALUES ('Diabetes');
INSERT INTO `she_categories` (`category_name`) VALUES ('Eyes');


CREATE TABLE `she_subcategories` (
  `subcategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11),
  `subcategory_name` varchar(45) NOT NULL,
  `subcategory_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  FOREIGN KEY (`category_id`) 
  REFERENCES `she_categories`(`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


INSERT INTO `she_subcategories` (`category_id`,`subcategory_name`,`subcategory_desc`) VALUES ('1','Prostate Cancer','cancer in the prostate or scrotum region pain');
INSERT INTO `she_subcategories` (`category_id`,`subcategory_name`,`subcategory_desc`) VALUES ('1','Bowel Cancer','cancer in the bowel, tommy, stomach region');
INSERT INTO `she_subcategories` (`category_id`,`subcategory_name`,`subcategory_desc`) VALUES ('1','Oesophageal Cancer','cancer in the throat, mouth or neck region');
INSERT INTO `she_subcategories` (`category_id`,`subcategory_name`,`subcategory_desc`) VALUES ('1','Cervical Cancer','cervical cancer');
INSERT INTO `she_subcategories` (`category_id`,`subcategory_name`,`subcategory_desc`) VALUES ('9','Weak Erection','erection not strong enough weak');
INSERT INTO `she_subcategories` (`category_id`,`subcategory_name`,`subcategory_desc`) VALUES ('9','Watery Sperm','sperm watery light');
INSERT INTO `she_subcategories` (`category_id`,`subcategory_name`,`subcategory_desc`) VALUES ('9','Quick Ejaculation','quick ejaculation fast');



CREATE TABLE `she_topics` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11),
  `subcategory_id` int(11),
  `author` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date_posted` TIMESTAMP NOT NULL,
  `views` int(6),
  PRIMARY KEY (`topic_id`),
  FOREIGN KEY(`category_id`) REFERENCES she_categories (`category_id`),
  FOREIGN KEY(`subcategory_id`) REFERENCES she_subcategories (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


CREATE TABLE `she_replies` (
  `replies_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11),
  `subcategory_id` int(11),
  `topic_id` int(11),
  `author` varchar(45) NOT NULL,
  `comment` text NOT NULL,
  `date_posted` TIMESTAMP NOT NULL,
  PRIMARY KEY (`replies_id`),
  FOREIGN KEY(`category_id`) REFERENCES she_categories (`category_id`),
  FOREIGN KEY(`subcategory_id`) REFERENCES she_subcategories (`subcategory_id`),
  FOREIGN KEY(`topic_id`) REFERENCES she_topics (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

CREATE TABLE `she_likes` (
  `likes_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11),
  `subcategory_id` int(11),
  `topic_id` int(11),
  `author` varchar(45) NOT NULL,
  `likes` INT(10),
  `date_posted` TIMESTAMP NOT NULL,
  PRIMARY KEY (`likes_id`),
  FOREIGN KEY(`category_id`) REFERENCES she_categories (`category_id`),
  FOREIGN KEY(`subcategory_id`) REFERENCES she_subcategories (`subcategory_id`),
  FOREIGN KEY(`topic_id`) REFERENCES she_topics (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

CREATE TABLE `she_follows` (
  `follows_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11),
  `author` varchar(45) NOT NULL,
  `update` INT(10),
  `status` INT(10),
  `date_created` TIMESTAMP NOT NULL,
  PRIMARY KEY (`follows_id`),
  FOREIGN KEY(`topic_id`) REFERENCES she_topics (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) UNIQUE NOT NULL,
  `role` varchar(45) NOT NULL,
  `enabled` boolean NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(50) UNIQUE NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

INSERT INTO `user_details`
(`username`, `role`, `enabled`, `password`, `email`, `date`) VALUES ('shewen', 'USER', TRUE, 'shewen', 'habeeb_seun@yahoo.com', now());
