# -*- mode: ruby -*-
# vi: set ft=ruby :

# General project settings
#################################

# IP Address for the host only network, change it to anything you like
# but please keep it within the IPv4 private network range
ip_address = "192.168.33.22"

# The project name is base for directories, hostname and alike
project_name = "medlib"

# MySQL and PostgreSQL password - feel free to change it to something
# more secure (Note: Changing this will require you to update the index.php example file)
database_password = "root"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Vagrant configuration
#################################

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Enable Berkshelf support
  config.berkshelf.enabled = true

  # Use the omnibus installer for the latest Chef installation
  config.omnibus.chef_version = :latest

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Setup port forwarding
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  # Create a private network, which allows host-only access to the machine using a specific IP.
  config.vm.network "private_network", ip: ip_address

  # Set share folder
  config.vm.synced_folder "../" , "/var/www/" + project_name + "/", group: "www-data", owner: "vagrant", :mount_options => ["dmode=775", "fmode=666"]

  # CUSTOMIZATION
  config.vm.provider "virtualbox" do |vb|
    vb.name = project_name
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
    vb.cpus = 1
  end

  # Use hostonly network with a static IP Address and enable
  # hostmanager so we can have a custom domain for the server
  # by modifying the host machines hosts file
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.define project_name do |node|
    node.vm.hostname = project_name + ".lan"
    node.vm.network :private_network, ip: ip_address
    node.hostmanager.aliases = [ "dev." + project_name + ".lan" ]
  end
  config.vm.provision :hostmanager

  # Enable and configure chef solo
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "app::packages"
    chef.add_recipe "app::web_server"
    chef.add_recipe "app::vhost"
    chef.add_recipe "memcached"
    chef.add_recipe "app::db"
    chef.json = {
      :app => {
        # Project name
        :name           => project_name,

        # Name of MySQL database that should be created
        :db_name        => project_name + "-dev",

        # Server name and alias(es) for Apache vhost
        :server_name    => project_name + ".lan",
        :server_aliases =>  [ "dev." + project_name + ".lan" ],

        # Document root for Apache vhost
        :docroot        => "/var/www/" + project_name + "/public",

        # General packages
        :packages   => %w{ vim git screen curl mysql-client-core-5.6 },

        # PHP packages
        :php_packages   => %w{ php5-common php5-fpm php5-cgi php5 php5-dev php5-cli php-pear php5-gd php5-curl php5-xsl libssh2-php php5-mysqlnd php5-gd php-pear php5-mysql php5-json language-pack-fr }
      },
      :mysql => {
        :server_root_password   => database_password,
        :server_repl_password   => database_password,
        :server_debian_password => database_password,
        :bind_address           => ip_address,
        :allow_remote_root      => true
      }
    }
  end

  # PROVISION
  # Define the bootstrap file: A (shell) script that runs after first setup of your box (= provisioning)
  # config.vm.provision :shell, path: "bootstrap.sh"
  # config.vm.provision :shell, path: “vagrant/bootstrap.sh"
  # Shell provisioning
  config.vm.provision :shell do |s|
    s.path = "vagrant/bootstrap.sh"
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

end
