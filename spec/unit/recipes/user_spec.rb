require 'spec_helper'

describe 'rocketchat::default' do
  context 'creates a user for the rocketchat server' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'creates a user with attributes' do
      expect(chef_run).to create_user('rocketchat').with(
        shell: '/bin/false',
        gid: 'rocketchat',
        home: '/srv/rocketchat'
      )
    end
  end
end
