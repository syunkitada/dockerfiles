FROM ubuntu:16.10
MAINTAINER Shunya Kitada syun.kitada@gmail.com

COPY setup_common.sh /tmp/
COPY openstack-tools-requirements.txt /tmp/
COPY glance-requirements.txt /tmp/

RUN \
    `# Install packages` \
    sh /tmp/setup_common.sh && \

    `# Install glance` \
    virtualenv /opt/glance && \
    mkdir -p /opt/glance/src && \
    cd /tmp/ && \
    git clone https://github.com/openstack/glance.git -b stable/ocata && \
    cd glance && \
    /opt/glance/bin/pip3 install -r /tmp/glance-requirements.txt && \
    /opt/glance/bin/python3 setup.py install && \
    cp -r /tmp/glance/etc /etc/glance && \

    `# Clean packages` \
    rm -rf /tmp/* && \
    apt-get purge wget git libssl-dev -y && \
    apt-get autoremove -y && \
    apt-get autoclean

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "echo 'pre setup' && sleep 3600;"]
