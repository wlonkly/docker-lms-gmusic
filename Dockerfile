
FROM gfjardim/logitechmediaserver:latest

MAINTAINER Rich Lafferty <rich@lafferty.ca>

ENV HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

COPY update.sh /tmp
RUN chmod +x /tmp/update.sh && /tmp/update.sh && rm /tmp/update.sh

CMD ["/sbin/my_init"]

VOLUME /config /music 
EXPOSE 3483 3483/udp 9000 9090
