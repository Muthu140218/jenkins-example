FROM tomcat:9.0.65-jre17
COPY target/*.jar /usr/local/tomcat/webapps/