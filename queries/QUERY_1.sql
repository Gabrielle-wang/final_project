
SELECT zip, COUNT(DISTINCT n.unique_key) as num_complaints 
FROM NYC311 n
WHERE date BETWEEN '2022-10-01' AND '2023-09-30' 
GROUP BY zip 
ORDER BY num_complaints DESC;
