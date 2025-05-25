SELECT user_id, COUNT(3) AS total_bookings
FROM bookings
GROUP BY user_id;
