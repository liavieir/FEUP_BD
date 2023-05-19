.mode columns
.header on
.nullvalue NULL

/*Quais agências não tem nenhuma garagem à venda*/

SELECT idAgenciaImobiliaria, Nome
FROM AgenciaImobiliaria
EXCEPT
SELECT AgenciaImobiliaria.idAgenciaImobiliaria, AgenciaImobiliaria.Nome
FROM AgenciaImobiliaria Inner Join (ImovelAgencia Inner Join Garagem using(idImovel)) using(idAgenciaImobiliaria);