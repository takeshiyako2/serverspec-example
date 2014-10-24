require 'spec_helper'

# newrelic mysql

describe "newrelic mysql" do
  describe command('ps auxf | grep plugin.jar | grep -v grep') do
    its(:stdout) { should match /java -Xmx128m -jar.*plugin.jar/ }
  end
end
