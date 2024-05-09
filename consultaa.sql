CREATE TABLE Usuario (
idUsuario INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
senha CHAR(8) NOT NULL,
cpf CHAR(11) NOT NULL,
email VARCHAR(50) NOT NULL,
celular VARCHAR(50) NOT NULL,
genero VARCHAR(14) NOT NULL,
rg VARCHAR(20) NOT NULL,
endereco VARCHAR(100) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL,
cep CHAR(8) NOT NULL,
bairro VARCHAR(30) NOT NULL,
CONSTRAINT PRIMARY KEY (idUsuario)
);
 
 
SELECT * FROM usuario
 
DROP TABLE Aluno
CREATE TABLE Aluno (
idAluno INT AUTO_INCREMENT NOT NULL,
matricula VARCHAR(10) NOT NULL,
nivelPontualidade VARCHAR(45),
idUsuario INT NOT NULL,
CONSTRAINT PRIMARY KEY (idAluno),
CONSTRAINT FK_Aluno_Usuario 
FOREIGN KEY (idUsuario)
REFERENCES Usuario(idUsuario)
);

 
SELECT * FROM Aluno
 
DROP TABLE Professor
 
CREATE TABLE Professor (
areaAtuacao VARCHAR(10) NOT NULL,
salario DECIMAL(6,2) NOT NULL,
idUsuario INT NOT NULL,
CONSTRAINT FK_Professor_Usuario 
FOREIGN KEY (idUsuario)
REFERENCES Usuario(idUsuario)
);
 
 
SELECT * FROM professor
 
DROP TABLE ContatoTelefonico
 
CREATE TABLE  ContatoTelefonico (
idContatoTelefonico INT AUTO_INCREMENT NOT NULL,
ddi VARCHAR(5) NOT NULL,
ddd CHAR(2),
numero CHAR(9),
idUsuario INT NOT NULL,
CONSTRAINT PRIMARY KEY (idContatoTelefonico),
CONSTRAINT FK_ContatoTelefonico_Usuario 
FOREIGN KEY (idUsuario)
REFERENCES Usuario(idUsuario)
);
 
SELECT * FROM ContatoTelefonico  
 
CREATE TABLE Recepcionista (
CTPS VARCHAR(30),
idUsuario INT NOT NULL,
CONSTRAINT FK_Recepcionista_Usuario 
FOREIGN KEY (idUsuario)
REFERENCES Usuario(idUsuario)
);
 
SELECT * FROM Recepcionista
 
CREATE TABLE Emprestimo (
idEmprestimo INT AUTO_INCREMENT NOT NULL,
DataEmprestimo DATETIME DEFAULT NOW(),
DataDevolucao DATETIME NOT NULL,
dataDevolucaoEfetiva DATETIME,
multa DECIMAL(6,2),
idAluno INT NOT NULL,
idRecepcionista INT NOT NULL,
idUsuario INT NOT NULL,
CONSTRAINT FK_Emprestimo_Recepcionista 
FOREIGN KEY (idUsuario)
REFERENCES Usuario(idUsuario),
CONSTRAINT FK_Emprestimo_Aluno
FOREIGN KEY (idAluno)
REFERENCES Aluno(idAluno),
CONSTRAINT FK_Emprestimo_Usuario
FOREIGN KEY (idUsuario)
REFERENCES Aluno(idUsuario),
CONSTRAINT PRIMARY KEY (idEmprestimo)
);
 
SELECT * FROM Emprestimo
 
CREATE TABLE EmprestimoLivro(
idEmprestimo INT NOT NULL,
idLivro INT NOT NULL,
CONSTRAINT fk_EmprestimoLivro_Emprestimo FOREIGN KEY (idEmprestimo) REFERENCES Emprestimo (idEmprestimo),
CONSTRAINT fk_EmprestimoLivro_Livro FOREIGN KEY (idLivro) REFERENCES Livro (idLivro),
CONSTRAINT PRIMARY KEY(idEmprestimo, idLivro)
);
 
SELECT * FROM EmprestimoLivro
 
CREATE TABLE Autor (
nome VARCHAR(50) NOT NULL,
nacionalidade VARCHAR(30),
idAutor INT NOT NULL AUTO_INCREMENT,
CONSTRAINT PRIMARY KEY (idAutor)
);
 
SELECT * FROM Autor
 
CREATE TABLE Editora (
idEditora INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(30) NOT NULL,
celular VARCHAR(14) NOT NULL,
email VARCHAR(50) NOT NULL,
responsavel VARCHAR(50) NOT NULL,
isbn CHAR(10),
CONSTRAINT PRIMARY KEY(idEditora)
);
 
SELECT * FROM Editora
 
CREATE TABLE Livro (
idLivro INT auto_increment NOT NULL,
nome VARCHAR(100) NOT NULL,
tomo VARCHAR(10) NOT NULL,
genero VARCHAR(15) NOT NULL,
qtdPaginas INT,
idioma VARCHAR(20) NOT NULL,
ano INT,
edicao INT,
ISEN CHAR(13),
idEditora INT NOT NULL,
CONSTRAINT PRIMARY KEY (idLivro),
CONSTRAINT FK_Livro_Editora FOREIGN KEY(idEditora)
REFERENCES Editora(idEditora),
CONSTRAINT UNIQUE (tomo)
);
 
SELECT * FROM Livro
 
CREATE TABLE LivroAutor (
idLivro INT NOT NULL,
idAutor INT NOT NULL,
CONSTRAINT FK_Livro_Autor FOREIGN KEY (idLivro) REFERENCES Livro(idLivro),
CONSTRAINT FK_Livro_Autores FOREIGN KEY (idAutor) REFERENCES Autor(idAutor)
);
SELECT * FROM LivroAutor