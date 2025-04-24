#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 3: Downloading Nextcloud..."

# Download the latest stable version to /tmp
wget -P /tmp $NEXTCLOUD_DOWNLOAD_URL

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Step 3: Nextcloud downloaded successfully to /tmp."
else
    echo "Step 3: Error downloading Nextcloud. Exiting."
    exit 1
fi