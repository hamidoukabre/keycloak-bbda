# Utilise Keycloak version 21
FROM quay.io/keycloak/keycloak:21.1.1

# Copie le realm exporté
COPY realms /opt/keycloak/data/import

# Copie ton thème personnalisé
COPY themes /opt/keycloak/themes

# Variables d'environnement pour la base PostgreSQL Render
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://$DATABASE_HOST:$DATABASE_PORT/$DATABASE_NAME
ENV KC_DB_USERNAME=$DATABASE_USER
ENV KC_DB_PASSWORD=$DATABASE_PASSWORD

# Autres configurations utiles
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge
ENV KC_HOSTNAME_STRICT=false

# Import automatique du realm BBDA
ENV KEYCLOAK_IMPORT=/opt/keycloak/data/import/BBDA-realm.json

# Création automatique du compte administrateur
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123

# Port HTTP par défaut
EXPOSE 8080

# Commande de démarrage de Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
