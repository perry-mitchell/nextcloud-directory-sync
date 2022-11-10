#!/bin/bash

echo "Building and deploying docker image";

VERSION_TAG=$(git tag -l --sort=-creatordate | head -n 1)
echo " • App version: ${VERSION_TAG}"

DOCKER_PREFIX="perrymitchell/nextcloud-directory-sync"
export TAG_VER=$DOCKER_PREFIX:${VERSION_TAG}
export TAG_LATEST=$DOCKER_PREFIX:latest

echo " • Building"
docker build -t $TAG_VER -t $TAG_LATEST .

echo " • Pushing"
docker push $TAG_VER
docker push $TAG_LATEST

echo "Done"

cd -
