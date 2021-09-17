FROM tomcat:8.0-alpine
MAINTAINER steph
COPY webapp/target/*.war /usr/local/tomcat/webapps/
