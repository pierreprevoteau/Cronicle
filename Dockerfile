FROM node:latest
MAINTAINER  Pierre Prevoteau <p.prevoteau@woody-technologies.com>

RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD . /src
RUN cd /src && npm install
RUN cd /src && node bin/build.js dist
RUN cd /src && bin/control.sh setup

EXPOSE  3012

WORKDIR /src
RUN /src/bin/control.sh start
CMD ["/usr/bin/supervisord"]
