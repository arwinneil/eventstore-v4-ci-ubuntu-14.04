FROM ubuntu:14.04.3
MAINTAINER Event Store LLP <ops@geteventstore.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ruby-dev \
    && gem install fpm -v 1.9.3 