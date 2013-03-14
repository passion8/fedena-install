#!/bin/bash
function update {
 sudo apt-get update -y
 sudo apt-get upgrade -y
  }

function install_essential_tool {
  sudo apt-get -y install \
    wget curl build-essential clang \
    bison openssl zlib1g \
    libxslt1.1 libssl-dev libxslt1-dev \
    libxml2 libffi-dev libyaml-dev \ 
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
function install_git {
  sudo apt-get -y install git-core
}

function install_apache2 {
  sudo apt-get -y install apache2
}

function install_mysql {
  sudo apt-get -y install libmysqlclient-dev mysql-server
}

function install_rvm {
  \curl -L https://get.rvm.io | bash -s stable 
  source ~/.bashrc
}

function install_ruby {
  rvm install 1.8.7
}
function dont_install_rdoc_ri_withs_gems {
  echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
}
function fresh-install {
  update
  install_essential_tool
  install_sqlite
  install_imagemagick
  install_git
  install_apache2
  # install mysql 
  # since mysql_server requires password,we will install mysql_server with capistraio capistrano capistrano
  install_rvm
  dont_install_rdoc_ri_withs_gems
  install_ruby
}

while (( $# > 0 )) 
 do
  token="$1"
  case "$token" in
      fresh-install)
        fresh-install
      ;;
      *)
        echo $"Usage: $0 {fresh-install}"
        exit 1
      ;;
  esac
done
