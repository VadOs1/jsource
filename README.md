# Running the services
1. **gradlew clean build dockerBuild**
2. **docker push vadimdissa/config-server**
3. **docker-compose -f docker/dev/docker-compose.yml up**