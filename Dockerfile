FROM eclipse-temurin:17-jdk-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

ENV APP_HOME=/usr/src/app

RUN mkdir -p $APP_HOME && chown -R appuser:appgroup $APP_HOME

USER appuser

EXPOSE 8080

COPY target/*.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

CMD ["java", "-jar", "app.jar"]
