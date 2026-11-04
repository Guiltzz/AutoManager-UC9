CREATE TABLE cliente (
    id  SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150)UNIQUE,
    endereco VARCHAR(200),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

ALTER TABLE nome_da_tabela 
ALTER COLUMN cpf TYPE VARCHAR(14);

CREATE TABLE veiculo (
    id  SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(7) NOT NULL UNIQUE,
    marca VARCHAR(60) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    ano INT NOT NULL CHECK (ano BETWEEN 1900 AND 2100),
    cor VARCHAR(40),
    observacao TEXT,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,

        FOREIGN KEY (cliente_id)REFERENCES cliente(id)
);

create table mecanico (
id SERIAL PRIMARY KEY,
nome VARCHAR(120) NOT NULL,
especialidade VARCHAR (100) NOT NULL,
telefone VARCHAR(20),
data_admissao DATE NOT NULL DEFAULT CURRENT_DAT
)

CREATE TABLE servico (
    id INT SERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL UNIQUE,
    categoria VARCHAR(80) NOT NULL,
    valor_base NUMERIC(10,2) NOT NULL DEFAULT 0
        CHECK (valor_base >= 0),
    tempo_estimado_horas NUMERIC(5,2)
        CHECK (tempo_estimado_horas > 0),
    observacao TEXT,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE ordem_servico (
    id  SERIAL PRIMARY KEY,
    veiculo_id INT NOT NULL,
    mecanico_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_abertura DATE NOT NULL DEFAULT CURRENT_DATE,
    data_conclusao DATE,
    descricao_problema TEXT NOT NULL,
    diagnostico TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'ABERTA',
    valor_cobrado NUMERIC(10,2) NOT NULL DEFAULT 0,
    observacao TEXT,

        FOREIGN KEY (veiculo_id) REFERENCES veiculo(id),

        FOREIGN KEY (mecanico_id) REFERENCES mecanico(id),

    
        FOREIGN KEY (servico_id) REFERENCES servico(id),

    
        CHECK (status IN ('ABERTA', 'EM_ANDAMENTO', 'CONCLUIDA', 'CANCELADA')),

        CHECK (valor_cobrado >= 0)
);

SELECT * FROM  cliente
