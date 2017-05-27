require 'spec_helper'

describe 'rocketchat::default' do
  context 'install rocketchat defaults' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'creates a directory for the rocketchat server to live' do
      expect(chef_run).to create_directory('/srv/rocketchat').with(
        user: 'rocketchat',
        group: 'rocketchat',
        mode: '0755',
        recursive: true
      )
    end
  end
end
