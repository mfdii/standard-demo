control_group 'Apache Config' do
  control 'Apache' do
    it 'should be listening on port 80' do
      expect(port(80)).to be_listening
    end

    it 'should be running' do
    	expect(service('httpd')).to be_running
    end

    it 'should be enabled' do
    	expect(service('httpd')).to be_enabled
    end
  end
end