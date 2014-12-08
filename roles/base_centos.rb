name "base_centos"
description "Base role for Centos nodes"
run_list "recipe[chef-client]","recipe[ohai-public_ip]","recipe[ohai]","recipe[push-jobs]","recipe[iptables]","recipe[fwrules]"
default_attributes(
	:chef_client => {
		:interval => 60,
		:splay => 30
	},
	:push_jobs	=> {
		:package_url => "https://opscode-private-chef.s3.amazonaws.com/el/6/x86_64/opscode-push-jobs-client-1.1.5-1.el6.x86_64.rpm",
		:package_checksum => "08d1e8058e2ca1290f71f9c2ba6684cecfc2099d"
	},
	:iptables => {
		:install_rules => false
	},
	:fwrules => {
		:'80' => true,
		:'22' => true,
		:'443' => true
	}	
)
