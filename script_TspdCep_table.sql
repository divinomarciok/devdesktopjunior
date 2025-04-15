CREATE TABLE IF NOT EXISTS TspdCep (
    ID SERIAL PRIMARY KEY,
    cep VARCHAR(9) UNIQUE,
    logradouro VARCHAR(100),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    localidade VARCHAR(100),
    uf VARCHAR(2),
    ibge VARCHAR(7),
    gia VARCHAR(5),
    ddd VARCHAR(3),
    siafi VARCHAR(5)
);