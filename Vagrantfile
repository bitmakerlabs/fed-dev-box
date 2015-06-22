# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = 'fed-dev-box'

  # Ruby projects default to port 3000
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  # Node Projects default to port 9000
  config.vm.network :forwarded_port, guest: 9000, host: 9000
  # Port 35729 is required by LiveReload to reflect content changes
  config.vm.network :forwarded_port, guest: 35729, host: 35729

  # projects folder next to this Vagrantfile will be shared with the VM
  config.vm.synced_folder "projects", "/home/vagrant/projects"

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
end
