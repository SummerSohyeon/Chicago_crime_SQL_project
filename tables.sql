CREATE DATABASE IF NOT EXISTS chicago;

USE chicago;

CREATE TABLE CRIMES (
	CRIME_ID serial, 
	CRIME_DATE TIMESTAMP,
	STREET_NAME VARCHAR(100),
	CRIME_TYPE VARCHAR(150),
	CRIME_DESCRIPTION VARCHAR(250),
	LOCATION_DESCRIPTION VARCHAR(150),
	ARREST boolean, 
	DOMESTIC boolean, 
	COMMUNITY_ID int, 
	LATITUDE numeric, 
	LONGITUDE numeric, 
	PRIMARY KEY (CRIME_ID));

ALTER TABLE CRIMES MODIFY COLUMN CRIME_DATE DATETIME;
ALTER TABLE CRIMES MODIFY COLUMN LATITUDE DOUBLE;
ALTER TABLE CRIMES MODIFY COLUMN LONGITUDE DOUBLE;
DESCRIBE CRIMES;

CREATE TABLE COMMUNITY (
	AREA_ID int, 
	COMMUNITY_NAME VARCHAR(250),
	POPULATION int, 
	AREA_SIZE numeric, 
	DENSITY numeric, 
	PRIMARY KEY (AREA_ID));
ALTER TABLE COMMUNITY MODIFY COLUMN AREA_SIZE DOUBLE;
ALTER TABLE COMMUNITY MODIFY COLUMN DENSITY DOUBLE;
describe community;

CREATE TABLE WEATHER (
	WEATHER_DATE date,
	TEMP_HIGH int, 
	TEMP_LOW int, 
	PRECIPITATION numeric, 
	PRIMARY KEY (WEATHER_DATE));

describe WEATHER;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/chicago_crimes_2021.csv' INTO TABLE CRIMES
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (
	@date_str,
	STREET_NAME,
	CRIME_TYPE,
	CRIME_DESCRIPTION,
	LOCATION_DESCRIPTION,
	@arrest,
	@domestic,
	COMMUNITY_ID,
	LATITUDE,
	LONGITUDE)
    SET CRIME_DATE = STR_TO_DATE(@date_str, '%c/%e/%Y %H:%i'),
	ARREST = (@arrest = 'TRUE'),
    DOMESTIC= (@domestic = 'TRUE');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/chicago_areas.csv' INTO TABLE COMMUNITY
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (
	AREA_ID, 
	COMMUNITY_NAME,
	POPULATION, 
	AREA_SIZE, 
	DENSITY);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/chicago_temps_2021.csv' INTO TABLE WEATHER
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (
	@weather_date,
	TEMP_HIGH, 
	TEMP_LOW, 
	PRECIPITATION)
    SET WEATHER_DATE = STR_TO_DATE(@weather_date, '%m/%d/%Y');
    DELETE FROM WEATHER;
    ALTER TABLE WEATHER MODIFY COLUMN PRECIPITATION DOUBLE;

