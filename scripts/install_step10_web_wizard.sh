#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 10: Proceeding to Web Installation Wizard."
echo "Please open your web browser and navigate to the Nextcloud address (based on your Apache ServerName or IP address)."
echo "Follow the on-screen instructions to complete the installation."
echo "You will need to provide the database details configured in Step 9 and set up the administrator account."
echo "Make sure to specify the data directory as $NEXTCLOUD_DATA_DIR during the web installation."

# Add a pause to allow the user to complete the web installation
read -p "Press Enter after you have completed the Nextcloud web installation..."

echo "Step 10: Web installation step acknowledged. Proceeding with post-installation steps."