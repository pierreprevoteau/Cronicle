FROM node:latest
MAINTAINER  Pierre Prevoteau <p.prevoteau@woody-technologies.com>

ADD . /src
RUN cd /src && npm install
RUN cd /src && node bin/build.js dist
RUN cd /src && bin/control.sh setup
RUN ls

EXPOSE  3012

WORKDIR /src
RUN ls
CMD node --expose_gc --always_compact /src/lib/main.js --echo "$@"
