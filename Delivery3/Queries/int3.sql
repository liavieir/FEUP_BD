.mode columns
.header on
.nullvalue NULL

/*Média do preço dos imóveis por concelho*/

SELECT 	Concelho, round(avg(Preco),2)
FROM Imovel Inner Join (Localizacao_Geral Inner Join Localizacao_Exata using (Freguesia)) using(idLocalizacao)
GROUP BY Concelho;