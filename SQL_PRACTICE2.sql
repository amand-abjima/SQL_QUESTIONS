-- WRITE AN SQL QUERY TO FIND MAXIMUM POPULATION AND MINIMUM POPULATION FOR STATES.

create table city_info(id int,state varchar(15),city varchar(10),population int);

insert into city_info values(1,'Maharashtra','Mumbai',1000)
insert into city_info values(2,'Maharashtra','Pune',500)
insert into city_info values(3,'Maharashtra','Nagpur',400)
insert into city_info values(4,'Punjab','Amritsar',800)
insert into city_info values(5,'Punjab','Ludhiana',350)
insert into city_info values(6,'Punjab','Patiala',200)
insert into city_info values(7,'TamilNadu','Chennai',700)
insert into city_info values(8,'TamilNadu','Vellore',400)

SELECT * FROM CITY_INFO;

SELECT *,ROW_NUMBER() OVER(PARTITION BY STATE ORDER BY POPULATION DESC) AS MAX_P,
ROW_NUMBER() OVER (PARTITION BY STATE ORDER BY POPULATION ASC) AS MIN_P INTO #TEMP1 FROM CITY_INFO;

SELECT * FROM #TEMP1;

DROP TABLE #TEMP1;

SELECT STATE,
MAX(CASE WHEN MAX_P = 1 THEN CITY END) AS MAXIMUM_POPULATION,
MIN(CASE WHEN MIN_P = 1 THEN CITY END)  AS MINIMIUM_POPULATION
FROM #TEMP1 WHERE MAX_P =1 OR MIN_P = 1 GROUP BY STATE;

SELECT STATE,
CASE WHEN MAX_P = 1 THEN CITY END AS MAXIMUM_POPULATION,
CASE WHEN MIN_P = 1 THEN CITY END  AS MINIMIUM_POPULATION
FROM #TEMP1 WHERE MAX_P =1 OR MIN_P = 1 GROUP BY STATE;