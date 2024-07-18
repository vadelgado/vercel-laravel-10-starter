FROM php:7.4-cli

# Instalar librerías necesarias
RUN apt-get update && apt-get install -y libssl-dev

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar el contenido del proyecto al contenedor
COPY . /app

# Configurar el directorio de trabajo
WORKDIR /app

# Instalar las dependencias de Composer
RUN composer install

CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
