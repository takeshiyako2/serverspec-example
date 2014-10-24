require 'spec_helper'

# redis

describe 'redis' do

  # redis

  describe service('redis') do
    it { should be_running }
  end

  describe service('redis_6379') do 
    it { should be_enabled }
  end

  # port

  describe port(6379) do
    it { should be_listening }
  end

  # kernel

  describe file('/etc/sysctl.conf') do
    it { should be_file }
    it { should contain "vm.overcommit_memory = 1" }
  end

  context linux_kernel_parameter('vm.overcommit_memory') do
    its(:value) { should eq 1 }
  end
end


