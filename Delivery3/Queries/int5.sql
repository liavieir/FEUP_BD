.mode columns
.header on
.nullvalue NULL

/*Preço máximo por m^2 por concelho*/

SELECT Concelho, round(max(Preco/Dimensao),2) AS MaxPrecoM2
FROM Imovel Inner Join (Localizacao_Geral Inner Join Localizacao_Exata using (Freguesia)) using(idLocalizacao)
GROUP BY Concelho
ORDER BY MaxPrecoM2;