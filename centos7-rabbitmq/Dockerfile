FROM centos:centos7
MAINTAINER Shunya Kitada syun.kitada@gmail.com

COPY setup.sh /tmp/
COPY kubernetes.repo /etc/yum.repos.d/

RUN /tmp/setup.sh

CMD ["bash", "-c", "sleep 3600;"]
