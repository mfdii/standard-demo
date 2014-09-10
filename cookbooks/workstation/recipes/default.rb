#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

chef_server_ip ="nothing"

chef_servers = search("node","name:ChefServer") || []
log chef_servers
chef_servers.map! do |member|
	chef_server_ip = member['public_ip']
end

cookbook_file "/home/chef/update_server.sh" do
	source "update_server.sh"
	owner "chef"
	group "chef"
	mode "0755"
end

execute "sync_server" do
	command "su - chef -c /home/chef/update_server.sh"
	action :nothing
end

git "/home/chef/standard-demo" do
	repository node['workstation']['git_repo']
	notifies :run, "execute[sync_server]"
end

log "ChefServer IP: #{chef_server_ip}"

template "/home/chef/user_data.sh" do
	source "user_data.sh.erb"
	user "chef"
	group "chef"
	mode "755"
	variables(
		:chef_server_ip => chef_server_ip
		)
end

template "/home/chef/user_data.ps1" do
	source "user_data.ps1.erb"
	user "chef"
	group "chef"
	mode "755"
	variables(
		:chef_server_ip => chef_server_ip
		)
end
