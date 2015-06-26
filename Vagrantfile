# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'fed-dev-box'

  # Ruby projects default to port 3000
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  # Node Projects default to port 9000
  config.vm.network :forwarded_port, guest: 9000, host: 9000
  # Port 35729 is required by LiveReload to reflect content changes
  config.vm.network :forwarded_port, guest: 35729, host: 35729

  # Required for NFS to work, using DHCP to dynamically assign an address to box
  config.vm.network :private_network, type: 'dhcp'
  # Use NFS for shared folders for better performance (ignored on Windows)
  # Extra optimizations for mount_options from: https://www.jverdeyen.be/vagrant/speedup-vagrant-nfs/
  config.vm.synced_folder './projects', '/home/vagrant/projects', type: 'nfs', mount_options: ['rw', 'vers=3', 'tcp', 'fsc' ,'actimeo=2']

  config.vm.provider 'virtualbox' do |v, override|
    host = RbConfig::CONFIG['host_os']

    # Performance tuning taken from: https://stefanwrobel.com/how-to-make-vagrant-performance-not-suck
    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else # sorry Windows folks, I can't help you
      cpus = 2
      mem = 1024

      # Patch vagrant itself for Windows machines to use UNC paths without 256 char limit
      # Fixed in next version of vagrant (1.7.3)
      # https://github.com/mitchellh/vagrant/pull/5495
      v.customize ["sharedfolder", "add", :id, "--name", "projects", "--hostpath", (("//?/" + File.dirname(__FILE__) + "/projects").gsub("/","\\"))]
      override.vm.provision :shell, inline: "mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` projects /home/vagrant/projects", run: "always"

      # Allow symlinks on Windows
      # Windows users must also use the --no-bin-links switch whenever using 'npm install'
      v.customize ['setextradata', :id, 'VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root', '1']
    end

    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]

    # Fixes a VirtualBox issue with setting the private_network to DHCP
    # https://github.com/mitchellh/vagrant/issues/3083
    # v.customize ['dhcpserver', 'remove', '--netname', 'HostInterfaceNetworking-vboxnet0']
  end

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
end
