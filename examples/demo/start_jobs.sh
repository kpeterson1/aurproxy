#!/bin/bash -xe
aurora job create my-mesos-cluster/root/dev/docker-flask-demo /etc/aurora/examples/jobs/demo/docker_flask_app.aurora
aurora job create my-mesos-cluster/root/dev/aurproxy-demo /etc/aurora/examples/jobs/demo/aurproxy_docker_flask_ssh.aur
aurora job create my-mesos-cluster/root/dev/aurproxy-demo-http /etc/aurora/examples/jobs/demo/aurproxy_docker_flask_http.aur
