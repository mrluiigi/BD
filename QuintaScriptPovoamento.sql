USE quinta;


INSERT INTO animal
		(ID, Espécie, Peso, DataNascimento, ValidadeVacina)
        VALUES
        (1, 'Vaca', 1000, '2000/12/03', '2020/08/20'),
        (2, 'Vaca', 1200, '2004/10/02', '2024/07/22'),
        (3, 'Galinha', 3, '2013/01/20', '2021/03/13'),
        (4, 'Cabra', 50, '2010/04/11', '2024/05/23');


INSERT INTO recurso
		(ID, Tipo, Fornecedor, Preco, Stock)
        VALUES
        (1, 'Água', 'Câmara Municipal', 0.01, 100000),
        (2, 'Adubo', 'ADP Fertilizantes', 0.50, 1000),
        (3, 'Herbicida', 'Bayer', 20, 124),
        (4, 'Farinha para galinhas', 'Loja do Gusto', 0.30, 700),
        (5, 'Farinha para vacas', 'Utilagro', 0.35, 1820);

INSERT INTO AnimalRecurso
		(Animal_ID, Recurso_ID, QuantidadeConsumida, DataUltimoConsumo)
        VALUES
        (1, 1, 100, '2018-11-20'),
        (2, 1, 100, '2018-11-20');



-- Cuidado, aldrabice 
-- SET foreign_key_checks = 0;
-- TRUNCATE  TABLE AnimalRecurso;
-- SET foreign_key_checks = 1;


-- SELECT * FROM AnimalRecurso;

INSERT INTO cliente
                (NIF, Nome, Tipo, Contacto)
        VALUES
        (1, 'Pedro Barbosa', 'Individual', '937573882'),
        (2, 'José Pinto', 'Individual', '911326812'),
        (3, 'Luís Correia', 'Individual', '932444512'),
        (4, 'Ângelo Sousa', 'Individual', '923612821'),
        (5, 'Diogo Pereira', 'Individual', '937172018'),
        (6, 'André Guimarães', 'Individual', '923499865'),
        (7, 'Ricardo Ribeiro', 'Individual', '933475867'),
        (8, 'Andreia Sousa', 'Individual', '912341786'),
        (9, 'Joana Matos', 'Individual', '912091344'),
        (10, 'Margarida Maia', 'Individual', '964324187'),
        (11, 'Frutas, Lda', 'Empresa', '252900345'),
        (12, 'Adubos e Adubos', 'Empresa', '254272138'),
        (13, 'Ração Armindo', 'Empresa', '251298458');

-- SELECT * FROM cliente;


INSERT INTO funcionário
                (Número, Nome, Tipo, Salário, Contacto, Horário)
        VALUES
        (1, 'Gabriel Trovão', 'Animais', 750, '955521239', 'S'),
        (2, 'Nuno Carvalho', 'Animais', 800, '940808728', 'S'),
        (3, 'Simão Pereira', 'Plantas', 650, '969054305', 'S'),
        (4, 'João Machado', 'Plantas', 675,  '919954869', 'S'),
        (5, 'Beatriz Abreu', 'Animais', 725, '938003443', 'S'),
        (6, 'Maria Silva', 'Animais', 825, '931116199', 'D'),
        (7, 'Paulo Carvalho', 'Plantas', 925, '927680363', 'D'),
        (8, 'Fábio Cunha', 'Plantas', 875, '961458206', 'D'),
        (9, 'Filipa Machado', 'Animais', 950, '921072714', 'D'),
        (10, 'Jéssica Patrícia', 'Plantas', 1000, '960591820', 'D');

-- SELECT * FROM funcionário;


INSERT INTO plantação
                (ID, Tipo, Area, MesColheita)
        VALUES
        (1, 'Terrestres', 10, 4),
        (2, 'Terrestres', 10, 5),
        (3, 'Terrestres', 10, 6),
        (4, 'Terrestres', 10, 10),
        (5, 'Medicinais', 2, 11),
        (6, 'Medicinais', 2, 12),
        (7, 'Medicinais', 3, 7),
        (8, 'Ornamentais', 5, 5),
        (9, 'Ornamentais', 5, 6),
        (10, 'Ornamentais', 5, 6);

-- SELECT * FROM plantação;

INSERT INTO PlantaçãoRecurso
		(Plantação_ID, Recurso_ID, QuantidadeConsumida, DataUltimoConsumo)
        VALUES
        (1, 1, 100, '2018-11-20'),
        (2, 1, 100, '2018-11-20'),
        (3, 1, 100, '2018-11-20'),
        (4, 1, 100, '2018-11-20');



INSERT INTO produtoanimal
                (ID, Designacao, Preco, Stock, Validade, Animal_ID)
        VALUES
        (1, 'Ovos', 0.89, 750, "2019-03-11", 1),
        (2, 'Leite', 1.19, 1500, "2019-05-23", 2),
        (3, 'Lã', 50, 200, "9999-01-01", 3),
        (4, 'Mel', 14.76, 250, "2020-01-31", 4),
        (5, 'Carne', 17.23, 500, "2018-12-20", 2);

-- SELECT * FROM produtoanimal;


INSERT INTO produtovegetal
                (ID, Designacao, Preco, Stock, Validade, Plantação_ID)
        VALUES
        (1, 'Cenouras', 0.75, 1500, "2018-12-23", 1),
        (2, 'Batatas', 5.45, 1750, "2018-12-21", 2),
        (3, 'Cebola', 1.13, 2000, "2019-1-2", 3),
        (4, 'Beterraba', 6.95, 1000, "2019-1-12", 4),
        (5, 'Camomila', 40, 100, "2019-05-13", 5),
        (6, 'Agrião', 11.93, 200, "2019-06-14", 6),
        (7, 'Alfazema', 37.80, 115, "2019-8-11", 7),
        (8, 'Rosas', 0.47, 350, "2018-11-30", 8),
        (9, 'Papoilas', 0.87, 300, "2018-11-30", 9),
        (10, 'Tulipas', 0.56, 275, "2018-11-30", 10);

-- SELECT * FROM produtovegetal;


INSERT INTO encomenda
                (ID, Valor, Data, Cliente)
        VALUES
        (1, 2500, "2018-06-12", 1),
        (2, 3000, "2018-11-09", 2),
        (3, 750, "2018-11-03", 3),
        (4, 250, "2018-4-23", 4),
        (5, 10000, "2018-1-11", 5);

-- SELECT * FROM encomenda;
