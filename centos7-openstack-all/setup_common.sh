#!/bin/bash -xe

yum install -y epel-release
yum install -y vim wget curl net-tools python-setuptools python-setuptools-devel python-devel
yum install -y mariadb
yum install -y nginx
yum install -y openstack-manager openstack-tools nova keystone neutron glance horizon cinder heat
yum install -y kubectl
yum install -y ebtables bridge-utils sysfsutils dbus genisoimage vde2-2.3.2 qemu-2.9.0

easy_install pip
pip install virtualenv
virtualenv /opt/k8s-openstack
/opt/k8s-openstack/bin/pip install -r /tmp/requirements.txt

cd /tmp
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.6.1-linux-amd64.tar.gz && \
tar -xf helm-v2.6.1-linux-amd64.tar.gz && \
mv linux-amd64/helm /usr/local/bin/ && \
rm -rf /tmp/*
