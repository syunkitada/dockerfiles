apt-get update
apt-get install -y apt-transport-https curl vim wget git libssl-dev nmap
apt-get install -y python libpython-dev python-pip mysql-client nginx
apt-get install -y ebtables iptables
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubectl

cd /tmp
wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb
dpkg -i dumb-init_*.deb
pip2 install -r /tmp/system-requirements.txt

# Install openstack-tools
virtualenv /opt/openstack-tools
/opt/openstack-tools/bin/pip install -r /tmp/openstack-tools-requirements.txt
ln -s /opt/openstack-tools/bin/openstack /usr/local/bin/
