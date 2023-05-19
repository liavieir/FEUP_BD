.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;


/*Assegura que um proprietário não é definido como indivíduo e banco ao mesmo tempo*/


CREATE TRIGGER IF NOT EXISTS DefineBancoProp
BEFORE INSERT ON BancoProp
FOR EACH ROW
WHEN
	EXISTS(SELECT * FROM IndividuoProp WHERE idProprietario = New.idProprietario)
Begin 
	SELECT RAISE(ABORT, "Proprietario ja definido como um individuo");
END;

CREATE TRIGGER IF NOT EXISTS DefineIndividuoProp
BEFORE INSERT ON IndividuoProp
FOR EACH ROW
WHEN
	EXISTS(SELECT * FROM BancoProp WHERE idProprietario = New.idProprietario)
BEGIN 
	SELECT RAISE(abort, "Proprietario ja definido como um banco");
END;