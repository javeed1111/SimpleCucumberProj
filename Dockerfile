FROM tomcat:9.0-jdk11-openjdk
WORKDIR $CATALINA_HOME/webapps/
COPY target/CucumberTestNG-1.0-SNAPSHOT.jar /usr/local/tomcat/webapps/CucumberTestNG-1.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["catalina.sh", "run"]
