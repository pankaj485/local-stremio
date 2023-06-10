- [**README**](#readme)
- [prerequisites](#prerequisites)
- [How to use it](#how-to-use-it)
- [Improvement ideas](#improvement-ideas)

## **README**

Allows to use stremio on localhost using docker container.
When the script executes, it will check if the container is already existing and running on the system.

If the container:

1.  Is running: will stop the container, remove it and create a new container and run it.
2.  Is not running but exists: will remove it and create a new container and run it.
3.  Is not running and doesn't exist: will create a new container and run it.

## prerequisites

- docker
- bash shell
- docker should be up and running

## How to use it

- downlaod the project
- set file permission to executable with `chmod u+x stremio.sh`
- execute the file with `./stremio.sh`
- access the local sever on [localhost:11470](http://127.0.0.1:11470)

## Improvement ideas

- to run the container on the desired port
