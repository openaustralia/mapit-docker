FROM ubuntu:precise
MAINTAINER Matthew Landauer <matthew@oaf.org.au>

RUN apt-get update

# Set the locale so that postgres is setup with the correct locale
RUN apt-get install -y language-pack-en
ENV LANG en_GB.UTF-8
ENV LC_ALL en_GB.UTF-8

#RUN apt-get install -y apt-utils libterm-readline-gnu-perl libui-dialog-perl

# Here we're installing things that are actually installed by the install script
# but we're installing them first here so that we can take advantage of docker
# caching while debugging this Dockerfile. So, it should be able to comment
# out this section when everything is working
RUN apt-get install -y git-core lockfile-progs rubygems curl dnsutils lsb-release
RUN apt-get install -y libgdal1-1.7.0 memcached python-virtualenv python-django python-django-south python-psycopg2 python-yaml python-memcache python-gdal python-beautifulsoup ruby-sass

# We install postgres now so that it can be running when the install script is used
RUN apt-get install -y postgresql postgresql-9.1-postgis

ADD https://raw.github.com/mysociety/commonlib/master/bin/install-site.sh /install-site.sh
RUN service postgresql start; /bin/bash /install-site.sh --default mapit mapit localhost
