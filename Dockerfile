# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory to /var/www/html/
WORKDIR /var/www/html/

# Copy the SimpleSAMLphp code into the container
COPY ./simplesaml /var/www/simplesamlphp/

# Install any necessary PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache web server
CMD ["apache2-foreground"]
