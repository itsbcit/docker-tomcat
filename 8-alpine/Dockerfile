FROM bcit/alpine:3.10
LABEL maintainer="jesse_weisner@bcit.ca"
LABEL tomcat_version="8.5.45"
LABEL alpine_version="3.10"
LABEL build_id="1568415301"

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

RUN mkdir -p /usr/local/tomcat \
 && chown 0:0 /usr/local/tomcat \
 && chmod 775 /usr/local/tomcat

ADD http://us.mirrors.quenda.co/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz /usr/local/tomcat/

RUN tar zxf apache-tomcat-8.5.45.tar.gz \
 && rm -f apache-tomcat-8.5.45.tar.gz \
 && mv apache-tomcat-8.5.45/* . \
 && rmdir apache-tomcat-8.5.45

RUN apk add --no-cache \
      openjdk8 \
      tomcat-native

EXPOSE 8080
CMD ["catalina.sh", "run"]
