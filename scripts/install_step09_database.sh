#!/bin/bash
set -e

# 加载变量
source ./scripts/00-variables.sh

echo "Step 9: 安装 MariaDB 并配置数据库..."

# 安装 MariaDB
echo "正在安装 MariaDB..."
apt update
DEBIAN_FRONTEND=noninteractive apt install -y mariadb-server

# 启动 MariaDB 服务
systemctl enable mariadb
systemctl start mariadb

echo "配置 MariaDB 安全性（替代 mysql_secure_installation）..."
mysql -u root <<EOF
-- 设置 root 密码
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
-- 删除匿名用户
DELETE FROM mysql.user WHERE User='';
-- 禁止 root 远程登录
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
-- 删除 test 数据库
DROP DATABASE IF EXISTS test;
-- 删除 test 权限
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
-- 刷新权限
FLUSH PRIVILEGES;
EOF

echo "创建数据库与用户（用于 Nextcloud）..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'$DB_HOST';
FLUSH PRIVILEGES;
EOF

echo "✅ MariaDB 配置完成："
echo " - 数据库名: $DB_NAME"
echo " - 用户名: $DB_USER"
echo " - 主机: $DB_HOST"
echo " - MariaDB root 密码: (已隐藏)"

echo "Step 9: Database configuration step acknowledged. Proceeding with the next steps."