# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo adding swap file
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Ruby ruby2.3 ruby2.3-dev
update-alternatives --set ruby /usr/bin/ruby2.3 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.3 >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

install Git git
install memcached memcached
install Redis redis-server
install RabbitMQ rabbitmq-server
install imagemagic imagemagic

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo sed -i "s/#listen_address.*/listen_addresses '*'/" /etc/postgresql/9.5/main/postgresql.conf
sudo cat >> /etc/postgresql/9.5/main/pg_hba.conf <<EOF
  # Accept all IPv4 connections - FOR DEVELOPMENT ONLY!!!
  host    all         all         0.0.0.0/0             md5
EOF
sudo su postgres -c "psql -c \"CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'\" "

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'ExecJS runtime' nodejs

install zsh zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="awesomepanda"/g' /home/vagrant/.zshrc
sudo chsh -s /bin/zsh vagrant
echo "cd /vagrant" >> /home/vagrant/.zshrc
zsh

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'all set, rock on!'
