#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 5: Setting up Nextcloud data directory..."

# Create the data directory
sudo mkdir -p $NEXTCLOUD_DATA_DIR

# Check if directory creation was successful
if [ $? -eq 0 ]; then
    echo "Step 5: Data directory created at $NEXTCLOUD_DATA_DIR."
else
    echo "Step 5: Error creating data directory. Exiting."
    exit 1
fi

# Set ownership of the data directory to the web server user
sudo chown -R $WEB_SERVER_USER:$WEB_SERVER_USER $NEXTCLOUD_DATA_DIR

# Check if ownership change was successful
if [ $? -eq 0 ]; then
    echo "Step 5: Ownership of data directory set to $WEB_SERVER_USER."
else
    echo "Step 5: Error setting ownership of data directory. Exiting."
    exit 1
fi