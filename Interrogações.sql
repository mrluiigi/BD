USE quinta;

-- verifica que animais expiram a vacina dentro de um mês
SELECT * FROM animal WHERE ValidadeVacina <= (DATE(NOW()) + INTERVAL 1 MONTH);

-- altera validade da vacina +2 anos
DELIMITER //
CREATE PROCEDURE alteraValidadeVacina(idAnimal INT)
BEGIN
UPDATE animal 
	SET ValidadeVacina = (ValidadeVacina + INTERVAL 2 YEAR)
    WHERE animal.ID = idAnimal;
END //
DELIMITER ;

-- adiciona ao stock de um certo recurso uma quantidade
DELIMITER //
CREATE PROCEDURE adicionaStockRecurso(idRecurso INT, quantidade INT)
BEGIN
UPDATE recurso
	SET Stock = Stock + quantidade
    where recurso.ID = idRecurso;
END//
DELIMITER ;

-- Pantação a colher no mês indicado
DELIMITER //
CREATE PROCEDURE colheitaMes(mes int)
BEGIN
	SELECT * FROM plantação 
		WHERE MesColheita = mes;
END//
DELIMITER //;

CALL colheitaMes(6);


-- Quantos espécies de animais existem na quinta 
SELECT COUNT(DISTINCT Espécie) AS TotalEspécies FROM Animal;

