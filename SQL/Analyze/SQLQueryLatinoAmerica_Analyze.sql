use Trabajo3

-- Seleccionamos la base de datos con la que vamos a trabajar / We select the database with which we are going to work

select * from Hoja2


-- Preguntas / Questions

/*

1. ¿Cuáles son las ventas totales y el margen promedio por región y año? / What are the total sales and average margin by region and year?

2. ¿Cuál es el producto con mayor utilidad en cada categoría? / What is the most useful product in each category?

3. ¿Cuál es la desviación estándar del precio de venta por subcategoría? / What is the standard deviation of the sales price by subcategory? 

4. ¿Cuál es el promedio de ventas por segmento y modo de envío? / What is the average sales by segment and shipping mode?

5. ¿Cuál es el producto con mayor descuento promedio por región? / What is the product with the highest average discount by region?

6. ¿Cuál es la diferencia de días promedio entre la fecha de orden y la fecha de envío por modo de envío? / What is the average day difference between order date and shipping date by shipping mode?

7. ¿Cuáles son las ventas totales y la utilidad promedio por cliente? / What are the total sales and average profit per customer?

8. ¿Cuáles son los top 5 productos con mayor cantidad vendida? / What are the top 5 products with the highest quantity sold?

9. ¿Cuál es la utilidad total por año y región? / What is the total profit by year and region?

10. ¿Cómo se comparan las ventas y el costo total por categoría y subcategoría? / How do sales and total cost compare by category and subcategory?

*/


--- 1

select
Region,
Year(Fecha_orden_2) as Año,
sum(Ventas) as ventas_totales,
avg(Margen) as Margen_Promedio
from 
    Hoja2
group by
    Region, Fecha_orden_2
having 
    sum(Margen) = (
        select MAX(Margen_Promedio)
        from (
            select
                Region,
                Fecha_orden_2,
                AVG(Margen) as Margen_Promedio
            from 
                Hoja2
            group by 
                Region, Fecha_orden_2
        ) as Subquery
        where Hoja2.Region = Subquery.Region
    )
order by  Año;





--- 2

select
Producto,
Categoria,
sum(Utilidad) total_utilidad
from    Hoja2
group by
    Producto, Categoria
having 
    sum(Utilidad) = (
        select MAX(total_utilidad)
        from (
            select
                Producto,
                Categoria,
                sum(Utilidad) as total_utilidad
            from 
                Hoja2
            group by 
                Producto, Categoria
        ) as Subquery
        where Hoja2.Categoria = Subquery.Categoria
    )
order by  total_utilidad desc;



---3

select 
STDEV(Precio_venta) as Desviacion_Estandar,
Subcategoria
from Hoja2
group by Subcategoria





---4


select
Segmento,
Modo_envio,
round(avg(total_ventas),1) Promedio_Ventas
from(
select
	Segmento,
	Modo_envio,
	sum(Ventas) total_ventas
	from Hoja2
	group by Segmento,Modo_envio
)sub1
group by Segmento,Modo_envio
order by Promedio_Ventas desc







--- 5

select
Region,
Producto,
avg(Descuento) as Descuento_Promedio
from 
    Hoja2
group by
    Region, Producto
having 
    AVG(Descuento) = (
        select MAX(Descuento_Promedio)
        from (
            select
                Region,
                Producto,
                AVG(Descuento) as Descuento_Promedio
            from 
                Hoja2
            group by 
                Region, Producto
        ) as Subquery
        where Hoja2.Region = Subquery.Region
    )
order by Region, Descuento_Promedio desc;


---6


select
Modo_envio,
round(avg(Diferencia_Tiempo_Orden_Envio),1) Promedio_Tiempo
from(
select
	Id,
	Modo_envio,
	Fecha_orden_2,
	Fecha_envio_2,
	DATEDIFF(day,Fecha_orden_2,Fecha_envio_2) Diferencia_Tiempo_Orden_Envio
	from Hoja2
	group by Id,Modo_envio,Fecha_orden_2,Fecha_envio_2
)sub1
group by Modo_envio
order by Promedio_Tiempo desc



---7

select
Id,
avg(Utilidad) as Utilidad_Promedio,
sum(Ventas) as Ventas_Totales
from 
    Hoja2
group by
    Id
having 
    avg(Utilidad) = (
        select max(Utilidad_Promedio)
        from (
            select
                Id,
                avg(Utilidad) as Utilidad_Promedio
            from 
                Hoja2
            group by 
                Id
        ) as Subquery
        where Hoja2.Id = Subquery.Id
    )and 
sum(Ventas) = (
        select sum(Ventas_Totales)
        from (
            select
                Id,
                sum(Ventas) as Ventas_Totales
            from 
                Hoja2
            group by 
                Id
        ) as Subquery
        where Hoja2.Id = Subquery.Id
    )
order by Utilidad_Promedio desc,Ventas_Totales desc;


--- 8

select TOP 5
Producto,
total_1
from(
select
	Producto,
	Id,
	sum(Ventas) total_1
	from Hoja2
	group by Id,Producto
)sub1
order by total_1 desc


---9

SELECT
    Region,
    YEAR(Fecha_orden_2) AS Año,
    SUM(Utilidad) AS Utilidad_Total
FROM 
    Hoja2
GROUP BY
    Region, YEAR(Fecha_orden_2)
ORDER BY
    Region, Año;




---10
select
    Categoria,
    Subcategoria,
    SUM(Ventas) as Ventas_Totales,
    SUM(Precio_costo * Cantidad) as Costo_Total
from 
    Hoja2
group by 
    Categoria, Subcategoria
order by 
    Categoria, Subcategoria;