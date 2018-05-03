# Running the services
1. **gradlew clean build dockerBuild**
2. **docker push vadimdissa/config-server**
3. **docker-compose -f docker/docker-compose.yml up**