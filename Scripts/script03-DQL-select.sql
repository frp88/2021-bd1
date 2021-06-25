-- DQL - Linguagem de Consultas de Dados - Comando SELECT
-- Criar um novo banco de dados
CREATE DATABASE bdprodutos;
USE bdprodutos;

-- Criar uma tabela no BD "bdprodutos"
CREATE TABLE produtos(
	codigo INT AUTO_INCREMENT, 
	tipo VARCHAR(50), modelo VARCHAR(50), marca VARCHAR(50),
	qdt INT, preco FLOAT, 
	PRIMARY KEY(codigo)
);
-- Altera o nome de uma coluna
ALTER TABLE produtos 
	CHANGE COLUMN qdt qtd INT;

DESC produtos;
-- Inserir alguns registros na tabela "produtos"
INSERT INTO produtos(tipo, modelo, marca, qtd, preco) 
VALUES('TV', '29 TP WIDE', 'SONY', '2', '1200.00');
INSERT INTO produtos(tipo, modelo, marca, qtd, preco) 
VALUES('DVD', 'D659', 'PHILIPS', 1, 399.00);
INSERT INTO produtos(tipo, modelo, marca, qtd, preco) 
VALUES('DVD', '91P', 'SONY', 5, 459.95);
INSERT INTO produtos(tipo, modelo, marca, qtd, preco) 
VALUES('CELULAR', '1100 PRETO', 'NOKIA', '10', '199,90');
INSERT INTO produtos(tipo, modelo, marca, qtd, preco) 
VALUES('CELULAR', '4911 CAMERA', 'NOKIA', 5, 850.00);
INSERT INTO produtos(tipo, modelo, marca, qtd, preco) 
VALUES('TV', '20 ST SAP', 'TOSHIBA', 10, '500.00');
INSERT INTO produtos(tipo, modelo, marca, qtd, preco) 
VALUES('DVD', 'D202', 'PHILIPS', '4', 500.00);
INSERT INTO produtos(tipo, modelo, marca, qtd, preco) 
VALUES('TV', '32 PLASMA', 'SONY', '1', '4500.00');

-- Exemplo 1: Selecionar todas as colunas e todos os registros. 
SELECT * FROM produtos;

-- Exemplo 2: Selecionar algumas colunas e todos os registros.
SELECT modelo, marca, tipo, preco FROM produtos;

-- Exemplo 3: Selecionar algumas colunas e alguns registros.
SELECT modelo, marca, tipo FROM produtos
WHERE marca = 'SONY';

-- Exemplo 4: Selecionar algumas colunas e alguns registros.
SELECT modelo, marca, preco, qtd FROM produtos
WHERE preco <= 850.00;

-- Exemplo 5: Selecionar algumas colunas e alguns 
--  registros utilizando mais de uma condição (filtro) 
-- com o operador “AND”
-- Selecionar todos os produtos cujo preço for  
-- menor do que R$ 500,00 e for da marca sony
SELECT modelo, marca, tipo, preco FROM produtos 
WHERE preco < 500 AND marca = 'SONY';

-- Exemplo 06 - Operador OR
-- Selecionar os produtos que o preço for menor
-- ou igual R$ 400,00 ou o tipo for igual a DVD
SELECT * FROM produtos
WHERE preco <= 400 OR tipo = 'dvd';

-- Exemplo 07 - Operadores AND e OR
-- Selecionar todas as TVs da marca SONY OU todos 
-- os DVDs da marca PHILIPS
SELECT * FROM produtos 
WHERE (marca = 'sony' AND tipo = 'TV')
OR (tipo = 'DVD' AND marca = 'PHILIPS');

-- Exemplo 8: Retornar os dados dos produtos que custam de 
-- 100 a 500 reais, considerando os valores 100 e 500 reais.
SELECT * FROM produtos 
WHERE preco >= 100 AND preco <= 500;

-- Exemplo 8 utilizando o operador BETWEEN
SELECT * FROM produtos 
WHERE preco BETWEEN 100 AND 500;

INSERT INTO produtos(modelo, marca) 
VALUES('Moto G9', 'Motorola');
INSERT INTO produtos(modelo, marca, tipo) 
VALUES('Galaxy A70', 'Samsung', 'celular');

SELECT * FROM produtos;

-- Exemplo 9: Retorna os produtos que não  
-- possuem preço definido:
SELECT * FROM produtos WHERE preco IS NULL;

-- Exemplo 10: Retorna os produtos que possuem 
-- a quantidade defina
SELECT * FROM produtos WHERE qtd IS NOT NULL;

-- Operador LIKE - Selecionar todos os produtos cuja 
-- marca iniciar com a letra "N"
SELECT * FROM produtos 
WHERE marca LIKE 'N%';

-- Operador LIKE - Selecionar todos os produtos cujo 
-- modelo tenha o termo "CAM"
SELECT * FROM produtos 
WHERE modelo LIKE '%CAM%';

-- Exemplo 13: Selecionar todos os produtos de 
-- código 1, 2, 5, 7
SELECT * FROM produtos 
WHERE codigo = 1 OR codigo = 2 OR codigo = 5 OR codigo = 7;
-- Exemplo 13 - Operador IN() - Selecionar todos 
-- os produtos de código 1, 2, 5, 7
SELECT * FROM produtos 
WHERE codigo IN(1, 2, 5, 7);

-- Exemplo retorna os produtos que o código não seja 6 e 8
SELECT * FROM produtos 
WHERE codigo NOT IN (6, 8);

-- --------------------------------------
-- SQL – Cláusula ORDER BY
-- Exemplo 15: Seleciona todos os produtos cujo  
-- preço for menor ou igual a 500, exibindo os  
-- produtos mais baratos primeiro
SELECT * FROM produtos
WHERE preco <= 500 
ORDER BY preco ASC;

-- Exemplo 16: Seleciona todos os produtos cujo preço for maior
-- ou igual a 700, exibindo os produtos mais caros primeiro.
SELECT * FROM produtos 
WHERE preco >= 700 
ORDER BY preco DESC;

-- Exemplo 17: Seleciona todos os produtos cujo tipo  
-- igual 'DVD', ornando por marca e exibindo 
-- os produtos mais caros primeiro.
SELECT * FROM produtos
WHERE tipo = 'dvd' 
ORDER BY marca ASC, preco DESC;

-- Exemplo 18: Seleciona a TV mais cara cadastrada.
SELECT * FROM produtos 
WHERE tipo = 'TV' 
ORDER BY preco DESC 
LIMIT 1; -- Define a quantidade de registros (linhas) que será exibido na consulta

-- Exemplo 19: Selecionar a coluna 'tipo' da tabela 
-- 'produtos’, exibindo somente uma vez cada tipo diferente.
SELECT DISTINCT tipo FROM produtos;






