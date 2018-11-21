CREATE USER 'gestor'@'localhost' IDENTIFIED BY 'aminhapass';

GRANT DELETE, INSERT, SELECT, UPDATE ON * . * TO 'gestor'@'localhost';

CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'aminhapass';

GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.Animal TO 'funcionario'@'localhost';

GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.ProdutoAnimal TO 'funcionario'@'localhost';

GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.ProdutoVegetal TO 'funcionario'@'localhost';

GRANT DELETE, INSERT, SELECT, UPDATE ON quinta.ProdutoVegetal TO 'funcionario'@'localhost';

-- GRANT ALL PRIVILEGES ON quinta.qualFuncionario TO 'funcionario'@'localhost';

SELECT * FROM mysql.user;