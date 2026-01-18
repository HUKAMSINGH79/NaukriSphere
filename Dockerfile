FROM eclipse-temurin:8-jre

WORKDIR /app

# Copy WAR file
COPY naukri-sphere-portal-app.war app.war

# Copy webapp-runner
COPY webapp-runner.jar webapp-runner.jar

# Expose Render port
EXPOSE 8080

# Start command
CMD ["java", "-jar", "webapp-runner.jar", "--port", "8080", "app.war"]
