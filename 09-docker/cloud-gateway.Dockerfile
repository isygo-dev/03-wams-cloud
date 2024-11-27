FROM openjdk:17-alpine
ADD 03-gateway-service/target/*.jar service.jar
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

CMD /wait && java -jar /service.jar