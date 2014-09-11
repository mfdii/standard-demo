include_recipe "aws"

node['apache']['sites'].each do |site_name,site_data|
	aws_elastic_lb "#{site_name}_elb_register" do
	  name "#{site_name}ELB"
	  action :register
	end
end


