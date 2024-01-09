FROM openjdk:21-jdk-slim
WORKDIR /opt/app
COPY /target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/opt/app/app.jar"]