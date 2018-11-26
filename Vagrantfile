BOX_IMAGE = "sbeliakou/centos"
<<<<<<< HEAD
	Vagrant.configure("2") do |config|
		config.vm.define "jenkins" do |subconfig|
    			subconfig.vm.box = BOX_IMAGE
    			subconfig.vm.hostname = "jenkins"
    			subconfig.vm.network :private_network, ip: "192.168.170.173"
    			subconfig.vm.provider "virtualbox" do |vb|	
    				vb.memory = "2048"
    				vb.name = "jenkins"
			end
		subconfig.vm.provision 'shell', path: "script.sh"	
		end
	end


=======
NODE_COUNT = 2

Vagrant.configure("2") do |config|
  config.vm.define "NGINXJ" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "NGINXJ"
    subconfig.vm.network :private_network, ip: "192.168.39.120"
        subconfig.vm.provider "virtualbox" do |vb|
	vb.memory = "4096"
	vb.name = "NGINXJ"
	end
    subconfig.vm.provision 'shell', path: "Script.sh"
      end
end
>>>>>>> 7367319715455ff5268768184369a51cfdea156b
