FROM openjdk:17-alpine
ADD 01-config-service/target/*.jar service.jar
ADD 01-config-service/target/config /config
RUN ls -al /config/*
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

CMD /wait && java -jar /service.jar
