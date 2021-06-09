-- Introdução ao SQL
-- Mostra todos os BDs
SHOW DATABASES; 
-- Criar um novo banco de dados
CREATE DATABASE bdola;
-- Excluir um banco de dados
drop database bdola;

-- Criar um novo banco de dados
CREATE DATABASE bdexemplo; 
-- Selecionar qual BD vamos construir as tabelas
USE bdexemplo;

-- Criar uma tabela no bdexemplo;
CREATE TABLE pessoas(
	cpf CHAR(11) NOT NULL, 
	nome VARCHAR(50) NOT NULL, 
	dataDeNascimento  DATE, 
	TELEFONE VARCHAR(20), 
	sexo CHAR(1), 
	PRIMARY KEY (cpf) );
	
-- Verificar se a tabela foi criada corretamente
DESCRIBE pessoas;

-- Criar uma tabela com chave primária incrementada automaticamente
CREATE TABLE cursos(
	codCurso INT NOT NULL AUTO_INCREMENT, 
	nome VARCHAR(50) NOT NULL, 
	dataDeCriacao DATE NOT NULL, 
	duracao INT DEFAULT 4,
	valor FLOAT, 
	PRIMARY KEY (codCurso) );

-- Verificar se a tabela foi criada corretamente
-- DESCRIBE cursos;
DESC cursos;

-- Criar uma tabela que contém chave estrangeira
CREATE TABLE disciplinas(
	codDisc INT AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	horas INT DEFAULT 80,
	curso INT NOT NULL, 
	PRIMARY KEY (codDisc), 
	CONSTRAINT fk_disciplinas_cursos FOREIGN KEY (curso) 
		REFERENCES cursos(codCurso) );

-- Verificar se a tabela foi criada corretamente
DESC disciplinas;

USE bdexemplo;

-- Renomear a tabela
RENAME TABLE pessoas TO alunos;

DESC alunos;

DESC disciplinas;

-- Adicionando colunas de uma tabela
ALTER TABLE disciplinas 
	ADD semestre INT NOT NULL;

-- Remover uma coluna de uma tabela
ALTER TABLE disciplinas 
	DROP semestre;	

DESC disciplinas;

-- Excluir uma tabela do BD
DROP TABLE cursos;
-- Antes de excluir a tabela cursos, é necessário
-- excluir todos os relacionamentos desta tabela
-- com outras tabelas. Excluir a relação da tabela 
-- "cursos" na tabela "disciplinas"
ALTER TABLE disciplinas 
DROP CONSTRAINT fk_disciplinas_cursos;
DESC disciplinas;
-- Após remover a chave estrangeira na tabela
-- "disciplinas", será possível excluir a 
-- tabela "cursos"
DROP TABLE cursos;

-- Adicionar uma chave estrangeira 
-- para uma tabela existente
ALTER TABLE disciplinas
	ADD CONSTRAINT fk_disciplinas_cursos
		FOREIGN KEY (curso) 
			REFERENCES cursos(codCurso);
			
			
-- Criar uma tabela definindo a restrição da 
-- da chave estrangeira em que se excluir um 
-- curso ou um aluno, as matriculas deste curso
-- ou deste aluno serão excluídos automaticamente
CREATE TABLE matriculas(
	cod_matricula INT NOT NULL AUTO_INCREMENT,
	cpf_aluno CHAR(11) NOT NULL, 
	cod_curso INT NOT NULL, 
	data_matricula DATE, 
	PRIMARY KEY(cod_matricula),
-- Definindo as chaves estrangeiras 
-- com exclusão em cascata
CONSTRAINT fk_matriculas_alunos 
	FOREIGN KEY (cpf_aluno)
		REFERENCES alunos(cpf) ON DELETE CASCADE,
CONSTRAINT fk_matriculas_cursos 
	FOREIGN KEY (cod_curso) 
		REFERENCES cursos(codCurso) ON DELETE CASCADE );

DESC matriculas;
