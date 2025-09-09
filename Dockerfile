# Stage 1: Build the WAR
FROM maven:3.9.1-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy pom and source code
COPY pom.xml .
COPY src ./src

# Build WAR
RUN mvn clean package

# Stage 2: Run WAR
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy WAR from builder
COPY --from=builder /app/target/QuotationGenerator-0.0.1-SNAPSHOT.war app.war

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.war"]
