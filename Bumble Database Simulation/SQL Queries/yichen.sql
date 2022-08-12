/*
The average number of swipes of our least active users (last active date > 2 months):
which illustrates the number of swipes needed to find "love"
*/
/*
SELECT total.swipe/success.suc AS average_swipe
FROM (SELECT count(A.user_ID1) AS suc
	FROM user_has_seen AS A, user_has_seen AS B, Account_and_login_info AS info, user_info AS u
	WHERE A.user_ID1=B.user_ID2 
	AND A.user_ID2=B.user_ID1
	AND A.user_ID1 = u.user_ID
	AND info.user_ID = u.user_ID
	AND ((A.user_ID1_action="right swipe" AND (B.user_ID1_action="right swipe" OR B.user_ID1_action="super swipe"))
	  OR
	 (A.user_ID1_action="super swipe" AND (B.user_ID1_action="right swipe" OR B.user_ID1_action="super swipe"))
	)
	AND DATEDIFF("2021-09-10",info.last_active_date) > 60
    ) as success
    ,
    (SELECT count(A.user_ID1) as swipe
	FROM user_has_seen AS A, Account_and_login_info AS info, user_info AS u
	WHERE A.user_ID1=info.user_ID
	AND info.user_ID = u.user_ID
    ) AS total

*/

/*
Calculate total revenue from subscriptions (all time revenue)
*/

/*
SELECT ROUND(SUM(CEILING(DATEDIFF(
IFNULL(ahs.date_ended,'2021-09-12'),ahs.date_started)/30
))*AVG(s.monthly_price)*2,2) AS total_revenue
FROM account_has_subscription AS ahs, Subscription AS s
WHERE ahs.subscriptionID = s.subscriptionID
AND ahs.subscriptionID = 102
*/

/*
find the conversion rate of users changing from free subscription to paid subscription
*/
/*
SELECT COUNT(DISTINCT sub.idNum)/COUNT(DISTINCT ahs.user_ID) AS conversion_rate
FROM account_has_subscription AS ahs,
(
SELECT ahs.user_ID as idNum
FROM account_has_subscription AS ahs
GROUP BY ahs.user_ID
HAVING SUM(ahs.subscriptionID=102)=1
) AS sub
*/

/*
map out the popularity of hobbies in function of locations 
(where is Yoga the most popular for women/men? etc...)
*/






