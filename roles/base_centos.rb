name "base_centos"
description "Base role for Centos nodes"
run_list "recipe[chef-client]","recipe[chef-client::config]","recipe[ohai-public_ip]","recipe[ohai]","recipe[push-jobs]","recipe[iptables]","recipe[fwrules]"
default_attributes(
	:chef_client => {
		:interval => 60,
		:splay => 30,
		:config => {
			"Ohai::Config[:plugin_path]" => ' << "/etc/chef/ohai_plugins"',
			"audit_mode" => ":enabled"
		}
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
	},
	:omnibus_updater => {
    :version => '12.3.0',
    :restart_chef_service => true
  }	
)
