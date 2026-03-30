FROM eclipse-temurin:17-jdk-focal
EXPOSE 8080
COPY target/*.war app.war
ENTRYPOINT ["java", "-jar", "/app.war"]
