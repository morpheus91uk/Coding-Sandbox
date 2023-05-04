-- --------------------------------------------------------------------------------------
-- ASSIGNMENT ---------------------------------
-- Create the world-relational-data Schema from the image provided. 
-- Underlined columns are PRIMARY KEYS
-- One of which is a composit PRIMARY KEY
-- FOREIGN KEYS REFERENCED VIA THE ARROWS on the diagram
-- Always leave adding FOREIGN KEYS to the end, add them after through ALTER keyword

-- -------------------------------------------------------------------------------
-- Create the Task2 Database;
CREATE DATABASE Task2;
-- TO use the Task2 Database;
USE Task2;
-- Create the Country table, with columns, Code PK, Name, Population, Capital;
CREATE TABLE Country(Code INT PRIMARY KEY, Name VARCHAR(30), Population INT, Capital INT);
-- Create the City table, with columns, ID PK, Name, CountryCode, Population;
CREATE TABLE City(ID INT PRIMARY KEY, Name VARCHAR(30), CountryCode INT, Population INT);
-- Create the CountryLanguage table, with columns, CountryCode PK, Language PK, IsOffical, Percentage;
CREATE TABLE CountryLanguage(CountryCode INT, Language INT, IsOfficial BOOLEAN, Population INT);
-- to set the multiple PRIMARY KEYS for the CountryLanguage table;
ALTER TABLE CountryLanguage
ADD CONSTRAINT CountryLanguage_PK PRIMARY KEY (CountryCode, Language);
-- to add FOREIGN KEYs TO the tables;---------
-- Country tables FOREIGN KEYS;
ALTER TABLE Country
ADD FOREIGN KEY (Capital) REFERENCES City(ID); 
-- City tables FOREIGN KEYS;
ALTER TABLE City
ADD FOREIGN KEY (CountryCode) REFERENCES Country(Code);
-- CountryLangauge tables FOREIGN KEYS;
ALTER TABLE CountryLanguage
ADD CONSTRAINT FOREIGN KEY (CountryCode) REFERENCES Country(Code);
ALTER TABLE CountryLanguage
ADD CONSTRAINT FOREIGN KEY (Language) REFERENCES Country(Code);
-- -------------------------------------------------------------------------------------------------


