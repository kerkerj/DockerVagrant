#!/bin/bash

printf "This is from Dockerfile: https://registry.hub.docker.com/u/dockerfile/mongodb/ \n"

printf "** Default is smallfiles mode **\n"
printf "[1] Run mongod: \n\t docker run -d -p 27017:27017  dockerfile/mongodb \n"
printf "[*2] Run mongod w/ persistent/shared directory: \n\t docker run -d -p 27017:27017 -v /data/mongodb:/data/db  dockerfile/mongodb \n"
printf "[3] Run mongod w/ HTTP support: \n\t docker run -d -p 27017:27017 -p 28017:28017  dockerfile/mongodb mongod --rest --httpinterface \n"
printf "[4] Run mongod w/ Smaller default file size: \n\t docker run -d -p 27017:27017  dockerfile/mongodb mongod --smallfiles \n"
printf "[5] Run mongo: \n\t docker run -it --rm --link mongodb:mongodb dockerfile/mongodb bash -c 'mongo --host mongodb \n"

printf "\nYour docker images: \n"

sudo docker images | grep -Ev 'none' | awk '{print $1 "\t" $2 "\t" $3 }'

printf "\n"
read -p "Your mongodb image name is: " image

if [ -z "$image" ]; then
	$image = "mongodb"
fi

printf "\n\n"

read -p "Choose an action: " number

# Cases: 
case $number in 

1)
sudo docker run -d -p 27017:27017 $image
;; 

2)
sudo docker run -d -p 27017:27017 -v /data/mongodb:/data/db --name mongodb $image mongod --smallfiles 
#read -r -p "small files? [y/N]" res

#if [[ $res =~ ^([yY][eE][sS]|[yY])$ ]]; then
#	sudo docker run -d -p 27017:27017 -v /data/mongodb:/data/mongodb $image mongod --smallfiles
#else
#	sudo docker run -d -p 27017:27017 -v /data/mongodb:/data/mongodb $image
#fi

;; 

3)
sudo docker run -d -p 27017:27017 -p 28017:28017  $image mongod --rest --httpinterface
;;

4)
sudo docker run -d -p 27017:27017  $image mongod --smallfiles
;;	
	
5)
docker run -it --rm --link mongodb:mongodb $image bash -c 'mongo --host mongodb'
;;

*)
printf "Wrong Command"
;;
esac

printf "\nWhatever you chose, it will take minutes to boot the service up."
