FROM postgres:15-alpine

# Copiar el esquema de la base de datos
COPY db/schema.sql /docker-entrypoint-initdb.d/

# El script se ejecuta automáticamente al iniciar el contenedor
# si la base de datos no existe