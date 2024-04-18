# Utiliser l'image officielle Golang comme image de base
FROM golang:1.16

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

RUN go install github.com/ybkuroki/go-webapp-sample@latest

RUN go run main.go
