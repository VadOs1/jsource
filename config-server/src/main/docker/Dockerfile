FROM openjdk:9
ENV version ${http_proxy}
RUN mkdir -p /usr/local/configserver
ADD /build/libs/config-server-${version}.jar /usr/local/configserver/
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh