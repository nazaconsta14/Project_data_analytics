use Trabajo3

-- Seleccionamos la base de datos para hacer un primer vistazo / We select the database to take a first look
select * from Country_2

--  Nos fijamos en los valores nulos que hay en la base de datos / We look at the null values ​​that are in the database

select * from Country_2 where Postal_Code is null

-- Procedemos a sustituirlos por buenos valores / We proceed to replace them with good values 


select a.Customer_ID,a.Postal_Code,b.Customer_ID,b.Postal_Code,isnull(a.Postal_Code,b.Postal_Code)
from Country_2 a
join Country_2 b
    on a.Customer_ID=b.Customer_ID
	and a.Row_ID <> b.Row_ID
where a.Postal_Code is null


UPDATE a
SET Postal_Code = ISNULL(a.Postal_Code, b.Postal_Code)
FROM Country_2 a
JOIN Country_2 b ON a.Customer_ID = b.Customer_ID
AND a.Row_ID <> b.Row_ID
WHERE a.Postal_Code IS NULL;



UPDATE a
SET Postal_Code = ISNULL(a.Postal_Code, b.Postal_Code)
FROM Country_2 a
JOIN Country_2 b ON a.Order_ID = b.Order_ID
AND a.Row_ID <> b.Row_ID
WHERE a.Postal_Code IS NULL;



UPDATE a
SET Postal_Code = ISNULL(a.Postal_Code, b.Postal_Code)
FROM Country_2 a
JOIN Country_2 b ON a.Product_ID = b.Product_ID
AND a.Row_ID <> b.Row_ID
WHERE a.Postal_Code IS NULL;

-- agregamos ciertas columnas nuevas para reemplazar las columnas que contienen errores / add certain new columns to replace columns that contain errors


alter table Country_2
add Order_Date_2 Date;

alter table Country_2
add Ship_Date_2 Date;

alter table Country_2
add Year_2 INT;

--- Procedemos a pasar los valores de las columnas antiguas a las nuevas y permanentes / We proceed to pass the values ​​of the old columns to the new and permanent ones

update Country_2
set Order_Date_2 = convert(Date,Order_Date) 


update Country_2
set Ship_Date_2 = convert(Date,Ship_Date) 

update Country_2
set Year_2 = convert(INT,Year) 

--- Procedemos a eliminar las columnas que ya no necesitamos / We proceed to eliminate the columns that we no longer need

alter table Country_2
drop column Order_Date,Ship_Date,Year





