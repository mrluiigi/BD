USE quinta;

-- Verifica que animais expiram a vacina dentro de um mês
SELECT * FROM animal WHERE ValidadeVacina <= (DATE(NOW()) + INTERVAL 1 MONTH);


-- Altera validade da vacina +2 anos
DROP PROCEDURE IF EXISTS alteraValidadeVacina;
DELIMITER //

CREATE PROCEDURE alteraValidadeVacina(idAnimal INT)
BEGIN
UPDATE animal 
	SET ValidadeVacina = (ValidadeVacina + INTERVAL 2 YEAR)
    WHERE animal.ID = idAnimal;
END //
DELIMITER ;



-- Adiciona ao stock de um certo recurso uma quantidade
DROP PROCEDURE IF EXISTS adicionaStockRecurso;
DELIMITER //

CREATE PROCEDURE adicionaStockRecurso(idRecurso INT, quantidade INT)
BEGIN
UPDATE recurso
	SET Stock = Stock + quantidade
    where recurso.ID = idRecurso;
END//
DELIMITER ;

-- remove stock do recurso animal e regista que animal consumiu e que quantidade consumiu e a data do ultimo consumo do mesmo animal
DELIMITER //
CREATE PROCEDURE removeStockRecursoAnimal(idRecurso INT, quantidade INT, idAnimal INT)
BEGIN
		if(quantidadeRecurso(idRecurso) > quantidade) then
		UPDATE animalrecurso
				SET QuantidadeConsumida = QuantidadeConsumida + quantidade,
                DataUltimoConsumo = NOW()
                WHERE Recurso_ID = idRecurso AND Animal_ID = idAnimal;
			 UPDATE recurso
				SET Stock = Stock - quantidade
				WHERE ID = idRecurso;
	end if;
END //
-- remove stock do recurso plantação e regista que plantação consumiu e que quantidade e a data do ultimo consumo da plantação
DELIMITER //
CREATE PROCEDURE removeStockRecursoPlantacao(idRecurso INT, quantidade INT, idPlantacao INT)
BEGIN
		if(quantidadeRecurso(idRecurso) > quantidade) then
		UPDATE plantaçãorecurso
				SET QuantidadeConsumida = QuantidadeConsumida + quantidade,
                DataUltimoConsumo = NOW()
                WHERE Recurso_ID = idRecurso AND Plantação_ID = idPlantacao;
			 UPDATE recurso
				SET Stock = Stock - quantidade
				WHERE ID = idRecurso;
	end if;
END //
DELIMITER ;

DELIMITER ;
-- Plantação a colher no mês indicado
DROP PROCEDURE IF EXISTS colheitaMes;
DELIMITER //

CREATE PROCEDURE colheitaMes(mes int)
BEGIN
	SELECT * FROM plantação 
		WHERE MesColheita = mes;
END//
DELIMITER //;
-- CALL colheitaMes(6);


-- Quantidade em Stock do recurso X
DROP FUNCTION IF EXISTS quantidadeRecurso;
DELIMITER %%

CREATE FUNCTION quantidadeRecurso(id INT) RETURNS INT
READS SQL DATA
	BEGIN 
		DECLARE quantidade INT;
        
        SELECT R.Stock INTO quantidade FROM Recurso AS R
			WHERE R.ID = id;
		RETURN quantidade;
        
	END %%
DELIMITER ;
-- SELECT quantidadeRecurso(4);


-- Quantos espécies de animais existem na quinta 
SELECT COUNT(DISTINCT Espécie) AS TotalEspécies FROM Animal;

