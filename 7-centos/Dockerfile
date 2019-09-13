FROM bcit/centos:7
LABEL maintainer="jesse_weisner@bcit.ca"
LABEL tomcat_version="7.0.96"
LABEL centos_version="7"
LABEL build_id="1568415301"

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

RUN mkdir -p /usr/local/tomcat \
 && chown 0:0 /usr/local/tomcat \
 && chmod 775 /usr/local/tomcat

ADD http://us.mirrors.quenda.co/apache/tomcat/tomcat-7/v7.0.96/bin/apache-tomcat-7.0.96.tar.gz /usr/local/tomcat/

RUN tar zxf apache-tomcat-7.0.96.tar.gz \
 && rm -f apache-tomcat-7.0.96.tar.gz \
 && mv apache-tomcat-7.0.96/* . \
 && rmdir apache-tomcat-7.0.96

RUN rm -rf /var/cache/yum/* \
 && echo "exclude=mirror.layeronline.com" >> /etc/yum/pluginconf.d/fastestmirror.conf \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
      epel-release \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
      java-1.8.0-openjdk-devel \
      tomcat-native

EXPOSE 8080
CMD ["catalina.sh", "run"]
