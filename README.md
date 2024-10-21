#Projeto Delphi, ConsultaCep Form


#ConsultaCep é um projeto em Delphi que realiza a consulta de CEPs utilizando a API do #ViaCEP. O objetivo é buscar informações de um CEP e salvá-las em um banco de dados, bem #como permitir consultas pelo estado e outras funcionalidades.

#Funcionalidades

#Consultar CEP: O método ConsultarCep consome a API ViaCEP para obter dados de um CEP e #salvar na tabela TspdCep.
#Gerenciamento de CEPs: O projeto salva novos CEPs no banco de dados e atualiza informações #existentes, se necessário.
#Consulta por estado: Exemplo de select que retorna todos os CEPs do estado do Paraná (PR).


#Collections de Teste: Inclui uma collection para realizar testes de consulta por CEP e #logradouro utilizando a API ViaCEP.



#Como utilizar


#1- Executar o projeto na pasta "view" chamado ConsultaCep.

#2- Na pasta service, configurar as variáveis de banco de dados no arquivo "moduleSQL"

#3- Compilar o projeto.

#4- Consultar CEP
