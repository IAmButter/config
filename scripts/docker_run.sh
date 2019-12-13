#!/bin/bash

docker run -ti --rm \
	-e DISPLAY=$DISPLAY \
	-v $(pwd):/home \
	-w /home \
	-u $(id -u) \
	butter:latest $1 $2
