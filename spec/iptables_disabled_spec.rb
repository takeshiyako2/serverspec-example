require 'spec_helper'

# iptables disabled

describe "iptables disabled" do
  describe service('iptables') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

