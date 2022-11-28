FROM maven:3.8.6-eclipse-temurin-11-alpine as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package --no-transfer-progress

FROM eclipse-temurin:11-alpine
COPY --from=builder /app/target/*.jar /app/application.jar
ENTRYPOINT ["java","-jar","/app/application.jar"]
EXPOSE 8080