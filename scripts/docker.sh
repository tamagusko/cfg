#!/bin/sh

# Tiago Tamagusko 2022

paru -S --noconfirm docker docker-compose
sudo docker version

sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

