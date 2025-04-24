#!/bin/bash

# Container name
CONTAINER_NAME="mariadb"

# Prompt for the current password
read -s -p "Enter the current root password for MariaDB: " CURRENT_PASSWORD
echo

# Prompt for the new password securely
read -s -p "Enter the new root password for MariaDB: " NEW_PASSWORD
echo

# Confirm new password
read -s -p "Confirm the new root password: " CONFIRM_PASSWORD
echo

# Check if passwords match
if [ "$NEW_PASSWORD" != "$CONFIRM_PASSWORD" ]; then
    echo "❌ Passwords do not match! Exiting..."
    exit 1
fi

echo "Changing MariaDB root password..."

# Update the root password inside the container using the current password
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$CURRENT_PASSWORD" <<EOF
USE mysql;
UPDATE user SET password=PASSWORD('$NEW_PASSWORD') WHERE user='root';
FLUSH PRIVILEGES;
EOF

# Check if the password update was successful
if [ $? -eq 0 ]; then
    echo "✅ Root password changed successfully!"
else
    echo "❌ Failed to change root password. Please check the current password and try again."
fi
