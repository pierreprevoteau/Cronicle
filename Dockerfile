FROM ubuntu:latest
MAINTAINER  Pierre Prevoteau <p.prevoteau@woody-technologies.com>

RUN apt-get update && apt-get install -y supervisor nodejs npm git
RUN apt-get upgrade -y

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN cd /opt && git clone https://github.com/jhuckaby/Cronicle
RUN cd /opt/Cronicle && npm install
RUN cd /opt/Cronicle && node bin/build.js dist
RUN cd /opt/Cronicle && bin/control.sh setup

EXPOSE  80

CMD ["/usr/bin/supervisord"]
