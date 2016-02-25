BEGIN TRANSACTION;
CREATE TABLE "Product" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT,
	`logoURL`	TEXT,
	`URL`	TEXT,
	`Company_ID`	INTEGER
);
INSERT INTO `Product` VALUES (1,'iPad','/Users/harry/Desktop/dev/objective_c/navControl/pics/ipad','http://www.apple.com/ipad/',1);
INSERT INTO `Product` VALUES (2,'iPod Touch','/Users/harry/Desktop/dev/objective_c/navControl/pics/ipod-touch-product-initial-2015','http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_91262087527_&cid=aos-us-kwg-ipod-slid-',1);
INSERT INTO `Product` VALUES (3,'iPhone','/Users/harry/Desktop/dev/objective_c/navControl/pics/iphone','http://www.apple.com/iphone/?afid=p238%7CsGy8lsjhy-dc_mtid_1870765e38482_pcrid_99437624767_&cid=aos-us-kwg-iphone-slid-',1);
INSERT INTO `Product` VALUES (4,'Galaxy S6','/Users/harry/Desktop/dev/objective_c/navControl/pics/glaxy','http://www.samsung.com/us/explore/galaxy-s6-edge-plus-features-and-specs/?cid=ppc-',2);
INSERT INTO `Product` VALUES (5,'Galaxy Note','/Users/harry/Desktop/dev/objective_c/navControl/pics/gnote','http://www.samsung.com/us/explore/galaxy-note-5-features-and-specs/?cid=ppc-',2);
INSERT INTO `Product` VALUES (6,'Galazy Tab','/Users/harry/Desktop/dev/objective_c/navControl/pics/gtab','http://www.samsung.com/us/mobile/galaxy-tab/',2);
INSERT INTO `Product` VALUES (7,'ONE A9','/Users/harry/Desktop/dev/objective_c/navControl/pics/oneA9','http://www.htc.com/us/smartphones/htc-one-a9/',3);
INSERT INTO `Product` VALUES (8,'Desire','/Users/harry/Desktop/dev/objective_c/navControl/pics/desire','http://www.htc.com/us/smartphones/htc-desire-626/',3);
INSERT INTO `Product` VALUES (9,'ONE M9','/Users/harry/Desktop/dev/objective_c/navControl/pics/oneM9','http://www.htc.com/us/smartphones/htc-one-m9/',3);
INSERT INTO `Product` VALUES (10,'Classic','/Users/harry/Desktop/dev/objective_c/navControl/pics/classic','http://us.blackberry.com/smartphones/blackberry-classic/overview.html',4);
INSERT INTO `Product` VALUES (11,'Leap','/Users/harry/Desktop/dev/objective_c/navControl/pics/leap','http://us.blackberry.com/smartphones/blackberry-leap/overview.html',4);
INSERT INTO `Product` VALUES (12,'Z30','/Users/harry/Desktop/dev/objective_c/navControl/pics/z30"','http://us.blackberry.com/smartphones/blackberry-z30/overview.html',4);
CREATE TABLE "Company" (
	`id`	INTEGER,
	`name`	TEXT,
	`logoURL`	TEXT,
	`company Title`	TEXT,
	PRIMARY KEY(id)
);
INSERT INTO `Company` VALUES (1,'Apple','apple.png','Apple mobile devices');
INSERT INTO `Company` VALUES (2,'Samsung','samsung-logo.jpeg','Samsung mobile devices');
INSERT INTO `Company` VALUES (3,'HTC','HTC.jpeg','HTC mobile devices');
INSERT INTO `Company` VALUES (4,'Blackberry','Blackberry_Logo_without_wordmark.svg','Blackberry mobile devices');
COMMIT;
