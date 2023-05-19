.mode columns
.header on
.nullvalue NULL

/*Listagem de utilizadores que não visitam anúncios há 2 anos*/

SELECT idVisitante, Nome, max(Data) AS VisitaMaisRecente
FROM Utilizador Inner Join Visita using(idVisitante)
GROUP BY Utilizador.idVisitante
having visitaMaisRecente < date('now','-2 years')
ORDER BY Data DESC;