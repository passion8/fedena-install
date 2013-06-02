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
sudo apt-get -y install git-core unzip
sudo apt-get install -y libgemplugin-ruby
sudo apt-get -y install apache2
sudo apt-get install ruby