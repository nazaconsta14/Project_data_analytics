use Trabajo3

-- Seleccionamos la base de datos para hacer un primer vistazo / We select the database to take a first look

select * from Hoja1

--  Nos fijamos en los valores nulos que hay en la base de datos / We look at the null values ​​that are in the database

select * from Hoja1 where Customer_Age is null

-- Procedemos a sustituirlos por buenos valores / We proceed to replace them with good values 


select a.Customer_Segment,a.Customer_Age,b.Customer_Segment,b.Customer_Age,isnull(a.Customer_Age,b.Customer_Age)
from Hoja1 a
join Hoja1 b
    on a.Customer_Segment=b.Customer_Segment
	and a.[Row_ID ] <> b.[Row_ID ]
where a.Customer_Age is null



update a
set Customer_Age=isnull(a.Customer_Age,b.Customer_Age)
from Hoja1 a
join Hoja1 b
    on a.Customer_Segment=b.Customer_Segment
	and a.[Row_ID ] <> b.[Row_ID ]
where a.Customer_Age is null


-- agregar ciertas columnas nuevas para reemplazar las columnas que contienen errores / add certain new columns to replace columns that contain errors


alter table Hoja1
add Customer_Age_2 int

alter table Hoja1
add Ship_Date_2 Date;

alter table Hoja1
add Order_Date_2 Date;

ALTER TABLE Hoja1
ADD Season INT;

select Ship_Date, convert(Date,Ship_Date) as Ship_Date_2
from Hoja1;

--- convertir fecha  que se encontraba en float a date / convert date that was in float to date
SELECT CAST(CONVERT(varchar(8), Order_Date) AS date) AS Order_Date_converted
FROM Hoja1;


--- Procedemos a pasar los valores de las columnas antiguas a las nuevas y permanentes / We proceed to pass the values ​​of the old columns to the new and permanent ones


update Hoja1
set Customer_Age_2 = convert(int,Customer_Age) ;


update Hoja1
set Ship_Date_2 = convert(Date,Ship_Date) ;


UPDATE Hoja1
SET Order_Date_2 = CAST(CONVERT(varchar(8), Order_Date) AS date);


UPDATE Hoja1
SET Season = YEAR(Order_Date_2);



--- Procedemos a eliminar las columnas que ya no necesitamos / We proceed to eliminate the columns that we no longer need

alter table Hoja1
drop column Ship_Date,Order_Date,Order_Date_3,Customer_Age





