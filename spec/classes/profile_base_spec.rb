require 'spec_helper'

describe 'profile::base' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :concat_basedir => '/dne',
        })
      end
      let(:params) {{ }}

      it { should compile.with_all_deps }
      it { should create_class('profile::base') }

      it { should contain_class('dnsclient') }
    end
  end
end
