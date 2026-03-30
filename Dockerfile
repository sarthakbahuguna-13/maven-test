# 1. Use Tomcat as the base instead of plain Java
FROM tomcat:9.0-jdk17-temurin-focal

# 2. Optional: Clean out the default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Copy your WAR file into Tomcat's deployment folder
# We rename it to ROOT.war so it loads at the base URL (http://<IP>:8080/)
COPY target/maven-web-application.war /usr/local/tomcat/webapps/ROOT.war

# 4. Tomcat listens on 8080 by default
EXPOSE 8080

# Note: We don't need an ENTRYPOINT because the Tomcat image 
# already knows how to start itself!
