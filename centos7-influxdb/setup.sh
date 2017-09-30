#!/bin/bash -xe

yum -y update
yum -y install epel-release
yum -y install wget net-tools iproute curl
yum -y install kubectl

cd /tmp
for version in 2.6.1
do
    wget https://storage.googleapis.com/kubernetes-helm/helm-v${version}-linux-amd64.tar.gz
    tar -xf helm-v${version}-linux-amd64.tar.gz
    mv linux-amd64/helm /usr/bin/helm-${version}

    wget https://github.com/rabbitmq/rabbitmq-perf-test/releases/download/v1.3.0/rabbitmq-perf-test-1.3.0-bin.tar.gz
    tar -xf rabbitmq-perf-test-1.3.0-bin.tar.gz
    cp -r rabbitmq-perf-test-1.3.0 /opt/
done

yum -y install https://s3.amazonaws.com/influxdb/influxdb-0.9.6.1-1.x86_64.rpm

rm -rf /tmp/*
rpm -qa
