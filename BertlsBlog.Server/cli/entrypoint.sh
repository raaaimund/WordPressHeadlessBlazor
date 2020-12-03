#!/bin/sh

echo "⚙️ Configuring Wordpress database..."
rm -f /var/www/html/wp-config.php
wp core config \
    --allow-root \
    --path='/var/www/html/' \
    --dbhost=${DB_HOST} \
    --dbname=${DB_NAME} \
    --dbuser=${DB_USER} \
    --dbpass=${DB_PASSWORD} \
    --locale=${WORDPRESS_LOCALE} \
    --skip-check

echo "⚙️ Configuring Wordpress parameters..."
wp core install \
    --allow-root \
    --path='/var/www/html/' \
    --url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
    --title="${WORDPRESS_WEBSITE_TITLE}" \
    --admin_user=${WORDPRESS_ADMIN_USER} \
    --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
    --admin_email=${WORDPRESS_ADMIN_EMAIL}

wp option update siteurl "${WORDPRESS_WEBSITE_URL}" \
    --allow-root \
    --path='/var/www/html/' 
wp rewrite structure ${WORDPRESS_WEBSITE_POST_URL_STRUCTURE} \
    --allow-root \
    --path='/var/www/html/' 

wp plugin install https://github.com/wp-graphql/wp-graphql/archive/v1.0.zip --activate \
    --allow-root \
    --path='/var/www/html/' 