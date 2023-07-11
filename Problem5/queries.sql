-- SQL queries for Problem 5
-- Assuming you have a table called TimeSeries with the following schema:
-- Name VARCHAR(255)
-- Start DATETIME
-- End DATETIME
-- Activity VARCHAR(255)
-- 


SELECT
    t1.Name AS 'Bot Name',
    t1.Start AS 'Start',
    t2.End AS 'End',
    GROUP_CONCAT(t1.Activity ORDER BY t1.Start SEPARATOR ', ') AS 'Activities'
FROM
    TimeSeries t1
JOIN
    TimeSeries t2 ON t1.Name = t2.Name AND t1.Start <= t2.End
GROUP BY
    t1.Name, t1.Start, t2.End
ORDER BY
    t1.Name, t1.Start
