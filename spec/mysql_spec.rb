require 'spec_helper'

# mysql

describe 'mysql' do
  describe command('/usr/bin/mysqladmin -uappvador -pXXXXXXXXXXXXXXX version') do
    its(:stdout) { should match /Server version(\s+)5.6/ }
  end

  describe service('mysqld') do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/etc/my.cnf') do
    it { should be_file }
    it { should contain "innodb_file_per_table" }
    it { should contain "innodb_flush_log_at_trx_commit = 0" }
    it { should contain "innodb_flush_method     = O_DIRECT" }
    it { should contain "plugin-load=handlersocket.so" }
  end

  # socket

  describe file('/var/lib/mysql/mysql.sock') do
    it { should be_socket }
  end

  # port

  describe port(3306) do
    it { should be_listening }
  end

  # kernel

  describe file('/etc/sysctl.conf') do
    it { should be_file }
    it { should contain "vm.swappiness = 0" }
  end

  context linux_kernel_parameter('vm.swappiness') do
    its(:value) { should eq 0 }
  end

end


