BEGIN TRANSACTION;
CREATE TABLE "users" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`username`	VARCHAR(50),
	`password`	VARCHAR(50)
);

CREATE TABLE "persons" (
  `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `ip`	VARCHAR(15),
  `nickname`	VARCHAR(50),
  `name`	VARCHAR(50),
  `post_count`	INTEGER,
  `status`	TEXT
);

INSERT INTO `users` VALUES(1,'theboss','klJFDWeelskj34erk');
INSERT INTO `users` VALUES(2,'nobody','LKJdf3jaro445erjr');
INSERT INTO `users` VALUES(13,'SuperSunCoreX','123Peter');

INSERT INTO `persons` VALUES(1,'121.50.83.257','n00bEr4z3r','Tammeira Chiesal',17,'active');
INSERT INTO `persons` VALUES(2,'161.85.287.159','DonkeyJam33','Salvatore Gundlachs',2,'active');
INSERT INTO `persons` VALUES(3,'2001:db8:a0b:12f0::1','EcMC','Jalisa Sgros',229,'active');
INSERT INTO `persons` VALUES(4,'98.159.273.2','Zweistein','Commander Bluebear',287,'active');
INSERT INTO `persons` VALUES(5,'127.0.0.1','_L337_','Larraine Peayouy',109,'deleted');
INSERT INTO `persons` VALUES(6,'3.141.592.65','Harri81','Harald Schunkel',22,'active');
INSERT INTO `persons` VALUES(7,'90.44.8.11.4','SunnyBoy19','Bibi Tapps',0,'active');
INSERT INTO `persons` VALUES(8,'21.116.259.34','crunchOverflow','Roben Alejandros',917,'deleted');
INSERT INTO `persons` VALUES(9,'98.87.-12.23','forkbomberTM','Evelia Plumpft',3591,'active');
INSERT INTO `persons` VALUES(10,'76.24.125.333','SunshineLady','Kosheen Dusseauley',231,'deleted');
INSERT INTO `persons` VALUES(11,'2001:db8:0:0:0:ff00:42','FeFri1','Federico Frinkels',64,'active');
INSERT INTO `persons` VALUES(12,'191.109.273.221','Jac91','Jacinta Ollerran',26,'active');
INSERT INTO `persons` VALUES(13,'212.168.9.11','SuperSunCoreX','Peter Siebenhausen',1337,'deleted');
INSERT INTO `persons` VALUES(14,'33.93.66.215','DabaDa','Eliot Grummel',298,'deleted');
INSERT INTO `persons` VALUES(15,'168.197.44.31','KiloT','Kamillo Terres',1,'active');
INSERT INTO `persons` VALUES(16,'113.71.151.299','babsi77','Barbara Mittlehr',59,'active');
COMMIT;
