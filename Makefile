all: carbon-relay-ng_docker collectd_docker

carbon-relay-ng_docker:
	docker build -f carbon-relay-ng/Dockerfile -t hsmtkk/graphite_stack/carbon-relay-ng:latest .

collectd_docker:
	docker build -f collectd/Dockerfile -t hsmtkk/graphite_stack/colletd:latest .
