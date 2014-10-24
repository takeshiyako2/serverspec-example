require 'spec_helper'

# nginx

describe "nginx" do
  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/etc/nginx/nginx.conf') do
    it { should be_file }
  end

  describe command("curl localhost/nginx_status") do
    its(:stdout) { should match /Active connections: \d+/ }
  end

  describe port(80) do
    it { should be_listening }
  end
end
