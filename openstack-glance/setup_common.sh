apt-get update
apt-get install -y apt-transport-https curl vim wget git libssl-dev
apt-get install -y python3 libpython3-dev python3-pip mysql-client
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubectl

cd /tmp
wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb
dpkg -i dumb-init_*.deb
pip3 install virtualenv

# Install openstack-tools
virtualenv /opt/openstack-tools
/opt/openstack-tools/bin/pip3 install -r /tmp/openstack-tools-requirements.txt
ln -s /opt/openstack-tools/bin/openstack /usr/local/bin/
