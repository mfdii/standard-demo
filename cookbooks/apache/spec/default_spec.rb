require 'chefspec'  
require_relative 'spec_helper'

describe 'apache::default' do  
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
 

  it 'includes the apache2 package' do
    expect(chef_run).to install_package('httpd')
  end 
	
end