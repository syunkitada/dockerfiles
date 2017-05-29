FROM ubuntu:16.10
MAINTAINER Shunya Kitada syun.kitada@gmail.com

COPY openstack-tools-requirements.txt /tmp/
COPY nova-requirements.txt /tmp/

RUN \
    `# Install packages` \
    apt-get update -y && \
    apt-get install wget git libssl-dev -y && \
    apt-get install python3 libpython3-dev python3-pip nginx mysql-client libvirt-dev -y && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb && \
    dpkg -i dumb-init_*.deb && \
    pip3 install virtualenv && \

    `# Install openstack-tools` \
    virtualenv /opt/openstack-tools && \
    /opt/openstack-tools/bin/pip3 install -r /tmp/openstack-tools-requirements.txt && \
    ln -s /opt/openstack-tools/bin/openstack /usr/local/bin/ && \

    `# Install nova` \
    virtualenv /opt/nova && \
    mkdir -p /opt/nova/src && \
    cd /opt/nova/src/ && \
    git clone https://github.com/openstack/nova.git -b stable/ocata && \
    cd nova && \
    /opt/nova/bin/pip3 install -r /tmp/nova-requirements.txt && \
    /opt/nova/bin/python3 setup.py install && \
    cp -r /opt/nova/src/nova/etc/nova /etc/nova && \

    `# Clean packages` \
    apt-get purge wget git libssl-dev -y && \
    apt-get autoremove -y && \
    apt-get autoclean


ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "echo 'pre setup' && sleep 3600;"]
