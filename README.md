# FormCepProject - Gerenciamento de Endereços via API

## Descrição

Este é um projeto Delphi que realiza a consulta de informações de endereço a partir de um CEP inserido no INPUT, realiza uma consulta externa para api (ViaCEP). Os dados recebidos em formato JSON são então utilizados para alimentar a classe `Address` e persistidos em um banco de dados. A aplicação também implementa validações para garantir a correção do formato do CEP e oferece funcionalidades para listar endereços por UF.

## Funcionalidades Principais

* **Consulta de CEP:** Permite ao usuário inserir um CEP e buscar as informações correspondentes através da API ViaCEP.
* **Validação de CEP:** Garante que o CEP inserido possui o formato correto (apenas números e 8 dígitos) antes da consulta à API.
* **Persistência de Dados:** Os dados do endereço obtidos da API são armazenados em um banco de dados.
    * **Inserção:** Se o CEP consultado não existir no banco, um novo registro é criado.
    * **Atualização:** Se o CEP já existir, as informações do endereço são atualizadas com os dados mais recentes da API.
* **Consulta por UF:** Permite listar todos os endereços armazenados no banco de dados para uma determinada UF.

## Tecnologias e Recursos Utilizados

* **Delphi:** A linguagem de programação utilizada para o desenvolvimento da aplicação. O projeto principal roda em 64 bits devido à necessidade de compatibilidade PostgreSQL.
* **FireDAC:** O framework de acesso a dados utilizado para interagir com o banco de dados.
* **Classes:**
    * `TAddressClass`: Uma classe para representar a estrutura dos dados de endereço (CEP, Logradouro, Complemento, Bairro, Localidade, UF, IBGE, GIA, DDD, SIAFI).
    * `TAddressModule`: Um Data Module que é responsável pela lógica de acesso ao banco de dados (conexão, criação de tabela, inserção, atualização, consulta).
    * `TServiceApiCep`: Uma classe responsável por realizar a comunicação com a API ViaCEP e processar a resposta JSON.
    * `TUtilities`: Uma classe com funções utilitárias para manipulação e validação de strings, como a remoção de hífen e a verificação do formato do CEP.

## Testes Unitários

* Aplicação principal utiliza PostgreSQL e roda em 64 bits, os testes unitários são realizados utilizando o banco de dados SQLite devido a limitações  framework de testes. A lógica de criação e manipulação da tabela `TspdCep` no `TAddressModule` considera essa diferença, adaptando os comandos SQL para o banco de dados em uso.

## Como Executar

1.  O projeto principal (`FormCepProject.dproj`) está configurado para compilação em 64 bits. Abra este projeto no Delphi.
2.  A unidade `AddresModuleDAO.pas` está configurada para conectar-se a um banco de dados PostgreSQL. Verifique ou ajuste os parâmetros de conexão na função `connectDatabase` conforme sua configuração:
    ```delphi
    ConnectDB.DriverName := 'PG';
    ConnectDB.Params.Database := 'AddressDB';
    ConnectDB.Params.UserName := 'postgres';
    ConnectDB.Params.Password := 'postgres';
    ConnectDB.Params.Add('Server=localhost');
    ConnectDB.Params.Add('Port=5432');
    ```
3.  Execute o projeto para visualizar a interface da aplicação.
