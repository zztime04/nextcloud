#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 6: Configuring Apache..."

# Create Apache virtual host configuration file
sudo tee $APACHE_VHOST_CONF > /dev/null <<EOF
<VirtualHost *:80>
    ServerName your_domain_or_ip # Replace with your actual domain or IP address
    DocumentRoot ${NEXTCLOUD_INSTALL_DIR}/

    <Directory ${NEXTCLOUD_INSTALL_DIR}/>
        Require all granted
        AllowOverride All
        Options FollowSymLinks MultiViews

        <IfModule mod_dav>
            Dav off
        </IfModule>
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF

# Check if config file creation was successful
if [ $? -eq 0 ]; then
    echo "Step 6: Apache virtual host file created at $APACHE_VHOST_CONF."
else
    echo "Step 6: Error creating Apache virtual host file. Exiting."
    exit 1
fi

# Enable necessary Apache modules
echo "Step 6: Enabling Apache modules..."
sudo a2enmod rewrite headers env dir mime

# Check if modules were enabled successfully
if [ $? -eq 0 ]; then
    echo "Step 6: Apache modules enabled."
else
    echo "Step 6: Error enabling Apache modules. Exiting."
    exit 1
fi

# Enable the new virtual host configuration
echo "Step 6: Enabling Nextcloud virtual host..."
sudo a2ensite $(basename $APACHE_VHOST_CONF)

# Check if site was enabled successfully
if [ $? -eq 0 ]; then
    echo "Step 6: Nextcloud virtual host enabled."
else
    echo "Step 6: Error enabling Nextcloud virtual host. Exiting."
    exit 1
fi

# Disable the default virtual host configuration (if it exists)
if [ -f "$APACHE_DEFAULT_VHOST_CONF" ]; then
    echo "Step 6: Disabling default Apache virtual host..."
    sudo a2dissite $(basename $APACHE_DEFAULT_VHOST_CONF)
    # Check if default site was disabled successfully
    if [ $? -eq 0 ]; then
        echo "Step 6: Default virtual host disabled."
    else
        echo "Step 6: Warning: Error disabling default virtual host."
    fi
else
    echo "Step 6: Default Apache virtual host not found, skipping disable."
fi


# Check Apache configuration syntax
echo "Step 6: Checking Apache configuration syntax..."
sudo apache2ctl configtest

# Check if config test was successful
if [ $? -eq 0 ]; then
    echo "Step 6: Apache configuration syntax is OK."
else
    echo "Step 6: Error in Apache configuration syntax. Exiting."
    exit 1
fi

# Reload Apache to apply changes
echo "Step 6: Reloading Apache..."
sudo systemctl reload apache2

# Check if reload was successful
if [ $? -eq 0 ]; then
    echo "Step 6: Apache reloaded successfully."
else
    echo "Step 6: Error reloading Apache. Exiting."
    exit 1
fi