# Running the services on dev environment
### `FrontEnd:`
1. **cd front-end && npm start**

### `BackEnd:`
1. **gradlew clean build dockerBuild**
2. **docker push vadimdissa/config-server**
3. **docker-compose -f docker/dev/docker-compose.yml up**