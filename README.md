# Running the services on dev environment

### `BackEnd:`
1. **gradlew clean build**
2. **docker push vadimdissa/config-server**
3. **docker-compose -f docker/common/docker-compose.yml -f docker/dev/docker-compose.yml up**