controls 'port compliance' do
  control port(23) do
    it "has nothing listening"
      expect(port(23)).to_not be_listening
    end
  end
end