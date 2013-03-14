#!/bin/bash
function update {
 sudo apt-get update -y
 sudo apt-get upgrade -y
  }

function essential_tool {
  sudo apt-get -y install \
    wget curl build-essential clang \
    bison openssl zlib1g \
    libxslt1.1 libssl-dev libxslt1-dev \
    libxml2 libffi-dev libyaml-dev \sudo apt-get -y install libsqlite3-0 sqlite3 libsqlite3-dev libmysqlclient-dev 
    libxslt1-dev autoconf libc6-dev \
    libreadline6-dev zlib1g-dev libcurl4-openssl-dev \
    libtool unzip libcurl4-openssl-dev libssl-dev apache2-prefork-dev libapr1-dev libaprutil1-dev
}

function install_sqlite {
  sudo apt-get -y install libsqlite3-0  \
    sqlite3 libsqlite3-dev libmysqlclient-dev 
}

function install_imagemagick {
  sudo apt-get -y install  libmagickwand-dev imagemagick
}

function install_rvm {
  \curl -L https://get.rvm.io | bash -s stable
  source ~/.bashrc
}

update
essential_tool
install_sqlite
install_imagemagick
install_rvm

