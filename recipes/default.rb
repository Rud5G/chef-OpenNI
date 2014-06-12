#
# Cookbook Name:: OpenNI
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

#
# apt_repository 'trusty-nonfree' do
#   uri 'http://archive.canonical.com/ubuntu'
#   distribution node['lsb']['codename']
#   components ['nonfree']
#   action :add
# end

include_recipe 'baseserver::baseserver'

include_recipe 'OpenNI::java'

node['openni']['required-packages'].each do |packagename|
  package packagename
end
