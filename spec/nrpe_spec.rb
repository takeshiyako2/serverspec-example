require 'spec_helper'

# nrpe

describe "nrpe" do
  describe service('nrpe') do
    it { should be_enabled }
    it { should be_running }
  end
end

