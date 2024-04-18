# Utiliser une image nginx officielle à partir de Docker Hub
FROM nginx:latest

# Copier les fichiers HTML, CSS, JS et autres ressources dans le dossier de contenu par défaut de nginx
COPY . /usr/share/nginx/html

# Exposer le port 80 pour permettre l'accès au serveur web
EXPOSE 80

# La commande CMD pour démarrer nginx lorsque le conteneur est lancé 
CMD ["nginx", "-g", "daemon off;"]
