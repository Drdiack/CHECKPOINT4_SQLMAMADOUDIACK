create table Clients(
customerID int PRIMARY KEY ,
Customername VARCHAR(50) NOT NULL ,
email VARCHAR(50) NOT NULL,
Phone varchar (50) NOT NULL );


Create table Commande (
OrderID int PRIMARY KEY,
customerID_FK int,
OrderDate  DATE ,
Foreign Key (customerID_FK) References Clients (customerID));
Create table Products (
productid INT PRIMARY KEY,
Productname VARCHAR(30) NOT NULL,
Producttype VARCHAR (50) NOT NULL,
Price int );

create table OtherDetails ( 
OrderDetailID int PRIMARY KEY,
OrderID_FK int,
ProductID_FK int,
Quantity  int,
Foreign key (OrderID_FK) References Commande (OrderID ),
Foreign Key (ProductID_FK) References  Products (productid));

insert into OtherDetails  (OrderDetailID ,OrderID_FK,ProductID_FK,Quantity)
 Values ( '1' , '101 ' , '1', '2');

insert into OtherDetails  (OrderDetailID ,OrderID_FK,ProductID_FK,Quantity)
 Values ( '2' , '101 ' , '3', '1');

 insert into OtherDetails  (OrderDetailID ,OrderID_FK,ProductID_FK,Quantity)
 Values ( '3' , '102 ' , '2', '3');

 insert into OtherDetails  (OrderDetailID ,OrderID_FK,ProductID_FK,Quantity)
 Values ( '4' , '102 ' , '4', '2');

 insert into OtherDetails  (OrderDetailID ,OrderID_FK,ProductID_FK,Quantity)
 Values ( '5' , '103 ' , '5', '1');

create table TYPE_PRODUITS1(
Productype_id int PRIMARY KEY,
Producttype VARCHAR (50));  

Foreign Key (Producttype_FK) references Products (Producttype);
 
insert into Products  (productid ,Productname,Producttype,Price )
 Values ( '1' , 'Widget A ' , 'Widget ' , '1000');
 insert into Products  (productid ,Productname,Producttype,Price )
 Values ( '2' , 'Widget B ' , 'Widget ' , '1500') 
 insert into Products  (productid ,Productname,Producttype,Price )
 Values ( '3' , 'Gadget X' , 'Gadget  ' , '2000')
 insert into Products  (productid ,Productname,Producttype,Price )
 Values ( '4' , 'Gadget Y' , 'Gadget  ' , '2500')
 insert into Products  (productid ,Productname,Producttype,Price )
 Values ( '5' , 'Doohickey Z ' , 'Doohickey   ' , '3000')

 UPDATE Products  SET Productname='Doohickey Z ' where Productname= 'Doohickey'; 
  UPDATE Products  SET Producttype='Doohickey  ' where Productname= 'Doohickey Z'; 
  select * from  Products;

 select * from Products ;
 insert into Clients (customerID ,Customername,email,Phone )
 Values ( '1' , 'John Smith  ' , 'john@example.com ' , '1234567890');
  insert into Clients (customerID ,Customername,email,Phone )
 Values ( '2' , 'Jane Doe  ' , 'jane.doe@example.com ' , '9876543210');

 insert into Clients  (customerID,Customername,email,Phone )
 Values ( '3' , 'Alice Brown  ' , 'alice.brown@example.com ' , '4567890123 ');

 select * from Clients ; 
 ----Enregistrement de la table Commande

  insert into Commande (OrderID ,customerID_FK,OrderDate)
 Values ( '101' , '1 ' , '2024-05-01 ');
  
   insert into Commande (OrderID ,customerID_FK,OrderDate)
 Values ( '102' , '2 ' , '2024-05-02 ');

   insert into Commande (OrderID ,customerID_FK,OrderDate)
 Values ( '103' , '3' , '2024-05-01');
 select *from Commande ;

----*/// Enregistrement de la table Oder details

 insert into OtherDetails  (OrderDetailID ,OrderID_FK,ProductID_FK,Quantity)
 Values ( '1' , '101 ' , '1', '2');

 
 insert into OtherDetails  (OrderDetailID ,OrderID_FK,ProductID_FK,Quantity)
 Values ( '2' , '101 ' , '3', '1');

 insert into OtherDetails  (OrderDetailID ,OrderID_FK,ProductID_FK,Quantity)
 Values ( '3' , '102 ' , '2', '3');

 insert into OtherDetails  (OrderDetailID ,customerid_FK,orderdate)
 Values ( '1' , '101  ' , '1','2');
 
 insert into Orders  (Orderid ,customerid_FK,orderdate)
 Values ( '102' , '2  ' , '2024-05-02  ');
  
 insert into Orders  (Orderid ,customerid_FK,orderdate)
 Values ( '103' , '3  ' , '2024-05-01  ');
 
 ---Enregistrement de la table TYPE PRODUITS 
INSERT INTO TYPE_PRODUITS1 ( Productype_id ,Producttype)
values ('1','Widget');
 
INSERT INTO TYPE_PRODUITS1 ( Productype_id ,Producttype)
values ('2','gadget ');

INSERT INTO TYPE_PRODUITS1 ( Productype_id ,Producttype)
values ('3','Doohickey ');
Select * from TYPE_PRODUITS1;

-----1	R�cup�rez tous les produits.
select * from  Products ;
-----2 R�cup�rer tous les clients
Select * from Clients;
-----3 R�cup�rez toutes les commandes.
select * from Commande;
---- 4.R�cup�rez tous les types de produits.
select * from  TYPE_PRODUITS1 ;

-----5.	R�cup�rez les noms des produits qui ont �t� command�s par au moins un client, ainsi que la quantit� totale de chaque produit command�.
select Products.Productname ,sum (Quantity) as Quantit�_totale 
from OtherDetails 
 SELECT Commande.OrderID_FK   
FROM OtherDetails ;
 JOIN Clients ON Commande.c = Clients.customerID ;

-----9.	R�cup�rez les noms des produits qui ont �t� command�s par au moins un client, ainsi que la quantit� totale de chaque produit command�.
Select Customername , Products.Productname, (Quantity)  'la quantit� totale'
FROM Customer 
JOIN  Products ON Customer.Customer_id = Products.productid 
jOIN OtherDetails ON Products.productid = OtherDetails.ProductID_FK 
GROUP BY Productname
having quantity >= 1;

----7.	R�cup�rez les noms des clients qui ont pass� une commande chaque jour de la semaine, ainsi que le nombre total de commandes pass�es par chaque client.
SELECT Commande.OrderID, Clients.customerID,Clients.customername ,OrderDate,  Quantity
FROM Commande 
join Clients ON Commande. CustomerID_FK=  Clients.CustomerID
join OtherDetails ON OtherDetails.OrderID_FK = Commande. OrderID ; 

-----8.	R�cup�rez les noms des clients qui ont pass� le plus de commandes, ainsi que le nombre total de commandes pass�es par chaque client.
-----9.	R�cup�rez les noms des produits qui ont �t� le plus command�s, ainsi que la quantit� totale de chaque produit command�.
SELECT  Productname , sum (Quantity)
FROM Clients cl
JOIN Products p
ON cl.customerID = p.Productid
JOIN OtherDetails OD
ON p.Productid = ProductID_FK
GROUP BY Productname;

----10.	R�cup�rez les noms des clients qui ont pass� une commande pour au moins un widget.
SELECT Customername ,Producttype
FROM Clients cl
JOIN Products p
ON cl.CustomerID = p.Productid
JOIN OtherDetails OD
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'widget';
------11.	R�cup�rez les noms des clients qui ont pass� une commande pour au moins un widget et au moins un gadget, ainsi que le co�t total des widgets et gadgets command�s par chaque client.

SELECT Customername,p.Producttype , (Quantity *price) 'co�t total'
FROM Clients cl
JOIN Products p
ON cl.Customerid = p.Productid
JOIN OtherDetails OD
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'Gadget' 
and p.Producttype = 'Widget';
 ------Les clients ont fait des commandes s�par�s Y'en a pas ------

---12.	R�cup�rez les noms des clients qui ont pass� une commande pour au moins un gadget, ainsi que le co�t total des gadgets command�s par chaque client.

SELECT Customername , Producttype , Price, Quantity ,(Price * Quantity) as 'co�t_total'
FROM Clients cl
JOIN Products p
ON cl.Customerid = p.Productid
JOIN OtherDetails OD
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'Widget';

------13.	R�cup�rez les noms des clients qui ont pass� une commande pour au moins un doohickey, ainsi que le co�t total des doohickeys command�s par chaque client.

SELECT Customername,  Quantity , Price , (quantity*price) 'co�t total'
FROM Clients  cl
JOIN Products p
ON cl.Customerid = p.Productid
JOIN OtherDetails OD 
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'Doohickey';

---14.	R�cup�rez les noms des clients qui ont pass� une commande tous les jours de la semaine, ainsi que le nombre total de commandes pass�es par chaque client.

SELECT Customername, sum(quantity) 'le nombre total de commandes pass�es par chaque client'
FROM Customer cl
JOIN Products p
ON cl.Customer_id = p.Productid
JOIN OtherDetails OD 
ON p.Productid = OD.ProductID_FK
WHERE orderDate LIKE '2024-01-%' OR orderDate LIKE '2024-02-%'
GROUP BY Customername;
select* from Commande ;
-----15.	R�cup�rez le nombre total de widgets et de gadgets command�s par chaque client, ainsi que le co�t total des commandes

SELECT  Clients.Customername  sum(quantity) 'Nombre Total', (quantity * Price ) 'co�t total des commandes'
FROM Customer cl
JOIN Products p
ON cl.Customer_id = p.Productid
JOIN OtherDetails OD 
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'widget'AND p.Producttype= 'gadget';








