FROM ubuntu:14.04.3

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y \
    autoconf \
    automake \
    build-essential \
    gettext \
    git \
    libtool \
    pkg-config \
    subversion \
    wget \
    python \
    mono-devel \
    aptitude \
   
RUN apt-get install -y \
    rake \
    ruby-dev \
    rpm \

RUN gem install fpm

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/4.6.2" main | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update
RUN aptitude install mono-complete -y