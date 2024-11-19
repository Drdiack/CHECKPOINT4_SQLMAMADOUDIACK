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

-----1	Récupérez tous les produits.
select * from  Products ;
-----2 Récupérer tous les clients
Select * from Clients;
-----3 Récupérez toutes les commandes.
select * from Commande;
---- 4.Récupérez tous les types de produits.
select * from  TYPE_PRODUITS1 ;

-----5.	Récupérez les noms des produits qui ont été commandés par au moins un client, ainsi que la quantité totale de chaque produit commandé.
select Products.Productname ,sum (Quantity) as Quantité_totale 
from OtherDetails 
 SELECT Commande.OrderID_FK   
FROM OtherDetails ;
 JOIN Clients ON Commande.c = Clients.customerID ;

-----9.	Récupérez les noms des produits qui ont été commandés par au moins un client, ainsi que la quantité totale de chaque produit commandé.
Select Customername , Products.Productname, (Quantity)  'la quantité totale'
FROM Customer 
JOIN  Products ON Customer.Customer_id = Products.productid 
jOIN OtherDetails ON Products.productid = OtherDetails.ProductID_FK 
GROUP BY Productname
having quantity >= 1;

----7.	Récupérez les noms des clients qui ont passé une commande chaque jour de la semaine, ainsi que le nombre total de commandes passées par chaque client.
SELECT Commande.OrderID, Clients.customerID,Clients.customername ,OrderDate,  Quantity
FROM Commande 
join Clients ON Commande. CustomerID_FK=  Clients.CustomerID
join OtherDetails ON OtherDetails.OrderID_FK = Commande. OrderID ; 

-----8.	Récupérez les noms des clients qui ont passé le plus de commandes, ainsi que le nombre total de commandes passées par chaque client.
-----9.	Récupérez les noms des produits qui ont été le plus commandés, ainsi que la quantité totale de chaque produit commandé.
SELECT  Productname , sum (Quantity)
FROM Clients cl
JOIN Products p
ON cl.customerID = p.Productid
JOIN OtherDetails OD
ON p.Productid = ProductID_FK
GROUP BY Productname;

----10.	Récupérez les noms des clients qui ont passé une commande pour au moins un widget.
SELECT Customername ,Producttype
FROM Clients cl
JOIN Products p
ON cl.CustomerID = p.Productid
JOIN OtherDetails OD
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'widget';
------11.	Récupérez les noms des clients qui ont passé une commande pour au moins un widget et au moins un gadget, ainsi que le coût total des widgets et gadgets commandés par chaque client.

SELECT Customername,p.Producttype , (Quantity *price) 'coût total'
FROM Clients cl
JOIN Products p
ON cl.Customerid = p.Productid
JOIN OtherDetails OD
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'Gadget' 
and p.Producttype = 'Widget';
 ------Les clients ont fait des commandes séparés Y'en a pas ------

---12.	Récupérez les noms des clients qui ont passé une commande pour au moins un gadget, ainsi que le coût total des gadgets commandés par chaque client.

SELECT Customername , Producttype , Price, Quantity ,(Price * Quantity) as 'coût_total'
FROM Clients cl
JOIN Products p
ON cl.Customerid = p.Productid
JOIN OtherDetails OD
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'Widget';

------13.	Récupérez les noms des clients qui ont passé une commande pour au moins un doohickey, ainsi que le coût total des doohickeys commandés par chaque client.

SELECT Customername,  Quantity , Price , (quantity*price) 'coût total'
FROM Clients  cl
JOIN Products p
ON cl.Customerid = p.Productid
JOIN OtherDetails OD 
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'Doohickey';

---14.	Récupérez les noms des clients qui ont passé une commande tous les jours de la semaine, ainsi que le nombre total de commandes passées par chaque client.

SELECT Customername, sum(quantity) 'le nombre total de commandes passées par chaque client'
FROM Customer cl
JOIN Products p
ON cl.Customer_id = p.Productid
JOIN OtherDetails OD 
ON p.Productid = OD.ProductID_FK
WHERE orderDate LIKE '2024-01-%' OR orderDate LIKE '2024-02-%'
GROUP BY Customername;
select* from Commande ;
-----15.	Récupérez le nombre total de widgets et de gadgets commandés par chaque client, ainsi que le coût total des commandes

SELECT  Clients.Customername  sum(quantity) 'Nombre Total', (quantity * Price ) 'coût total des commandes'
FROM Customer cl
JOIN Products p
ON cl.Customer_id = p.Productid
JOIN OtherDetails OD 
ON p.Productid = OD.ProductID_FK
Where p.Producttype = 'widget'AND p.Producttype= 'gadget';








