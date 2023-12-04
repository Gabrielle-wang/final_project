
SELECT z.zip, COUNT(DISTINCT t.tree_id) as num_trees
FROM tree t
INNER JOIN zipcode z ON ST_Within(t.geometry, z.geometry)
GROUP BY z.zip
ORDER BY num_trees DESC
LIMIT 10;
