require 'spec_helper'

# ruby

describe 'ruby' do
  describe command('ruby -v') do
    its(:stdout) { should match /ruby 2\..*/ }
  end
end


