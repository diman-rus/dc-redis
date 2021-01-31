#!/bin/bash

#Install redis-cli on local machine
yum install redis-cli -y

#Change dir to .
cd /

#Make dir
mkdir Docker-C 
cd /Docker-C

#Clone from repository
git clone https://github.com/diman-rus/dc-redis.git

#Go to work directory
cd /Docker-C/dc-redis

#Build container
docker-compose build

#Start cluster
docker-compose up -d

#Enter cluster info
echo [Enter in next string - CLUSTER INFO]
redis-cli -h 173.17.0.1 -p 7000