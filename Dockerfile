FROM ubuntu:16.04

MAINTAINER hg8496@cstolz.de

ENV HOME /root

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install apache2 libapache2-mod-php7.0 -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD apache.sh /apache.sh
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_SERVER_NAME **NONE**
EXPOSE 80
CMD ["/apache.sh"]
