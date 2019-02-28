Vagrant.configure("2") do |config|
  config.vm.box = "centos7x64"
  #config.vm.provider "virtualbox" do |vb|
  #  vb.cpus = 2
  #  vb.memory = 2048
  #end
  config.vm.provision "shell", path: "setup_zelcash.sh"
end
