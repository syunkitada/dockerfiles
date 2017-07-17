apt-get update
apt-get install -y apt-transport-https curl vim wget git libssl-dev nmap traceroute
apt-get install -y python libpython-dev python-pip mysql-client nginx
apt-get install -y ebtables iptables

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubectl

cd /tmp
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.4.2-linux-amd64.tar.gz
tar -xf helm-v2.4.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/

wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb
dpkg -i dumb-init_*.deb
pip install -r /tmp/system-requirements.txt

# Install openstack-tools
virtualenv /opt/openstack-tools
/opt/openstack-tools/bin/pip install -r /tmp/openstack-tools-requirements.txt
ln -s /opt/openstack-tools/bin/openstack /usr/local/bin/
