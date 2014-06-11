# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'
VAGRANT_MIN_VERSION = '1.5.2'


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
# Check Vagrant version
  if Vagrant::VERSION < VAGRANT_MIN_VERSION
    puts "FATAL: Cookbook depends on Vagrant #{VAGRANT_MIN_VERSION} or higher."
    exit
  end

# Plugin-specific configurations
  # Detects vagrant omnibus plugin
  if Vagrant.has_plugin?('vagrant-omnibus')
    puts 'INFO:  Vagrant-omnibus plugin detected.'
    config.omnibus.chef_version = :latest
  else
    puts "FATAL: Vagrant-omnibus plugin not detected. Please install the plugin with\n       'vagrant plugin install vagrant-omnibus' from any other directory\n       before continuing."
    exit
  end

  # Detects vagrant berkshelf plugin
  if Vagrant.has_plugin?('berkshelf')
    # The path to the Berksfile to use with Vagrant Berkshelf
    puts 'INFO:  Vagrant-berkshelf plugin detected.'
    config.berkshelf.berksfile_path = './Berksfile'
  else
    puts "FATAL: Vagrant-berkshelf plugin not detected. Please install the plugin with\n       vagrant plugin install vagrant-berkshelf --plugin-version '>= 2.0.1' from any OTHER directory\n       before continuing."
    exit
  end

  # Detects vagrant hostmanager plugin
  if Vagrant.has_plugin?('vagrant-hostmanager')
    puts 'INFO:  Vagrant-hostmanager plugin detected.'
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
    config.hostmanager.aliases = %w(openni.dev) 
  else
    puts "WARN:  Vagrant-hostmanager plugin not detected. Please install the plugin with\n       'vagrant plugin install vagrant-hostmanager' from any other directory\n       before continuing."
  end

# vm config
  config.vm.hostname = 'openni.dev'

  config.vm.box = 'opscode-ubuntu-12.04'
  config.vm.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box'

  config.vm.network :private_network, :ip => '33.33.34.100'

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = true

    # Give enough horsepower to build without taking all day.
    vb.customize [
      'modifyvm', :id,
      '--memory', '1024',
      '--cpus', '2',
    ]
  end

  # Enable SSH agent forwarding for git clones
  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = 'data_bags'
    chef.environments_path = 'environments'
    chef.roles_path = 'roles'

    chef.verbose_logging = true
    chef.log_level = :info
    # chef.log_level = :debug
    chef.node_name = 'openni.dev'
    chef.environment = 'development'

    chef.log_level = :debug
    chef.json = {
        'java' => {
            'install_flavor' => 'openjdk',
            'jdk_version' => '6'
        }
    }

    chef.run_list = [
        'recipe[OpenNI::default]'
    ]
  end



end

