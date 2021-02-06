FROM ubuntu:20.10

RUN apt-get -y update \
 && apt-get -y --no-install-recommends install collectd libmnl0 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY collectd/graphite.conf /etc/collectd/collectd.conf.d/graphite.conf

RUN /usr/sbin/collectd -t && /usr/sbin/collectd -T

ENTRYPOINT ["/usr/sbin/collectd", "-f"]
