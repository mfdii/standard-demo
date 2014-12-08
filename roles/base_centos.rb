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
		:package_checksum => "f5e6be32f60b689e999dcdceb102371a4ab21e5a1bb6fb69ff4b2243a7185d84"
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
