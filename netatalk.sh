#!/bin/bash


docker run --name netatalk \
	--env AFP_USER=netatalk \
	--env AFP_PASSWORD=netatalk \
	--platform linux/amd64 --detach -v $PWD/afp.conf:/etc/afp.conf --volume $PWD/share:/media/share --publish 548:548 cptactionhank/netatalk:latest
