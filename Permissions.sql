-- Gestor
CREATE USER 'gestor'@'localhost' IDENTIFIED BY 'manel42';
-- DROP USER 'gestor'@'localhost';

-- Permissões do gestor
GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.* TO 'gestor'@'localhost';


-- Funcionário
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'aminhapass';
-- DROP USER 'funcionario'@'localhost';

-- Permissões do Funcionário
GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.Animal TO 'funcionario'@'localhost';

GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.ProdutoAnimal TO 'funcionario'@'localhost';

GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.ProdutoVegetal TO 'funcionario'@'localhost';

GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.ProdutoVegetal TO 'funcionario'@'localhost';

GRANT EXECUTE ON quinta.* TO 'funcionario'@'localhost';




-- SELECT * FROM mysql.user;