CREATE DATABASE cantina


-- Tabela de funcionarios
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL
);

-- Tabela de produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INTEGER DEFAULT 0
    tipo  VARCHAR(20)
);

-- Tabela de vendas
CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    funcionario_id INTEGER REFERENCES funcionarios(id),
    produto_id INTEGER REFERENCES produtos(id),
    quantidade INTEGER NOT NULL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO funcionarios (nome, email, senha) VALUES 
('Ademir', 'adimin@pizzaria.com.br', 'admin123'),
('Seu Ze', 'funcionario1@pizzaria.com.br', '123456'),

INSERT INTO produtos (nome, preco, estoque, tipo) VALUES
('Salgado de Frango', 10.50, 0, Salgado Assado),
('Coca Cola', 12.50, 0, Coca Cola 220ml),
('Bolo de Chocolate', 15.50, 0, Bolo de Pote de Chocolate),

INSERT INTO VENDAS (funcionario_id, produto_id, quantidade) VALUES
(1, 1, 1),
(1, 2, 1),

UPDATE produtos
SET estoque = estoque - (
    SELECT SUM(quantidade)
    FROM vendas
    WHERE vendas.produto_id = produtos.id,
)









-- Relacionamentos
-- 1 usuário ----> N vendas
-- 1 pizza  ----> N vendas