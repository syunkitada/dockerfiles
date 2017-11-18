FROM centos:7.3.1611
MAINTAINER Shunya Kitada syun.kitada@gmail.com

COPY setup_common.sh /tmp/
COPY requirements.txt /tmp/
COPY openstack.repo /etc/yum.repos.d/
COPY kubernetes.repo /etc/yum.repos.d/

RUN /tmp/setup_common.sh

CMD ["bash", "-c", "echo 'pre setup' && sleep 3600;"]
