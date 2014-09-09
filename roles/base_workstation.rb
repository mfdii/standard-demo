name "base_workstation"
description "Base role for workstation nodes"
run_list "recipe[chef-client]","recipe[ohai-public_ip]","recipe[ohai]","recipe[push-jobs]","recipe[workstation]"
default_attributes(
	:chef_client => {
		:interval => 60,
		:splay => 30
	},
	:push_jobs	=> {
		:package_url => "https://s3.amazonaws.com/opscode-private-chef/el/6/x86_64/opscode-push-jobs-client-1.0.2-1.el6.x86_64.rpm"
	}	
)
