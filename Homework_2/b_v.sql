SELECT authorId
FROM Writes w5
JOIN Writes w6 ON w5.paperId = w6.paperId
WHERE w6.authorid IN ALL (
    SELECT w1.authorId
    FROM Writes w1
    JOIN Writes w2 ON w1.paperId = w2.paperId
    WHERE w1.authorId != w2.authorId
    AND w1.authorId = w5.authorId
)
OR w6.authorId NOT IN ANY (
    SELECT w3.authorId
    FROM Writes w3
    JOIN Writes w4 ON w3.paperId = w4.paperId
    WHERE w3.authorId != w4.authorId
    AND w3.authorId = w5.authorId
)

