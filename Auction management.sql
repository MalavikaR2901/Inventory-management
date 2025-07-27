create database Auction_management;
use Auction_management;
create table user (
user_id int auto_increment primary key,
user_name varchar(50) not null unique,
email_id varchar(50) not null unique,
phone_number varchar(15) not null unique,
user_type enum ('admin', 'seller', 'buyer', 'auctioneer')not null,
status enum ('active', 'inactive', 'suspended') not null,
registration_date datetime not null
);
Alter table user
Add Residence_address varchar(50),
Add street_address varchar(50);
Alter table user
ADD COLUMN city VARCHAR(50),
ADD COLUMN state VARCHAR(50),
ADD COLUMN zip_code VARCHAR(10);
select * from user;
INSERT INTO user (user_name, email_id, phone_number, user_type, status, registration_date)
VALUES
  ('Malavika', 'malavika@gmail.com', 9876543210, 'admin', 'active', '2025-07-15'),
  ('Vivek', 'vivek@gmail.com', '1234567890', 'auctioneer', 'active', '2025-07-14'),
  ('Janeeta', 'janeeta@gmail.com', '1324354657', 'buyer', 'active', '2025-07-13'),
  ('Hridhul', 'hridhul@gmail.com', '1235465768', 'seller', 'active', '2025-07-12');
INSERT INTO user (user_name, email_id, phone_number, user_type, status, registration_date)
VALUES  
  ('Nandhana', 'nandhana@gmail.com', '9234768590', 'auctioneer', 'inactive', '2025-07-21'),
  ('Laiju', 'laiju@gmail.com', '9870654378', 'buyer', 'inactive', '2025-07-20'),
  ('Jubit', 'jubit@gmail.com', '903531435', 'seller', 'inactive', '2025-07-19'),
  ('Nabeel', 'nabeel@gmail.com', '9875467389', 'auctioneer', 'inactive', '2025-07-18');
 drop table user;
UPDATE user
SET
  residence_address = CASE user_id
    WHEN 1001 THEN 'Rose Residency'
    WHEN 1002 THEN 'Skyline Heights'
    WHEN 1003 THEN 'Royal Enclave'
    WHEN 1004 THEN 'Blue Waters'
    WHEN 1005 THEN 'Emerald Villas'
    WHEN 1006 THEN 'Green Gardens'
    WHEN 1007 THEN 'Sunrise Apartments'
    WHEN 1008 THEN 'Maple Residency'
    
  END,
street_address = CASE user_id
    WHEN 1001 THEN '1st Cross Street'
    WHEN 1002 THEN 'MG Road'
    WHEN 1003 THEN 'Main Bazaar Road'
    WHEN 1004 THEN 'Beach View Lane'
    WHEN 1005 THEN 'Library Road'
    WHEN 1006 THEN 'Temple Street'
    WHEN 1007 THEN 'Stadium Road'
    WHEN 1008 THEN 'Hill View Colony'
   
  END,
  city = CASE user_id
    WHEN 1001 THEN 'Thrissur'
    WHEN 1002 THEN 'Kochi'
    WHEN 1003 THEN 'Palakkad'
    WHEN 1004 THEN 'Kozhikode'
    WHEN 1005 THEN 'Kannur'
    WHEN 1006 THEN 'Alappuzha'
    WHEN 1007 THEN 'Kottayam'
    WHEN 1008 THEN 'Pathanamthitta'
    
  END,

  state = 'Kerala',  
  zip_code = CASE user_id
    WHEN 1001 THEN '680001'
    WHEN 1002 THEN '682001'
    WHEN 1003 THEN '678001'
    WHEN 1004 THEN '673001'
    WHEN 1005 THEN '670001'
    WHEN 1006 THEN '688001'
    WHEN 1007 THEN '686001'
    WHEN 1008 THEN '689001'
   
  END

WHERE user_id IN (1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008);
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE auction;
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE auction AUTO_INCREMENT = 1;
create table admin (
user_id int primary key,
admin_password varchar(255) not null unique,
foreign key (user_id) references user(user_id)
);
drop table admin;
insert into admin (admin_password,user_id )
values ('admin@123', 1001);
select * from admin;
create table buyer (
user_id int primary key,
buyer_password varchar(255) not null unique,
foreign key (user_id) references user(user_id)
);
Alter table buyer 
Add first_name varchar(50) not null,
Add last_name varchar (50) not null,
Add dob date;
insert into buyer (user_id, buyer_password, first_name, last_name, dob)
values ('1003', 'buyer@123', 'Janeeta', 'CJ', '2003-07-21' ),
	   ('1006', 'buyer@234', 'Laiju', 'Varghese', '2003-06-23');
       
select * from buyer;
drop table buyer;
create table seller (
user_id int primary key,
seller_password varchar(255) not null unique,
company_name varchar(50) not null,
business_type enum ('Retail', 'Wholesale', 'Manufacturer', 'Service')not null,
bank_account_number varchar(30),
Building_number varchar(50),
Street_address varchar (50),
city varchar(50),
state varchar(50),
zip_code int not null,
email_address varchar(50)not null unique,
foreign key (user_id) references user(user_id)
);
insert into seller (user_id, seller_password,company_name, business_type, bank_account_number, Building_number, Street_address, city, state, zip_code,email_address)
values ('1004', 'seller@123', 'ABC Pvt.Ltd', 'Retail', '286940035678','2379/A','Beach view lane', 'Kozhikode', 'Kerala', '673001', 'hridhul@gmail.com '),
       ('1007', 'seller@234', 'EFG Pvt.Ltd', 'Wholesale', '243570985006', '3425/B', 'Stadium Road', 'Kottayam', 'Kerala', '686001','jubit@gmail.com');
       
drop table seller;
select * from seller;
create table auctioneer (
user_id int not null primary key,
auctioneer_password varchar(255) not null unique,
full_name_or_business_name varchar(10) not null,
Contact_number varchar(10) not null,
Bank_account_number varchar(50), 
Business_address varchar(50),
Email_address varchar(50) not null,
Auctioneer_license_number varchar(10) not null,
Upload_license_document_url varchar(255),
foreign key (user_id) references user(user_id)
);
insert into auctioneer (user_id, auctioneer_password, full_name_or_business_name, Contact_number, Bank_account_number, Business_address, Email_address, Auctioneer_license_number, upload_license_document_url)
values ('1002', 'auctioneer@123', 'Vivek','1234567890', '23436789009', 'Market Road,Kochi,Kerala, 682013', 'vivek@gmail.com', 'NMLS 21345', 'https://example.com/images/license.jpg' ),
       ('1005', 'auctioneer@234', 'Nandhana', '9234768590', '23435465768', 'Maavoor road, Kozhikode, Kerala,670015','nandhana@gmail.com', 'NMLS 12345', 'https://example.com/images/license.jpg'),
       ('1008', 'auctioneer@345','Nabeel', '9875467389','3426578790', 'Batheri road, Kannur, Kerala, 660019', 'nabeel@gmail.com', 'MB-12345', 'https://example.com/images/license.jpg' );
drop table auctioneer;
select * from auctioneer;
create table product (
product_id int primary key,
product_name varchar(50) not null,
product_description text,
category varchar(50) not null,
base_price int not null,
user_id int not null,
foreign key (user_id) references user(user_id),
status enum ('available', 'sold', 'inactive', 'expired') not null,
image_url varchar(255)
);
insert into product (product_id, product_name, product_description, category, base_price, user_id, status, image_url)
VALUES 
(5001, 'iPhone 14 Pro', '128GB, Space Black, Brand New', 'Electronics', 124999.00, 1004, 'available', 'https://example.com/images/iphone14.jpg'),
(5002, 'Vintage Watch', 'Classic wristwatch from the 70s', 'Accessories', 2500.00, 1004, 'available', 'https://example.com/images/watch.jpg'),
(5003, 'Leather Bag', 'Handcrafted leather bag for daily use', 'Fashion', 1800.00, 1004, 'sold', 'https://example.com/images/bag.jpg'),
(5004, 'Antique Mirror', 'A rare mirror with a golden frame', 'Antiques', 4500.00, 1004, 'available', 'https://example.com/images/mirror.jpg'),
(5005, 'Gaming Laptop', 'High-end gaming laptop with RTX 3060', 'Electronics', 75000.00, 1007, 'available', 'https://example.com/images/laptop.jpg'),
(5006, 'Bluetooth Speaker', 'Waterproof portable Bluetooth speaker', 'Electronics', 3000.00, 1007, 'available', 'https://example.com/images/speaker.jpg'),
(5007, 'Smartphone', 'Latest Android smartphone', 'Electronics', 20000.00, 1007, 'available', 'https://example.com/images/phone.jpg');
drop table product;
select * from product;
create table auction (
auction_id int auto_increment primary key,
product_id int not null,
status enum ('pending', 'active', 'closed') not null,
start_time datetime not null,
end_time datetime not null,
final_price decimal(10,2) null,
foreign key (product_id) references product(product_id)
);
select * from auction;
INSERT INTO auction (product_id, status, start_time, end_time, final_price)
VALUES (5001, 'active', '2025-07-15 10:00:00', '2025-07-17 10:00:00', NULL);
INSERT INTO auction (product_id, status, start_time, end_time, final_price)
VALUES 
(5001, 'active',    '2025-07-25 10:00:00', '2025-07-25 17:00:00', NULL),
(5002, 'active',    '2025-07-26 10:00:00', '2025-07-26 17:00:00', NULL),
(5003, 'closed',    '2025-07-27 10:00:00', '2025-07-27 17:00:00', NULL),
(5004, 'active',    '2025-07-28 09:00:00', '2025-07-28 18:00:00', NULL),
(5005, 'active',    '2025-07-29 09:00:00', '2025-07-29 14:00:00', NULL),
(5006, 'active',    '2025-07-19 12:00:00', '2025-07-30 12:00:00', NULL),
(5007, 'active',    '2025-07-20 16:00:00', '2025-07-31 16:00:00', NULL);

drop table auction;
create table bid (
bid_id int auto_increment primary key,
bid_time datetime not null,
product_id int not null,
user_id int not null,
bid_amount decimal(10,2) not null,
foreign key (product_id) references product(product_id),
foreign key (user_id) references buyer(user_id)
);
INSERT INTO bid (bid_time, product_id, user_id, bid_amount)
VALUES
  ('2025-07-25 10:05:00', 5001, 1003, 25000.00),
  ('2025-07-25 10:10:00', 5001, 1006, 50000.00),
  ('2025-07-25 10:15:00', 5001, 1003, 75000.00),
  ('2025-07-25 10:20:00', 5001, 1006, 100000.00);
  select * from bid;
  drop table bid;
create table watchlist (
watchlist_id int auto_increment primary key,
user_id int not null,
added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
product_id int not null,
foreign key (product_id) references product(product_id),
foreign key (user_id) references buyer(user_id)
); 
insert into watchlist (watchlist_id, user_id, added_at, product_id)
values ('2001', '1003', '2025-07-25 10:05:00', '5001');

drop table watch_list;
create table payment (
payment_id int auto_increment primary key,
payment_date datetime not null,
payment_status enum ('pending', 'completed', 'failed'),
payment_method enum ('cash', 'card', 'upi'),
payment_amount decimal(10,2) not null,
user_id int not null,
foreign key (user_id) references buyer(user_id)
); 
INSERT INTO payment (payment_date,payment_status,payment_method,payment_amount,user_id)
VALUES ('2025-07-15 12:30:00','completed','upi',45999.99,1003),
('2025-07-16 10:00:00', 'completed', 'upi', 50000.00,1006);
drop table payment;
create table commission (
commission_id int auto_increment primary key,
commission_amount decimal(10,2) not null,
auction_id int not null,
commission_percentage decimal(5,2) default 0.00,
foreign key (auction_id) references auction(auction_id)
);
INSERT INTO commission (commission_amount, auction_id, commission_percentage)
VALUES (500.00,1, 5.00),
(1000.00,2, 10.00);
drop table commission;
create table report (
report_id int auto_increment primary key,
report_type enum ('user', 'product', 'auction', 'payment', 'violation'),
reference_id INT,
user_id int not null,
report_reason varchar(50) not null,
report_status enum ('pending', 'under review', 'resolved'),
report_date datetime not null,
foreign key (user_id) references user(user_id)
);
INSERT INTO report (report_type, reference_id, user_id, report_reason, report_status, report_date) 
VALUES ('product', 5001, 1003, 'Fake iPhone listing', 'pending', '2025-07-15 12:00:00'),
       ('auction', 1, 1004, 'Suspicious bidding', 'under review', '2025-07-15 12:10:00');
create table dispute (
dispute_id int auto_increment primary key,
auction_id int not null,
user_id int not null,
status enum ('pending', 'under review', 'resolved'),
issue varchar(50) not null,
foreign key (auction_id) references auction(auction_id),
foreign key (user_id) references buyer(user_id)
);
INSERT INTO dispute (auction_id, user_id, status, issue)
VALUES (1, 1003, 'pending', 'Delayed delivery');
select * from dispute;
drop table dispute;
CREATE TABLE live_reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    role ENUM('admin', 'seller', 'buyer', 'auctioneer') NOT NULL,
    action_type VARCHAR(50) NOT NULL,
    bid_id INT,  -- Nullable: only set if the report is bid-related
    reference_id INT,
    reference_table VARCHAR(50),
    description TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (bid_id) REFERENCES bid(bid_id)
);
INSERT INTO live_reports (user_id, role, action_type, bid_id, reference_id, reference_table, description)
VALUES (1003, 'buyer', 'placed bid', 2, 5001, 'product', 'Buyer 1003 placed a bid of ₹25,000 on product 5001');

select user_id, user_name 
from user
where status = 'active';

