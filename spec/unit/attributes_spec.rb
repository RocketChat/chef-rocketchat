require 'spec_helper'

describe 'rocketchat::default_attributes' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
    runner.converge('rocketchat::default')
  end

  describe 'on and ubuntu 16.04 system' do
    it 'sets the default user & group' do
      expect(chef_run.node['rocketchat']['user']).to eq('rocketchat')
      expect(chef_run.node['rocketchat']['group']).to eq('rocketchat')
    end

    it 'sets a installation directory' do
      expect(chef_run.node['rocketchat']['install_dir']).to eq('/srv/rocketchat')
    end

    it 'has a url' do
      expect(chef_run.node['rocketchat']['url']).to match(%r{https:.+(/download)})
    end

    it 'has contains a valid checksum' do
      expect(chef_run.node['rocketchat']['checksum']).to match(/\b(?:[a-fA-F0-9][\r\n]*){64}\b/)
    end

    it 'sets some the packages arrays' do
      expect(chef_run.node['rocketchat']['dependencies']).to eq(%w(graphicsmagick curl))
    end
  end
end
