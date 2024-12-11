create database hamza_sql_1

create table customer_table(
C_id int PRIMARY KEY,
C_name nvarchar(20),
C_address varchar(50),
C_city nvarchar(15)
);

select * from order_table
select * from customer_table


insert into customer_table values(1001,'Hamza','Liaquatabad','Karachi')
insert into customer_table values(1002,'Ali','Nazimabad','Karachi')
insert into customer_table values(1003,'Talal','DHA','Islamabad')
insert into customer_table values(1004,'Rameez','Gulshan','Karachi')
insert into customer_table values(1005,'Abdullah','Liaquatabad','Karachi')
insert into customer_table values(1006,'Anfal','Highway','Lahore')


create table order_table(
Or_id int PRIMARY KEY,
Or_item nvarchar(20),
Or_quantity int,
Or_price money,
C_id int REFERENCES customer_table(C_id)
);

insert into order_table values(101,'Mouse',10,1500,1003)
insert into order_table values(102,'Kayboard',20,1000,1006)
insert into order_table values(103,'Graphic Card',12,10000,1005)
insert into order_table values(104,'HDMI Cable',24,800,1004)
insert into order_table values(105,'DPI Cable',23,1200,1002)
insert into order_table values(106,'Motherboard',8,8000,1001)


--View records using where clause

select * from customer_table
where C_name = 'Hamza'

select * from customer_table
where C_id <= 1005 

select * from order_table
where Or_price between 10000 AND 12000

select * from customer_table
where C_city IN('Karachi')


select * from customer_table
where C_city NOT IN('Karachi')


select * from customer_table
where C_name like 'H___a'

select * from customer_table
where C_name like '%a'


select * from customer_table
where C_name like 'H%%a'


---Group by with all and where
select Or_item, sum (Or_price) as 'Total Price'
from order_table
where Or_item like 'M%' OR Or_item like 'k%'
group by all Or_item

---Truncate table
truncate table order_table
select * from order_table

---Order by clause
select C_name from customer_table
order by C_name desc
select C_name from customer_table
order by C_name asc

---Group by with null
select Or_item, sum(Or_price) as 'Total Ammount'
from order_table
where Or_item IS null
group by all Or_item

select top 3 * from order_table;
select * from order_table
select top 20 percent * from order_table;
select distinct Or_item from order_table;

select * from order_table

select Or_item, sum (Or_price) as Total_price
from order_table
group by Or_item
having Or_item in ('Graphic Card');

select Or_item, sum (Or_price) as Total_price
from order_table
where Or_item in ('Graphic Card')
group by Or_item

select Or_item, sum (Or_price) as Total_price
from order_table
where Or_item in ('Graphic Card', 'Mouse', 'Motherboard')
group by Or_item
having sum(Or_price) >= 1000;



create table personal_table (
PersonID int,
FirstName nvarchar (25),
Gender nvarchar (5),
Age int,
ContactNo int

);

select * from person_table

select * from order_table2



create table person_table(
PersonID int PRIMARY KEY,
FirstName nvarchar(20),
Gender varchar(5),
Age int,
ContactNo int
);

insert into person_table values(1001,'Hamza','Male',20, 0337-8022639)
insert into person_table values(1002,'Ali','Male',21, 0333-5684125)
insert into person_table values(1003,'Anabiii','Female',24, 0321-9854127)
insert into person_table values(1004,'Maha','Female',20, 0315-5424127)
insert into person_table values(1005,'Sabih','Male',19, 0378-52389412)
insert into person_table values(1006,'Bilal','Male',25, 0322-6547231)
insert into person_table values(1007,'Hamza','Male',20, 0322-6521348)
insert into person_table values(1008,'Asad','Male',20, 0322-234578)



create table order_table2(
OrderId int PRIMARY KEY,
OrderNumber nvarchar(20),
PersonID int REFERENCES person_table(PersonID),
OrderPrice money,
);

select * from order_table2

insert into order_table2 values(101,'A21RA',1001,50000)
insert into order_table2 values(102,'BN21RA',1002,5000)
insert into order_table2 values(103,'LA21RA',1005,25000)
insert into order_table2 values(104,'UY21RA',1006,6000)
insert into order_table2 values(105,'RE21RA',1007,450000)
insert into order_table2 values(106,'OP21RA',1008,9000)

---INNER JOIN
select order_table2.OrderId, order_table2.OrderNumber, order_table2.PersonID
from order_table2 INNER JOIN person_table
on order_table2.PersonID = person_table.PersonID

---RIGHT JOIN
SELECT order_table2.OrderId, order_table2.OrderNumber, order_table2.PersonID FROM order_table2 RIGHT JOIN person_table
ON order_table2.PersonID = person_table.PersonID;


---LEFT JOIN
SELECT order_table2.OrderId, order_table2.OrderNumber, order_table2.PersonID FROM order_table2 RIGHT JOIN person_table
ON order_table2.PersonID = person_table.PersonID;


---FULL JOIN
SELECT * 
FROM order_table2
FULL JOIN person_table
ON order_table2.PersonID = person_table.PersonID;

---SELFJOIN
create table Employee_Manager (
Emp_Id int,
Emp_name varchar(25),
Manager_Id int
);
select * from Employee_Manager

insert into Employee_Manager values(1,'Ali',4);
insert into Employee_Manager values(2,'Hamza',3);
insert into Employee_Manager values(3,'Talal',1);
insert into Employee_Manager values(4,'Rameez',5);
insert into Employee_Manager values(5,'Abdullah',2);


select M.Emp_name as Manager,E.Emp_name as Employee from Employee_Manager as E
inner join Employee_Manager as M
on E.Emp_Id = M.Manager_Id;


create table rider_table(
OrderId int PRIMARY KEY,
OrderNumber nvarchar(20),
CustomerId int REFERENCES person_table(PersonID),
OrderPrice money,
);

insert into rider_table values(101,'A21RA',1001,50000)
insert into rider_table values(102,'BN21RA',1002,5000)
insert into rider_table values(103,'LA21RA',1005,25000)
insert into rider_table values(104,'UY21RA',1006,6000)
insert into rider_table values(105,'RE21RA',1007,450000)
insert into rider_table values(106,'OP21RA',1008,9000)

select * from rider_table

SELECT * 
FROM order_table2
FULL JOIN person_table,rider_table
 ON order_table2.PersonID = person_table.PersonID = rider_table.OrderId;


 SELECT *
FROM order_table2 thirdjoin
FULL JOIN person_table p ON thirdjoin.PersonID = p.PersonID
FULL JOIN rider_table r ON thirdjoin.OrderId = r.OrderId;
