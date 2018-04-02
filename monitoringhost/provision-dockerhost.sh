#!/usr/bin/env bash
set -euo pipefail

echo "Installing general utils..."
yum install -y vim

echo "Installing docker..."
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce-17.12.1.ce

echo "Configuring docker service..."
systemctl enable docker.service
systemctl start docker.service

echo "Testing docker installation..."
docker run --name hello-world hello-world
docker rm hello-world
docker rmi hello-world

echo "Installing docker-compose..."
curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Provisioning completed [dockerhost]"
