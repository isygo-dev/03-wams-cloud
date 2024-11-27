# 03-wams-cloud

> WAMS backend cloud services.

# Technology Stack

 Component       | Technology 
-----------------|------------
 Java            | 17         
 Spring Boot     | 3.2.1      
 Spring security | 6.1.1      
 Postgred SQL    | 17         
 Hibernate       | 6.2.2      
 Maven           | 3          

# Getting Started

## Prerequisites

- Install Git last version from https://git-scm.com/downloads/win
- Install Intellij IDEA last version (Ultimate or Community) from https://www.jetbrains.com/idea/download/other.html
- Install Java 17 from https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html
- install Docker desktop last version from https://www.docker.com/products/docker-desktop

## Backend

### Cloud services

- Clone the cloud project from https://github.com/your-org/03-wams-cloud.git
- For localhost running : Set mvn profile (build-dev-localhost & ddl-update)
- For Docker running : Set mvn profile (build-docker & ddl-update)
- Open the cloud project with Intellij IDEA (open as maven project)
- Run: `mvn clean install` in the terminal or use the Intellij Maven GUI (use dev-localhost and ddl-create profiles)
- For localhost running Run Config sever then the Discovery server
- For Docker running use Docker images

### Docker image

- Run Docker desktop
- Run: docker build -f .\09-docker\cloud-config.Dockerfile -t cloud/config-serv .
- Run: docker build -f .\09-docker\cloud-discovery.Dockerfile -t cloud/discovery-serv .
- Run: docker build -f .\09-docker\cloud-gateway.Dockerfile -t cloud/gateway-serv .



