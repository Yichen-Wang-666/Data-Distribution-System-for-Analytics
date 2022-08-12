/*Q1. Customers usually won’t come to the amusement park when the lowest temperature 
is below 5 degree Celsius. Find out the proportion of the days where customers 
don’t want to come because of the weather in the past 2 years. */

/*
SELECT SUM(CASE WHEN w.TEMP_MIN < 5 THEN 1 ELSE 0 END) AS DAY_COLD,
       COUNT(w.DATE) AS DAY_TOTAL,
   SUM(CASE WHEN w.TEMP_MIN < 5 THEN 1 ELSE 0 END)/COUNT(w.DATE) AS PERCENTAGE
FROM WEATHER AS w
*/

/*Q2. Find the number of visits for each rides in spring, summer, fall and winter in 2019
Assumption: spring is from march to may, summer is from june to august, fall is 
from september to november, winter is from december to feburary.*/

/*SELECT rt.RIDE_RIDE_ID, 
SUM(CASE WHEN MONTH(rt.TIME_STAMP) >=3 AND MONTH(rt.TIME_STAMP) <=5 
THEN 1 ELSE 0 END) AS count_spring,
SUM(CASE WHEN MONTH(rt.TIME_STAMP) >=6 AND MONTH(rt.TIME_STAMP) <=8 
THEN 1 ELSE 0 END) AS count_summer,
SUM(CASE WHEN MONTH(rt.TIME_STAMP) >=9 AND MONTH(rt.TIME_STAMP) <=11
THEN 1 ELSE 0 END) AS count_fall,
SUM(CASE WHEN MONTH(rt.TIME_STAMP) =12 AND MONTH(rt.TIME_STAMP) <=2 
THEN 1 ELSE 0 END) AS count_winter
FROM ride_ticket_id AS rt
WHERE YEAR(rt.TIME_STAMP)=2019
GROUP BY rt.RIDE_RIDE_ID*/

/*Q3. Find the average number of visits per day for each facility when raining

/*SELECT COUNT(ft.facility_ticket_id)/COUNT(ft.WEATHER_DATE)
FROM FACILITY_TICKET_ID AS ft
INNER JOIN WEATHER AS w ON w.DATE = ft.WEATHER_DATE
WHERE w.TOTAL_RAIN >0
GROUP BY ft.FACILITY_FACILITY_ID*/


/*Q4. Find the percentage of days are there in 2019 where there is no snow and there is no rain

/*SELECT SUM(CASE WHEN w.TOTAL_RAIN = 0 AND w.TOTAL_SNOW=0 THEN 1 ELSE 0 END)
	AS DAY_CLEAR,COUNT(w.DATE) AS DAY_TOTAL,
       SUM(CASE WHEN w.TOTAL_RAIN = 0 AND w.TOTAL_SNOW=0 THEN 1 ELSE 0 END
	)/COUNT(w.DATE) AS PERCENTAGE
FROM WEATHER AS w
WHERE YEAR(w.DATE)=2019*/

/*Q5. Find the average amount of snow and rains in 2019 in december
 where the temperature is above -10 degree celsius.

/*SELECT AVG(w.TOTAL_SNOW), AVG(w.TOTAL_RAIN)
FROM WEATHER AS w
WHERE (w.TEMP_MEAN) >-10.0
AND YEAR(w.DATE)=2019
AND MONTH(w.DATE)=12*/