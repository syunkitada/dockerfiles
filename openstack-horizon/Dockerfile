FROM ubuntu:16.10
MAINTAINER Shunya Kitada syun.kitada@gmail.com

COPY openstack-tools-requirements.txt /tmp/
COPY horizon-requirements.txt /tmp/

RUN \
    `# Install packages` \
    apt-get update -y && \
    apt-get install wget git libssl-dev -y && \
    apt-get install python3 libpython3-dev python3-pip nginx mysql-client -y && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb && \
    dpkg -i dumb-init_*.deb && \
    pip3 install virtualenv && \

    `# Install openstack-tools` \
    virtualenv /opt/openstack-tools && \
    /opt/openstack-tools/bin/pip3 install -r /tmp/openstack-tools-requirements.txt && \
    ln -s /opt/openstack-tools/bin/openstack /usr/local/bin/ && \

    `# Install horizon` \
    virtualenv /opt/horizon && \
    mkdir -p /opt/horizon/src && \
    cd /opt/horizon/src/ && \
    git clone https://github.com/openstack/horizon.git -b stable/ocata && \
    cd horizon && \
    /opt/horizon/bin/pip3 install -r /tmp/horizon-requirements.txt && \
    /opt/horizon/bin/python3 setup.py install && \
    mkdir -p /opt/horizon/share/horizon && \
    cp -r /opt/horizon/src/horizon/openstack_dashboard /opt/horizon/share/horizon && \
    cp -r /opt/horizon/src/horizon/manage.py /opt/horizon/share/horizon && \

    `# Clean packages` \
    apt-get purge wget git libssl-dev -y && \
    apt-get autoremove -y && \
    apt-get autoclean


ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "echo 'pre setup' && sleep 3600;"]
