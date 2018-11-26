Vagrant.configure("2") do |config|
  config.vm.define "webserver" do |subconfig|
    subconfig.vm.box = "sbeliakou/centos"
    subconfig.vm.hostname = "webserver"
    subconfig.vm.network :private_network, ip: "192.168.10.10"
    subconfig.vm.provider "virtualbox" do |vb|
         vb.memory = "2048"
         vb.name = "Webserver"
     end
     subconfig.vm.provision 'shell', path: "jen.sh"
  end
end
