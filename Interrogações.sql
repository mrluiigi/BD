USE quinta;

-- Pantação a colher no mês indicado
DELIMITER //
CREATE PROCEDURE colheitaMes(mes int)
BEGIN
	SELECT * FROM plantação 
		WHERE MesColheita = mes;
END//
DELIMITER //;

CALL colheitaMes(6);