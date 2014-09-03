name "LoadBalancer"
description "Sets up HAProxy to balance between servers with role[webserver]"
run_list "role[base_centos]","recipe[haproxy::app_lb]","recipe[haproxy]"
default_attributes(
	:haproxy => {
		:member_port => 80,
		:admin => {
			:address_bind => "0.0.0.0"
		}
	}

)