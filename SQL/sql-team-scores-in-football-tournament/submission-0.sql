-- Write your query below
WITH 
points AS
(SELECT host_team, guest_team,
            CASE
              WHEN host_goals > guest_goals THEN 3
              WHEN host_goals = guest_goals THEN 1
              ELSE 0
            END AS host_points,
            CASE
              WHEN host_goals < guest_goals THEN 3
              WHEN host_goals = guest_goals THEN 1
              ELSE 0
            END AS guest_points
     FROM matches),

collapsed_points (team_id, points) AS 
(SELECT host_team, host_points FROM points
UNION ALL 
SELECT guest_team, guest_points FROM points)

SELECT t.team_id, team_name, COALESCE(SUM(points), 0) AS num_points
FROM collapsed_points p
RIGHT JOIN teams t ON p.team_id = t.team_id
GROUP BY t.team_id, team_name
ORDER BY num_points DESC, t.team_id ASC;
            