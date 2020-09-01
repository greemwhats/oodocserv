#!/usr/bin/env bash
#################
###Greem Whats###
#################

###bystroFIX
sudo touch /etc/apt/apt.conf.d/99verify-peer.conf \
&& sudo echo >>/etc/apt/apt.conf.d/99verify-peer.conf 'Acquire::https::download.onlyoffice.com::Verify-Peer "false";'
###
sudo apt-get update
#

sudo apt-get install -y  postgresql postgresql-contrib libpq-dev
sudo -i -u postgres psql -c "CREATE DATABASE onlyoffice;"
sudo -i -u postgres psql -c "CREATE USER onlyoffice WITH password 'onlyoffice';"
sudo -i -u postgres psql -c "GRANT ALL privileges ON DATABASE onlyoffice TO onlyoffice;"
sudo service postgresql start
sudo update-rc.d postgresql defaults
###
sudo apt-get install -y redis-server
sudo service redis-server start
sudo update-rc.d redis-server defaults
###
sudo apt-get install -y rabbitmq-server
sudo cp /vagrant/rabbitmq-env.conf /etc/rabbitmq/rabbitmq-env.conf
sudo service rabbitmq-server start
sudo update-rc.d rabbitmq-server defaults
###
sudo rabbitmqctl add_user onlyoffice mypassword
sudo rabbitmqctl set_user_tags onlyoffice administrator
sudo rabbitmqctl set_permissions -p / onlyoffice ".*" ".*" ".*"
###
sudo apt-get install -y nginx
sudo cp  /vagrant/onlyoffice-documentserver /etc/nginx/sites-available/onlyoffice-documentserver
sudo service nginx start
sudo update-rc.d nginx defaults
###
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
sudo echo 'deb  [trusted=yes] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee /etc/apt/sources.list.d/onlyoffice.list
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get --allow-unauthenticated  install -y onlyoffice-documentserver
###
