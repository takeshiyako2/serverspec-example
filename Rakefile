require 'rake'
require 'rspec/core/rake_task'

hosts = [
  {
    :hostname   => 'front1',
    :ip_address  => '100.100.100.101',
    :roles => %w( os selinux iptables nginx php ruby nrpe munin_node newrelic_server newrelic_nginx ),
  },
  {
    :hostname   => 'front2',
    :ip_address  => '100.100.100.102',
    :roles => %w( os selinux iptables nginx php ruby nrpe munin_node newrelic_server newrelic_nginx ),
  },
  {
    :hostname   => 'redis1',
    :ip_address  => '100.100.100.103',
    :roles => %w( os iptables ruby redis nrpe munin_node newrelic_server newrelic_redis ),
  },
  {
    :hostname   => 'mysql1',
    :ip_address  => '100.100.100.104',
    :roles => %w( os iptables ruby mysql nrpe munin_node newrelic_server newrelic_mysql ),
  },
]

hosts = hosts.map do |host|
  {
    :ip_address => host[:ip_address],
    :hostname => host[:hostname],
    :roles      => host[:roles],
  }
end

desc "Run serverspec to all hosts"
task :serverspec => 'serverspec:all'

namespace :serverspec do
  task :all => hosts.map {|h| 'serverspec:' + h[:hostname] }
  hosts.each do |host|
    desc "Run serverspec to #{host[:ip_address]}"
    RSpec::Core::RakeTask.new(host[:hostname].to_sym) do |t|
      ENV['TARGET_HOST'] = host[:ip_address]
      t.pattern = 'spec/{' + host[:roles].join(',') + '}_spec.rb'
    end
  end
end
