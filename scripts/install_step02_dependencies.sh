#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 2: Updating system and installing dependencies..."

# Update system package list
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Install Nextcloud dependencies (PHP 8.2 and extensions, Apache, wget, unzip)
# Note: PHP version and extensions should match Nextcloud requirements.
# This example uses PHP 8.2. Adjust if needed.
sudo apt install -y apache2 php8.2 libapache2-mod-php8.2 php8.2-gd php8.2-mysql php8.2-curl php8.2-intl php8.2-json php8.2-zip php8.2-xml php8.2-mbstring php8.2-apcu php8.2-redis php8.2-imagick php8.2-gmp php8.2-bcmath wget unzip

# Check if installation was successful (basic check)
if [ $? -eq 0 ]; then
    echo "Step 2: Dependencies installed successfully."
else
    echo "Step 2: Error installing dependencies. Exiting."
    exit 1
fi