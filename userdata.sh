#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
groupadd docker
usermod -aG docker ec2-user
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose -f /tmp/docker-compose.yml up
