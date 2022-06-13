FROM bcit.io/centos:7
LABEL maintainer="jesse_weisner@bcit.ca, chriswood.ca@gmail.com"
LABEL build_id="1655150995"
LABEL tomcat_version="9.0.64"
LABEL centos_version="7"

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

RUN mkdir -p /usr/local/tomcat \
 && chown 0:0 /usr/local/tomcat \
 && chmod 775 /usr/local/tomcat

ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz /usr/local/tomcat/

RUN tar zxf apache-tomcat-9.0.64.tar.gz \
 && rm -f apache-tomcat-9.0.64.tar.gz \
 && mv apache-tomcat-9.0.64/* . \
 && rmdir apache-tomcat-9.0.64

ADD server.xml    /usr/local/tomcat/conf/
ADD ping.jsp      /usr/local/tomcat/webapps/ROOTping/
ADD index.html    /usr/local/tomcat/webapps/ROOTping/

RUN rm -rf /var/cache/yum/* \
 && echo "exclude=mirror.layeronline.com" >> /etc/yum/pluginconf.d/fastestmirror.conf \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
      epel-release \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
      java-1.8.0-openjdk-devel \
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
