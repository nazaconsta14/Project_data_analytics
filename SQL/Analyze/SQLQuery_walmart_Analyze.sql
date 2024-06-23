use Trabajo3

-- Seleccionamos la base de datos con la que vamos a trabajar /  We select the database with which we are going to work

select * from Hoja1

-- Preguntas / Questions 

/*

1. ¿Cuál es el nombre del cliente que realizó la compra con el mayor beneficio (Profit)? /  What is the name of the customer who made the purchase with the highest profit (Profit)? 

2. ¿Cuál es el producto más vendido (Order_Quantity) en la región Este (East)? / What is the best-selling product (Order_Quantity) in the Eastern region?

3. ¿Cuál es la fecha de envío (Ship_Date) más reciente en tu base de datos? / What is the most recent Ship_Date in your database?

4. ¿Cuántas ventas se realizaron en la ciudad de Smithtown? / How many sales were made in the city of Smithtown? 

5. ¿Cuál es el promedio de edad (Customer_Age) de los clientes que realizaron compras en la categoría de Office Supplies? / What is the average age (Customer_Age) of customers who made purchases in the Office Supplies category?

6. ¿Cuál es el nombre del producto más caro (Unit_Price)? / What is the name of the most expensive product (Unit_Price)?

7. ¿Cuántos clientes pertenecen al segmento de Corporate? / How many clients belong to the Corporate segment?

8. ¿Cuál es el descuento promedio (Discount) aplicado en las ventas? / What is the average discount applied on sales?

9. ¿Cuál es la suma total de los costos de envío (Shipping_Cost) en tu base de datos? / What is the total amount of shipping costs (Shipping_Cost) in your database?

*/

--1
select
Customer_Name
from Hoja1
where Profit = (select max(Profit) from Hoja1)
 

--2

select Product_Name
from Hoja1 t1
where Region = 'East'
AND Order_Quantity = (
    select MAX(Order_Quantity)
    from Hoja1 t2
    where t2.Region = t1.Region
);

---3

select 
max(Ship_Date_2) as Latest_Shipping_Date
from Hoja1;


---4

select 
sum(Sales) as Total_Sales
from Hoja1
where City ='Smithtown'


---5
 
select
avg(Customer_Age_2)
from Hoja1
where Product_Category ='Office Supplies'


--- 6

select
Product_Name
from Hoja1
where Unit_Price=(select max(Unit_Price) from Hoja1)


---7

select
count(Customer_Name)
from Hoja1
where Customer_Segment='Corporate'

---8

select
avg(Discount) as Total_Discount
from Hoja1
where Region='West' and Product_Category='Furniture'


---9


select
sum(Shipping_Cost)
from Hoja1