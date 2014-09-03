name "LoadBalancer"
description "Sets up HAProxy to balance between servers with role[webserver]"
run_list "role[base_centos]","recipe[lb]"
default_attributes(
	:fwrules => {
		:'22002' => true
	}
)