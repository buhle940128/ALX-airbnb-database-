INNER JOIN
BOOKING
booking id:primary key,UUID,indexed
property id:Foreign key,references property(property id)
user id:Foreign key,reference user(user id)
start date:DATE,NOT NULL
end date:DATE,NOT NULL
total price:DECIMAL,NOT NULL
status:ENUM(pending,comfirmed,canceled),NOT NULL
FROM bookings
INNER JOIN user on booking id foreign key,reference user(user id)
PROPERTY
property id:primary key,UUID,indexed
host id:Foreign key,references user(user id)
name:VARCHAR,NOT NULL
description:TEXT,NOT NULL
location:VARCHAR,NOT NULL
price pernight:DECIMAL,NOT NULL
created at:TIMESTAMP,DEFUALT CURRENT TIMESTAMP
updated at:TIMESTAMP,ON UPDATE CURRENT TIMESTAMP
FROM properties
LEFT JOIN user on properties id =foreign key id.properties id
user id:primary key,UUID,indexed
first name:VARCHAR,NOT NULL
email:VARCHAR,UNIQUE,NOT NULL
booking id:primary key,UUID,Indexed
start date:DATE, NOT NULL
end date:DATE ,NOT NULL
FROM
users
LEFT JOIN
bookings ON users.user id =booking user id
FULL OUTER JOIN
User id:primary key,uuid,indexed
first name:VARCHAR,NOT NULL
email:VARCHAR,UNIQUE,NOT NULL
booking id:primary key,UUID,Indexed
start date:DATE, NOT NULL
end date:DATE ,NOT NULL
FROM
user
FULL OUTER JOIN
booking b
ON
u.user id=b.userid;
subquery and average rating
property id:primary key,UUID,indexed
description:TEXT,NOT NULL
location:VARCHAR,NOT NULL
FROM 
PROPERTY
WHERE
PROPERTY id IN (
  SELECT
  rating.property id
  FROM
  ratings
  GROUP BY
  ratings.property id
  HAVING
  AVG(rating.rating)>4.0
  CORRELATED SUBQUERY
  SELECT u
  FROM user u
  WHERE(
  SELECT COUNT(5)
  FROM booking b
  WHERE b.user id=u.id
  SELECT user id,count(1)
  SELECT u.id,u name,count(1)
  SELECT
  p.id=property id
  p.name=property name
  count(1) as total booking
  RANK(1) OVER (1(2)
  ROW NUMBER(3)(2)as booking rank
  API ENDPIONT 
  Get/api/property/rankings
  INPUTS
