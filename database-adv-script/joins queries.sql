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
