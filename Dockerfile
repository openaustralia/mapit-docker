FROM ubuntu:precise
MAINTAINER Matthew Landauer <matthew@oaf.org.au>

RUN apt-get update
#RUN apt-get install -y apt-utils libterm-readline-gnu-perl libui-dialog-perl
RUN apt-get install -y git-core lockfile-progs rubygems curl dnsutils lsb-release

ADD https://raw.github.com/mysociety/commonlib/master/bin/install-site.sh /install-site.sh
RUN /bin/bash /install-site.sh --default mapit mapit mapit
