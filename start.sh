!#/bin/bash

#Install redis-cli on local machine
#yum install redis-cli -y

#Change dir to .
cd /

#Make dir
#mkdir Docker-C && 
cd  /Docker-C

#Clone from repository
#git clone https://github.com/diman-rus/dc-redis.git

cd /dc-redis
#docker-compose build
docker-compose up -d

redis-cli -h 173.17.0.1 -p 7000 -c "CLUSTER INFO"