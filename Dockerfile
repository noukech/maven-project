FROM tomcat:8.0
MAINTAINER steph
COPY webapp/target/*.war /usr/local/tomcat/webapps/
