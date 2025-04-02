# Projeto Go API Simples

Este projeto é uma API simples em Go criada como parte do meu desafio de aprendizado da linguagem Go. A API implementa apenas os métodos **GET** e **POST** para manipulação de produtos.

## 📋 Pré-requisitos

- Go 1.18+ instalado
- Docker e Docker Compose (opcional, para rodar o PostgreSQL em container)
- Git (opcional)

## 🚀 Como executar

### Opção 1: Localmente (com PostgreSQL em Docker)

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/go-api-simples.git
cd go-api-simples
```
2. Inicie o PostgreSQL com Docker:
```bash
docker compose up -d
```
3. Execute a aplicação:
```bash
go run cmd/main.go
```

### Opção 2: Localmente (sem Docker)

1. Configure um PostgreSQL local e atualize as credenciais em `db/conn.go`.
2. Execute a aplicação:
```bash
go run cmd/main.go
```

## 🌐 Endpoints

### GET /products
Retorna todos os produtos.

**Exemplo de resposta:**
```json
[
  {
    "id": 1,
    "name": "Produto A",
    "price": 19.99
  }
]
```

### POST /products
Cria um novo produto.

**Exemplo de requisição:**
```json
{
  "name": "Novo Produto",
  "price": 29.99
}
```

## 🛠️ Estrutura do Projeto

```
go-api-simples/
├── cmd/
│   └── main.go          # Ponto de entrada da aplicação
├── db/
│   └── conn.go          # Configurações de conexão com o DB
├── model/
│   └── product.go       # Modelo de dados
├── repository/          # Camada de acesso a dados
├── usecase/             # Lógica de negócios
├── controller/          # Manipulação de requisições HTTP
├── go.mod               # Dependências do projeto
└── docker-compose.yml   # Configuração do PostgreSQL
```

## 🐳 Configuração do Docker

O arquivo `docker-compose.yml` configura um container PostgreSQL:

```yaml
services:
  go_db:
    image: postgres:12
    environment:
      POSTGRES_PASSWORD: 1234
      POSTGRES_USER: postgres
      POSTGRES_DB: postgres
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
```

## 📚 Aprendizados

Neste projeto pratiquei:

- Estruturação de projetos em Go
- Conexão com PostgreSQL
- Criação de APIs REST simples
- Separação em camadas (controller, usecase, repository)
- Uso do Docker para bancos de dados

## 🤝 Contribuições

Este é um projeto de aprendizado, mas sugestões são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.

## 📄 Licença

MIT
