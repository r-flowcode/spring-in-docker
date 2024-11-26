#!/bin/bash

IMAGE_NAME=spring-in-docker-image

echo "> Step 1/3: Creating JAR"
mvn clean package -DskipTests
echo "> Step  1/3: Creating JAR - COMPLETED!"

echo "> Step  2/3: Creating Docker Image ..."
docker build -t $IMAGE_NAME .
echo "> Step  2/3: Creating Docker Image - COMPLETED!"

echo "> Step  3/3: Exporting Docker Image ..."
docker save -o ./target/$IMAGE_NAME.tar $IMAGE_NAME
echo "> Step 3/3: Exporting Docker Image - COMPLETED!"