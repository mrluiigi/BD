-- Remove stock do recurso animal e regista que animal consumiu e que quantidade consumiu e a data do ultimo consumo do mesmo animal
DROP PROCEDURE IF EXISTS removeStockRecursoAnimal;
DELIMITER //
CREATE PROCEDURE removeStockRecursoAnimal(idRecurso INT, quantidade INT, idAnimal INT)
BEGIN
	IF(quantidadeRecurso(idRecurso) > quantidade AND existeAnimal(idAnimal)) THEN
        BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN 
			ROLLBACK;
		END;
        
        START TRANSACTION;
            
        UPDATE recurso
			SET Stock = Stock - quantidade
			WHERE ID = idRecurso;
                
		UPDATE animalrecurso
			SET QuantidadeConsumida = QuantidadeConsumida + quantidade,
                DataUltimoConsumo = NOW()
			WHERE Recurso_ID = idRecurso AND Animal_ID = idAnimal;
	   

		COMMIT;
        END;
	END IF;
END //
DELIMITER ;


-- Adiciona produto animal
DELIMITER //
CREATE PROCEDURE addProdAnimal(nome VARCHAR(45), preco FLOAT, stock INT, validade DATETIME, idAnimal INT)
BEGIN
	BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN 
			ROLLBACK;
		END;
        
        START TRANSACTION;
        
        INSERT INTO produtoanimal  (Designacao, Preco, Stock, Validade, Animal_ID) 
			VALUE (nome,preco,stock,validade,idAnimal);
		COMMIT;
	END;
END //
DELIMITER ;

-- Adiciona produto vegetal
DELIMITER //
CREATE PROCEDURE addProdVegetal(nome VARCHAR(45), preco FLOAT, stock INT, validade DATETIME, idPlantação INT)
BEGIN
	BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN 
			ROLLBACK;
		END;
        
        START TRANSACTION;
        
        INSERT INTO produtovegetal  (Designacao, Preco, Stock, Validade, Plantação_ID) 
			VALUE (nome,preco,stock,validade,idPlantação);
		COMMIT;
	END;
END //

DELIMITER ;


-- Altera a data da última vez que os animais foram alimentados para a hora atual
DELIMITER //
CREATE PROCEDURE atualizaDataConsumo()
BEGIN
	BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN 
			ROLLBACK;
		END;
        
        START TRANSACTION;
        
		UPDATE AnimalRecurso
			INNER JOIN animal ON animal.ID = animalrecurso.Animal_ID
			SET DataUltimoConsumo = NOW()
				WHERE animal.Vida = 'V';
		COMMIT;
	END;
END //
DELIMITER ;

