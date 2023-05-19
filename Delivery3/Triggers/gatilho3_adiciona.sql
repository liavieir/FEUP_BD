.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

/*Assegura que há um espaçamento de 30 minutos entre cada entrevista para o mesmo imóvel*/


CREATE TRIGGER IF NOT EXISTS EntrevistaMesmaHora
BEFORE INSERT ON Entrevista
FOR EACH ROW 
WHEN
	(EXISTS(SELECT * FROM(
	SELECT Hora 
	FROM Entrevista 
	WHERE idImovel = NEW.idImovel 
	AND Data = NEW.Data 
	AND (time(Hora,'+30 minutes' )> NEW.hora) 
	AND (time(Hora,'-30 minutes')< NEW.hora))))
BEGIN 
	SELECT RAISE(abort, "Horario ja ocupado");
END;
