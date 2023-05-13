# -*- mode: ruby -*-
# vi:set ft=ruby sw=2 ts=2 sts=2:

NUM_MANAGED_NODE = 2
IP_NW = "192.168.30."
MANAGED_IP_START = 200

Vagrant.configure("2") do |config|
  
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.ssh.insert_key = false

# Provision ansible control Node
    
    config.vm.define "control" do |control|
      control.vm.hostname = "control.clevory.local"
	    control.vm.network :private_network, ip: "192.168.30.200"
	    control.vm.provision "shell", path: "control.sh"
      control.vm.provider "virtualbox" do |vb|
        vb.name = "control"
        vb.memory = "2048"
      end
	  end

# Provision ansible managed Nodes
  
  (1..NUM_MANAGED_NODE).each do |i|  
	  config.vm.define "node#{i}" do |node|
	    node.vm.hostname = "node#{i}.clevory.local"
      node.vm.network :private_network, ip: IP_NW + "#{MANAGED_IP_START + i}"
	    node.vm.provision "shell", path: "managed.sh"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "node#{i}"
        vb.memory = "1024"
      end                
    end
  end
end
