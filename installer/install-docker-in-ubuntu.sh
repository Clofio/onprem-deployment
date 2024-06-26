#!/bin/bash 

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get install --yes apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install --yes docker-ce docker-ce-cli containerd.io

sudo apt-get install --yes docker-compose

sudo groupadd docker

sudo gpasswd -a $USER docker

newgrp docker