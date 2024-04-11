# onprem-deployment
Instruction to run Clofio on-premise inside virtual machine

## Prerequisites
- Infrastructure to deploy Clofio
    - Virtual Machine [with Ubuntu Server OS]
    - PostgreSQL database (optional)
    - Redis Cache (optional)
- Container Registry URL and credential to pull docker images
- An allocated `subdomain.domain.com` pointed to the IP/DNS name of deployed infrastructure
- SMTP Server URL and credential to send email alerts
- Environment variable values for services (including license key)

## How to setup
- SSH into virtual machine using provided auth

- Install Docker Engine using `/installer/install-docker-in-ubuntu.sh` (if not already installed)

- If using external PostgreSQL DB and Redis Cache, remove/comment them in `/template/docker-compose.yaml` (line #4-#28)

- If using internal PostgreSQL DB and Redis Cache (via docker container), update postgres username and password in `/template/docker-compose.yaml` (line #9-#10)

- Update the allocated `subdomain.domain.com` in NGINX config file in `/template/nginx/conf/default.conf` (line #14, #22, #29, #31-#32)

- Login to Container Registry using below command

    `docker login -u <username> -p <password> <registry_url>`

- Populate values of environment variables in below files

    `/template/backend-service/.env`

    `/template/frontend-service/.env`

- Run below commands in sequence to spawn up Clofio deployment
    ```
    cd template
    
    export REGISTRY_URL=<registry_url>
    export BE_TAG=<backend_service_tag>
    export FE_TAG=<frontend_service_tag>

    docker-compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d subdomain.domain.com

    docker-compose up -d
    ```

- The setup uses LetsEncrypt to configure SSL certificate for the given `subdomain.domain.com`. To renew the certificate every 3 months, run below

    `$ docker-compose run --rm certbot renew`

