use Trabajo3

-- Aca vemos la base de datos,para ver si contiene valores null o columnas configuradas de forma erronea / Here we see the database, to see if it contains null values ​​or incorrectly configured columns

select * from Hoja2


-- Añadimos dos columnas de tipo fecha /  We add two date type columns
alter table Hoja2
add Fecha_orden_2 Date;

alter table Hoja2
add Fecha_envio_2 Date;

-- Aca actualizamos las nuevas columnas con la informacion de las viejas / Here we update the new columns with the information from the old ones

update Hoja2
set Fecha_orden_2 = convert(Date,Fecha_orden) ;


update Hoja2
set Fecha_envio_2 = convert(Date,Fecha_envio) ;

-- Por ultimo procedemos a eliminar las columnas viejas que son erroneas / Finally we proceed to eliminate the old columns that are incorrect. 

alter table Hoja2
drop column Fecha_orden,Fecha_envio


