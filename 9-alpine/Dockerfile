FROM bcit/alpine:3.11
LABEL maintainer="jesse_weisner@bcit.ca, chriswood.ca@gmail.com"
LABEL tomcat_version="9.0.34"
LABEL alpine_version="3.11"
LABEL build_id="1588890525"

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

RUN mkdir -p /usr/local/tomcat \
 && chown 0:0 /usr/local/tomcat \
 && chmod 775 /usr/local/tomcat

ADD http://us.mirrors.quenda.co/apache/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz /usr/local/tomcat/

RUN tar zxf apache-tomcat-9.0.34.tar.gz \
 && rm -f apache-tomcat-9.0.34.tar.gz \
 && mv apache-tomcat-9.0.34/* . \
 && rmdir apache-tomcat-9.0.34

ADD https://raw.githubusercontent.com/itsbcit/openshift-tomcat/master/files/server.xml /usr/local/tomcat/conf/

RUN apk add --no-cache \
      openjdk8
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
      tomcat-native

RUN mkdir /application /config \
 && chown root:root \
        /application \
        /config \
 && chmod 755 /config \
 && chown -R root:root /usr/local/tomcat/ \
 && find /usr/local/tomcat/conf -type d -exec chmod 0775 {} \; \
 && find /usr/local/tomcat/conf -type f -exec chmod 0664 {} \;

WORKDIR /application
ADD https://raw.githubusercontent.com/itsbcit/openshift-tomcat/master/files/ROOT/ping.jsp ROOT/
ADD https://raw.githubusercontent.com/itsbcit/openshift-tomcat/master/files/ROOT/index.html ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
