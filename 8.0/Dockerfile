FROM tifayuki/java:7
MAINTAINER Feng Honglin <hfeng@tutum.co>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.11
ENV CATALINA_HOME /tomcat
ENV TOMCAT_OPTS_PERMSIZE 384
ENV TOMCAT_OPTS_MAXPERMSIZE 384
ENV TOMCAT_OPTS_XMS 384
ENV TOMCAT_OPTS_XMX 1024

# INSTALL TOMCAT
RUN wget --no-check-certificate -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
  tar zxf apache-tomcat-*.tar.gz && \
  rm apache-tomcat-*.tar.gz && \
  mv apache-tomcat* tomcat

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD config_tomcat.sh /config_tomcat.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

VOLUME  ["/tomcat/webapps"]

EXPOSE 8080 8009
CMD ["/run.sh"]
