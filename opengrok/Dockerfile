FROM ubuntu:16.04

MAINTAINER Ubuntu Builds Eng "qiao.helloworld@gmail.com"

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y apt-utils --no-install-recommends
RUN apt-get install -y dialog --no-install-recommends
RUN apt-get install -y --no-install-recommends \
  exuberant-ctags \
  git-core \
  software-properties-common \
  tomcat8 \
  wget

RUN mkdir /src
RUN mkdir /data
RUN ln -s /data /var/opengrok
RUN ln -s /src /var/opengrok/src
ARG OPENGROK_VERSION=1.1-rc30
RUN wget "https://github.com/OpenGrok/OpenGrok/releases/download/${OPENGROK_VERSION}/opengrok-${OPENGROK_VERSION}.tar.gz" -O /tmp/opengrok-${OPENGROK_VERSION}.tar.gz
RUN tar zxvf /tmp/opengrok-${OPENGROK_VERSION}.tar.gz -C /

ENV SRC_ROOT /src
ENV OPENGROK_TOMCAT_BASE /usr/share/tomcat8
ENV CATALINA_HOME /usr/share/tomcat8
ENV PATH $CATALINA_HOME/bin:$PATH
ENV PATH /opengrok-${OPENGROK_VERSION}/bin:$PATH

ENV CATALINA_BASE /usr/share/tomcat8
ENV CATALINA_HOME /usr/share/tomcat8
RUN mkdir /usr/share/tomcat8/temp
RUN mkdir /usr/share/tomcat8/logs
ENV CATALINA_TMPDIR /usr/share/tomcat8/temp
ENV JRE_HOME /usr
ENV CLASSPATH /usr/share/tomcat8/bin/bootstrap.jar:/usr/share/tomcat8/bin/tomcat-juli.jar

WORKDIR $CATALINA_HOME
RUN /opengrok-${OPENGROK_VERSION}/bin/OpenGrok deploy

EXPOSE 8080
ADD scripts /scripts
ENTRYPOINT ["/scripts/start.sh"]
