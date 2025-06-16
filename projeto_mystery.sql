-- ====================================================
-- PROJETO: SQL-Mystery-O-Caso-do-Manuscrito-Perdido
-- OBJETIVO: Criação de tabelas, inserção de dados e consultas investigativas
-- ====================================================

-- =======================
-- 1.CREATE TABLES
-- =======================

CREATE TABLE autores (
    id_autor INT PRIMARY KEY,
    nome_autor VARCHAR(100)
);

CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(100),
    genero VARCHAR(50),
    quantidade_estoque INT,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    presente_na_noite BOOLEAN
);

CREATE TABLE leitores (
    id_leitor INT PRIMARY KEY,
    nome VARCHAR(100),
    autorizado BOOLEAN
);

CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_leitor INT,
    id_livro INT,
    data_emprestimo DATE,
    FOREIGN KEY (id_leitor) REFERENCES leitores(id_leitor),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

CREATE TABLE convidados_evento (
    id_autor INT,
    data_evento DATE,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

-- ==================
-- 2. INSERT DE DADOS
-- ==================

-- Autores
INSERT INTO autores VALUES
(1, 'Machado de Assis'),
(2, 'Clarice Lispector'),
(3, 'George Orwell'),
(4, 'J. K. Rowling');

-- Livros
INSERT INTO livros VALUES
(1, 'Dom Casmurro', 'Clássico', 4, 1),
(2, '1984', 'Distopia', 3, 3),
(3, 'A Hora da Estrela', 'Romance', 1, 2), -- Manuscrito raro
(4, 'Harry Potter', 'Fantasia', 2, 4);

-- Funcionários
INSERT INTO funcionarios VALUES
(1, 'João Oliveira', 1),
(2, 'Maria Souza', 1),
(3, 'Luana Martins', 0);

-- Leitores
INSERT INTO leitores VALUES
(1, 'Beatriz Silva', 1),
(2, 'Carlos Henrique', 0),
(3, 'Fernanda Lima', 1),
(4, 'Lucas Pereira', 1);

-- Empréstimos
INSERT INTO emprestimos VALUES
(1, 1, 2, '2023-11-15'),
(2, 3, 1, '2023-11-15'),
(3, 4, 4, '2023-11-15'),
(4, 1, 3, '2023-11-15');

-- Convidados
INSERT INTO convidados_evento VALUES
(2, '2023-11-15'),
(4, '2023-11-15');

-- ================
-- 3. CONSULTAS SQL
-- ================

-- Buscar todos os manuscritos e suas pistas
-- Verifique quem está autorizado
SELECT * FROM leitores
WHERE autorizado = 1;
-- Filtre empréstimos no dia do desaparecimento (2023-11-15)
SELECT * FROM emprestimos
WHERE data_emprestimo = '2023-11-15';
--Descubra quem pegou qual livro nesse dia
SELECT 
	a.nome,
    b.data_emprestimo,
    c.titulo
FROM leitores as a
join emprestimos  as b ON a.id_leitor = b.id_leitor
join livros as c on b.id_livro = c.id_livro
WHERE b.data_emprestimo = '2023-11-15';
--Descubra qual livro tem apenas 1 exemplar (raro)
SELECT * from livros
where quantidade_estoque = 1;
--Quantos livros cada pessoa pegou naquela noite?
SELECT 
	a.nome,
    count(b.id_emprestimo) as quant_emprestimo
from leitores AS a
join emprestimos as b on a.id_leitor = b.id_leitor
where data_emprestimo = '2023-11-15'
GROUP bY a.nome
order by quant_emprestimo desc;
--Quem pegou esse livro raro na data?
SELECT 
	a.nome,
    c.titulo,
    b.data_emprestimo
from leitores as a
join emprestimos as b on a.id_leitor = b.id_leitor
join livros as c on b.id_livro = c.id_livro
where b.data_emprestimo = '2023-11-15' and c.id_livro = '3'
--Filtrar apenas leitores autorizados que pegaram o livro raro:
SELECT 
	a.nome,
    a.autorizado,
    c.titulo,
    b.data_emprestimo
from leitores as a
join emprestimos as b on a.id_leitor = b.id_leitor
join livros as c on b.id_livro = c.id_livro
where b.data_emprestimo = '2023-11-15' and c.id_livro = '3' and a.autorizado = '1';