require 'spec_helper'

# newrelic nginx

describe "newrelic nginx" do
  describe command('ps auxf | grep nginx-nr-agent | grep -v grep') do
    its(:stdout) { should match /\/var\/run\/nginx-nr-agent\/nginx-nr-agent.pid/ }
  end
end
