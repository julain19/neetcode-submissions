-- Write your query below
WITH wins AS (
    SELECT wimbledon AS player_id FROM championships
    UNION ALL
    SELECT fr_open FROM championships
    UNION ALL
    SELECT us_open FROM championships
    UNION ALL
    SELECT au_open FROM championships
)
SELECT p.player_id, p.player_name, COUNT(*) AS grand_slams_count
FROM players p
JOIN wins w ON p.player_id = w.player_id
GROUP BY p.player_id, p.player_name;