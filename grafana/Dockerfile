FROM centos:centos7
MAINTAINER Shunya Kitada syun.kitada@gmail.com

COPY run.sh /
COPY dashboards /dashboards

RUN \
    `# Install packages` \
    yum install -y curl wget && \
    yum install -y https://grafanarel.s3.amazonaws.com/builds/grafana-4.1.2-1486989747.x86_64.rpm && \

    `# Install dumb-init` \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64  && \
    chmod +x /usr/local/bin/dumb-init && \

    rpm -qa


ENTRYPOINT ["/usr/local/bin/dumb-init", "/run.sh"]
