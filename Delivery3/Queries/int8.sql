.mode columns
.header on
.nullvalue NULL

/*Estado do imóvel com mais entrevistas*/

SELECT max(numEntrevista) AS NumEntrevista, Estado
FROM (SELECT idImovel, COUNT(idImovel) AS numEntrevista, Estado
FROM Imovel Inner Join Entrevista using(idImovel) 
GROUP BY idImovel);