# Running the services on dev environment

### `BackEnd:`
1. **gradlew -Pversion=0.0.1 clean build**
2. **docker push vadimdissa/eureka-server**
3. **docker push vadimdissa/config-server**
4. **docker push vadimdissa/superkid-service**
5. **docker-compose -f docker/dev/docker-compose.yml up**