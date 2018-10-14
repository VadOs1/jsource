# Running the services on dev environment

### `BackEnd:`
1. **gradlew -Pversion=0.0.1 clean build**
2. **docker push vadimdissa/config-server**
3. **docker-compose -f docker/dev/docker-compose.yml up**