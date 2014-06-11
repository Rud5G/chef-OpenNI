#
# Cookbook Name:: OpenNI
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

include_recipe 'baseserver::baseserver'

include_recipe 'OpenNI::java'

node['openni']['required-packages'].each do |packagename|
  package packagename
end
