FROM eclipse-temurin:17-jdk

ARG WAR_FILE=target/QuotationGenerator-0.0.1-SNAPSHOT.war
COPY ${WAR_FILE} app.war

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.war"]
