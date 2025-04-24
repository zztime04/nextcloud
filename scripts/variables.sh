#!/bin/bash

# This script contains variables for the Nextcloud installation process.

# Nextcloud version and download URL (replace with the actual latest version and URL)
NEXTCLOUD_VERSION="latest" # Placeholder, should be updated with a specific version
NEXTCLOUD_DOWNLOAD_URL="https://download.nextcloud.com/server/releases/latest.zip" # Placeholder, should be updated

# Installation directories
NEXTCLOUD_INSTALL_DIR="/var/www/nextcloud"
NEXTCLOUD_DATA_DIR="/mnt/nextcloud_data/nextcloud_data"

# Web server user
WEB_SERVER_USER="www-data"

# Apache configuration
APACHE_VHOST_CONF="/etc/apache2/sites-available/nextcloud.conf"
APACHE_DEFAULT_VHOST_CONF="/etc/apache2/sites-available/000-default.conf"

# MariaDB root 密码
MYSQL_ROOT_PASSWORD="StrongRootPass123!"
# Database configuration (replace with your actual database details)
DB_NAME="nextcloud_db" # Placeholder
DB_USER="nextcloud_user" # Placeholder
DB_PASSWORD="your_db_password" # Placeholder
DB_HOST="localhost"

# Server Name
SERVER_NAME="your_domain_or_ip" # Replace with your actual domain or IP address
# Add more variables as needed