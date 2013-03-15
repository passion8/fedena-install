#!/bin/bash
function update {
 sudo apt-get update -y
 sudo apt-get upgrade -y
}

function background_color {
  echo ; echo
  echo -e "\033[32m $1"
  tput sgr0 
  echo ; echo
}

function install_essential_tool {
  sudo apt-get -y install \
    wget curl build-essential clang \
    bison openssl zlib1g  \
    libxslt1.1 libssl-dev libxslt1-dev make\
    libxml2 libffi-dev libyaml-dev \ 
    libxslt1-dev autoconf libc6-dev  \
    libreadline6-dev zlib1g-dev libcurl4-openssl-dev \
    libtool  libcurl4-openssl-dev libssl-dev apache2-prefork-dev libapr1-dev libaprutil1-dev make
    background_color "All essentail tools are installed"
}

function install_sqlite {
  sudo apt-get -y install libsqlite3-0  \
    sqlite3 libsqlite3-dev libmysqlclient-dev 
  background_color "sqlite3 is installed"
}

function install_imagemagick {
  sudo apt-get -y install  libmagickwand-dev imagemagick
  background_color "Image customization tools are installed"
}

function install_git {
  sudo apt-get -y install git-core
  background_color "Git installed"
}

function install_apache2 {
  sudo apt-get -y install apache2
  background_color "Apache server installed"
}

function install_mysql {
  sudo apt-get -y install libmysqlclient-dev  mysql-server mysql-client  
  background_color "Mysql server installed"
}

function install_rvm {
  curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable 
  source ~/.bashrc
}

function install_ruby {
  rvm install ruby-1.8.7-p371
  rvm use ruby-1.8.7-p371 --default
  rvm rubygems 1.4.2
  background_color "ruby 1.8.7 installed"
  echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" ' >> ~/.bashrc
  sudo apt-get install -y libgemplugin-ruby
}

function dont_install_rdoc_ri_withs_gems {
  echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
}

function install_fedena_gems {
  
  gem install bundler 
  gem install rails -v 2.3.5 
  gem install  i18n -v 0.4.2 
  gem install  declarative_authorization -v 0.5.1 
  gem install  mysql -v 2.8.1 
  gem install  rake -v 0.8.7 
  gem install  rush -v 0.6.8 
  gem update --system 1.4.2

  gem install passenger
  background_color "fedena required gems are installed"
}

function make_production_mode {
 echo 'export RAILS_ENV=production' >> ~/.bashrc
 source ~/.bashrc
 background_color "Its now a production mode"
}

function get_fedena {
  wget http://www.projectfedena.org/download/fedena-github -O fedena.zip
  sudo apt-get install unzip
  unzip fedena.zip
  mv projectfedena-fedena* fedena/
  cd fedena/
  background_color "Latest fedena downloaded and extracted"
}

function write_database_file {
  echo 
  echo "Hi, i am writing config/database.yml file with your mysql password,please provide me so i can do it for you"
  read password
  curl https://raw.github.com/Passionate/fedena-install/master/ymlwriter.rb | ruby $password
  background_color "database.yml updated"
}
function create_db {
  rake db:create
}
function install_fedena_plugins {
  rake fedena:plugins:install_all
}
function make_fedena_script_executable {
  chmod +x script/*
}
function install_passenger {
  passenger-install-apache2-module
}
function fresh-install {
  update
  install_essential_tool
  install_sqlite
  install_imagemagick
  install_git
  install_apache2
  install_mysql
  install_rvm
  install_ruby
  dont_install_rdoc_ri_withs_gems
  install_fedena_gems
  make_production_mode
  get_fedena 
  write_database_file
  create_db
  install_fedena_plugins
  make_fedena_script_executable
  install_passenger
}

# while (( $# > 0 )) 
#  do
#   token="$1"
#   case "$token" in
#       fresh-install)
#         fresh-install
#       ;;
#       )
#       *)
#         echo $"Usage: $0 {fresh-install} {MysqlPasswordHere}"
#         exit 1
#       ;;
#   esac
# done
fresh-install