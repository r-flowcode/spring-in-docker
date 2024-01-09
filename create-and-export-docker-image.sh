#!/bin/bash

IMAGE_NAME=spring-in-docker-image

echo "1/3 Creating JAR ..."
mvn clean package -DskipTests
echo "1/3 Creating JAR ... DONE!"

echo "2/3 Creating Docker Image ..."
docker build -t $IMAGE_NAME .
echo "2/3 Creating Docker Image ... DONE!"

echo "3/3 Exporting Docker Image ..."
docker save -o ./target/$IMAGE_NAME.tar $IMAGE_NAME
echo "3/3 Exporting Docker Image ... DONE!"