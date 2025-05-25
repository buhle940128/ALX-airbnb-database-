SELECT user_id, COUNT(3) AS total_bookings
FROM bookings
GROUP BY user_id;
SELECT
p.id= property id
p.name= property name,
COUNT(1)=total bookings,
RANK(1)OVER(ORDER BY COUNT()DESC)AS BOOKING RANK
FROM property=p
LEFT JOIN bookings b ON p.id=property id
GROUP BY p.id,p.name
