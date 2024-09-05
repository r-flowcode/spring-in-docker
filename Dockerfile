FROM eclipse-temurin:21-jre-ubi9-minimal
ENV APP_DIRECTORY="/opt/app"
ENV APP_USER="appuser"
ENV APP_USER_GROUP="appuser"

RUN mkdir ${APP_DIRECTORY}
RUN groupadd -r $APP_USER_GROUP && useradd -r $APP_USER -g $APP_USER_GROUP
WORKDIR ${APP_DIRECTORY}

COPY /target/*.jar app.jar
RUN chown -R $APP_USER:$APP_USER_GROUP $APP_DIRECTORY

USER $APP_USER
EXPOSE 8080
ENTRYPOINT ["java","-jar","./app.jar"]