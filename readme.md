# Spring-Boot Docker Image

In this application, I have developed a simple SpringBoot application with a single rest endpoint **/rest/hello-world**. 
This application is embedded in a Docker image using the bash script **create-and-export-docker-image.sh**.

### **To Run without Docker**
```
> mvn clean package -DskipTests
> java -jar target/spring-in-docker-1.0.0.jar
```

### **To Run with Docker**
```
> mvn clean package -DskipTests
> docker build -t <image-name>
> docker run -d -p 8080:8080 <image-name>

> docker stop <container-id>
```

### **Dockerfile**
```dockerfile
FROM openjdk:21-jdk-slim
WORKDIR /opt/app
COPY /target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/opt/app/app.jar"]
```

### **Bash Script**
```
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
```