FROM openjdk:9
RUN mkdir -p /usr/local/configserver
ADD /build/libs/config-server-0.0.1-SNAPSHOT.jar /usr/local/configserver/
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh