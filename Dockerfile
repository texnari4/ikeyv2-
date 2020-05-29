FROM ubuntu:14.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install strongswan iptables uuid-runtime \
    && rm -rf /var/lib/apt/lists/* # cache busted 20160406.1

RUN rm /etc/ipsec.secrets

ADD ./etc/* /etc/
ADD ./bin/* /usr/bin/

VOLUME /etc

EXPOSE 500/udp 4500/udp

CMD /usr/bin/start-vpn
