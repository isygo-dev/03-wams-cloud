# ----------- Stage 1: Build -----------

FROM maven:3.9-eclipse-temurin-17-alpine AS builder

WORKDIR /build

COPY 01-config-service/pom.xml ./
COPY 01-config-service/profile ./profile
COPY 01-config-service/src ./src

# Build with profile 'build-docker' and skip tests
RUN mvn clean package -Pbuild-docker -DskipTests

# ----------- Stage 2: Run -----------

FROM eclipse-temurin:17-jdk-alpine
RUN apk add --no-cache curl

# Set working directory
#WORKDIR /app

# Copy built JAR and config directory from the builder stage
COPY --from=builder /build/target/*.jar service.jar
COPY --from=builder /build/target/config /config

# Download docker-compose-wait
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

EXPOSE 8088

# Use shell form to allow shell features like '&&'
CMD /wait && java -jar service.jar