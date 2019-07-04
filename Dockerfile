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
    rake \
    rpm\
    software-properties-common\
    python-software-properties

RUN apt-add-repository ppa:brightbox/ruby-ng && apt-get update && apt-get -y install ruby2.2 ruby2.2-dev

RUN gem install fpm

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/4.6.2" main | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update
RUN aptitude install mono-complete -y

#NodeJS v8.11.4 (LTS) EOL December 2019
RUN wget -O nodejs.deb https://deb.nodesource.com/node_8.x/pool/main/n/nodejs/nodejs_8.11.4-1nodesource1_amd64.deb && dpkg -i nodejs.deb

ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig