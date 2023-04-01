-- Active: 1671709889479@@127.0.0.1@3306@realestate
create database realestate;
use realestate;
drop table sells;
create table property(pid integer , house integer, street varchar(50), area varchar(50), pincode numeric(4,0),area_sqft int, avail int, market_in date, rent_price integer, sell_price integer, no_bedrooms integer, build_year integer, is_sold boolean, is_rented boolean, primary key (pid)); 
create table agent(agent_id integer, password varchar(50), aname varchar(50), contact numeric(10,0),area varchar(50), rating numeric(2,1), no_of_rentals integer, no_of_sold integer, rentals_sales bigint, sold_sales bigint, base_commission numeric(2,1), primary key (agent_id));
create table buyer(bid integer, password varchar(50), bname varchar(50),contact numeric(10),  area varchar(50), budget bigint, bought boolean, primary key(bid));
create table seller(sid integer, password varchar(50),  sname varchar(50),contact numeric(10,0), primary key
(sid));
create table _admin(username varchar(50), password varchar(50), primary key(username));

create table sells(pid integer, agent_id integer, primary key(agent_id, pid), foreign key (pid) references property(pid));
create table buys(bid integer, pid integer,year_sold integer, market_out date, primary key(bid, pid));
create table owns(sid integer, pid integer,current_owner int, primary key(sid, pid));
select * from buys;

 
insert into property values (16250,40,"LAUREL ST","Asylum Hill",667,1486,0,'2020-06-25',1300,792300,1,1961,0,1),
(14346,1,"ANN UCCELLO ST","Barry Square",2913,3275,1,'2021-01-13',2200,619800,3,2000,0,0),
(10744,11,"WARREN ST","Behind the Rocks",2116,1907,1,'2019-08-30',3100,445000,2,1896,0,0),
(16674,41,"BEACON ST","Blue Hills",2913,2569,0,'2022-02-14',4000,982100,3,1883,0,1),
(20062,27,"VICTORIA RD","Blue Hills",2653,3898,0,'2021-07-11',4900,745600,2,1924,0,0),
(21621,44,"AMHERST ST","Blue Hills",2704,2145,1,'2019-12-07',5800,268900,2,1957,0,0),
(24848,42,"SHERBROOKE AVE","Behind the Rocks",6105,2947,1,'2020-11-17',6700,916700,2,1971,0,0),
(422,42,"PEMBROKE ST","Behind the Rocks",1439,3582,0,'2022-01-04',7600,536800,2,1927,0,0),
(23059,27,"EATON ST","Behind the Rocks",2661,1325,0,'2020-02-09',8500,733400,4,1991,0,0),
(23495,33,"MAIN ST","North Meadows",2913,1754,1,'2021-10-22',9400,851900,2,1926,0,0),
(21390,57,"WESTBOURNE PKWY","Barry Square",1731,2736,1,'2022-03-16',10300,373200,3,1921,0,0),
(15530,20,"CONGRESS ST","Barry Square",1073,1985,0,'2020-05-02',11200,578100,2,1930,0,0),
(13537,11,"BROADVIEW TER","Barry Square",3805,3158,0,'2019-09-21',1900,998500,4,1927,0,0),
(5155,19,"SOUTH WHITNEY ST","Asylum Hill",6106,2279,1,'2021-04-30',2800,405200,2,2003,0,0),
(13924,8,"TOWER AVE","Asylum Hill",1953,2698,0,'2020-09-26',2600,689700,4,1937,0,1),
(10752,36,"FREEMAN ST","Asylum Hill",6114,1845,0,'2019-12-01',2250,247500,2,1922,0,1),
(20121,8,"CHESHIRE ST","North Meadows",2203,2996,1,'2022-01-24',1550,768300,4,1916,0,0),
(24199,47,"SUMMIT ST","North Meadows",6105,3641,1,'2019-11-09',1800,543600,2,1910,0,0),
(13906,38,"CAPEN ST","North Meadows",2066,1412,0,'2020-05-14',2900,914200,2,1920,0,0),
(16588,19,"MONTOWESE ST","Asylum Hill",3041,3369,1,'2021-07-19',2350,281400,3,1915,0,0),
(8513,15,"FRASER PL","Asylum Hill",6155,2115,0,'2022-03-03',2050,482900,3,1996,0,0),
(10990,36,"OWEN ST","Asylum Hill",3280,1927,1,'2021-02-15',3200,926800,1,1965,0,0),
(13860,14,"WOODLAND ST","Barry Square",4338,2875,0,'2020-02-26',1700,697100,2,1963,0,1),
(3689,8,"HUDSON ST","Asylum Hill",6106,3312,1,'2019-09-15',2500,572400,2,1999,0,0),
(21382,9,"GOODWIN CIR","Asylum Hill",5204,2548,1,'2021-11-28',3100,864900,3,2004,0,0);

insert into agent values (1865,'zephyr891','Samantha Johnson',9723456810,'Asylum Hill',4,3,0,6150,0,5.6),
(1529,'target173','Timothy Wilson',9867321540,'Barry Square',2,0,0,0,0,5.2),
(1847,'melon712','Gabrielle Rodriguez',9998745620,'Behind the Rocks',1,0,0,0,0,5.8),
(1698,'puffin416','Matthew Davis',9176324580,'Blue Hills',3,0,0,0,0,5.3),
(1276,'parrot223','Victoria Williams',9568721430,'North Meadows',5,0,0,0,0,5.9),
(1541,'gorilla550','Ethan Martinez',9912345670,'Asylum Hill',2,0,0,0,0,5.7),
(1967,'seahorse928','Caroline Lee',9308756142,'Barry Square',5,1,0,1700,0,5.5),
(1775,'emerald611','Joshua Thompson',9445678910,'Behind the Rocks',4,0,0,0,0,5.1),
(1295,'lioness375','Natalie Brown',9874561230,'Blue Hills',4,1,0,4000,0,5.4),
(1845,'monkey758','Aaron Green',9345126870,'North Meadows',3,0,0,0,0,5.8);

insert into seller values (1503,"bluebutterfly12","Emily Davis",7321489567),
(1792,"fireice34","William Johnson",9547108326),
(1986,"greenapple89","Olivia Martin",7862930154),
(1548,"purplesunflower67","Benjamin Thompson",9035872461),
(1276,"oceanwave23","Sophia Wright",7298345160),
(1289,"yellowlemonade56","James Taylor",9741628305),
(1682,"blackcoffee78","Ava Clark",7985462130),
(1250,"pinkroses91","Michael Hernandez",9176403852),
(1027,"browniecookie45","Isabella Robinson",7432169850),
(1849,"redvelvetcake76","Daniel Lee",9580713624);

insert into sells values (16250,1865),
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
(21382,1865);

insert into owns values 
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

insert into buyer values (1548,"BlueTulip23","Jameson Lee",9712358469,"Asylum Hill",900000,0),
(1694,"GreenApple98","Kaitlyn Turner",9287635121,"Behind the Rocks",600000,0),
(1220,"HappyDog77","Benjamin Reed",9867412098,"Barry Square",400000,0),
(1067,"SilverSpoon12","Madison Scott",9584731265,"Blue Hills",700000,0),
(1263,"OrangeSunset45","Michaela Baker",9023651487,"Blue Hills",700000,0);

insert into _admin values
("sindhu", "sindhu162"),
("shreya", "shreya195"),
("sunidhi", "sunihi205"),
("pari", "pari139");




ALTER TABLE owns ADD CONSTRAINT FK_owns_property_pid FOREIGN KEY (pid) REFERENCES property(pid);
ALTER TABLE owns ADD CONSTRAINT FK_owns_seller_sid FOREIGN KEY (sid) REFERENCES seller(sid);
ALTER TABLE buys ADD CONSTRAINT FK_buys_property_pid FOREIGN KEY (pid) REFERENCES property(pid);
ALTER TABLE buys ADD CONSTRAINT FK_buys_buyer_bid FOREIGN KEY (bid) REFERENCES buyer(bid);
ALTER TABLE sells ADD CONSTRAINT FK_sells_agent_id FOREIGN KEY (agent_id) REFERENCES agent(agent_id);


Select * from sells natural join property natural join agent;
TER TABLE buys ADD CONSTRAINT FK_buys_property_pid FOREIGN KEY (pid) REFERENCES property(pid);
ALTER TABLE buys ADD CONSTRAINT FK_buys_buyer_bid FOREIGN KEY (bid) REFERENCES buyer(bid);

ALTER TABLE sells ADD CONSTRAINT FK_sells_property_pid FOREIGN KEY (pid) REFERENCES property(pid);
ALTER TABLE sells ADD CONSTRAINT FK_sells_agent_id FOREIGN KEY (agent_id) REFERENCES agent(agent_id);

DESCRIBE sells;

