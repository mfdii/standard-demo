use_inline_resources

action :create do
	
	site_name = new_resource.site_name
	port = new_resource.port

	document_root = "/srv/apache/#{site_name}"

#Add a template for Apache virtual host configuration
	template "/etc/httpd/conf.d/#{site_name}.conf" do
		source "custom.erb"
		mode "0644"
		variables(
			:document_root => document_root,
			:port => port
			)
	end
	
#Add a directory resource to create the document_root
	directory document_root do
		mode "0755"
		recursive true
	end
	
#Add at template resource for the virtual host's index.html
	template "#{document_root}/index.html" do
		source "index.html.erb"
		mode "0644"
		variables(
			:site_name => site_name,
			:port => port
			)
	end

end