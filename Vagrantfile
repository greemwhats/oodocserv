#################
###Greem Whats###
#################
Vagrant.configure("2") do |config|
  #ubuntu 20.04
  config.vm.box = "bento/ubuntu-20.04"
  config.vm.box_version = "202008.16.0"
  #### ubuntu 14.04
  #  config.vm.box = "ubuntu/trusty64"
  #  config.vm.box_version = "20190514.0.0"
  #
  ###hdd required size is 50Gb
  config.disksize.size = '50GB'

  ###swap required size is 4Gb
  config.vm.provision "shell", path: "./swap_size.sh"
  
  config.vm.network "forwarded_port", guest: 80, host: 4567
  config.vm.box_check_update = false
  config.vbguest.auto_update = false

  config.vm.provision "shell", path: "./apps.sh"

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
      vb.check_guest_additions=false
      vb.name = "DocServ"
  end
end
