show databases;
USE verrukkulluk;
SELECT COUNT(DISTINCT user_id) FROM gerecht_info ORDER BY user_id ASC;

-- Firefox methode voor 
SELECT COUNT(*) AS DistinctUserIds FROM (SELECT DISTINCT user_id FROM gerecht_info);