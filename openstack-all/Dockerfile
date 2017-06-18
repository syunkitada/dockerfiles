FROM ubuntu:16.10
MAINTAINER Shunya Kitada syun.kitada@gmail.com

COPY setup_common.sh /tmp/
COPY system-requirements.txt /tmp/
COPY openstack-tools-requirements.txt /tmp/
COPY keystone-requirements.txt /tmp/
COPY glance-requirements.txt /tmp/
COPY nova-requirements.txt /tmp/
COPY neutron-requirements.txt /tmp/
COPY horizon-requirements.txt /tmp/

RUN \
    `# Install packages` \
    sh /tmp/setup_common.sh && \

    `# Install keystone` \
    virtualenv /opt/keystone && \
    cd /tmp && \
    git clone https://github.com/openstack/keystone.git -b stable/ocata && \
    cd keystone && \
    /opt/keystone/bin/pip3 install -r /tmp/keystone-requirements.txt && \
    /opt/keystone/bin/python3 setup.py install && \
    cp -r /tmp/keystone/etc /etc/keystone && \

    `# Install glance` \
    virtualenv /opt/glance && \
    cd /tmp/ && \
    git clone https://github.com/openstack/glance.git -b stable/ocata && \
    cd glance && \
    /opt/glance/bin/pip3 install -r /tmp/glance-requirements.txt && \
    /opt/glance/bin/python3 setup.py install && \
    cp -r /tmp/glance/etc /etc/glance && \

    `# Install nova` \
    virtualenv --system-site-packages /opt/nova && \
    cd /tmp && \
    git clone https://github.com/openstack/nova.git -b stable/ocata && \
    cd nova && \
    /opt/nova/bin/pip3 install -r /tmp/nova-requirements.txt && \
    /opt/nova/bin/python3 setup.py install && \
    cp -r /tmp/nova/etc/nova /etc/nova && \

    `# Install neutron` \
    virtualenv --system-site-packages /opt/neutron && \
    cd /tmp && \
    git clone https://github.com/openstack/neutron.git -b stable/ocata && \
    cd neutron && \
    /opt/neutron/bin/pip3 install -r /tmp/neutron-requirements.txt && \
    /opt/neutron/bin/python3 setup.py install && \
    cp -r /tmp/neutron/etc /etc/neutron && \
    cp -r /tmp/neutron/etc/neutron/* /etc/neutron && \

    `# Install horizon` \
    virtualenv /opt/horizon && \
    mkdir -p /opt/horizon/src && \
    cd /tmp && \
    git clone https://github.com/openstack/horizon.git -b stable/ocata && \
    cd horizon && \
    /opt/horizon/bin/pip3 install -r /tmp/horizon-requirements.txt && \
    /opt/horizon/bin/python3 setup.py install && \
    mkdir -p /opt/horizon/share/horizon && \
    cp -r /tmp/horizon/openstack_dashboard /opt/horizon/share/horizon && \
    cp -r /tmp/horizon/manage.py /opt/horizon/share/horizon && \

    `# Clean packages` \
    rm -rf /tmp/* && \
    apt-get purge wget git libssl-dev -y && \
    apt-get autoremove -y && \
    apt-get autoclean

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "echo 'pre setup' && sleep 3600;"]
