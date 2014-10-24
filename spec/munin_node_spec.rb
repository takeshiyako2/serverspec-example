require 'spec_helper'

# munin-node

describe "munin-node" do
  describe service('munin-node') do
    it { should be_enabled }
    it { should be_running }
  end
end

