FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends kamailio && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY kamailio /etc/default/kamailio
COPY kamailio.cfg /etc/kamailio/kamailio.cfg

CMD ["/usr/sbin/kamailio", "-DD", "-E", "-m", "64", "-M", "8", "-u", "kamailio", "-g", "kamailio"]

