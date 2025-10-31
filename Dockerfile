# Utilise Keycloak version 21
FROM quay.io/keycloak/keycloak:21.1.1

# Copie le realm exporté
COPY realms /opt/keycloak/data/import

# Copie ton thème personnalisé
COPY themes /opt/keycloak/themes

# Autres configurations utiles
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge
ENV KC_HOSTNAME_STRICT=false

# Import automatique du realm BBDA
ENV KEYCLOAK_IMPORT=/opt/keycloak/data/import/BBDA-realm.json

# Création automatique du compte administrateur
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123

# Port HTTP par défaut (Render utilise la variable $PORT)
EXPOSE 8080

# Commande de démarrage de Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
