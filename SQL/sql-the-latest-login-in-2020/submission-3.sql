-- Write your query below
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM logins
WHERE time_stamp BETWEEN '2020-01-01' AND '2021-01-01'
GROUP BY user_id;