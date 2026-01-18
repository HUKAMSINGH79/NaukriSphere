FROM eclipse-temurin:8-jre

WORKDIR /app

# Copy WAR file
COPY naukari-sphere-portal-app.war /app/naukari-sphere-portal-app.war

# Copy webapp-runner
COPY webapp-runner.jar /app/webapp-runner.jar

# Expose Render port
EXPOSE 8080

# Start command
CMD ["java", "-jar", "webapp-runner.jar", "--port", "8080", "naukari-sphere-portal-app.war"]
