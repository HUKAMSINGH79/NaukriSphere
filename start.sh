#!/bin/sh

echo "Jai Shree Ram - Starting NaukriSphere on Railway"

# Railway automatically provides PORT
echo "Using PORT=$PORT"

# Run WAR using embedded Tomcat (webapp-runner)
java -jar webapp-runner.jar --port $PORT naukari-sphere-portal-app.war
