#!/bin/bash
sudo apt install docker.io
sudo systemctl enable docker
sudo systemctl status docker
sudo systemctl start docker
sudo docker run hello-world