yum install -y epel-release
yum install -y vim wget curl net-tools
yum install -y mariadb
yum install -y nginx
yum install -y openstack-tools nova keystone neutron glance horizon cinder heat
yum install -y kubectl

cd /tmp
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.4.2-linux-amd64.tar.gz
tar -xf helm-v2.4.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/
rm -rf /tmp/*
