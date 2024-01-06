SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM insurance i
WHERE 
    tiv_2015 IN (
        SELECT tiv_2015 
        FROM insurance 
        WHERE pid != i.pid
    )
    AND (lat, lon) NOT IN (
        SELECT lat, lon 
        FROM insurance 
        WHERE pid != i.pid
    );
