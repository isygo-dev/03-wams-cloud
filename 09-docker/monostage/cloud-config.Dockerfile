FROM eclipse-temurin:17-jdk-alpine
RUN apk add --no-cache curl

# Copy built JAR and config directory from the builder stage
ADD 01-config-service/target/*.jar service.jar
ADD 01-config-service/target/config /config

# Download docker-compose-wait
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

# Use shell form to allow shell features like '&&'
CMD /wait && java -jar service.jar