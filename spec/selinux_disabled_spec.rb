require 'spec_helper'

# selinux

describe "selinux" do
  describe command('getenforce') do
    its(:stdout) { should match /Disabled|Permissive/ }
  end
end
