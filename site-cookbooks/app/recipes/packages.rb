#
# Cookbook Name:: app
# Recipe:: packages
#
# Copyright 2015, Patrick LUZOLO SIASIA
#

# Makes sure apt is up to date
include_recipe "apt"

# Install app packages
node['app']['packages'].each do |a_package|
  package a_package
end
