#!/bin/bash -xe

yum -y update
yum -y install epel-release
yum -y install wget net-tools iproute
yum -y install kubectl

yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel
yum -y install https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.12/rabbitmq-server-3.6.12-1.el7.noarch.rpm
rm -rf /var/lib/rabbitmq

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

rm -rf /tmp/*
rpm -qa
