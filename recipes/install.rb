#
# Cookbook Name:: rbenv
# Recipe:: install
#
# Copyright 2014, mostlyfine
#
# All rights reserved - Do Not Redistribute
#

execute "rbenv init" do
  command "source #{node.rbenv.profile_path}/rbenv.sh; rbenv rehash"
  user node.rbenv.user
  group node.rbenv.user
  action :run
end

node.rbenv.build.each do |version|
  execute "ruby install #{version}" do
    not_if "source #{node.rbenv.profile_path}/rbenv.sh; rbenv versions | grep #{version}"
    command "source #{node.rbenv.profile_path}/rbenv.sh; rbenv install #{version}"
    user node.rbenv.user
    group node.rbenv.user
    action :run
  end
end

execute "global ruby change" do
  command "source #{node.rbenv.profile_path}/rbenv.sh; rbenv global #{node.rbenv.global}; rbenv rehash"
  user node.rbenv.user
  group node.rbenv.user
  action :run
end

