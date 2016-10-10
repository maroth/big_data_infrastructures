SELECT affiliation
FROM Author
NATURAL JOIN Writes
GROUP BY affiliation
HAVING count(paperid) >= ALL (
    SELECT count(paperid)
    FROM Author
    NATURAL JOIN Writes
    GROUP BY affiliation
)