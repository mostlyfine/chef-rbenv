#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2014, mostlyfine
#
# All rights reserved - Do Not Redistribute
#

group node.rbenv.group do
  members node.rbenv.members
  append true
  action :create
end

git node.rbenv.rbenv_root do
  not_if { File.exist?(node.rbenv.rbenv_root) }
  user node.rbenv.user
  group node.rbenv.group
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :sync
end

directory "#{node.rbenv.rbenv_root}/plugins" do
  not_if { File.exist?("#{node.rbenv.rbenv_root}/plugins") }
  owner node.rbenv.user
  group node.rbenv.group
  mode "0755"
  action :create
end

git "#{node.rbenv.rbenv_root}/plugins/ruby-build" do
  not_if { File.exist?("#{node.rbenv.rbenv_root}/plugins/ruby-build") }
  user node.rbenv.user
  group node.rbenv.group
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :sync
end

git "#{node.rbenv.rbenv_root}/plugins/rbenv-update" do
  not_if { File.exist?("#{node.rbenv.rbenv_root}/plugins/rbenv-update") }
  user node.rbenv.user
  group node.rbenv.group
  repository "git://github.com/rkh/rbenv-update.git"
  reference "master"
  action :sync
end

directory node.rbenv.profile_path do
  not_if { File.exist?(node.rbenv.profile_path) }
  owner node.rbenv.user
  group node.rbenv.group
  mode "0755"
  recursive true
  action :create
end

template "#{node.rbenv.profile_path}/rbenv.sh" do
  not_if { File.exist?("#{node.rbenv.profile_path}/rbenv.sh" ) }
  owner node.rbenv.user
  group node.rbenv.group
  mode "0644"
end
