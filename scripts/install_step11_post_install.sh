#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 11: Performing post-installation optimization and security hardening..."

# Configure Cron job
echo "Step 11: Configuring Nextcloud Cron job..."
# It's recommended to use systemd timers or a dedicated cron file for Nextcloud.
# This is a basic example adding to the www-data user's crontab.
# Adjust the path to cron.php if necessary.
(crontab -u $WEB_SERVER_USER -l 2>/dev/null; echo "*/5 * * * * php -f ${NEXTCLOUD_INSTALL_DIR}/cron.php --force-auto") | crontab -u $WEB_SERVER_USER -

# Check if cron job was added successfully (basic check)
if [ $? -eq 0 ]; then
    echo "Step 11: Nextcloud Cron job configured for user $WEB_SERVER_USER."
else
    echo "Step 11: Warning: Error configuring Nextcloud Cron job. Please configure it manually."
fi


# Configure memory caching (APCu or Redis)
echo "Step 11: Configuring memory caching..."
echo "Memory caching (like APCu or Redis) is highly recommended for performance."
echo "Please refer to the Nextcloud documentation for detailed configuration steps."
echo "You will need to edit the config/config.php file."
# Example for APCu (add to config/config.php inside the config array):
# 'memcache.local' => '\OC\Memcache\APCu',
# Example for Redis (add to config/config.php inside the config array):
# 'memcache.local' => '\OC\Memcache\Redis',
# 'memcache.distributed' => '\OC\Memcache\Redis',
# 'memcache.locking' => '\OC\Memcache\Redis',
# 'redis' => array(
#      'host' => 'localhost',
#      'port' => 6379,
#      'timeout' => 0.0,
#      'password' => '', # Optional if Redis requires a password
#      'dbindex' => 0,
# ),


# Enable HTTPS
echo "Step 11: Enabling HTTPS..."
echo "Enabling HTTPS is crucial for security."
echo "This typically involves obtaining an SSL certificate (e.g., using Certbot with Let's Encrypt) and configuring Apache."
echo "Please refer to the Nextcloud and Certbot documentation for detailed steps."
# Example commands (requires certbot and mod_ssl):
# sudo apt install certbot python3-certbot-apache
# sudo certbot --apache

# Adjust based on Nextcloud security and performance warnings
echo "Step 11: Checking Nextcloud security and performance warnings..."
echo "After completing the web installation and accessing your Nextcloud instance, check the 'Overview' section in the Administration settings."
echo "Address any security or performance warnings displayed there."
echo "This might involve installing additional PHP extensions, configuring recommended PHP settings, or optimizing your database."