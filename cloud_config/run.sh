#Concatenate the .cloud files, with the .env files required for docker compose
cat .env.app.cloud >> ../config/.env.app
cat .env.catalog.cloud >> ../config/.env.catalog

#run docker compose command
echo Starting Meltano-CE in Docker...
export userID=$(id -u); export groupID=$(id -g)
docker compose -f ../docker-compose.yml up --detach

#start nginx
echo Staring nginx...
nginx -c <fullpath>/matatika-ce/cloud_config/nginx.conf
echo Everything is UP!