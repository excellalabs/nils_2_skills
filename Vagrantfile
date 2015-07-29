Vagrant.configure(2) do |config|
  
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3000, host: 8888

  config.vm.provision "shell", path: "./vagrantconfig/bootstrap.sh"
  
end