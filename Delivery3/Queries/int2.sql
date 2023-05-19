.mode columns
.header on
.nullvalue NULL

/*Top 10 imóveis mais favoritados:*/

SELECT idImovel, count(*) AS NumFavoritos
FROM Favorita Inner Join Anuncio using(idAnuncio)
GROUP BY idImovel
ORDER BY numFavoritos DESC
LIMIT 10;