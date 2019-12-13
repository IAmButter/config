#!/bin/bash

set -e

export ALCHEMY_WORKSPACE_DIR=$(pwd -P)
export ALCHEMY_HOME=${ALCHEMY_WORKSPACE_DIR}/alchemy

HOST_OS=$(${ALCHEMY_HOME}/scripts/host.py OS)
HOST_ARCH=$(${ALCHEMY_HOME}/scripts/host.py ARCH)

# Use gmake under bsd
if [ "${MAKE}" = "" ]; then
	case ${HOST_OS} in
		*bsd*)
			export MAKE=gmake
		;;
	esac
fi

export TARGET_GLOBAL_CXXFLAGS=-std=c++11
export TARGET_CONFIG_DIR=${ALCHEMY_WORKSPACE_DIR}/config

# Autodetect target os/arch
export TARGET_OS=${HOST_OS}
export TARGET_OS_FLAVOUR=native
if [ "${TARGET_ARCH}" = "" ]; then
	export TARGET_ARCH=${HOST_ARCH}
fi
export TARGET_OUT=${ALCHEMY_WORKSPACE_DIR}/out/${TARGET_OS}-${TARGET_ARCH}
export TARGET_DEFAULT_ARM_MODE=arm
export ALCHEMY_USE_COLORS=1

# Execute makefile
if [ "$1" = "" ]; then
	${ALCHEMY_HOME}/scripts/alchemake all final
elif [ "$1" = "clean" ]; then
	${ALCHEMY_HOME}/scripts/alchemake "$@"
	rm -rf ${TARGET_OUT}
else
	${ALCHEMY_HOME}/scripts/alchemake "$@"
fi