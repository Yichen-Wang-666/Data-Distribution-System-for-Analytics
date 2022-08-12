/* Q1
 display the first and last name, and ids of all facilities that 
 has been visited for customer CD0101
 */
/*
SELECT c.C_ID, c.FIRST_NAME, c.LAST_NAME, ft.FACILITY_FACILITY_ID
FROM Ticket AS t
INNER JOIN facility_ticket_id AS ft ON t.TICKET_ID = ft.TICKET_TICKET_ID
INNER JOIN facility AS f ON f.FACILITY_ID = ft.FACILITY_FACILITY_ID
INNER JOIN CUSTOMER AS c ON c.C_ID = t.CUSTOMER_C_ID
WHERE c.C_ID = "CD0101"
GROUP BY ft.FACILITY_FACILITY_ID
*/
-- ----------------------------------------------------------------------------
/*Q2
  display the most popular method of payment based on 
  its amount of sales among all the purchases, as well as
  its total revenue generated
*/

/*
SELECT t.PAYMENT_METHOD_PAYMENT AS payment_id, p.PAYMENT_METHOD_DESC AS description,
COUNT(t.PAYMENT_METHOD_PAYMENT) AS t_count, SUM(t.price) AS total_revenue
FROM ticket AS t
INNER JOIN payment_method AS p ON p.PAYMENT = t.PAYMENT_METHOD_PAYMENT
GROUP BY t.PAYMENT_METHOD_PAYMENT
ORDER BY COUNT(t.PAYMENT_METHOD_PAYMENT) DESC
LIMIT 1
*/
-- ------------------------------------------------------------
/*Q3
  Display all the customer id, name and the ticket id for
  the customer who has visited most of the rides (so an award 
  could be given to that customer) within the last 2 years
*/
/*
SELECT c.C_ID, c.FIRST_NAME, c.LAST_NAME, 
COUNT(DISTINCT rt.RIDE_RIDE_ID) AS num_tried
FROM Ticket AS t
INNER JOIN ride_ticket_id AS rt ON t.TICKET_ID = rt.RIDE_TICKET_ID
INNER JOIN ride AS r ON r.RIDE_ID = rt.RIDE_RIDE_ID
INNER JOIN CUSTOMER AS c ON c.C_ID = t.CUSTOMER_C_ID
GROUP BY c.C_ID
ORDER BY COUNT(DISTINCT rt.RIDE_RIDE_ID) DESC
*/

-- -------------------------------------------------------------
/* Q4 
   Display number of the customers who are below 18 years old 
   number of the customers who are above 18 years old and below 65
   and number of the customers who are above 65 years old 
*/
/*
SELECT SUM(CASE WHEN DATEDIFF('2021/09/08',c.DOB)/365 < 18 THEN 1 ELSE 0 END) AS num_child,
	SUM(CASE WHEN DATEDIFF('2021/09/08',c.DOB)/365 BETWEEN 18 AND 65 THEN 1 ELSE 0 END) AS num_adult,
    SUM(CASE WHEN DATEDIFF('2021/09/08',c.DOB)/365 > 65 THEN 1 ELSE 0 END) AS num_elderly
FROM CUSTOMER AS c

*/
-- -----------------------------------------------------------------
/*Q5
  Calculate the percentage of rides which requries additional 
  fees out of all the rides
*/
/*
SELECT SUM(CASE WHEN r.ADDITIONAL_FEES = 'Y' THEN 1 ELSE 0 END) AS add_fee_required,
	COUNT(r.RIDE_ID) AS num_total,
   SUM(CASE WHEN r.ADDITIONAL_FEES = 'Y' THEN 1 ELSE 0 END)/COUNT(r.RIDE_ID) AS add_fee_percent
FROM RIDE AS r
*/

-- -----------------------------------------------
/*Q6
  if customers who registered before 2018 are considered as early birds, find the facility which
  is in top 5 popularity amongD early birds
*/

/*
SELECT ft.FACILITY_FACILITY_ID, COUNT(ft.facility_ticket_id) 
FROM facility_ticket_id AS ft
INNER JOIN ticket AS t ON t.TICKET_ID = ft.TICKET_TICKET_ID
INNER JOIN (
	SELECT c.C_ID, c.DATE_OF_REG FROM CUSTOMER AS c
	WHERE DATEDIFF('2018/01/01',c.DATE_OF_REG)/365 > 0
) AS sub ON sub.C_ID = t.CUSTOMER_C_ID
GROUP BY ft.FACILITY_FACILITY_ID
ORDER BY COUNT(ft.facility_ticket_id) DESC
LIMIT 5
*/

-- -------------------------------------------------------------
/* Q7
   count the number of visits of each rides in morning and evening in 2019
*/

/*
SELECT rt.RIDE_RIDE_ID, 
SUM(CASE WHEN HOUR(rt.TIME_STAMP) >=6 AND HOUR(rt.TIME_STAMP) <=12 
THEN 1 ELSE 0 END) AS count_morning,
SUM(CASE WHEN HOUR(rt.TIME_STAMP) >12 AND HOUR(rt.TIME_STAMP) <=18 
THEN 1 ELSE 0 END) AS count_afternoon,
SUM(CASE WHEN HOUR(rt.TIME_STAMP) >18 AND HOUR(rt.TIME_STAMP) <=22
THEN 1 ELSE 0 END) AS count_evening
FROM ride_ticket_id AS rt
WHERE YEAR(rt.TIME_STAMP)=2019
GROUP BY rt.RIDE_RIDE_ID
*/
-- --------------------------------------------------------------------

/* Q8
   Check which category of ticket generates the most amount of revenue in DESC order in 2019
*/

/*
SELECT tc.CATEGORY_OF_TICKET_ID, tc.CATEGORY_OF_TICKET_DESC, SUM(t.price) AS total_revenue
FROM ticket AS t
INNER JOIN ticket_category AS tc 
ON t.TICKET_CATEGORY_CATEGORY_OF_TICKET_ID = tc.CATEGORY_OF_TICKET_ID
WHERE YEAR(t.PURCHASE_DATE) = 2019
GROUP BY tc.CATEGORY_OF_TICKET_ID
ORDER BY SUM(t.price) DESC
LIMIT 3
*/

-- ----------------------------------------------------------------------------------

/*Q9
  check the highest price, lowest price and the average price paid by the consumer in year 2020
  who are under the age of 25 
*/
/*
SELECT MAX(t.PRICE) AS max_price, MIN(t.price) AS min_price, AVG(t.price) AS avg_price
FROM ticket AS t
INNER JOIN CUSTOMER AS c ON c.C_ID = t.Customer_C_ID
WHERE YEAR(t.PURCHASE_DATE) = 2020
AND DATEDIFF('2021/09/08',c.DOB)/365 > 25
*/

-- -------------------------------------------------------------------
/*Q10
  List down all the rides whose popularity based on times of visits is above average
  over the past few years
*/


SELECT r.RIDE_ID, r.RIDE_NAME, COUNT(rt.ride_ticket_id) AS popularity
FROM RIDE AS r
INNER JOIN ride_ticket_id AS rt ON r.RIDE_ID = rt.RIDE_RIDE_ID
GROUP BY r.RIDE_ID
HAVING COUNT(rt.ride_ticket_id) > (
	SELECT AVG(popularity) FROM(
	SELECT r.RIDE_ID, r.RIDE_NAME, COUNT(rt.ride_ticket_id) AS popularity
	FROM RIDE AS r
	INNER JOIN ride_ticket_id AS rt ON r.RIDE_ID = rt.RIDE_RIDE_ID
	GROUP BY r.RIDE_ID
) AS sub
)
ORDER BY popularity DESC











