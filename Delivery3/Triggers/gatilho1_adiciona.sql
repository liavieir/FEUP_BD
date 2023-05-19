.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;


/*Assegura que o capital de um indivíduo proprietário não excede 1000000€*/


CREATE TRIGGER IF NOT EXISTS ValidaCapitalProprietario
BEFORE INSERT ON PropImovel
FOR EACH ROW
WHEN
    ((SELECT Capital FROM(SELECT idProprietario, sum(Preco) AS Capital
FROM PropImovel INNER JOIN Imovel using(idImovel) INNER JOIN IndividuoProp using(idProprietario) 
WHERE idProprietario = NEW.idProprietario
GROUP BY idProprietario )) +
    (SELECT Preco FROM PropImovel INNER JOIN Imovel using(idImovel)) > 1000000)

BEGIN 
	DELETE FROM Imovel WHERE idImovel = NEW.idImovel;
    SELECT RAISE(FAIL, 'Limite de capital excedido');
END;