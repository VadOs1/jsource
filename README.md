# Running the services on dev environment

### `BackEnd:`
1. **gradlew -Pversion=0.0.1 clean build**
2. **docker push vadimdissa/eureka-server**
3. **docker push vadimdissa/config-server**
4. **docker push vadimdissa/zuul-server**
5. **docker push vadimdissa/auth-server**
6. **docker push vadimdissa/superkid-service**
7. **docker-compose -f docker/dev/docker-compose.yml up**