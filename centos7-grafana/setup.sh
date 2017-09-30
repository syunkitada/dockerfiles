#!/bin/bash -xe

yum -y update
yum -y install wget net-tools iproute

yum -y install https://grafanarel.s3.amazonaws.com/builds/grafana-4.1.2-1486989747.x86_64.rpm

wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64
chmod +x /usr/local/bin/dumb-init

rpm -qa
