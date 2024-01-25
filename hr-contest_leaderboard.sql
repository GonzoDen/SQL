SELECT h.hacker_id, h.name, sumsc.total_score
FROM (SELECT hacker_id, sum(max_score) as total_score
      FROM (select hacker_id, max(score) as max_score
            from submissions
            group by hacker_id, challenge_id) maxsc
      GROUP BY hacker_id) sumsc
JOIN hackers h ON sumsc.hacker_id = h.hacker_id    
WHERE total_score > 0
ORDER BY total_score DESC, hacker_id ASC;
