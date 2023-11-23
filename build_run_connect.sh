docker stop my_postgres
docker rm my_postgres
docker rmi -f my_postgres 
docker build . -t my_postgres

docker run --publish 5432:5432 -d --name my_postgres -e POSTGRES_HOST_AUTH_METHOD=trust -e POSTGRES_DB=mydb -e POSTGRES_USER=user -e POSTGRES_PASSWORD=secret my_postgres:latest -c ssl=on -c ssl_cert_file=/var/lib/postgresql/server.crt -c ssl_key_file=/var/lib/postgresql/server.key

echo "Sleeping..."
sleep 3

psql "host=localhost port=5432 user=user dbname=mydb sslmode=verify-full"