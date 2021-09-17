FROM tomcat:8.0-alpine
LABEL maintainer=”steph”
COPY webapp/target/*.war /usr/local/tomcat/webapps/
