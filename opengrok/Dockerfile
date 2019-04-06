FROM ubuntu:18.04

MAINTAINER Ubuntu Builds Eng "qiao.helloworld@gmail.com"

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y apt-utils --no-install-recommends
RUN apt-get install -y dialog --no-install-recommends
RUN apt-get install -y --no-install-recommends \
  git-core \
  software-properties-common \
  tomcat8 \
  wget
RUN apt-get install -y \
  autoconf \
  pkg-config

ARG OPENGROK_VERSION=1.2.6
#ENV PATH /opengrok-${OPENGROK_VERSION}/bin:$PATH
ENV PATH /opengrok/bin:$PATH
RUN wget \
  "https://github.com/OpenGrok/OpenGrok/releases/download/${OPENGROK_VERSION}/opengrok-${OPENGROK_VERSION}.tar.gz" \
  -O /tmp/opengrok-${OPENGROK_VERSION}.tar.gz
RUN tar zxvf /tmp/opengrok-${OPENGROK_VERSION}.tar.gz -C /

ENV OPENGROK_TOMCAT_BASE /usr/share/tomcat8
ENV CATALINA_HOME /usr/share/tomcat8
ENV PATH $CATALINA_HOME/bin:$PATH

ENV CATALINA_BASE /usr/share/tomcat8

WORKDIR /
RUN mv /opengrok-${OPENGROK_VERSION} /opengrok
RUN cp /opengrok/lib/source.war /var/lib/tomcat8/webapps/

RUN apt install -y automake

RUN git clone https://github.com/universal-ctags/ctags.git --progress && \
  cd ctags && \
  git checkout 07796ea && \
  ./autogen.sh && \
  ./configure && \
  make && \
  make install

EXPOSE 8080
ADD scripts /scripts
ENTRYPOINT ["/scripts/start.sh"]
