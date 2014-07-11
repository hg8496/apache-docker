FROM ubuntu:14.04

MAINTAINER hg8496@cstolz.de

# Install the relevant packages
RUN apt-get update && apt-get install apache2 libapache2-mod-php5 -y && apt-get clean

# Enable the php mod we just installed
RUN a2enmod php5

# expose port 8080 so that our webserver can respond to requests.
EXPOSE 80

# Manually set the apache environment variables in order to get apache to work immediately.
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

# Execute the apache daemon in the foreground so we can treat the container as an 
# executeable and it wont immediately return.
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
