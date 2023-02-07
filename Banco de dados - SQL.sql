-- Apaga o banco de dados se ele existir
DROP DATABASE IF EXISTS sistema_resilia;

-- Cria o banco de dados usando UTF-8 e buscas case-insensitive.
CREATE DATABASE sistema_resilia CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados
USE sistema_resilia;

-- Criar tabela (entidade)
CREATE TABLE polos (
	ID_Polos INT PRIMARY KEY AUTO_INCREMENT,
    Nome_do_polo VARCHAR(255) NOT NULL,
    Localização VARCHAR(255) NOT NULL,
	CNPJ VARCHAR(14) NOT NULL,
	Telefone VARCHAR(10) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	Hora_de_funcionamento VARCHAR(100) NOT NULL,
    
    ID_facilitadores VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_facilitadores) REFERENCES turmas (ID_facilitadores),
    ID_turmas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_turmas) REFERENCES turmas (ID_turmas),
    ID_matriculas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_matricula) REFERENCES turmas (ID_matricula),
    ID_alunos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_alunos) REFERENCES turmas (ID_alunos),
    ID_cursos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_cursos) REFERENCES turmas (ID_cursos),
    ID_professores VARCHAR(20) NOT NULL,
	FOREIGN KEY (ID_professores) REFERENCES professores (ID_professores)
	);

-- Criar tabela (entidade)
CREATE TABLE cursos (
	ID_cursos INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(255) NOT NULL,
	Valor VARCHAR(20) NOT NULL,
	Dat_de_inicio VARCHAR(20) NOT NULL,
	Data_de_termino VARCHAR(20) NOT NULL,
	
    ID_professores VARCHAR(20) NOT NULL,
	FOREIGN KEY (ID_professores) REFERENCES professores (ID_professores),
    ID_turmas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_turmas) REFERENCES turmas (ID_turmas),
    ID_facilitadores VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_facilitadores) REFERENCES turmas (ID_facilitadores)
);

-- Criar tabela (entidade)
CREATE TABLE professores (
    ID_professores INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Gênero VARCHAR(255) NOT NULL,
    Data_de_nascimento VARCHAR(11) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
    Endereço VARCHAR(100) NOT NULL,
	Formação VARCHAR(50) NOT NULL,
	
	ID_turmas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_turmas) REFERENCES turmas (ID_turmas),
    ID_polos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_polos) REFERENCES turmas (ID_polos),
    ID_cursos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_cursos) REFERENCES turmas (ID_cursos)
);

-- Criar tabela (entidade)
CREATE TABLE facilitadores (
    ID_facilitadores INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Gênero VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Data_de_nascimento VARCHAR(11) NOT NULL,
	Endereço VARCHAR(100) NOT NULL,
	Formação VARCHAR(50) NOT NULL,
	
	ID_turmas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_turmas) REFERENCES turmas (ID_turmas),
    ID_polos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_polos) REFERENCES turmas (ID_polos),
    ID_cursos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_cursos) REFERENCES turmas (ID_cursos)
);

-- Criar tabela (entidade)
CREATE TABLE alunos (
    ID_alunos INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(255) NOT NULL,
	Data_de_nascimento VARCHAR(11) NOT NULL,
	Endereço VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Telefone_de_contato VARCHAR(11) NOT NULL,
	Gênero VARCHAR(10) NOT NULL,
    
	ID_turmas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_turmas) REFERENCES turmas (ID_turmas),
    ID_matriculas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_matricula) REFERENCES turmas (ID_matricula),
    ID_polos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_polos) REFERENCES turmas (ID_polos)
);

-- Criar tabela (entidade)
CREATE TABLE matriculas (
    ID_Matrículas INT PRIMARY KEY AUTO_INCREMENT,
	Data_da_matrícula VARCHAR(11) NOT NULL,
    Numero_da_matrícula VARCHAR(11) NOT NULL,
    Nome_do_aluno VARCHAR(255) NOT NULL,
	    
	ID_polos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_polos) REFERENCES turmas (ID_polos),
    ID_cursos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_cursos) REFERENCES turmas (ID_cursos),
	ID_turmas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_turmas) REFERENCES turmas (ID_turmas),
    ID_alunos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_alunos) REFERENCES turmas (ID_alunos) 
    );

-- Criar tabela (entidade)
CREATE TABLE turmas (
	ID_Turmas INT PRIMARY KEY AUTO_INCREMENT,
    Data_de_inicio VARCHAR(11) NOT NULL,
    Data_de_termino VARCHAR(11) NOT NULL,
	Número_da_sala VARCHAR(15) NOT NULL,
    Carga_horária VARCHAR(11) NOT NULL,
		
	ID_facilitadores VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_facilitadores) REFERENCES turmas (ID_facilitadores),
    ID_professores VARCHAR(20) NOT NULL,
	FOREIGN KEY (ID_professores) REFERENCES professores (ID_professores),
    ID_cursos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_cursos) REFERENCES turmas (ID_cursos),
    ID_matriculas VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_matricula) REFERENCES turmas (ID_matricula),
    ID_polos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_polos) REFERENCES turmas (ID_polos),
    ID_alunos VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_alunos) REFERENCES turmas (ID_alunos) 
);
