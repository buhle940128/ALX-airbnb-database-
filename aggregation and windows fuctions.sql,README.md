SELECT user_id, COUNT() AS total_bookings
FROM bookings
GROUP BY user_id;
