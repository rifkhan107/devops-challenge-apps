#!/bin/bash

# Update the package repository
sudo apt-get update

# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM into the current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Download and install Node.js (using NVM)
nvm install 20

# Verifies the right Node.js version is in the environment
echo "Node version installed:"
node -v # should print `v20.x.x`

# Verifies the right NPM version is in the environment
echo "NPM version installed:"
npm -v # should print `10.x.x`


# Install Nginx
sudo apt-get install -y nginx

# Create Nginx server blocks for web.example.com and api.example.com
sudo tee /etc/nginx/sites-available/web.sreinsider.info <<EOF
server {
    listen 80;
    server_name web.sreinsider.info;

    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

sudo tee /etc/nginx/sites-available/api.sreinsider.info <<EOF
server {
    listen 80;
    server_name api.sreinsider.info;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Enable the new server blocks
sudo ln -s /etc/nginx/sites-available/web.sreinsider.info /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/api.sreinsider.info /etc/nginx/sites-enabled/

# Check the nginx configuration and reload if it's ok
sudo nginx -t && sudo systemctl reload nginx

# Install Certbot and request SSL certificates
sudo apt-get install -y certbot python3-certbot-nginx
sudo certbot --nginx -d web.sreinsider.info -d api.sreinsider.info

# Automatic certificate renewal
echo "0 12 * * * /usr/bin/certbot renew --quiet" | sudo tee -a /etc/crontab > /dev/null
