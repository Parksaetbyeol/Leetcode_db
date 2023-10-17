SELECT name AS 'Customers'
FROM customers C LEFT JOIN orders O ON C.id = O.customerId
WHERE O.customerId IS NULL;
