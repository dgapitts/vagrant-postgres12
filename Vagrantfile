# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", 2]
  end
  #config.vm.box = "centos/7"
  config.vm.box = "https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-1804_02.VirtualBox.box"
  config.vm.hostname = "pg12centos7"
  config.vm.network :forwarded_port, guest: 5432, host: 9510
  config.vm.provision :shell, :path => "provision.sh"
end
