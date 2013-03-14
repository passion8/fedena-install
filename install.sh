#!/bin/bash 
##wget --no-check-certificate https://raw.github.com/paritoshparitosh57/fedena-install/master/install.sh
clear

server_path='https://raw.github.com/paritoshparitosh57/fedena-install/master/ymlwriter.rb'

echo "Updating system"
sudo apt-get update -y
sudo apt-get upgrade -y


echo "Installing essential build tool"
sudo apt-get -y install \
    wget curl build-essential clang \
    bison openssl zlib1g \
    libxslt1.1 libssl-dev libxslt1-dev \
    libxml2 libffi-dev libyaml-dev \
    libxslt1-dev autoconf libc6-dev \
    libreadline6-dev zlib1g-dev libcurl4-openssl-dev \
    libtool unzip libcurl4-openssl-dev libssl-dev apache2-prefork-dev libapr1-dev libaprutil1-dev

echo -e " Installing libs needed for sqlite and mysql..."
sudo apt-get -y install libsqlite3-0 sqlite3 libsqlite3-dev libmysqlclient-dev 
echo "==> done..."


echo -e "Installing imagemagick (this may take a while)..."
sudo apt-get -y install  libmagickwand-dev imagemagick
echo "==> done..."


echo -e "Installing git..."
sudo apt-get -y install git-core 
echo "==> done..."



echo -e "Installing RVM..."
\curl -L https://get.rvm.io | bash -s stable 
source ~/.bashrc
echo "done"



echo "Installing Ruby "
rvm install 1.8.7
echo "done"

echo "Installing Mysql database and apache"
sudo apt-get -y install apache2 libmysqlclient-dev mysql-server
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
gem install mysql
read -p "Please enter your mysql root password : " password


echo "Installing additional gems"
gem install bundler 
gem install rails -v 2.3.5 
gem install  i18n -v 0.4.2 
gem install  declarative_authorization -v 0.5.1 --no-rdoc --no-ri
gem install  mysql -v 2.8.1 
gem install  rake -v 0.8.7 
gem install  rush -v 0.6.8 
gem update --system 1.4.2
gem install passenger 

echo "download fedena"
cd ~
wget http://www.projectfedena.org/download/fedena-github -O fedena.zip
unzip fedena-github
mv projectfedena-fedena* fedena/
cd fedena/
export RAILS_ENV=production


wget --no-check-certificate $server_path
chmod +x ymlwriter.rb
ruby ymlwriter.rb $password
rm ymlwriter.rb
rake db:create
rake fedena:plugins:install_all
chmod +x script/*



echo "installing passenger"

passenger-install-apache2-module

