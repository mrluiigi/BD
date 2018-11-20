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

-- Cuidado, aldrabice 
SET foreign_key_checks = 0;
TRUNCATE  TABLE animal;
SET foreign_key_checks = 1;


SELECT * FROM recurso;