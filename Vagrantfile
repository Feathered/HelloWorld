Vagrant.configure("2") do
  config.box = "bento/ubuntu-16.04"
  config.vm.provision "file", source: "deploy.sh", destination: "/tmp/deploy.sh"
  config.vm.provision "shell", path: "/tmp/deploy.sh"  
end

