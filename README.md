# OpenNI cookbook

# Requirements

Install chef-dk from the downloads page on the [Chef-DK github page](https://github.com/opscode/chef-dk)

Install Vagrant '>= 1.5.2' from the [Vagrant downloads page](http://www.vagrantup.com/download-archive/v1.5.2.html)

Install the Vagrant plugins: Berkshelf, Omnibus, Hostmanager

    $ vagrant plugin install vagrant-berkshelf --plugin-version '>= 2.0.1'
    $ vagrant plugin install vagrant-omnibus
    $ vagrant plugin install vagrant-hostmanager

# Usage

Set the required project (git), database, virtualhost & users in the databags

    $ vagrant up
    $ vagrant halt


## Known Issues 


# Attributes

# Recipes

# Author

Author:: Triple-networks (<r.gravestein@triple-networks.com>)

Author:: Lifthoofd (<eovermeire@gmail.com>)

# Todo

 * primesense-nite-nonfree
 * https://github.com/OpenNI/OpenNI
 * vagrant-vbguest plugin
