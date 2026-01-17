FROM eclipse-temurin:17-jre

WORKDIR /app

COPY webapp-runner.jar webapp-runner.jar
COPY naukari-sphere-portal-app.war app.war

EXPOSE 8080

CMD java -jar webapp-runner.jar \
    --port $PORT \
    app.war
