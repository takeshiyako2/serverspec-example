require 'spec_helper'

# php-fpm

describe "php" do

  describe package('php-fpm') do
    it { should be_installed }
  end

  describe service('php-fpm') do
    it { should be_enabled }
    it { should be_running }
  end

  # php config

  describe file('/etc/php.ini') do
    it { should be_file }
    it { should contain("Asia/Tokyo").after(/^date\.timezone/) }
    it { should contain("expose_php = Off") }
    it { should contain("display_errors = Off") }
  end

  describe command("php -i") do
    its(:stdout) { should match /Default timezone => Asia\/Tokyo/ }  
    its(:stdout) { should match /date.timezone => Asia\/Tokyo => Asia\/Tokyo/ }
    its(:stdout) { should match /expose_php => Off => Off/ }
    its(:stdout) { should match /opcache.enable => On => On/ }
    its(:stdout) { should match /display_errors => Off => Off/ }
  end

  # socket

  describe file('/tmp/php.socket') do
    it { should be_socket }
  end

end

