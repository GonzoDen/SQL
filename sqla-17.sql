SELECT f.member_name, f.status, SUM(p.amount * p.unit_price) as costs
FROM FamilyMembers f JOIN Payments p ON f.member_id = p.family_member
WHERE YEAR(p.date)=2005
GROUP BY f.member_name, f.status
;