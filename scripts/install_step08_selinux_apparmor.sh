#!/bin/bash

# Source the variables file
source ./scripts/variables.sh

echo "Step 8: Checking and configuring SELinux/AppArmor (if enabled)..."

# Check if SELinux is enforcing
if command -v getenforce > /dev/null 2>&1 && [ "$(getenforce)" == "Enforcing" ]; then
    echo "Step 8: SELinux is in Enforcing mode. You may need to configure SELinux policies."
    echo "Refer to Nextcloud documentation for specific SELinux configurations."
    # Example (requires policycoreutils-python-utils):
    # sudo semanage fcontext -a -t httpd_sys_rw_content_t "${NEXTCLOUD_DATA_DIR}(/.*)?"
    # sudo restorecon -Rv ${NEXTCLOUD_DATA_DIR}
    # sudo semanage fcontext -a -t httpd_sys_rw_content_t "${NEXTCLOUD_INSTALL_DIR}/config(/.*)?"
    # sudo restorecon -Rv ${NEXTCLOUD_INSTALL_DIR}/config
    # sudo semanage fcontext -a -t httpd_sys_rw_content_t "${NEXTCLOUD_INSTALL_DIR}/apps(/.*)?"
    # sudo restorecon -Rv ${NEXTCLOUD_INSTALL_DIR}/apps
    # sudo semanage fcontext -a -t httpd_sys_rw_content_t "${NEXTCLOUD_INSTALL_DIR}/updater(/.*)?"
    # sudo restorecon -Rv ${NEXTCLOUD_INSTALL_DIR}/updater
    # sudo semanage fcontext -a -t httpd_sys_rw_content_t "${NEXTCLOUD_INSTALL_DIR}/version.php"
    # sudo restorecon -v ${NEXTCLOUD_INSTALL_DIR}/version.php
elif command -v aa-status > /dev/null 2>&1 && aa-status | grep "AppArmor status: enabled" > /dev/null; then
    echo "Step 8: AppArmor is enabled. You may need to configure AppArmor profiles."
    echo "Refer to Nextcloud documentation for specific AppArmor configurations."
    # Example:
    # sudo apt install apparmor-utils
    # sudo aa-complain /etc/apparmor.d/usr.sbin.apache2
    # sudo systemctl reload apparmor
else
    echo "Step 8: SELinux and AppArmor do not appear to be in enforcing/enabled mode. Skipping configuration."
fi