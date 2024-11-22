# Usar a imagem base do PHP com Apache
FROM php:8.2-apache

# Instalar as extensões do MySQL
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Copiar o código-fonte para o contêiner
COPY ./src /var/www/html

# Configurar permissões do Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
