-- SQL - DML - Linguagem de Manipulação de Dados
-- Seleciona qual BD será utilizado
USE bdexemplo;

-- Comando que Insere um registro (linha) em uma tabela
DESC alunos;
INSERT INTO alunos(cpf, nome, datadenascimento, telefone, sexo) 
VALUES('123', 'Maria', '2000-12-25', '(35) 9 9988-7766', 'F');
-- Comando que insere apenas alguns valores na tabela
INSERT INTO alunos(nome, cpf) 
VALUES('José', '456');
INSERT INTO alunos(cpf, nome, sexo) 
VALUES('Ana', '789', 'M');
-- Insere um novo registro com valores em todas as colunas
-- INSERT INTO alunos  
INSERT INTO alunos(cpf, nome, datadenascimento, telefone, sexo) 
VALUES('567', 'Pedro', '1998-05-23', '9 8812-3456', 'masculino');

desc cursos;
-- Inserir um registro em uma tabela que a chave 
-- primária (PK) for gerada automaticamente
INSERT INTO cursos(nome, datadecriacao, duracao, valor)
	VALUES('Sistemas de Informação', '2004-01-20', 
		4, 758.97);
INSERT INTO cursos(datadecriacao, duracao, valor, nome)
VALUES ('2016-02-15', '5', '923.81', 'Engenharia Civil');
-- Altera os valores de uma linha (registro)
SELECT * FROM cursos WHERE codcurso = 3;
UPDATE cursos SET nome = 'Enfermagem', duracao = 4,
	datadecriacao = '1990-07-25', valor = 895
	WHERE codcurso = 3; 

SELECT * FROM cursos;

-- Inserir um registro em uma tabela que possui 
-- chave estrangeira (FK)
DESC disciplinas;
INSERT INTO disciplinas(nome, horas, curso) 
VALUES('Linguagem de Programação I', 80, 1);

INSERT INTO disciplinas(nome, curso, horas) 
VALUES('Desenho por computador', 2, 60);

INSERT INTO disciplinas(nome, horas, curso) 
VALUES('Saúde do Trabalhador', 40, 3);

-- Inserir um registro em uma tabela que possui chave
--  primária gerada automaticamente, definindo 
-- explicitamente a chave primária
INSERT INTO disciplinas(codDisc, nome, horas, curso) 
VALUES(1, 'Estatística', 80, 2);

SELECT * FROM disciplinas;

-- UPDATE disciplinas SET codDisc = 3 WHERE codDisc = 0;

-- Comando que retorna / exibe os registros (linhas / dados) 
-- de uma tabela do banco de dados
SELECT * FROM alunos;
SELECT cpf, nome, datadenascimento, telefone, sexo FROM alunos;
-- Comando que retorna todos os registros, porém somente 
-- apenas algumas colunas da tabela
SELECT nome, cpf FROM alunos;
-- Comando que retorna apenas algunas registros (linhas) 
-- definindo um filtro (WHERE)
SELECT * FROM alunos WHERE nome = 'José';
SELECT * FROM alunos WHERE cpf = '123';

-- Comando que retorna apenas alguns registros e algumas colunas
select nome,  cpf, telefone FROM alunos 
WHERE nome = 'Maria';

-- Comando que atualiza os dados de um determinado registro na tabela
SELECT * FROM alunos;
SELECT * FROM alunos WHERE cpf = '567';
UPDATE alunos SET sexo = 'M' WHERE cpf = '567';

SELECT * from alunos WHERE cpf = 'Ana';
UPDATE alunos SET cpf='789', nome = 'Ana' WHERE cpf = 'Ana';

SELECT * FROM alunos WHERE cpf = '789';
UPDATE alunos SET sexo = 'F', datadenascimento = '2003-06-07'
	WHERE cpf = '789';

SELECT * FROM alunos WHERE nome = 'José';
UPDATE alunos SET telefone = '3531-1234'
	WHERE nome = 'José';

SELECT * FROM alunos WHERE cpf = '';
UPDATE alunos SET cpf = '246', nome = 'José da Silva' 
	WHERE cpf = '';
	
-- Comando que exclui um registro no BD
SELECT * FROM alunos;
SELECT * FROM alunos WHERE cpf = '456';
DELETE FROM alunos WHERE cpf = '456';

