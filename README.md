# 🛒 Banco de Dados Relacional — Sistema de Loja

Projeto de modelagem e implementação de um banco de dados relacional em **MySQL** para controle de clientes, localidades e contas a receber de uma loja.

## 🎯 Objetivo
Estruturar uma base de dados normalizada aplicando chaves primárias com autoincremento, chaves estrangeiras com integridade referencial, restrições de domínio (`NOT NULL`, `ENUM`) e criação de visões (`VIEW`) para consultas gerenciais.

---

## 🗂️ Estrutura dos Arquivos no Repositório

| Arquivo | Descrição |
| :--- | :--- |
| `Script Loja.sql` | Comandos **DDL** (`CREATE DATABASE`, `CREATE TABLE`) para criação da estrutura e relacionamentos. |
| `inserts_consultas.sql` | Comandos **DML** (`INSERT INTO`) para carga inicial de dados e consultas (`SELECT` / `VIEW`). |
| `backup_completo_loja.sql` | Dump completo gerado via `mysqldump` contendo estrutura e registros do banco `loja`. |

---

## 🏗️ Modelagem e Tabelas

O banco de dados **`loja`** é composto pelas seguintes entidades e relacionamentos:

* **`Estado`**: Armazena as unidades federativas (UF).
* **`Municipio`**: Armazena os municípios vinculados a um `Estado` (`1:N`).
* **`Cliente`**: Cadastro de clientes contendo dados pessoais (Nome, CPF, Celular, Endereço) vinculados a um `Municipio` (`1:N`).
* **`ContaReceber`**: Controle financeiro das vendas a prazo vinculadas a um `Cliente` (`1:N`), contendo data da conta, vencimento, valor e situação controlada por `ENUM('1', '2', '3')`.

### 👁️ Views Implementadas
* **`vw_ContasNaoPagas`**: Consulta que cruza as tabelas `ContaReceber` e `Cliente` (`INNER JOIN`) para listar rapidamente o ID da conta, nome e CPF do cliente, data de vencimento e valor de todas as contas pendentes (`Situação = '1'`).

---

## 🚀 Como Executar o Projeto

1. Certifique-se de ter o **MySQL Server** (versão 8.0+) e o **MySQL Workbench** instalados.
2. Clone este repositório ou baixe os arquivos `.sql`.
3. Execute o script `Script Loja.sql` para criar o banco de dados e as tabelas.
4. Execute o script `inserts_consultas.sql` para popular as tabelas e criar a *view* de consultas.
   * *Alternativa:* Você pode importar diretamente o arquivo `backup_completo_loja.sql` para restaurar toda a estrutura e os dados de uma só vez.

---

## 🛠️ Tecnologias Utilizadas
* **SGBD:** MySQL 8.0
* **Ferramenta de Administração:** MySQL Workbench
* **Versionamento:** Git & GitHub Desktop
