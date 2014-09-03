name "base_centos"
description "Base role for Centos nodes"
run_list "recipe[chef-client]","recipe[push-jobs]","recipe[iptables]"
default_attributes(
	:chef_client => {
		:interval => 60,
		:splay => 30
	},
	:push_jobs	=> {
		:package_url => "https://s3.amazonaws.com/opscode-private-chef/el/6/x86_64/opscode-push-jobs-client-1.0.2-1.el6.x86_64.rpm"
	},
	:iptables => {
		:install_rules => false
	}
	:fwrules => {
		:80 => true,
		:22 => true,
		:443 => true
	}	
)
