#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
	action :install
end

#Disable the default virtual host

execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
	notifies :restart, "service[httpd]"
end

#Iterate over the apache sites
node["apache"]["sites"].each do |site_name, site_data|

	apache_site site_name do
		port site_data["port"]
		notifies :restart, "service[httpd]"
		notifies :run, "execute[selinux_srv]"
	end

end

execute "selinux_srv" do
	command "chcon -Rv --type=httpd_sys_content_t /srv"
	action :nothing
end

iptables_rule "http"

#Service Restarting/Start	
service "httpd" do
	action [ :enable, :start ]
end
