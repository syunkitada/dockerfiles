FROM ubuntu:16.10
MAINTAINER Shunya Kitada syun.kitada@gmail.com

RUN \
    `# Install packages` \
    apt-get update -y && \
    apt-get install wget -y && \
    apt-get install mariadb-server -y && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb && \
    dpkg -i dumb-init_*.deb && \

    `# Clean packages` \
    apt-get purge wget -y && \
    apt-get autoremove -y && \
    apt-get autoclean


ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "echo 'pre setup' && sleep 3600;"]
