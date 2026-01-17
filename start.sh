#!/bin/sh

echo "Jai Shree Ram - Starting NaukriSphere on Railway"
echo "Using PORT=$PORT"

java -version

java -jar webapp-runner.jar --port $PORT naukari-sphere-portal-app.war
