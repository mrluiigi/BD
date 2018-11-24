USE quinta;

-- Verifica que animais expiram a vacina dentro de um mês
SELECT * FROM animal WHERE ValidadeVacina <= (DATE(NOW()) + INTERVAL 1 MONTH);


-- Quantas espécies de animais existem na quinta 
SELECT COUNT(DISTINCT Espécie) AS TotalEspécies FROM Animal;


-- Área total das plantações (é preciso atributo para saber se foi colhida)
SELECT SUM(Area) FROM plantação;
select * from plantação;


-- Número de encomendas feitas
SELECT COUNT(*) FROM encomenda;



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
	WHERE recurso.ID = idRecurso;
END//
DELIMITER ;


-- Remove stock do recurso dado e regista que animal consumiu, que quantidade consumiu e a data do último consumo do mesmo animal
DROP PROCEDURE IF EXISTS removeStockRecursoAnimal;

DELIMITER //
CREATE PROCEDURE removeStockRecursoAnimal(idRecurso INT, quantidade INT, idAnimal INT)
BEGIN
	IF(quantidadeRecurso(idRecurso) > quantidade) 
		THEN
			UPDATE animalrecurso
				SET QuantidadeConsumida = QuantidadeConsumida + quantidade,
					DataUltimoConsumo = NOW()
				WHERE Recurso_ID = idRecurso AND Animal_ID = idAnimal;
			UPDATE recurso
				SET Stock = Stock - quantidade
				WHERE ID = idRecurso;
	END IF;
END //


-- Remove stock do recurso dado e regista que plantação consumiu, que quantidade e a data do último consumo da plantação
DROP PROCEDURE IF EXISTS removeStockRecursoPlantacao;

DELIMITER //
CREATE PROCEDURE removeStockRecursoPlantacao(idRecurso INT, quantidade INT, idPlantacao INT)
BEGIN
	IF(quantidadeRecurso(idRecurso) > quantidade) 
		THEN
			UPDATE plantaçãorecurso
				SET QuantidadeConsumida = QuantidadeConsumida + quantidade,
					DataUltimoConsumo = NOW()
				WHERE Recurso_ID = idRecurso AND Plantação_ID = idPlantacao;
			UPDATE recurso
				SET Stock = Stock - quantidade
				WHERE ID = idRecurso;
	END IF;
END //
DELIMITER ;


-- Plantações a colher no mês indicado
DROP PROCEDURE IF EXISTS colheitaMes;

DELIMITER //
CREATE PROCEDURE colheitaMes(mes INT)
BEGIN
	SELECT * FROM plantação AS P 
		WHERE P.MesColheita = mes;
END//
DELIMITER ;

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





-- Que funcionario cuidou do Animal X
DROP PROCEDURE IF EXISTS qualFuncionario

DELIMITER %%
CREATE PROCEDURE qualFuncionario(idAnimal INT)
	BEGIN
		SELECT Funcionário_Número FROM FuncionárioAnimal AS FA
			WHERE FA.Animal_ID = idAnimal;
            

	END %%
DELIMITER ;

-- CALL qualFuncionario(3);


-- Verifica se um determinado animal existe. Retorna 1 se existe e 0 caso contrário.
DELIMITER %%
CREATE FUNCTION existeAnimal(id INT) RETURNS INT
READS SQL DATA
	BEGIN 
		DECLARE existe INT;
		SELECT COUNT(A.id) INTO existe FROM Animal AS A
				WHERE A.ID = id;
		RETURN existe;
	END %%
DELIMITER ;



-- Soma das vendas num intervalo de tempo 
DELIMITER //
CREATE PROCEDURE valorVendasIntervalo (inicio DATE, fim DATE)
	BEGIN 
		SELECT SUM(Valor) FROM Encomenda 
			WHERE (data BETWEEN inicio AND fim);
	END//
DELIMITER ;


-- Valor das vendas totais de um cliente

DELIMITER %%
CREATE FUNCTION totalVendasCliente(id INT) RETURNS INT
READS SQL DATA
	BEGIN
		DECLARE total INT;
        
		SELECT Valor INTO total FROM cliente
		INNER JOIN encomenda ON encomenda.Cliente = cliente.NIF 
			WHERE cliente.NIF = id;
        
        RETURN total;
	END %%
DELIMITER ;
-- SELECT totalVendasCliente(2);


-- Produtos do animal x

DELIMITER //
CREATE PROCEDURE produtosDoAnimal(id INT)
	BEGIN
		SELECT * FROM produtoanimal WHERE Animal_ID = id;
	END//
DELIMITER ;
-- CALL produtosDoAnimal(2);


-- Produtos animais que tem validade abaixo da data indicada
DROP PROCEDURE IF EXISTS passouValidadeAnimal;

DELIMITER //
CREATE PROCEDURE passouValidadeAnimal(dataA DATE)
	BEGIN
        SELECT * FROM produtoanimal 
			WHERE Validade <= dataA;
	END //
DELIMITER ;
-- CALL passouValidadeAnimal('2018-11-20');


-- Produtos vegetais que tem data de validade abaixo da dada.
DROP PROCEDURE IF EXISTS passouValidadePlanta;

DELIMITER //
CREATE PROCEDURE passouValidadePlanta(dataA DATE)
	BEGIN
        SELECT * FROM produtovegetal
			WHERE Validade <= dataA;
	END//
DELIMITER ;

-- Recursos consumidos pela Plantação dada
DROP PROCEDURE IF EXISTS recursosConsumidosPlantacao;

DELIMITER //
CREATE PROCEDURE recursosConsumidosPlantacao(idPlantacao INT)
BEGIN
        SELECT P.ID, P.Tipo, R.Tipo, PR.QuantidadeConsumida FROM Plantação AS P
			INNER JOIN PlantaçãoRecurso AS PR ON PR.Plantação_ID = P.ID
			INNER JOIN recurso AS R ON R.ID = PR.Recurso_ID
                WHERE P.ID = idPlantacao;
END //
DELIMITER ;

CALL recursosConsumidosPlantacao(2);

-- Recursos consumidos pelo animal dado
DROP PROCEDURE IF EXISTS recursosConsumidosAnimal;

DELIMITER //
CREATE PROCEDURE recursosConsumidosAnimal(idAnimal INT)
BEGIN
        SELECT A.ID, A.Espécie, R.Tipo, AR.QuantidadeConsumida FROM animal AS A
			INNER JOIN animalrecurso AS AR ON AR.Animal_ID = A.ID
			INNER JOIN recurso AS R ON R.ID = AR.Recurso_ID
                WHERE A.ID = idAnimal;
END //
DELIMITER ;

CALL recursosConsumidosAnimal(1);


-- Calcula o custo associado à alimentação de um animal

DELIMITER %%
CREATE FUNCTION calculaCustoConsumidoAnimal(idAnimal INT) RETURNS INT
READS SQL DATA
	BEGIN 
		DECLARE total INT;
        
        SELECT SUM(R.Preco * AR.QuantidadeConsumida) INTO total FROM animal AS A
            INNER JOIN animalrecurso AS AR ON AR.Animal_ID = A.ID
			INNER JOIN recurso AS R ON R.ID = AR.Recurso_ID
                WHERE A.ID = idAnimal;
                
		RETURN total;
	END %%
DELIMITER ;
-- SELECT calculaCustoConsumidoAnimal(3)


-- Calcula o valor de todas as vendas dos produtos provindos de certo animal
DROP Function calculaVendaProdutosAnimal;

DELIMITER %%
CREATE FUNCTION calculaVendaProdutosAnimal(idAnimal INT) RETURNS INT
READS SQL DATA
	BEGIN 
		DECLARE total INT;
       
		SELECT SUM(PA.Preco * PAE.Quantidade) INTO total FROM ProdutoAnimal AS PA
			INNER JOIN ProdutoAnimalEncomenda AS PAE ON PAE.ProdutoAnimal_ID = PA.ID
				WHERE PA.Animal_ID = idAnimal;
                
		RETURN total;
	END %%
DELIMITER ;
-- SELECT calculaVendaProdutosAnimal(8);


-- Calcula o lucro que um certo animal forneceu

DROP PROCEDURE calculaLucro;
DELIMITER //
CREATE PROCEDURE calculaLucro(idAnimal INT)
	BEGIN
		SELECT (calculaVendaProdutosAnimal(idAnimal) - calculaCustoConsumidoAnimal(idAnimal));
	END //
DELIMITER ;

CALL calculaLucro(8);


-- Funcionários da Plantação X
DELIMITER //
CREATE PROCEDURE funcionariosDaPlantacao(idPlantação INT)
BEGIN
	SELECT * FROM funcionário AS F
		INNER JOIN funcionárioplantação AS FP ON FP.Funcionário_Número = F.Número
			WHERE FP.Plantação_ID = idPlantação;
END //
DELIMITER ;
-- CALL funcionariosDaPlantacao(3);


-- Número de animais da espécie X
DELIMITER //
CREATE PROCEDURE animalEspecie(especie varchar(45))
	BEGIN
		SELECT COUNT(*) FROM animal
			WHERE animal.Espécie = especie AND animal.Vida = 'V';
	END //
DELIMITER ;

CALL animalEspecie('Vaca minhota');



-- Que espécies consomem o recurso X
DELIMITER //
CREATE PROCEDURE especiesConsomem(recurso INT)
BEGIN
    SELECT DISTINCT(Espécie) FROM animal
		INNER JOIN animalrecurso AS AR ON AR.Animal_ID = animal.ID
        WHERE AR.Recurso_ID = recurso;
END //
DELIMITER ;

CALL especiesConsomem(1);

