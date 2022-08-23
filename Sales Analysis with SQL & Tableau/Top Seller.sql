SELECT DISTINCT p.productCode, p.productName, SUM(od.quantityOrdered) AS order_quantity, p.quantityInStock AS stock
FROM products AS p, orderdetails AS od
WHERE p.productCode=od.productCode
GROUP BY p.productCode
ORDER BY SUM(od.quantityOrdered) DESC
LIMIT 10

