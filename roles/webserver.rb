name "webserver"
description "Sets up apache on Linux based servers"
run_list "role[base_centos]","recipe[apache]"