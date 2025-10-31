# Utilise Keycloak version 21 en mode production
FROM quay.io/keycloak/keycloak:21.0.0

# Copie le realm exporté (BBDA-realm.json)
COPY realms /opt/keycloak/data/import

# Copie ton thème personnalisé
COPY themes /opt/keycloak/themes

# Activer HTTP et configurer le proxy
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge
ENV KC_HOSTNAME_STRICT=false

# Création automatique du compte administrateur
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123

# Définir la base de données comme PostgreSQL
ENV KC_DB=postgres

# Exposer le port (Render utilisera sa variable $PORT)
EXPOSE 8080
ENV KC_HTTP_PORT=${PORT}

# Commande de démarrage en mode production et import automatique du realm
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--import-realm"]
