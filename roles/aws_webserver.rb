name "aws_webserver"
description "Sets up apache on Linux based servers in aws"
run_list "role[webserver]","recipe[apache::aws_lb]"