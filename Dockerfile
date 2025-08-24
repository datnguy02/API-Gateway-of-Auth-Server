   FROM maven:3.8.5-openjdk-17 AS build
   WORKDIR /project
   COPY . .
   RUN mvn clean package -DskipTests

   FROM openjdk:17.0.1-jdk-slim
   COPY --from=build /project/target/Api-gateway-0.0.1-SNAPSHOT.jar api-gateway.jar
   EXPOSE 3000
   ENTRYPOINT ["java", "-jar", "api-gateway.jar"]
