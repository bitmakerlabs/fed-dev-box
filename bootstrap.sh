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

install Ruby ruby2.2
update-alternatives --set ruby /usr/bin/ruby2.2 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.2 >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

install Git git
install SQLite sqlite3 libsqlite3-dev

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev

# Install NodeJS v0.12.x
curl -sL https://deb.nodesource.com/setup_0.12 | bash -
install NodeJS nodejs

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

# Install Yeoman (+ dependencies) and Bitmaker Generator
npm install -g yo grunt-cli bower generator-bitmaker


echo 'all set, rock on!'
