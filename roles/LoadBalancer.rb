name "LoadBalancer"
description "Sets up HAProxy to balance between servers with role[webserver]"
run_list "role[base_centos]","recipe[haproxy::app_lb]"