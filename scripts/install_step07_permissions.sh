#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 7: Setting Nextcloud file and directory permissions..."

# Set ownership of the installation directory to the web server user
# This might be redundant if Step 4 already did this, but it's safer to ensure.
sudo chown -R $WEB_SERVER_USER:$WEB_SERVER_USER $NEXTCLOUD_INSTALL_DIR

# Check if ownership change was successful
if [ $? -eq 0 ]; then
    echo "Step 7: Ownership of installation directory set to $WEB_SERVER_USER."
else
    echo "Step 7: Error setting ownership of installation directory. Exiting."
    exit 1
fi

# Set file permissions
echo "Step 7: Setting file permissions..."
sudo find $NEXTCLOUD_INSTALL_DIR/ -type f -print0 | sudo xargs -0 chmod 0640

# Check if file permissions were set successfully
if [ $? -eq 0 ]; then
    echo "Step 7: File permissions set."
else
    echo "Step 7: Error setting file permissions. Exiting."
    exit 1
fi

# Set directory permissions
echo "Step 7: Setting directory permissions..."
sudo find $NEXTCLOUD_INSTALL_DIR/ -type d -print0 | sudo xargs -0 chmod 0750

# Check if directory permissions were set successfully
if [ $? -eq 0 ]; then
    echo "Step 7: Directory permissions set."
else
    echo "Step 7: Error setting directory permissions. Exiting."
    exit 1
fi

# Set specific directory permissions
echo "Step 7: Setting specific directory permissions..."
sudo chmod 0750 ${NEXTCLOUD_INSTALL_DIR}/apps/
sudo chmod 0750 ${NEXTCLOUD_INSTALL_DIR}/config/
sudo chmod 0750 ${NEXTCLOUD_INSTALL_DIR}/updater/

# Check if specific directory permissions were set successfully
if [ $? -eq 0 ]; then
    echo "Step 7: Specific directory permissions set."
else
    echo "Step 7: Error setting specific directory permissions. Exiting."
    exit 1
fi

# Set writable directory permissions (if exists)
if [ -d "${NEXTCLOUD_INSTALL_DIR}/writable/" ]; then
    echo "Step 7: Setting writable directory permissions..."
    sudo chmod 0770 ${NEXTCLOUD_INSTALL_DIR}/writable/
    # Check if writable directory permissions were set successfully
    if [ $? -eq 0 ]; then
        echo "Step 7: Writable directory permissions set."
    else
        echo "Step 7: Warning: Error setting writable directory permissions."
    fi
else
    echo "Step 7: Writable directory not found, skipping writable permissions."
fi