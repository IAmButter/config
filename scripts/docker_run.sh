#!/bin/bash

docker run -ti --rm \
	-e DISPLAY=$DISPLAY \
	-v $(pwd):/home \
	-w /home \
	-u $(id -u) \
	unnamed_project:latest $1 $2
