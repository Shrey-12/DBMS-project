-- Active: 1671709889479@@127.0.0.1@3306@RealEstate
CREATE DATABASE RealEstate;

USE RealEstate;

CREATE TABLE property
     (
     pid    		INTEGER,
     house_no  		INTEGER,
     street    		VARCHAR(50),
     area      		VARCHAR(50),
     pincode   		NUMERIC(4,0),
     area_sqft 		INT,
     avail     		VARCHAR(20),
     market_in 		DATE,
     rent_price 	INTEGER,
     sell_price 	INTEGER,
     no_bedrooms 	INTEGER,
     build_year  	INTEGER,
     is_sold     	BOOLEAN,
     is_rented   	BOOLEAN,
     PRIMARY KEY	(pid)
     );
     
INSERT INTO property VALUES
(16250,40,"LAUREL ST","Asylum Hill",667,1486,'rent','2020-06-25',1300,792300,1,1961,0,1),
(14346,1,"ANN UCCELLO ST","Barry Square",2913,3275,'sale','2021-01-13',2200,619800,3,2000,0,0),
(10744,11,"WARREN ST","Behind the Rocks",2116,1907,'sale','2019-08-30',3100,445000,2,2003,0,0),
(16674,41,"BEACON ST","Blue Hills",2913,2569,'rent','2022-02-14',4000,982100,3,2021,0,1),
(20062,27,"VICTORIA RD","Blue Hills",2653,3898,'rent','2021-07-11',4900,745600,2,2020,0,0),
(21621,44,"AMHERST ST","Blue Hills",2704,2145,'sale','2019-12-07',5800,268900,2,2018,1,0),
(24848,42,"SHERBROOKE AVE","Behind the Rocks",6105,2947,'sale','2020-11-17',6700,916700,2,1971,0,0),
(422,42,"PEMBROKE ST","Behind the Rocks",1439,3582,'rent','2022-01-04',7600,536800,2,2021,0,0),
(23059,27,"EATON ST","Behind the Rocks",2661,1325,'rent','2020-02-09',8500,733400,4,1991,0,0),
(23495,33,"MAIN ST","North Meadows",2913,1754,'sale','2021-10-22',9400,851900,2,1926,0,0),
(21390,57,"WESTBOURNE PKWY","Barry Square",1731,2736,'sale','2022-03-16',10300,373200,3,1921,1,0),
(15530,20,"CONGRESS ST","Barry Square",1073,1985,'rent','2020-05-02',11200,578100,2,1930,0,0),
(13537,11,"BROADVIEW TER","Barry Square",3805,3158,'rent','2019-09-21',1900,998500,4,1927,0,0),
(5155,19,"SOUTH WHITNEY ST","Asylum Hill",6106,2279,'sale','2021-04-30',2800,405200,2,2003,1,0),
(13924,8,"TOWER AVE","Asylum Hill",1953,2698,'rent','2020-09-26',2600,689700,4,1937,0,1),
(10752,36,"FREEMAN ST","Asylum Hill",6114,1845,'rent','2019-12-01',2250,247500,2,1922,1,0),
(20121,8,"CHESHIRE ST","North Meadows",2203,2996,'sale','2022-01-24',1550,768300,4,1916,0,0),
(24199,47,"SUMMIT ST","North Meadows",6105,3641,'sale','2019-11-09',1800,543600,2,1910,0,0),
(13906,38,"CAPEN ST","North Meadows",2066,1412,'rent','2020-05-14',2900,914200,2,1920,0,0),
(16588,19,"MONTOWESE ST","Asylum Hill",3041,3369,'sale','2021-07-19',2350,281400,3,1915,0,0),
(8513,15,"FRASER PL","Asylum Hill",6155,2115,'rent','2022-03-03',2050,482900,3,1996,0,0),
(10990,36,"OWEN ST","Asylum Hill",3280,1927,'sale','2021-02-15',3200,926800,1,1965,0,0),
(13860,14,"WOODLAND ST","Barry Square",4338,2875,'rent','2022-02-26',1700,697100,2,2021,0,1),
(3689,8,"HUDSON ST","Asylum Hill",6106,3312,'sale','2019-09-15',2500,572400,2,1999,1,0),
(21382,9,"GOODWIN CIR","Asylum Hill",5204,2548,'sale','2021-11-28',3100,864900,3,2004,0,0),
(13333, 123, 'Main St', 'Asylum hill', 1234, 1000,'sale', '2000-01-01', 1000, 200000, 2, 1990, 1, 0),
(16521,2,"Franklin Avenue","Barry Square",2913,3275,'sale','1999-01-13',2200,619800,3,2000,1,0),
(18909,3,"Farmington Avenue","Asylum Hill",2923,3285,'sale','2003-01-13',2200,670000,3,2000,1,0),
(19700,5,"Asylum Street","Blue Hills",3000,3265,'sale','2002-01-13',2200,770000,3,2000,1,0),
(19030,3,"Park Street","Blue Hills",3933,4285,'sale','2004-01-13',2200,870000,3,2000,1,0);



 CREATE TABLE agent
     (
     agent_id 			INTEGER,
     password 			VARCHAR(50),
     agent_name 		VARCHAR(50),
     contact_no 		NUMERIC(10,0),
     area 				VARCHAR(50),
     rating 			NUMERIC(2,1),
     no_rented 			INTEGER,
     no_sold 			INTEGER,
     rental_sales 		BIGINT,
     sold_sales 		BIGINT,
     base_commission 	NUMERIC(2,1),
     PRIMARY KEY 		(agent_id)
     );
 
INSERT INTO  agent VALUES
(1865,'zephyr891','Samantha Johnson',9723456810,'Asylum Hill',4,3,1,6150,247500,5.6),
(1529,'target173','Timothy Wilson',9867321540,'Barry Square',2,0,0,0,0,5.2),
(1847,'melon712','Gabrielle Rodriguez',9998745620,'Behind the Rocks',1,0,0,0,0,5.8),
(1698,'puffin416','Matthew Davis',9176324580,'Blue Hills',3,0,2,0,1138900,5.3),
(1276,'parrot223','Victoria Williams',9568721430,'North Meadows',5,0,0,0,0,5.9),
(1541,'gorilla550','Ethan Martinez',9912345670,'Asylum Hill',2,0,4,0,1847600,5.7),
(1967,'seahorse928','Caroline Lee',9308756142,'Barry Square',5,1,2,1700,993000,5.5),
(1775,'emerald611','Joshua Thompson',9445678910,'Behind the Rocks',4,0,0,0,0,5.1),
(1295,'lioness375','Natalie Brown',9874561230,'Blue Hills',4,1,1,4000,770000,5.4),
(1845,'monkey758','Aaron Green',9345126870,'North Meadows',3,0,0,0,0,5.8);



CREATE TABLE buyer
    (
     bid 		INTEGER,
     password 	VARCHAR(50),
     buyer_name VARCHAR(50),
     contact_no NUMERIC(10,0),
     area  		VARCHAR(50),
     budget 	BIGINT,
     PRIMARY KEY (bid)
     );
     
INSERT INTO buyer VALUES
(1548,"BlueTulip23","Jameson Lee",9712358469,"Asylum Hill",900000),
(1694,"GreenApple98","Kaitlyn Turner",9287635121,"Behind the Rocks",600000),
(1220,"HappyDog77","Benjamin Reed",9867412098,"Barry Square",400000),
(1067,"SilverSpoon12","Madison Scott",9584731265,"Blue Hills",700000),
(1263,"OrangeSunset45","Michaela Baker",9023651487,"Blue Hills",700000),
(1999,"Ownworld33","David John",9023651486,"Barry Square",600000),
(1098,"Lowhigh21","JohnHM",9023654487,"Behind the Rocks",500000),
(1076,"Canwedance23","Michaela Barua",9023681487,"Asylum Hills",350000),
(1852,"OrangeSunset45","Michaela Baker",9023651487,"Blue Hills",500000),
(1555,"Pinkred23","Jameson Lae",9782358469,"Asylum Hill",900000),
(1239,"BlackTulip23","Jamoson Lee",9732358469,"Asylum Hill",900000);


 CREATE TABLE seller
     (
     sid INTEGER,
     password VARCHAR(50),
     seller_name VARCHAR(50),
     contact_no NUMERIC(10,0),
     PRIMARY KEY (sid)
     );

INSERT INTO seller VALUES
(1503,"bluebutterfly12","Emily Davis",7321489567),
(1792,"fireice34","William Johnson",9547108326),
(1986,"greenapple89","Olivia Martin",7862930154),
(1548,"purplesunflower67","Benjamin Thompson",9035872461),
(1276,"oceanwave23","Sophia Wright",7298345160),
(1289,"yellowlemonade56","James Taylor",9741628305),
(1682,"blackcoffee78","Ava Clark",7985462130),
(1250,"pinkroses91","Michael Hernandez",9176403852),
(1027,"browniecookie45","Isabella Robinson",7432169850),
(1849,"redvelvetcake76","Daniel Lee",9580713624);

CREATE TABLE sells (
  pid INT,
  agent_id INT,
  PRIMARY KEY (agent_id, pid),
  FOREIGN KEY (pid) REFERENCES property(pid),
  FOREIGN KEY (agent_id) REFERENCES agent(agent_id)
);


insert into sells values
(16250,1865),
(14346,1967),
(10744,1775),
(16674,1295),
(20062,1295),
(21621,1698),
(24848,1847),
(422,1775),
(23059,1775),
(23495,1276),
(21390,1967),
(15530,1967),
(13537,1529),
(5155,1541),
(13924,1865),
(10752,1865),
(20121,1276),
(24199,1276),
(13906,1845),
(16588,1865),
(8513,1541),
(10990,1865),
(13860,1967),
(3689,1541),
(21382,1865),
(13333, 1541),
(18909,1541),
(19700,1295),
(19030,1698),
(16521, 1967);


CREATE TABLE buys
(
pid 			INTEGER,
bid 			INTEGER,
year_sold 		INTEGER,
market_out 		DATE,
PRIMARY KEY	(bid, pid),
FOREIGN KEY 	(pid) 		references 	property(pid),
FOREIGN KEY 	(bid) 		references 	buyer(bid)
);

INSERT INTO buys VALUES
(3689,1548,2023,"2023-01-25"),
(21390,1067,2022,"2022-02-22"),
(5155,1852,2023,"2023-01-02"),
(10752,1098,2023,"2023-02-03"),
(13333, 1555, 2018, "2018-08-25"), 
(18909, 1239, 2018, "2018-08-21"), 
(16521, 1999, 2018, "2018-08-20"), 
(19700, 1239, 2018, "2018-08-21"), 
(19030, 1852, 2018, "2018-08-21"),
(21621,1694,2018,"2018-05-23");


CREATE TABLE owns
(
pid 			INTEGER,
sid 			INTEGER,
current_owner   BOOLEAN,
PRIMARY KEY		(sid, pid),
FOREIGN KEY 	(pid) 		references 	property(pid),
FOREIGN KEY 	(sid) 		references 	seller(sid)
);

insert into owns(sid, pid, current_owner) values 
(1503,16250,1),
(1792,14346,1),
(1986,10744,1),
(1548,16674,1),
(1276,20062,1),
(1289,21621,1),
(1682,24848,1),
(1250,422,1),
(1027,23059,1),
(1849,23495,1),
(1503,21390,1),
(1792,15530,1),
(1986,13537,1),
(1548,5155,1),
(1276,13924,1),
(1289,10752,1),
(1682,20121,1),
(1250,24199,1),
(1027,13906,1),
(1849,16588,1),
(1986,8513,1),
(1548,10990,1),
(1276,13860,1),
(1289,3689,1),
(1682,21382,1);



CREATE TABLE admin
(
username		VARCHAR(50),
password 		VARCHAR(50), 
PRIMARY KEY	(username)
);

INSERT INTO admin VALUES
("sindhu", "sindhu162"),
("shreya", "shreya195"),
("sunidhi", "sunidhi205"),
("pari", "pari139");


#TRIGGER

-- SHOW TRIGGERS;
-- DROP TRIGGER buyer_buys;

DELIMITER //
CREATE TRIGGER buyer_buys
AFTER INSERT ON buys
FOR EACH ROW 
BEGIN 
	DECLARE agent_id INTEGER;
	DECLARE sp INTEGER;
    DECLARE rp INTEGER;
    DECLARE avail VARCHAR(10);

  -- Get the agent ID for the property being bought
  SELECT agent_id INTO agent_id FROM sells WHERE pid = new.pid;
  
  -- Get the sell price of the property
  SELECT sell_price INTO sp FROM property WHERE pid = new.pid and avail = 'sale' and is_sold = 0;
  
  -- Get the rent price of the property
  SELECT rent_price INTO rp FROM property WHERE pid = new.pid and avail = 'rent' and is_rented = 0;
  
  -- Get avail of a property
  SELECT avail into avail FROM property WHERE pid = new.pid;

  -- Update the agent's no_sold and sold_sales columns
  IF avail = 'sale' THEN
  
  UPDATE agent
  SET no_sold = no_sold + 1,
      sold_sales = sold_sales + sp  
      WHERE agent_id = agent_id;

   UPDATE property
   SET is_sold = 1
		WHERE pid = new.pid;
  END IF;
  
-- Update the agent's no_rent and rented_sales columns
  IF avail = 'rent' THEN
  UPDATE agent
  SET no_rented = no_rented + 1,
      rented_sales = rented_sales + rp  
      WHERE agent_id = agent_id;
   UPDATE property
   SET is_rented = 1
		WHERE pid = new.pid;
  END IF;
  
END //

DELIMITER ;

# to get the required attributes to check if 
-- SELECT pid,bid,area,budget,sell_price,avail 
-- FROM property natural join buyer 
-- WHERE budget >= sell_price and avail = 'sale' and is_sold = 0;


#QUERIES:

#Q1
 -- List houses + built in 2020 + rent 
SELECT * 
FROM property 
WHERE avail = 'rent' AND is_rented = 0 AND build_year >=  2020;

#Q2
-- get the sell price range -> -> (200000,  926800)
 SELECT pid, sell_price, avail 
 FROM property 
 WHERE avail = 'sale' 
 ORDER BY sell_price; 

-- List houses + address + sell price in a range 
SELECT house_no, street, area, pincode, sell_price 
FROM property 
WHERE sell_price >= 500000 AND sell_price <= 800000 
ORDER BY sell_price;
 
-- get the rent price range -> (1300, 11200)
 SELECT pid, rent_price, avail 
 FROM property 
 WHERE avail = 'rent' 
 ORDER BY rent_price; 
 
-- List houses + address + sell price in a range
SELECT house_no, street, area, pincode, rent_price 
FROM property 
WHERE sell_price <= 3000 AND sell_price >= 8000 
ORDER BY sell_price ;

#Q3
-- rent + area - bluehills + bedrooms atleast 2 + rent price costing less than 6000 
SELECT  house_no, street, area, pincode 
FROM property  
WHERE avail = 'rent' AND area = 'Blue hills' AND no_bedrooms >= 2 AND rent_price <= 6000;

#Q4
-- agent_name + total amount of sold property prices in 2023
WITH get_sell_price(a_id, a_name, total_sales) AS
(
	SELECT agent_id, agent_name, sum(sell_price) 
    FROM buys NATURAL JOIN sells NATURAL JOIN property NATURAL JOIN agent 
    WHERE year_sold = 2023
    GROUP BY agent_id, agent_name 
)
SELECT a_name, total_sales
FROM get_sell_price 
ORDER BY total_sales DESC LIMIT 0, 1 ;


#Q5
-- each agent + avg_sp in 2018 + avg_dur the property was in market
WITH in_market(time_dur, a_id, s_price) AS
(
	SELECT datediff(market_out,market_in), agent_id, sell_price 
    FROM buys NATURAL JOIN sells NATURAL JOIN property 
    WHERE year_sold = 2018
)   
SELECT a_id as agent, AVG(time_dur) as avg_time_duration, AVG(s_price) as avg_selling_price  
FROM in_market 
GROUP BY a_id;

#Q6 
-- most expensive property 
-- gives the max sell_price of all the properties
SELECT * 
FROM property
ORDER BY sell_price DESC LIMIT 0,1;

-- highest rent 
-- gives the max rent_price of all the properties
SELECT * 
FROM property 
ORDER BY rent_price DESC LIMIT 0,1;

