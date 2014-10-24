require 'spec_helper'

# iptables

describe "iptables" do
  describe service('iptables') do
    it { should be_enabled }
  end
  describe command('/etc/init.d/iptables status') do
    its(:stdout) { should match /state NEW tcp dpt:22/ }
  end
end