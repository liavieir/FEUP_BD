.mode columns
.header on
.nullvalue NULL

/*Número de visitas ao site no ano de 2021:*/

SELECT count(*) AS NumVisitas
FROM Visita
WHERE Visita.Data BETWEEN '2021-01-01' AND '2021-12-31';