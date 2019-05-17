#!/bin/sh

exported_commands=("install" "up" "down" "go")

# DO NOT DELETE
#docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)
#--name=textures

function contains {
	declare -a arg=("${!2}")
	$(echo "${arg[@]}") #| grep -o "$1" | wc -w)
}

function setEnv {
    cd docker;
}

function install {
    setEnv;
    docker-compose build;
}

function up {
   setEnv;
   docker-compose up;
}

function down {
  setEnv;
  docker-compose down;
}

function go {
 setEnv;
 docker-compose run frontend;
 echo go
}

contains $1 exported_commands[@]
#eval $1
