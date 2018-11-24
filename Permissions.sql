-- Permissões

-- -------------------GESTOR--------------------------
CREATE USER 'gestor'@'localhost' IDENTIFIED BY 'manel42';
-- DROP USER 'gestor'@'localhost';

-- Permissões do gestor
GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.* TO 'gestor'@'localhost';

GRANT EXECUTE ON quinta.* TO 'gestor'@'localhost';



-- -----------------------FUNCIONÁRIO-----------------------------------
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'aminhapass';
-- DROP USER 'funcionario'@'localhost';

-- Permissões do Funcionário a tabelas
GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.Animal TO 'funcionario'@'localhost';
GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.ProdutoAnimal TO 'funcionario'@'localhost';
GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.ProdutoVegetal TO 'funcionario'@'localhost';
GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.Recurso TO 'funcionario'@'localhost';

-- Permissoes para os procedures
GRANT EXECUTE ON PROCEDURE quinta.addProdAnimal TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.addProdVegetal TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.adicionaStockRecurso TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.alteraValidadeVacina TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.animalEspecie TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.areaPlantacoes TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.atualizaDataConsumo TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.colheitaMes TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.especiesConsomem TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.foraValidadeAnimal TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.passouValidadeAnimal TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.passouValidadePlanta TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.produtosDoAnimal TO 'funcionario'@'localhost';  
GRANT EXECUTE ON PROCEDURE quinta.recursosConsumidosPlantacao TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.recursosConsumidosAnimal TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.removeStockRecursoAnimal TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON PROCEDURE quinta.removeStockRecursoPlantacao TO 'funcionario'@'localhost'; 

-- Premissoes para funções
GRANT EXECUTE ON FUNCTION quinta.existeAnimal TO 'funcionario'@'localhost'; 
GRANT EXECUTE ON FUNCTION quinta.quantidadeRecurso TO 'funcionario'@'localhost'; 

-- Permissão para ver view horarios
GRANT SELECT ON quinta.horarios TO 'funcionario'@'localhost';


-- SHOW GRANTS FOR 'funcionario'@'localhost';

-- SELECT * FROM mysql.user;