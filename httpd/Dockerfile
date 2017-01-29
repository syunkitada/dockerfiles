FROM centos:centos7
MAINTAINER Shunya Kitada syun.kitada@gmail.com

ENV MSG=helloworld

RUN \
    `# Install httpd` \
    yum install -y httpd && \
    echo $MSG >> /var/www/html/msg.html

COPY index.html /var/www/html/

EXPOSE 80

CMD httpd -DFOREGROUND
