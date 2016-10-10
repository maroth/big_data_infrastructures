SELECT DISTINCT a1.email
FROM Author a1
NATURAL JOIN Writes w1
NATURAL JOIN Submits s1
WHERE NOT EXISTS (
    SELECT *
    FROM Author a2
    NATURAL JOIN Writes w2
    WHERE w2.paperId = w1.paperId
    AND a1.authorId != a2.authorId
)