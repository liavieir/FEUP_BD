.mode columns
.header on
.nullvalue NULL

/*Número de apartamentos com pelo menos 2 casas de banho*/

SELECT NumCasasBanho, count(idImovel) AS NumApartamentos
FROM Apartamento
WHERE NumCasasBanho >= 2
GROUP BY NumCasasBanho;