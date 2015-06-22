#!/usr/bin/env bash

# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Ruby ruby2.2 ruby2.2-dev
update-alternatives --set ruby /usr/bin/ruby2.2 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.2 >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

install Git git
install SQLite sqlite3 libsqlite3-dev

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant

install 'Nokogiri dependencies' zlib1g-dev libxml2 libxml2-dev libxslt1-dev

# Install NodeJS v0.12.x
echo 'Setting up NodeJS 0.12.x source'
curl -sL https://deb.nodesource.com/setup_0.12 | bash - >/dev/null 2>&1
install NodeJS nodejs

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo installing Sass
gem install sass -N >/dev/null 2>&1

# Install Yeoman (+ dependencies) and Bitmaker Generator
echo 'Installing global npm dependencies'
npm install -g yo
npm install -g grunt-cli
npm install -g bower
npm install -g generator-bitmaker


echo 'all set, rock on!'
