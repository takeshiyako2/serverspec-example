require 'spec_helper'

# newrelic redis

describe 'newrelic redis' do
  describe process('newrelic-plugin') do
    it { should be_running }
    its(:args) { should match /\/usr\/bin\/newrelic-plugin-agent/ }
  end
end
