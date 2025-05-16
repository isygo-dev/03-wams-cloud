# ----------- Stage 1: Build -----------

FROM maven:3.9-eclipse-temurin-17-alpine AS builder

WORKDIR /build

COPY 03-gateway-service/pom.xml .
COPY 03-gateway-service/src ./src

# Build with profile 'build-docker' and skip tests
RUN mvn clean package -Pbuild-docker -DskipTests

# ----------- Stage 2: Run -----------

FROM eclipse-temurin:17-jdk-alpine
RUN apk add --no-cache curl

# Set working directory
WORKDIR /app

# Copy built JAR and config directory from the builder stage
COPY --from=builder /build/target/*.jar service.jar

# Download docker-compose-wait
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

EXPOSE 8060

# Use shell form to allow shell features like '&&'
CMD /wait && java -jar service.jar