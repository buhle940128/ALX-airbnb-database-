SELECT
booking id:primary key,UUID,indexed
start date:DATE,NOT NULL
end date:DATE,NOT NULL
status:ENUM(pending,comfirmed,canceled),NOT NULL
User id:primary key,uuid,indexed
first name:VARCHAR,NOT NULL
email:VARCHAR,UNIQUE,NOT NULL
property id:primary key,UUID,indexed
location:VARCHAR,NOT NULL
price pernight:DECIMAL,NOT NULL
payment id:primary key,UUID,Indexed
amount:DECIMAL,NOT NULL
payment date:TIMESTAMP,DEFAULT CURRENT TIMESTAMP
