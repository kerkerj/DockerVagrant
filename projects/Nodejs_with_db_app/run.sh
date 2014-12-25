#!/bin/bash

#mongodb
sudo docker run -d -p 27017:27017 -v /data/mongodb:/data/db --name mongodb mongodb:latest mongod --smallfiles

#node app
sudo docker run -it -p 8080:8080 -d --link mongodb:mongodb --name nodejsapp kerkerj:nodejsapp

#nginx
sudo docker run -it -p 80:80 -p 3000:3000 -d --link nodejsapp:nodejsapp -v /var/log/nginx:/var/log/nginx -v /home/ubuntu/DockerVagrant/dockerfiles/Nginx/conf.d/:/etc/nginx/conf.d kerkerj:nginx
