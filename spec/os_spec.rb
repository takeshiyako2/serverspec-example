require 'spec_helper'

# users

describe 'users' do
  %w{ user1 user2 }.each do |u|
    describe user("#{u}") do
      it { should exist }
      it { should belong_to_group 'wheel' }
    end
  end
end

# kernel

describe 'kernel' do
  describe file('/etc/sysctl.conf') do
    it { should be_file }
    it { should contain "net.ipv4.ip_local_port_range = 1024 65000" }
  end
  context linux_kernel_parameter('net.ipv4.ip_local_port_range') do
    its(:value) { should match /1024\t65000/ }
  end
end

# swap

describe "swap" do
  describe command('swapon -s') do
    its(:stdout) { should match /.*(partition|file)\s+\d+\t\d+\t-1/ }
  end
  describe file('/proc/swaps') do
    it { should be_file }
    its(:content) { should match /.*(partition|file)\s+\d+\t\d+\t-1/ }
  end
end

# timezone 

describe "timezone" do
  describe command('date') do
    its(:stdout) { should match /JST/ }
  end
end

# crond

describe "crond" do
  describe service('crond') do
    it { should be_enabled }
    it { should be_running }
  end
end

# sshd

describe "sshd" do
  describe service('sshd') do
    it { should be_enabled }
    it { should be_running }
  end

  # sshd_config settings
  describe file("/etc/ssh/sshd_config") do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 600 }
    its(:content) { should match(/^PasswordAuthentication no$/) }
  end
end

# ntpd

describe "ntpd" do
  describe service('ntpd') do
    it { should be_enabled }
    it { should be_running }
 end
end

# git

describe "git" do
  describe package('git') do
    it { should be_installed }
  end
end

# bash

describe "bash" do
  describe command('env x=\'() { :;}; echo vulnerable\' bash -c "echo this is a test"') do
    its(:stdout) { should eq "this is a test\n" }
  end
end
