#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 4: Extracting and moving Nextcloud files..."

# Define the expected zip file name from the URL
NEXTCLOUD_ZIP=$(basename $NEXTCLOUD_DOWNLOAD_URL)

# Extract to /tmp
unzip /tmp/$NEXTCLOUD_ZIP -d /tmp/

# Check if extraction was successful
if [ $? -eq 0 ]; then
    echo "Step 4: Nextcloud extracted successfully to /tmp/nextcloud."
else
    echo "Step 4: Error extracting Nextcloud. Exiting."
    exit 1
fi

# Move extracted files to the installation directory
sudo mv /tmp/nextcloud $NEXTCLOUD_INSTALL_DIR

# Check if move was successful
if [ $? -eq 0 ]; then
    echo "Step 4: Nextcloud moved to $NEXTCLOUD_INSTALL_DIR."
else
    echo "Step 4: Error moving Nextcloud files. Exiting."
    exit 1
fi