SELECT o.orderNumber as orderNumber, o.orderDate as orderDate,
SUM(od.quantityOrdered*od.priceEach) as PriceTotal,
c.country as country, c.state as state, c.city as city
FROM orders as o, orderdetails as od, customers as c
WHERE o.orderNumber=od.orderNumber
AND c.customerNumber=o.customerNumber
GROUP BY o.orderNumber