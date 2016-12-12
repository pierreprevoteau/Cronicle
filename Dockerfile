FROM node:latest
MAINTAINER  Pierre Prevoteau <p.prevoteau@woody-technologies.com>

RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /opt/cronicle/
ADD . /opt/cronicle/

RUN cd /opt/cronicle && npm install
RUN cd /opt/cronicle && node bin/build.js dist

EXPOSE  80

CMD ["/usr/bin/supervisord"]
