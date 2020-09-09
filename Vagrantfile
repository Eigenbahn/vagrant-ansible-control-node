# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-buster64"

  # config.vm.box_check_update = false

  config.vm.network "private_network", ip: "192.168.254.253"

  # config.vm.synced_folder ".", "/vagrant" # NB: for some reason, on some versions on VirtualBox this needs to be set explicitely
  # config.vm.synced_folder "~/Nextcloud/ansible", "/ansible"

  config.vm.boot_timeout = 600

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ansible-control-node"
    vb.memory = "512"
  end

  # fix vbox guest addition install
  # config.vm.provision "basic", type: "shell", :path => "provision/guest-additions.sh"
  # basic box/machine normalization
  config.vm.provision "normalize", type: "ansible_local" do |ansible|
    ansible.playbook = "provision/normalize.yml"
  end
  # ansible installation + tweaks
  config.vm.provision "ansible", type: "ansible_local" do |ansible|
    ansible.playbook = "provision/ansible.yml"
  end
end
