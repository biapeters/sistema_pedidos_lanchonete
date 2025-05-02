CREATE DATABASE IF NOT EXISTS sistema_pedidos;
USE sistema_pedidos;

-- Criação de tabelas
CREATE TABLE Enderecos (
	id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    CEP CHAR(8) NOT NULL UNIQUE,
    UF CHAR(2) NOT NULL,
    municipio VARCHAR(45) NOT NULL,
    logradouro VARCHAR(45) NOT NULL
);

CREATE TABLE Clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(85) NOT NULL,
	id_endereco INT NOT NULL,
	CPF VARCHAR(11) NOT NULL UNIQUE,
	FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

CREATE TABLE TelefonesClientes (
	id_cliente INT,
	telefone VARCHAR(11),
	PRIMARY KEY (id_cliente, telefone),
	FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE EnderecosClientes (
	id_endereco_cliente INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_endereco INT NOT NULL,
	numero_residencia VARCHAR(10) NOT NULL,
	complemento_residencia VARCHAR(45) NULL,
	FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
	FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

CREATE TABLE Cardapio (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    preco_unitario DECIMAL(5,2) NOT NULL,
    descricao VARCHAR(45) NOT NULL
);

CREATE TABLE Pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    preco_total DECIMAL(7,2) NOT NULL,
    id_endereco_cliente INT NOT NULL,
    pedido_status TINYINT NULL CHECK (pedido_status IN (0, 1, 2)),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_endereco_cliente) REFERENCES EnderecosClientes(id_endereco_cliente)
);

CREATE TABLE ItensPedidos (
	id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(5,2) NOT NULL,
    subtotal DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Cardapio(id_produto)
);

CREATE TABLE Entregadores (
	id_entregador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(85) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE Entregas (
	id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_entregador INT NOT NULL,
    id_pedido INT NOT NULL,
    data_entrega DATETIME NOT NULL,
    FOREIGN KEY (id_entregador) REFERENCES Entregadores(id_entregador),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

-- Inserção de dados
INSERT INTO Clientes (nome, id_endereco, CPF)
VALUES ('João Silva', 1, '99988877766');

INSERT INTO TelefonesClientes (id_cliente, telefone)
VALUES (1, '41999998888');

INSERT INTO EnderecosClientes (id_cliente, id_endereco, numero_residencia, complemento_residencia)
VALUES (1, 1, '123', 'Apto 101');

INSERT INTO Cardapio (nome, preco_unitario, descricao)
VALUES ('X-Burguer', 15.50, 'Pão, carne, queijo');

INSERT INTO Pedidos (id_cliente, data_pedido, preco_total, id_endereco_cliente, pedido_status)
VALUES (1, NOW(), 15.50, 1, '0');

INSERT INTO ItensPedidos (id_pedido, id_produto, quantidade, preco_unitario, subtotal)
VALUES (1, 1, 1, 15.50, 15.50);

INSERT INTO Entregadores (nome, telefone, CPF)
VALUES ('Carlos Entregador', '41988887777', '11122233344');

INSERT INTO Entregas (id_entregador, id_pedido, data_entrega)
VALUES (1, 1, NOW());

-- Consulta das tabelas
SELECT * 
FROM Enderecos;

SELECT * 
FROM Clientes;

SELECT * 
FROM TelefonesClientes;

SELECT *
FROM EnderecosClientes;

SELECT * 
FROM Cardapio;

SELECT id_pedido, id_cliente, data_pedido, pedido_status 
FROM Pedidos 
WHERE pedido_status = '0';

SELECT * 
FROM ItensPedidos;

SELECT * 
FROM Entregadores;

SELECT * 
FROM Entregas;
