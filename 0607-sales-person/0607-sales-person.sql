SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (SELECT sales_id 
                        FROM Company C RIGHT JOIN Orders O ON C.com_id = O.com_id  ## USING(com_id)
                        WHERE C.name = 'RED')