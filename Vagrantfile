Vagrant.configure("2") do |config|
    config.vm.box = "sbeliakou/centos"
    config.vm.box_check_update = false
    config.vm.define "jenkins" do |jenkins|
        jenkins.vm.hostname = "jenkins"
        jenkins.vm.network "private_network", ip: "192.168.10.10"
        jenkins.vm.provider "virtualbox" do |vb|  
            vb.memory = "2048"
            vb.gui = false
            vb.name = "jenkins"
            end
        jenkins.vm.provision 'shell', path: "jenkins.sh"
        end
end
