INDEXED RECOMMENDATIONS
| Table        | Suggested Indexes                                                |
| ------------ | ---------------------------------------------------------------- |
| `users`      | `email`, `status`, `created_at,end date`                                  |
| `bookings`   | `(user_id, booking_date)`, `property_id`, `status`, `created_at`end date |
| `properties` | `location`, `price`, `owner_id`, `status`, `created_at`updated at          |
-- Indexes for User table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_status ON users(status);
CREATE INDEX idx_users_created_at ON users(created_at);
-- Indexes for Booking table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
-- Indexes for Property table
CREATE INDEX idx_properties_owner_id ON properties(owner_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);
CREATE INDEX idx_properties_status ON properties(status);
CREATE INDEX idx_properties_created_at ON properties(created_at);
To measure SQL query performance before and after adding indexes for estimated query execution plans and for actual runtime performance
