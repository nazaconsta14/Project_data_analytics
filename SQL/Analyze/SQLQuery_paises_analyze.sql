use Trabajo3

-- Seleccionamos la base de datos con la que vamos a trabajar /  We select the database with which we are going to work

select * from country_2

-- Preguntas / Questions 

/*

1. ¿Cuál es el país con más registros de pedidos? / Which country has the most order records?

2. ¿Cuál es la ciudad que más ganancia ha generado? / Which is the city that has generated the most profit?

3. ¿Cuál es el segmento de clientes que más compras ha realizado? / What is the customer segment that has made the most purchases?

4. ¿Cuál es el producto más vendido en la categoría de muebles? / What is the best-selling product in the furniture category?

5. ¿Cuál es el estado con la orden de venta más antigua? / What is the state with the oldest sales order?

6. ¿Cuál es el promedio de ventas por año? / What is the average sales per year?

7. ¿Cuántos productos se han vendido en total? / How many products have been sold in total?

8. ¿Cuál es el país con el mayor promedio de descuento aplicado? / How many products have been sold in total?

9 ¿Cuántos pedidos han sido enviados el mismo día? / How many orders have been shipped on the same day?

*/

--1
select 
Country,
sum(Sales) as Total_Sales
from Country_2
group by Country
order by Total_Sales desc

--2
select 
City,
sum(Sales)Sales_City
from Country_2
group by City
order by Sales_City desc

--3
select
Segment,
sum(Sales)Sales_Segment
from Country_2
group by Segment
order by Sales_Segment desc


-- 4

SELECT Product_Name
FROM Country_2
WHERE Category = 'Furniture'
GROUP BY Product_Name
ORDER BY SUM(Quantity) desc

--5
select
State,
min(Ship_Date_2) Older_Date
from Country_2
group by State
order by Older_Date asc



--6
select
Year_2,
avg(Sales) as Sales_per_Year
from Country_2
group by Year_2


--7
SELECT
SUM(Quantity) AS Total_Productos_Vendidos
FROM Country_2;





--8

select
Country,
sum(discount) as Discount_Country
from Country_2
group by Country


--9

select
Ship_Date_2,
count(*) as Same_day_shipments
from Country_2
where Ship_Date_2 = Ship_Date_2
group by Ship_Date_2
order by Same_day_shipments desc



