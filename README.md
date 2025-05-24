#ALX-AIRBNB-database- to manage its online marketplace for short-term rentals,storing information about listings,hosting,guests,bookings, and reviews and normalized airbnb schema should minimize redundancy and follow database normalization principles to ensure data integrity and efficient storage.potential redundancies could arise from storing customer information multiple times for each booking or repeating location details across different listing.violation of nomalization could lead to inconsistencies,update anomalies and inefficent queries.
#Nomalization.md refers to the process of making something normal or regular.transform data to a standard scale for comparison and analysis
#ENTITIES and Attributes
USER-STORIES MD- Register
As a user, I want to be able to register an account so that I can access the platform and book or list properties.
 Login
As a user, I want to log in to my account so that I can manage my bookings and personal information securely.
 Search Properties
As a user, I want to search for properties using filters like location, price, and dates so that I can find suitable places to book.
 View Property Details
As a user, I want to view detailed information about a property, including photos and amenities, so that I can make an informed booking decision.
Book Property
As a user, I want to book a property for specific dates so that I can reserve my stay in advance.
Make Payment
As a user, I want to make a secure payment for my booking so that I can confirm my reservation.
Cancel Booking
As a user, I want the ability to cancel my booking within a certain period so that I can get a refund if my plans change.
View Booking History
As a user, I want to view my past and upcoming bookings so that I can keep track of my travel schedule.
 Leave Review
As a user, I want to leave a review for a property after my stay so that I can share my experience with other users.
#DESIGN A DATA FLOW DIAGRAM FOR YOUR FEATURES AND FUNCTIONALITIES
#DESIGN A CHARTFLOW FOR SYSTEM PROCESSES
User
User id:primary key,uuid,indexed
first name:VARCHAR,NOT NULL
last name:VARCHAAR,NOT NULL
email:VARCHAAR,UNIQUE,NOT NULL
password hash:VARCHAAR,NOT NULL
phone number:VARCHAAR,NULL
role:ENUM(guest,host,admin),NOT NULL
created at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
PROPERTY
property id:Primary Key,UUID,Indexed
host id:Foreign key,references user(user id)
name:VARCHAAR,NOT NULL
description:TEXT,NOT NULL
location:VARCHAAR,NOT NULL
price pernight:DECIMAL,NOT NULL
created at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
updated at:TIMESTAMP,ON UPDATE CURRENT TIMESTAMP
BOOKING
booking id:primary key,UUID,Indexed
property id:Foreign key,references user(user id)
start date:DATE, NOT NULL
end date:DATE ,NOT NULL
total price:DECIMAL,NOT NULL
status:ENUM(pending,comfirmed,canceled),NOT NULL
created at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
PAYMENT
payment id:primary key,UUID,Indexed
booking id:Foreign key,references booking(booking id)
amount:DECIMAL,NOT NULL
payment date:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
payment method:ENUM(credit card ,paypal,stripe),NOT NULL
REVIEW
review id:primary key,UUID,Indexed
property id:Foreign key,references property(property id)
user id:Foreign key,references user(user id)
rating:INTEGER,CHECK:rating>=1 AND rating<=5,NOT NULL
comment:TEXT,NOT NULL
created at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
MESSAGE
message id:primary key,UUID,Indexed
sender id:Foreign key,references user(user id)
recipient id:Foreign key,reference user(user id)
message body:TEXT,NOT NULL
sent at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
#Constraints
USER TABLE
unique constraint on email.
non-null contraints on required fields
PROPERTY TABLE
foreign key contraint on host id
non-null contraints on essentials attributes.
BOOKING TABLE
FOREIGN KEY constraints on property id and user id.
status must be one of pending,confirmed,or canceled
PAYMENT TABLE
foreign key constraint on booking id,ensuring payment is linkined to valid bookings
REVIEW TABLE
constraints on rating values(1-5)
foreign key constraints on property id and user id
MESSAGE TABLE
foreign key constraints on sender id and recipient id
INDEXING
primary keys:indexed automatically
additional indexes:email in the user table,property id in the property and bookingtables,booking id in the booking and payment table
#NORMALIZATION.MD
USER 
user id:primary key,UUID,indexed
first name:VARCHAR,NOT NULL
last name:VARCHAR,NOT NULL
email:VARCHAR,UNIQUE,NOT NULL
password hash:VARCHAR,NOT NULL
phone number:VARCHAR,NULL
role:ENUM(guest,host,admin),NOT NULL
created at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
PROPERTY
property id:primary key,UUID,indexed
host id:Foreign key,references user(user id)
name:VARCHAR,NOT NULL
description:TEXT,NOT NULL
location:VARCHAR,NOT NULL
price pernight:DECIMAL,NOT NULL
created at:TIMESTAMP,DEFUALT CURRENT TIMESTAMP
updated at:TIMESTAMP,ON UPDATE CURRENT TIMESTAMP
BOOKING
booking id:primary key,UUID,indexed
property id:Foreign key,references property(property id)
user id:Foreign key,reference user(user id)
start date:DATE,NOT NULL
end date:DATE,NOT NULL
total price:DECIMAL,NOT NULL
status:ENUM(pending,comfirmed,canceled),NOT NULL
PAYMENT
payment id:primary key,UUID indexed
booking id:Foreign key,reference booking(booking id)
amount:DECIMAL,NOT NULL
payment date:TIMESTAMP DEFUALT CURRENT TIMESTAMP
payment method:ENUM(credit card,paypal,stripe)NOT NULL
REVIEW
review id:primary key,UUID indexed
property id:Foreign key,reference property(property id)
user id:Foreign key,reference user(user id)
rating:INTEGER,CHECK:rating>=1 AND rating <=5,NOT NULL
comments:TEXT,NOT NULL
created at:TIMESTAMP DEFUALT CURRENT TIMESTAMP
MESSAGE
message id:primary key,UUID indexed
sender id:Foreign key,reference user(user id)
recipient id:Foreign key,reference user(user id)
message body:TEXT,NO NULL
sent at:TIMESTAMP DEFUALT CURRENT TIMESTAMP
#NORMALIZATION STEP focuses on leveraging the structural elements inherent in these data types while carefully preseving tags and markdown features 
#DATABASE-SCRIPT-001
USER
user id:primary key,UUID indexed
PROPERTY
property id:primary key,UUID indexed
host id:Foreign key,reference user(user id)
BOOKING
booking id:primary key,UUID indexed
property id:Foreign key,reference property(property id)
user id:foreign key,reference user(user id)
PAYMENT
payment id:primary key,UUID indexed
booking id:Foreign key,reference booking(booking id)
REVIEW
review id:primary key,UUID indexed
property id:foreign key,reference property(property id)
user id:foreign key,reference user(user id)
MESSAGE
message id:primary key,UUID indexed
sender id:Foreign key,reference user(user id)
recipient id:Foreign key,reference user(user id)
CONSTRAINTS
BOOKING TABLE
Foreign key contraints on property id and user id
PAYMENT TABLE
Foreign key contraint on booking id,ensuring payments linked to valid bookings
INDEXING
primary key:indexed automatically
addtional indexes:property and booking
#SQL CREATE TABLE
User id:primary key,uuid,indexed
first name:VARCHAR,NOT NULL
last name:VARCHAAR,NOT NULL
email:VARCHAAR,UNIQUE,NOT NULL
password hash:VARCHAAR,NOT NULL
phone number:VARCHAAR,NULL
role:ENUM(guest,host,admin),NOT NULL
created at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
property id:Primary Key,UUID,Indexed
host id:Foreign key,references user(user id)
name:VARCHAAR,NOT NULL
description:TEXT,NOT NULL
location:VARCHAAR,NOT NULL
price pernight:DECIMAL,NOT NULL
created at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
updated at:TIMESTAMP,ON UPDATE CURRENT TIMESTAMP
booking id:primary key,UUID,Indexed
property id:Foreign key,references user(user id)
start date:DATE, NOT NULL
end date:DATE ,NOT NULL
total price:DECIMAL,NOT NULL
status:ENUM(pending,comfirmed,canceled),NOT NULL
created at:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
payment id:primary key,UUID,Indexed
booking id:Foreign key,references booking(booking id)
amount:DECIMAL,NOT NULL
payment date:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
payment method:ENUM(credit card ,paypal,stripe),NOT NULL
USER TABLE
unique constraint on email.
non-null contraints on required fields
PROPERTY TABLE
foreign key contraint on host id
non-null contraints on essentials attributes.
BOOKING TABLE
FOREIGN KEY constraints on property id and user id.
status must be one of pending,confirmed,or canceled
PAYMENT TABLE
foreign key constraint on booking id,ensuring payment is linkined to valid bookings
REVIEW TABLE
constraints on rating values(1-5)
foreign key constraints on property id and user id
MESSAGE TABLE
foreign key constraints on sender id and recipient id
INDEXING
primary keys:indexed automatically
additional indexes:email in the user table,property id in the property and bookingtables,booking id in the booking and payment table
#SQL INSERTINSERTINTO table_name (column1, column2, ...
users (id, name, email, password, role)
INTO bookings (id, guest_id, listing_id, check_in, check_out, total, status)
OPTIONAL RETURN INSERT INTO users (name, email, password, role) RETURN
INSERT INTO listings (id, user_id, title, description, location, price, guests, amenities)
Database-adv-script
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

