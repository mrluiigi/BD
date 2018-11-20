USE quinta;


INSERT INTO animal
		(ID, Espécie, Peso, DataNascimento, ValidadeVacina)
        VALUES
        (1, 'Vaca', 1000, '2000/12/03', '2020/08/20'),
        (2, 'Vaca', 1200, '2004/10/02', '2024/07/22'),
        (3, 'Galinha', 3, '2013/01/20', '2021/03/13'),
        (4, 'Cabra', 50, '2010/04/11', '2024/05/23');

TRUNCATE TABLE animal;
        
SELECT * FROM animal;