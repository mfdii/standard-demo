#
# Cookbook Name:: lb
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

pool_members = search("node", "role:#{node['lb']['app_server_role']} AND chef_environment:#{node.chef_environment}") || []

pool_members.map! do |member|
  server_ip = begin
    if member.attribute?('cloud')
      if node.attribute?('cloud') && (member['cloud']['provider'] == node['cloud']['provider'])
         member['cloud']['local_ipv4']
      else
        member['cloud']['public_ipv4']
      end
    else
      member['ipaddress']
    end
  end
  {:ipaddress => server_ip, :hostname => member['hostname']}
end

package "haproxy" do
	action :install
end

template "/etc/haproxy/haproxy.cfg" do
	source "haproxy.cfg.erb"
	owner "root"
	group "root"
	mode "0644"
	variables(
		:servers => pool_members.uniq
		)
  notifies :restart, "service[haproxy]"
end

include_recipe "apache::fwrules"

service "haproxy" do
	supports  :restart => true
	action [ :enable, :start ]
end





