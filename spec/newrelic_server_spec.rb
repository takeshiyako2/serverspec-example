require 'spec_helper'

# newrelic servers 

describe 'newrelic servers' do
  describe command('ps auxf | grep nrsysmond | grep -v grep') do
    its(:stdout) { should match /\/usr\/sbin\/nrsysmond/ }
  end
end

