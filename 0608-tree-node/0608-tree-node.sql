SELECT A.id
    ,(CASE WHEN A.p_id IS NULL THEN 'Root'
        WHEN EXISTS(SELECT * FROM TREE T WHERE T.p_id = A.id) THEN 'Inner'
        ELSE 'Leaf'
        END) AS type
FROM Tree A;