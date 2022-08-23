SELECT p.productLine, SUM(sales) as total_sale
FROM products as p
LEFT JOIN (
	SELECT productCode, SUM(quantityOrdered*priceEach) as sales
    FROM orderdetails
    GROUP BY productCode
) AS sub on sub.productCode = p.productCode
GROUP BY p.productLine
ORDER BY sum(sales) DESC