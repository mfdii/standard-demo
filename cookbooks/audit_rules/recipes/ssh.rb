control_group 'SSH Security' do
  control 'SSH' do
    it 'should be listening on port 22' do
      expect(port(22)).to be_listening
    end

    it 'disables root logins over ssh' do
      expect(file('/etc/ssh/sshd_config')).to contain('PermitRootLogin no')
    end

    it "PasswordAuthentication is disabled"
      expect(file('/etc/ssh/sshd_config')).to match(/PasswordAuthentication\s+no/)
    end
  end
end
