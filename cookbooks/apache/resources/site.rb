actions :create

attribute :site_name, :name_attribute => true, :kind_of => String
attribute :port, :required => true, :kind_of => Fixnum

default_action :create