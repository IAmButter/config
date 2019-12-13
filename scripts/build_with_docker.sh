#!/bin/bash

DOCKER_HOME=/home
DOCKER_SCRIPTS=${DOCKER_HOME}/config/scripts
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ "$(docker images -q myimage:mytag 2> /dev/null)" == "" ]]; then
	${DIR}/docker_build.sh
fi

if [ "$1" = "config" ]; then
	${DIR}/build.sh "$@"
else
	${DIR}/docker_run.sh ${DOCKER_SCRIPTS}/build.sh "$@"
fi
