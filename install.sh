control_c()
{
  echo -en "\n\n*** Exiting ***\n\n"
  exit 1
}
function background_color {
  echo ; echo
  echo -e "\033[32m $1"
  tput sgr0 
  echo ; echo
}
trap control_c SIGINT
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get -y install wget curl build-essential clang 
sudo apt-get -y install bison openssl zlib1g
sudo apt-get -y install libxslt1.1 libssl-dev libxslt1-dev make
sudo apt-get -y install libxml2 libffi-dev libyaml-dev 
sudo apt-get -y install libxslt1-dev autoconf libc6-dev 
sudo apt-get -y install libreadline6-dev zlib1g-dev libcurl4-openssl-dev
sudo apt-get -y install  libtool  libcurl4-openssl-dev libssl-dev apache2-prefork-dev libapr1-dev libaprutil1-dev make
sudo apt-get -y install libsqlite3-0   sqlite3 libsqlite3-dev libmysqlclient-dev
sudo apt-get -y install  libmagickwand-dev imagemagick 
sudo apt-get -y install git-core
sudo apt-get install -y libgemplugin-ruby
sudo apt-get -y install apache2
sudo apt-get -y install libmysqlclient-dev  mysql-server mysql-client
echo
read  -p "Please tell your root password,it is required for fedena installation" password
curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable 
echo 'source ~/.bashrc' >> ~/.bash_login
source ~/.bash_login
rvm install ruby-1.8.7-p371
rvm alias create default ruby-1.8.7-p371
background_color "ruby 1.8.7 installed"
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
source ~/.bashrc
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
echo 'export RAILS_ENV=production' >> ~/.bashrc
source ~/.bashrc
background_color "Its now a production mode"
rm ~/.rvm/gems/ruby-1.8.7-p371@global/bin/rake
rm -rf  ~/.rvm/gems/ruby-1.8.7-p371@global/cache 
rm -rf ~/.rvm/gems/ruby-1.8.7-p371@global/gems/rake-10.0.4/ 
rm  -rf ~/.rvm/gems/ruby-1.8.7-p371@global/specifications/rake-10.0.4.gemspec 
source ~/.bashrc
wget http://www.projectfedena.org/download/fedena-github -O fedena.zip
unzip fedena.zip && mv projectfedena-fedena* fedena/  && cd fedena/
background_color "Latest fedena downloaded and extracted"
wget https://raw.github.com/Passionate/fedena-install/master/ymlwriter.rb 
ruby  ymlwriter.rb $password
rm ymlwriter.rb
background_color "database.yml updated"
rake db:create
rake fedena:plugins:install_all
chmod +x script/*
passenger-install-apache2-module