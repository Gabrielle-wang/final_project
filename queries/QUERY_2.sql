
SELECT zip, COUNT(DISTINCT t.tree_id) as num_trees
FROM TREE t
GROUP BY zip
ORDER BY num_trees DESC
LIMIT 10;
