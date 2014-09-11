name "aws_webserver"
description "Sets up apache on Linux based servers in aws"
run_list "role[base_centos]","recipe[apache]","recipe[apache::aws_lb]"