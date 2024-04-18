# Utiliser l'image officielle Golang comme image de base
FROM golang:1.22.2

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

RUN go install github.com/ybkuroki/go-webapp-sample@latest

RUN go run main.go
