# Sistema de Gerenciamento de Pedidos (SQL)

[![SQL](https://img.shields.io/badge/Linguagem-SQL-blue.svg)](https://dev.mysql.com/doc/)
[![Banco de Dados](https://img.shields.io/badge/Banco%20de%20Dados-Relacional-orange.svg)]()
[![Status](https://img.shields.io/badge/Status-Concluído-green.svg)]()
[![Licença](https://img.shields.io/badge/Licença-MIT-lightgrey.svg)](LICENSE)

## 📝 Descrição do Projeto

Este projeto consiste na criação de um esquema de banco de dados relacional completo para um sistema de gerenciamento de pedidos, com foco em um cenário de serviço de delivery. Ele abrange desde a definição das tabelas e seus relacionamentos até a inserção de dados de exemplo e a realização de consultas básicas.

O objetivo principal foi aplicar conceitos de modelagem de dados, normalização e integridade referencial para construir uma base de dados robusta e eficiente para uma aplicação transacional.

## ✨ Funcionalidades e Componentes

* **Criação de Banco de Dados:** Script SQL para criar o banco de dados `sistema_pedidos`.
* **Definição de Tabelas:**
    * `Enderecos`: Armazena informações de CEP, UF, município e logradouro.
    * `Clientes`: Gerencia dados dos clientes, incluindo nome, CPF e vínculo com endereços.
    * `TelefonesClientes`: Permite múltiplos telefones por cliente.
    * `EnderecosClientes`: Associa clientes a endereços específicos de residência/entrega, com número e complemento.
    * `Cardapio`: Lista os produtos disponíveis para pedido, com preço e descrição.
    * `Pedidos`: Registra os pedidos, associando-os a clientes, endereços de entrega, data, preço total e status.
    * `ItensPedidos`: Detalha os produtos incluídos em cada pedido, com quantidade e subtotal.
    * `Entregadores`: Gerencia informações dos entregadores.
    * `Entregas`: Registra as entregas realizadas, vinculando entregadores e pedidos.
* **Relacionamentos (Chaves Estrangeiras):** Todas as tabelas são interligadas por chaves estrangeiras, garantindo a integridade e consistência dos dados.
* **Restrições de Integridade:** Uso de `NOT NULL`, `UNIQUE` e `CHECK` para impor regras de negócio e qualidade dos dados.
* **Inserção de Dados de Exemplo:** Scripts `INSERT` para popular as tabelas com dados fictícios, facilitando o teste e a compreensão da estrutura.
* **Consultas Básicas:** Exemplos de comandos `SELECT` para visualizar os dados e filtrar informações, como pedidos com status específico.

## 📁 Estrutura do Projeto

O repositório está organizado da seguinte forma:

* **`sql/`**: Este diretório contém o script SQL principal para criar o banco de dados e suas tabelas, além de popular com dados de exemplo.
    * `sistema_pedidos_schema.sql`: O arquivo SQL com todas as instruções DDL (CREATE DATABASE, CREATE TABLE) e DML (INSERT).
* `README.md`: Este arquivo, que fornece uma visão geral do projeto.

## 🚀 Como Utilizar / Configurar o Banco de Dados

Para configurar este banco de dados em seu ambiente, siga os passos abaixo:

1.  **Pré-requisitos:**
    * Um sistema de gerenciamento de banco de dados relacional (SGBD) como [MySQL](https://dev.mysql.com/downloads/mysql/) ou [MariaDB](https://mariadb.org/download/).
    * Um cliente SQL (ex: MySQL Workbench, DBeaver, ou o terminal do MySQL/MariaDB).

2.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/biapeters/seu-repositorio-sql-pedidos.git](https://github.com/biapeters/seu-repositorio-sql-pedidos.git)
    ```
    *(**Lembre-se de substituir `seu-repositorio-sql-pedidos` pelo nome real do seu repositório!**)*

3.  **Acesse seu cliente SQL:**
    Abra seu cliente MySQL/MariaDB preferido e conecte-se ao seu servidor de banco de dados.

4.  **Execute o script SQL:**
    Copie o conteúdo do arquivo `sql/sistema_pedidos_schema.sql` (que é o código que você me enviou) e execute-o em seu cliente SQL. Isso criará o banco de dados, as tabelas, os relacionamentos e inserirá os dados de exemplo.

    Alternativamente, você pode executar o script via linha de comando:
    ```bash
    mysql -u seu_usuario -p < sql/sistema_pedidos_schema.sql
    ```
    *(Substitua `seu_usuario` pelo seu nome de usuário do MySQL/MariaDB.)*

## 🛠️ Tecnologias Utilizadas

* **SQL (Structured Query Language):** Linguagem padrão para gerenciamento de bancos de dados relacionais.
* **MySQL/MariaDB:** SGBD utilizado para a criação e manipulação do esquema.
* **Modelagem de Dados:** Conceitos de design de banco de dados.

## 🧠 Aprendizados e Desafios

Este projeto foi fundamental para aprofundar minha compreensão em:

* **Modelagem Relacional:** A capacidade de traduzir requisitos de negócio em um esquema de banco de dados eficiente, definindo entidades, atributos e relacionamentos.
* **Integridade de Dados:** O uso de chaves primárias, chaves estrangeiras, `NOT NULL` e `UNIQUE` para garantir a consistência e a validade das informações armazenadas.
* **Consultas SQL:** Prática na escrita de comandos DDL (Data Definition Language) para criar e modificar a estrutura do banco, e DML (Data Manipulation Language) para inserir e consultar dados.
* **Otimização de Esquema:** Considerações sobre como a estrutura do banco pode impactar o desempenho e a escalabilidade de uma aplicação.

O principal desafio foi garantir que todos os relacionamentos entre as tabelas estivessem corretamente definidos para refletir a lógica de um sistema de pedidos real, evitando redundâncias e garantindo a integridade dos dados.

## 🤝 Contribuições

Contribuições são bem-vindas! Se você tiver sugestões, melhorias ou encontrar algum bug, sinta-se à vontade para abrir uma issue ou enviar um pull request.

## 📄 Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

Made with ❤️ by Bianca Peters

