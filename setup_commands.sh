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
sudo apt install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io