FROM bcit/centos:7
LABEL maintainer="jesse_weisner@bcit.ca"
LABEL tomcat_version="8.5.45"
LABEL centos_version="7"
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

RUN rm -rf /var/cache/yum/* \
 && echo "exclude=mirror.layeronline.com" >> /etc/yum/pluginconf.d/fastestmirror.conf \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
      epel-release \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
      java-1.8.0-openjdk-devel \
      tomcat-native

EXPOSE 8080
CMD ["catalina.sh", "run"]
