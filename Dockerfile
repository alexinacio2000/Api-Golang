# Use uma versão do Go que suporte 1.24.1 (a mais recente no momento é 1.22)
FROM golang:1.22-alpine AS builder

WORKDIR /app

# Primeiro copie os arquivos de módulo para aproveitar o cache de camadas
COPY go.mod go.sum ./
RUN go mod download

# Depois copie o resto do código
COPY . .

# Construa a aplicação
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./cmd/main.go

# Estágio final com imagem mínima
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/main .

EXPOSE 8080
CMD ["./main"]