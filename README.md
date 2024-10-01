# olympics-dataset
Practice Writing SQL Queries using Real Dataset

Source: https://techtfq.com/blog/practice-writing-sql-queries-using-real-dataset

<ol>
List of all these 20 :
<<<<<<< HEAD
<li> How many olympics games have been held?
</li><li>List down all Olympics games held so far with columns year, season, city.
</li><li>Mention the total no of nations who participated in each olympics game?
</li><li>Which year saw the highest and lowest no of countries participating in olympics?
</li><li>Which nation has participated in all of the olympic games?
</li><li>Identify the sport which was played in all summer olympics.
</li><li>Which Sports were just played only once in the olympics?
</li><li>Fetch the total no of sports played in each olympic games.
</li><li>Fetch details of the oldest athletes to win a gold medal.
</li><li>Find the Ratio of male and female athletes participated in all olympic games.
</li><li>Fetch the top 5 athletes who have won the most gold medals.
</li><li>Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
</li><li>Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
</li><li>List down total gold, silver and broze medals won by each country.
</li><li>List down total gold, silver and broze medals won by each country corresponding to each olympic games.
</li><li>Identify which country won the most gold, most silver and most bronze medals in each olympic games.
</li><li>Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
</li><li>Which countries have never won gold medal but have won silver/bronze medals?
</li><li>In which Sport/event, India has won highest medals.
</li><li>Break down all olympic games where india won medal for Hockey and how many medals in each olympic games.
</li>
</ol>

<h2>SCHEME</h2>

DROP TABLE IF EXISTS athlete_events;

CREATE TABLE  athlete_events ( id INT, name VARCHAR(255), sex VARCHAR(255), age VARCHAR(255), height VARCHAR(255), weight VARCHAR(255), team VARCHAR(255), noc VARCHAR(255), games VARCHAR(255), year INT, season VARCHAR(255), city
 VARCHAR(255), sport VARCHAR(255), event VARCHAR(255), medal VARCHAR(255));
 
LOAD DATA INFILE 'athlete_events.csv' INTO TABLE athlete_events  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;