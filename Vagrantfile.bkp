# -*- mode: ruby -*-
# vi: set ft=ruby :
 boxes = [
      { :name => :app,   :roles => ['base', 'web']              },
      { :name => :mc,    :roles => ['base', 'mc']         },
      { :name => :db,    :roles => ['base', 'db']        },      
]
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, :path => "requirements.sh"
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "./cookbooks/dev/Berksfile"
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "1024"
  end
  boxes.each do |opts|
    # per node configuration
    config.vm.define opts[:name] do |node|
      node.vm.hostname = "%s.vagrant" % opts[:name].to_s
      # chef-solo configuration
      node.vm.provision :chef_solo do |chef|
        #chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
        #chef.data_bags_path = "data_bags"
        chef.roles_path = "roles"
        opts[:roles].each do |role|
          chef.add_role("#{role}")
        end
        # stop chef-solo from breaking the box
        chef.json = {
          "authorization" => {
            "sudo" => {
              "users" => [ "vagrant" ],
              "passwordless" => true,
              "sudoers_defaults" => ['!requiretty'],
            }
          }
        }
      end
    end 
  end  
end
