.mode columns
.header on
.nullvalue NULL

/*Listagem do capital de cada agência imobiliária*/

SELECT idAgenciaImobiliaria, Nome, sum(Preco) AS Capital
FROM Imovel Inner Join (ImovelAgencia Inner Join AgenciaImobiliaria using(idAgenciaImobiliaria)) using(idImovel)
GROUP BY idAgenciaImobiliaria
ORDER BY Capital DESC;