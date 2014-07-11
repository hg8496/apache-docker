FROM ubuntu:14.04

MAINTAINER hg8496@cstolz.de

RUN apt-get update && apt-get install apache2 libapache2-mod-php5 openssh-server supervisor -y && apt-get clean
RUN mkdir -p /var/run/sshd
RUN echo 'root:toor' |chpasswd
RUN mkdir -p /var/log/supervisor

RUN a2enmod php5
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80 22

CMD ["/usr/bin/supervisord"]
