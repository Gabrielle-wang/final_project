
WITH MonthlyAvgRent AS (
  SELECT
    ZILLOW.zip,
    AVG("2023-01") AS avg_rent,
    RANK() OVER (ORDER BY AVG("2023-01") DESC) AS high_rank,
    RANK() OVER (ORDER BY AVG("2023-01") ASC) AS low_rank
  FROM
    ZILLOW
  WHERE
    "2023-01" IS NOT NULL  -- Exclude rows where rent is NaN
  GROUP BY
    ZILLOW.zip
),
TopZips AS (
  SELECT
    m.zip,
    m.avg_rent
  FROM
    MonthlyAvgRent m
  WHERE
    m.high_rank <= 5 OR m.low_rank <= 5
)
SELECT
  t.zip,
  t.avg_rent,
  COUNT(DISTINCT n.unique_key) AS nyc311_count
FROM
  TopZips t
LEFT JOIN (
  SELECT zip, unique_key
  FROM NYC311
) n ON t.zip = n.zip
GROUP BY
  t.zip, t.avg_rent
ORDER BY
  t.avg_rent DESC;
