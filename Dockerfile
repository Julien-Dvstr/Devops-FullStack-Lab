# Image Nginx légère
FROM nginx:alpine

# Supprime la page par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copie le portfolio dans le dossier servi par Nginx
COPY app/ /usr/share/nginx/html/

# Expose le port 80
EXPOSE 80

# Nginx démarre automatiquement
CMD ["nginx", "-g", "daemon off;"]