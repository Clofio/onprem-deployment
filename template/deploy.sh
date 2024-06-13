## Make the script executable -> chmod +x deploy.sh
## Update environment variable values
## Run the script -> ./deploy.sh

export REGISTRY_URL=<registry_url>
export BE_TAG=<backend_service_tag>
export FE_TAG=<frontend_service_tag>
export DOCU_TAG=<documentation_tag>

docker-compose up -d