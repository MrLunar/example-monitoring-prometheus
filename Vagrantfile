Vagrant.configure("2") do |config|

  config.vm.define "monitoringhost" do |monitoringhost|
    monitoringhost.vm.box = "centos/7"
    monitoringhost.vm.network "forwarded_port", guest: 3000, host: 3000
    monitoringhost.vm.network "forwarded_port", guest: 9090, host: 9090
    monitoringhost.vm.network "private_network", ip: "10.0.57.10"
    monitoringhost.vm.provision "shell", path: "monitoringhost/provision-dockerhost.sh"
    monitoringhost.vm.provision "shell", inline: "cd /vagrant/monitoringhost; docker-compose up-d"
    monitoringhost.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end
  
  config.vm.define "winhost01" do |winhost01|
    winhost01.vm.box = "mrlunar/windows-server-2016"
    winhost01.vm.network "private_network", ip: "10.0.57.11"
    winhost01.vm.provision "shell", path: "winhost/Provision-Host.ps1"
    winhost01.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

  config.vm.define "linhost01" do |linhost01|
    linhost01.vm.box = "centos/7"
    linhost01.vm.network "private_network", ip: "10.0.57.12"
    linhost01.vm.provision "shell", path: "linhost/provision-host.sh"
    linhost01.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

end
