FROM bcit.io/alpine:3.16
LABEL maintainer="jesse_weisner@bcit.ca, chriswood.ca@gmail.com"
LABEL build_id="1668809761"
LABEL tomcat_version="8.5.83"
LABEL alpine_version="3.16"

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

RUN mkdir -p /usr/local/tomcat \
 && chown 0:0 /usr/local/tomcat \
 && chmod 775 /usr/local/tomcat

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.83/bin/apache-tomcat-8.5.83.tar.gz /usr/local/tomcat/

RUN tar zxf apache-tomcat-8.5.83.tar.gz \
 && rm -f apache-tomcat-8.5.83.tar.gz \
 && mv apache-tomcat-8.5.83/* . \
 && rmdir apache-tomcat-8.5.83

ADD server.xml    /usr/local/tomcat/conf/
ADD ping.jsp      /usr/local/tomcat/webapps/ROOTping/
ADD index.html    /usr/local/tomcat/webapps/ROOTping/

RUN apk add --no-cache \
      openjdk8 \
      tomcat-native

RUN mkdir /application /config \
 && chown root:root \
        /application \
        /config \
 && chmod 755 /config \
 && chmod 775 /application \
 && chown -R root:root /usr/local/tomcat/ \
 && find /usr/local/tomcat/conf -type d -exec chmod 0775 {} \; \
 && find /usr/local/tomcat/logs -type d -exec chmod 0775 {} \; \
 && find /usr/local/tomcat/work -type d -exec chmod 0775 {} \; \
 && find /usr/local/tomcat/temp -type d -exec chmod 0775 {} \; \
 && find /usr/local/tomcat/conf -type f -exec chmod 0664 {} \;

COPY 50-copy-config.sh /docker-entrypoint.d/ 

WORKDIR /application
ADD ping.jsp ROOT/
ADD index.html ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
