# Utiliser l'image officielle Golang comme image de base
FROM golang:1.16

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers go.mod et go.sum
COPY go.mod go.sum ./

# Télécharger toutes les dépendances
RUN go mod download

# Télécharger le module manquant
RUN go mod download github.com/casbin/casbin/v2

# Copier le code source dans le conteneur
COPY . .

# Compiler l'application
RUN go build -o main .

# Exposer le port 8081
EXPOSE 8081

# Commande à exécuter lors du démarrage du conteneur
CMD ["./main"]
