# Sistema de Pedidos Lanchonete

## Descrição do Projeto
Este projeto tem como objetivo implementar um sistema de pedidos para uma lanchonete, com funcionalidades de cadastro de clientes, cardápio, pedidos e entrega, simulando um sistema de delivery. O sistema foi desenvolvido utilizando MySQL para o banco de dados e conta com as seguintes funcionalidades:

- **Cadastro de Clientes**: Armazena dados de clientes como nome, telefone, código e endereço.
- **Cardápio**: Armazena informações dos sanduíches disponíveis para o pedido, incluindo código do item, nome e preço.
- **Pedidos**: Permite a criação de pedidos com um ou mais itens, informando quantidades e status (em preparação, em entrega ou entregue).
- **Entregadores**: Realiza o cadastro dos entregadores com nome, telefone e código.
- **Consultas**: Permite consultar pedidos em preparação.

## Tecnologias Utilizadas
- **Banco de Dados**: MySQL
- **Modelagem de Dados**: BrModelo (Modelo Conceitual)
- **Ferramenta de Design de Banco**: MySQL Workbench

## Funcionalidades

### Cadastro de Clientes:
- Nome
- Telefone
- Endereço

### Cadastro de Cardápio:
- Nome do Sanduíche
- Preço Unitário
- Descrição

### Realização de Pedidos:
- Cadastro do pedido com o status e os itens selecionados
- Pedidos podem estar em 3 status: em preparação, em entrega ou entregue

### Cadastro de Entregadores:
- Nome
- Telefone
- Código

### Consultas:
- Consulta para listar pedidos em preparação

## Estrutura do Banco de Dados
O banco de dados foi estruturado com as seguintes tabelas:

- **Clientes**: Armazena os dados dos clientes (nome, telefone, endereço).
- **Cardápio**: Armazena os sanduíches disponíveis no cardápio (nome, preço, descrição).
- **Pedidos**: Armazena os pedidos feitos pelos clientes, com o status e dados associados.
- **ItensPedidos**: Relaciona os pedidos aos itens do cardápio, incluindo quantidades e subtotal.
- **Entregadores**: Armazena informações dos entregadores (nome, telefone, código).
- **Entregas**: Registra as entregas realizadas pelos entregadores para cada pedido.

## Inserção de Dados

O sistema permite a inserção de dados de forma que as integridades referenciais sejam mantidas entre as tabelas. Por exemplo, ao criar um pedido, é necessário inserir dados em Pedidos, ItensPedidos, e Entregas, garantindo que todas as tabelas relacionadas ao pedido sejam atualizadas corretamente.


```sql
-- Inserir Cliente
INSERT INTO Clientes (nome, id_endereco, CPF)
VALUES ('João Silva', 1, '99988877766');

-- Inserir Pedido
INSERT INTO Pedidos (id_cliente, data_pedido, preco_total, id_endereco_cliente, pedido_status)
VALUES (1, NOW(), 15.50, 1, '0');

-- Inserir Itens do Pedido
INSERT INTO ItensPedidos (id_pedido, id_produto, quantidade, preco_unitario, subtotal)
VALUES (1, 1, 1, 15.50, 15.50);
```
## Consultas

É possível consultar os pedidos que estão em preparação no sistema, utilizando o seguinte código SQL:

```sql
SELECT id_pedido, id_cliente, data_pedido, pedido_status
FROM Pedidos
WHERE pedido_status = '0';
```

## Como Rodar o Projeto

### Pré-requisitos
- MySQL instalado e configurado
- MySQL Workbench para visualização e design do banco de dados (opcional)
