#################
###Greem Whats###
#################

Vagrantfile развёртывания сервера документов ONLYOFFICE для Linux  Ubuntu
https://helpcenter.onlyoffice.com/ru/server/linux/document/linux-installation.aspx

базовый образ ubuntu 20.04
приложение onlyoffice-documentserver 

Требования:
Virtualbox
Vagrant


Для запуска выполнить

$git clone git@github.com:greemwhats/oodocserv.git

$cd oodocserv

$vagrant up

для входа в виртуальную машину DocServ
$vagrant ssh
или
$ssh -Y -P 2222 vagrant@localhost
пароль vagrant

Для остановки

$vagrant halt

для полного удаления виртуальной машины

$vagrant destroy

Получить доступ к серверу документов

http://127.0.0.1:4567


#############
TODO
change postgres to mariadb, rewrite apps.sh in yaml for ansible
