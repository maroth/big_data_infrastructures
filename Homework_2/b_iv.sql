SELECT name, count(paperId)
FROM Author
NATURAL JOIN Writes
NATURAL JOIN Submits 
WHERE isAccepted = TRUE
GROUP BY authorid
HAVING count(paperId) >= ALL (
    SELECT count(paperId)
    FROM Author
    NATURAL JOIN Writes
    NATURAL JOIN Submits 
    WHERE isAccepted = TRUE
    GROUP BY authorid
)