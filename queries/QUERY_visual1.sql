
SELECT type, COUNT(*) AS complaint_count
FROM NYC311
WHERE date BETWEEN '2022-10-01' AND '2023-09-30'
GROUP BY type
ORDER BY complaint_count DESC
LIMIT 3;
