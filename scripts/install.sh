#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Nextcloud Installation Script Started."

# Step 2: System Update and Dependency Installation
echo "Running Step 2: System Update and Dependency Installation..."
./scripts/install_step02_dependencies.sh
if [ $? -ne 0 ]; then
    echo "Step 2 failed. Exiting."
    exit 1
fi

# Step 3: Nextcloud Download
echo "Running Step 3: Nextcloud Download..."
./scripts/install_step03_download.sh
if [ $? -ne 0 ]; then
    echo "Step 3 failed. Exiting."
    exit 1
fi

# Step 4: File Extraction and Movement
echo "Running Step 4: File Extraction and Movement..."
./scripts/install_step04_extract_move.sh
if [ $? -ne 0 ]; then
    echo "Step 4 failed. Exiting."
    exit 1
fi

# Step 5: Data Directory Setting
echo "Running Step 5: Data Directory Setting..."
./scripts/install_step05_data_dir.sh
if [ $? -ne 0 ]; then
    echo "Step 5 failed. Exiting."
    exit 1
fi

# Step 6: Apache Configuration
echo "Running Step 6: Apache Configuration..."
./scripts/install_step06_apache_config.sh
if [ $? -ne 0 ]; then
    echo "Step 6 failed. Exiting."
    exit 1
fi

# Step 7: Permissions Setting
echo "Running Step 7: Permissions Setting..."
./scripts/install_step07_permissions.sh
if [ $? -ne 0 ]; then
    echo "Step 7 failed. Exiting."
    exit 1
fi

# Step 8: SELinux/AppArmor Configuration (If Enabled)
# echo "Running Step 8: SELinux/AppArmor Configuration..."
# ./scripts/install_step08_selinux_apparmor.sh
# Note: Step 8 is informational and does not exit on non-zero status as it might not apply to all systems.

# Step 9: Database Configuration
echo "Running Step 9: Database Configuration..."
./scripts/install_step09_database.sh
if [ $? -ne 0 ]; then
    echo "Step 9 failed. Exiting."
    exit 1
fi

# Step 10: Web Installation Wizard
echo "Running Step 10: Web Installation Wizard..."
./scripts/install_step10_web_wizard.sh
if [ $? -ne 0 ]; then
    echo "Step 10 failed. Exiting."
    exit 1
fi

# Step 11: Post-installation Optimization and Security Hardening
echo "Running Step 11: Post-installation Optimization and Security Hardening..."
./scripts/install_step11_post_install.sh
# Note: Step 11 contains manual steps and warnings, so it does not exit on non-zero status.

echo "Nextcloud Installation Script Finished."
echo "Please review the output of each step and perform any necessary manual actions."