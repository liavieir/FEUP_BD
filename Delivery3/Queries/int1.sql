.mode columns
.headers on
.nullvalue NULL

/*Listagem do número de imóveis por proprietario*/

SELECT idProprietario, Nome, count(*) AS numImoveis
FROM Proprietario Inner Join PropImovel using(idProprietario)
GROUP BY idProprietario
ORDER BY numImoveis DESC;