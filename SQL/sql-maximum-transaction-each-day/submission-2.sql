-- Write your query below
SELECT transaction_id
FROM (
    SELECT *, RANK() OVER (PARTITION BY day :: DATE ORDER BY amount DESC) AS rnk
    FROM transactions
) t
WHERE rnk = 1
ORDER BY transaction_id;