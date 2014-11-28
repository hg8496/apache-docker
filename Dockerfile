FROM phusion/baseimage:0.9.15

MAINTAINER hg8496@cstolz.de

ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install apache2 libapache2-mod-php5 -y \
    && mkdir /etc/service/apache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD apache.sh /etc/service/apache/run
EXPOSE 80 22
RUN 
