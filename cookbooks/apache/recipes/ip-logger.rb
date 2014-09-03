#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

search("node","platform:centos").each do |server|
 log "The CentOS servers in your organization have the following FQDN/IP Addresses:- #{server["fqdn"]}/#{server["ipaddress"]}"
end 
