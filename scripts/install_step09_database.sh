#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 9: Configuring MariaDB for Nextcloud..."

# Create database and user for Nextcloud
# Note: This requires the MariaDB root password or a user with sufficient privileges.
# It's recommended to run this part manually or handle credentials securely.
# For demonstration purposes, we'll use a placeholder command.
echo "Please manually create the database and user in MariaDB with the following details:"
echo "Database Name: $DB_NAME"
echo "Database User: $DB_USER"
echo "Database Password: $DB_PASSWORD"
echo "Database Host: $DB_HOST"
echo "Example command (requires root access or similar):"
echo "sudo mysql -u root -p -e \"CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;\";"
echo "sudo mysql -u root -p -e \"CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASSWORD';\";"
echo "sudo mysql -u root -p -e \"GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'$DB_HOST';\";"
echo "sudo mysql -u root -p -e \"FLUSH PRIVILEGES;\";"

# Add a pause or require user confirmation before proceeding, as database creation is manual or requires secure handling of credentials.
read -p "Press Enter after you have manually configured the database..."

echo "Step 9: Database configuration step acknowledged. Proceeding with the next steps."