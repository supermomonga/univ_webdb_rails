# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "coreos"
  config.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/dev-channel/coreos_production_vagrant.box"


  # Fix docker not being able to resolve private registry in VirtualBox
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provider :vmware_fusion do |vb, override|
    override.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/dev-channel/coreos_production_vagrant_vmware_fusion.box"
  end

  # Make docker daemon accesible from host machine
  # CoreOS doesn't allow us to modify systemd config,
  # so we need to run docker directly.
  config.vm.provision :shell, path: 'bootstrap.sh'
  # Also need port forwarding
  config.vm.network :forwarded_port, guest: 4243, host: 4243

  # plugin conflict
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end
end
