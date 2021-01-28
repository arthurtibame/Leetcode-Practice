#!/bin/bash
LEVEL=$1
TASKNAME=$2
NEW_DIR=./${LEVEL}/${TASKNAME}
mkdir -p ${NEW_DIR}
touch ${NEW_DIR}/index.md