CREATE DATABASE PortfolioDB;
USE PortfolioDB;

-- Tabela de Usuários (Opcional, caso queira um portfólio multiusuário)
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Tabela de Categorias (Para classificar os projetos)
CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL
);

-- Tabela de Projetos
CREATE TABLE Projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    imagem VARCHAR(255), -- URL da imagem do projeto
    link VARCHAR(255), -- Link para visualizar o projeto
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT, -- Relacionamento com usuário
    categoria_id INT, -- Relacionamento com categoria
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id) ON DELETE SET NULL,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id) ON DELETE SET NULL
);

-- Inserindo categorias padrão
INSERT INTO Categorias (nome) VALUES ('Web Development'), ('Design Gráfico'), ('Data Science');

-- Exemplo de inserção de um projeto
INSERT INTO Projetos (titulo, descricao, imagem, link, categoria_id) 
VALUES ('Meu Primeiro Site', 'Site desenvolvido em HTML, CSS e JS.', 'https://meusite.com/imagem.jpg', 'https://meusite.com', 1);

-- Consultando projetos
SELECT p.id, p.titulo, p.descricao, p.imagem, p.link, c.nome AS categoria
FROM Projetos p
LEFT JOIN Categorias c ON p.categoria_id = c.id;
