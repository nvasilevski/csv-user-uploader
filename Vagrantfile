VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'parallels/ubuntu-16.04'
  config.vm.provider 'parallels' do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.ssh.forward_agent = true
  config.vm.provision :file, source: '~/.gitconfig', destination: '~/.gitconfig'
  config.vm.network 'private_network', type: 'dhcp'
  config.vm.network 'forwarded_port', guest: 3000,  host: 3000
end
