FROM node:latest
MAINTAINER  Pierre Prevoteau <p.prevoteau@woody-technologies.com>

ADD . /src
RUN cd /src && npm install
RUN cd /src && node bin/build.js dist

EXPOSE  3012

WORKDIR /src
CMD ["./bin/debug.sh"]
