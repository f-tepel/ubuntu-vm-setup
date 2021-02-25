# Create users and setup ssh
useradd -m admin
echo "admin:Start1234" | chpasswd
usermod -aG sudo admin

useradd -m git
echo "git:Start1234" | chpasswd

# Install Nginx
sudo apt update
sudo apt install nginx

# Set Up a Basic Firewall
ufw allow OpenSSH
sudo ufw allow 'Nginx HTTP'
ufw enable
ufw status

# Install docker https://docs.docker.com/engine/install/ubuntu/
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker admin
sudo usermod -aG docker git


# Docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Git
sudo apt install git