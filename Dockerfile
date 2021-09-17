FROM tomcat:8.0-alpine
LABEL maintainer=”steph”
EXPOSE 8080
COPY webapp/target/*.war /usr/local/tomcat/webapps/
