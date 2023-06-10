#!/bin/bash

# define mapped PORT
# check if any container is already running
# if the container is running then stop and remove it
# TODO: implement the PORT from user input or use custom default value
# TODO: keep the output running on the terminal
# TODO: when user will stop the command, kill the cotainer and remove it
# when the process terminates, stop and remove the container

# PORT=8848
container_name="stremio-streaming-server"
all_containers=$(sudo docker container ls -a --format "{{.Names}}")
running_containers=$(sudo docker container ls --format "{{.Names}}")
is_container_running=$(echo "$running_containers" | grep "$container_name")
is_container_existing=$(echo "$all_containers" | grep "$container_name")

# echo "container name: $container_name"
# echo "all containers: $all_containers"
# echo "all containers: $running_containers"
# echo "is container running: $is_container_running"
# echo "is container existing: $is_container_existing"

# if container is running then stop it, remove it, create a new container on specified port
# if container is not running then check if it's already existing or not, if exists then remove it and create a  new container on specified port

if [[ $is_container_running ]]; then
  echo "--> Container is already running. Stopping it"
  sudo docker container stop $container_name

  echo "--> Container stopped. Removing it"
  sudo docker container rm $container_name

  echo "--> Container removed. Recreating it"
  sudo docker run -it -p 11470:11470 -v ${PWD}:/root/.stremio-server --name=stremio-streaming-server sleeyax/stremio-streaming-server

elif [[ $is_container_existing ]]; then
  echo "--> container already exists. Removing it"
  sudo docker container rm $container_name

  echo "--> Container removed. Recreating it"
  sudo docker run -it -p 11470:11470 -v ${PWD}:/root/.stremio-server --name=stremio-streaming-server sleeyax/stremio-streaming-server

else
  echo "--> creating a new container"
  sudo docker run -it -p 11470:11470 -v ${PWD}:/root/.stremio-server --name=stremio-streaming-server sleeyax/stremio-streaming-server

fi

# when the process terminates, stop and remove the container

echo "--> stopping container"
sudo docker container stop $container_name
echo "--> container stopped"

echo "--> removing container"
sudo docker container rm $container_name
echo "--> $container_name continaer removed"
