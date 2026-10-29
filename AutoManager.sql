CREATE TABLE ordem_servico (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    veiculo_id INTEGER NOT NULL,
    mecanico_id INTEGER NOT NULL,
    servico_id INTEGER NOT NULL,
    data_abertura TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_conclusao TIMESTAMP,
    descricao_problema TEXT NOT NULL,
    diagnostico TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'ABERTA',
    valor_cobrado NUMERIC(10,2) NOT NULL DEFAULT 0,
    observacao TEXT,

    CONSTRAINT fk_os_veiculo
        FOREIGN KEY (veiculo_id) REFERENCES veiculo(id),

    CONSTRAINT fk_os_mecanico
        FOREIGN KEY (mecanico_id) REFERENCES mecanico(id),

    CONSTRAINT fk_os_servico
        FOREIGN KEY (servico_id) REFERENCES servico(id),

    CONSTRAINT chk_os_status
        CHECK (status IN ('ABERTA', 'EM_ANDAMENTO', 'CONCLUIDA', 'CANCELADA')),

    CONSTRAINT chk_os_valor
        CHECK (valor_cobrado >= 0)
);