#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

# Install libnginx-mod-rtmp
echo "Installing libnginx-mod-rtmp..."
sudo apt install -y libnginx-mod-rtmp

# Clone the RTMP server repository
echo "Cloning the RTMP server repository..."
git clone https://github.com/nishantnz/rtmp-server.git

# Copy the nginx configuration file
echo "Copying the nginx configuration file..."
sudo cp ./rtmp-server/nginx.conf /etc/nginx/nginx.conf

# Restart NGINX service
echo "Restarting NGINX service..."
sudo systemctl restart nginx.service

# Set ownership of /tmp/hls to www-data
echo "Setting ownership of /tmp/hls directory..."
sudo chown -R www-data:www-data /tmp/hls

# Output completion message
echo "RTMP server setup completed successfully."
