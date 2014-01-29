background_color() {
  echo ; echo
  echo -e "\033[32m $1"
  tput sgr0 
  echo ; echo
}
control_c()
{
  echo -en "\n\n*** Exiting ***\n\n"
  exit 1
}
trap control_c SIGINT
wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz
tar xzf rubygems-1.3.7.tgz
sudo ruby rubygems-1.3.7/setup.rb --no-format-executable
wget http://www.projectfedena.org/download/fedena-github -O fedena.zip
unzip fedena.zip && mv projectfedena-fedena* fedena/  && cd fedena/
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
sudo gem install bundler
sudo gem install rails -v 2.3.5 
sudo gem install  i18n -v 0.4.2 
sudo gem install  declarative_authorization -v 0.5.1 
sudo gem install  mysql -v 2.8.1 
sudo gem install  rake -v 0.8.7 
sudo gem install  rush -v 0.6.8 
sudo gem install passenger
sudo apt-get -y install libmysqlclient-dev  mysql-server mysql-client
read  -p "Please tell your root password,it is required for fedena installation: " password
wget https://raw.github.com/passion8/fedena-install/master/ymlwriter.rb 
ruby  ymlwriter.rb $password && rm ymlwriter.rb && background_color "database.yml updated"
sudo rm -rf /usr/lib/ruby/gems/1.8/gems/rake-10.1.1/ 
sudo rm -rf /usr/lib/ruby/gems/1.8/cache/rake-10.1.1.gem
sudo rm -rf /usr/lib/ruby/gems/1.8/specifications/rake-10.1.1.gemspec
sudo echo "export RAILS_ENV=production" >> ~/.bashrc
source ~/.bashrc
rake db:create
chmod +x script/*
rake fedena:plugins:install_all
sudo passenger-install-apache2-module
