SELECT name
FROM Author a
NATURAL JOIN Writes
GROUP BY name, paperId
HAVING count(paperId) = 1;