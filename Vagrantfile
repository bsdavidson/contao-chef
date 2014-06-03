# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure VAGRANTFILE_API_VERSION do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.network "private_network", ip: "192.168.33.11"
  config.vm.provision "shell", inline: "apt-get update >/dev/null"
  config.vm.provision "chef_solo" do |chef|
  	chef.verbose_logging = true
  	chef.add_recipe "mysql"
  	chef.add_recipe "nginx"
  	chef.add_recipe "php"
  	chef.add_recipe "contao"
  end
end