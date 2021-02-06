FROM golang:1.15 AS builder

WORKDIR /go/src

ADD https://github.com/grafana/carbon-relay-ng/archive/v0.13.0.tar.gz /go/src

RUN tar fxz v0.13.0.tar.gz

WORKDIR /go/src/carbon-relay-ng-0.13.0/cmd/carbon-relay-ng

ENV CGO_ENABLED=0

RUN go build

FROM centos:7

COPY --from=builder /go/src/carbon-relay-ng-0.13.0/cmd/carbon-relay-ng/carbon-relay-ng /usr/local/sbin/carbon-relay-ng

WORKDIR /usr/local

ADD https://golang.org/dl/go1.15.8.linux-amd64.tar.gz /usr/local

RUN tar fxz go1.15.8.linux-amd64.tar.gz && rm go1.15.8.linux-amd64.tar.gz

COPY carbon-relay-ng/carbon-relay-ng.ini /usr/local/etc/carbon-relay-ng.ini

EXPOSE 2003 8081

ENTRYPOINT ["/usr/local/sbin/carbon-relay-ng", "-enable-pprof", "/usr/local/etc/carbon-relay-ng.ini"]
