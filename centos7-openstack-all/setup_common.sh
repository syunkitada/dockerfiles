yum install -y epel-release
yum install -y vim wget curl net-tools
yum install -y mariadb
yum install -y nginx
yum install -y openstack-tools nova keystone neutron glance horizon cinder heat
yum install -y kubectl
yum install -y ebtables sysfsutils dbus genisoimage vde2-2.3.2 qemu-2.9.0

cd /tmp
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.5.1-linux-amd64.tar.gz && \
tar -xf helm-v2.5.1-linux-amd64.tar.gz && \
mv linux-amd64/helm /usr/local/bin/ && \
rm -rf /tmp/*
