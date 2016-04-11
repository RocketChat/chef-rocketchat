require 'spec_helper'

describe 'rocketchat::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  let(:sdtd) { chef_run.node['rocketchat'] }

  describe 'on an debian system' do
    it 'sets the default user & group' do
      expect(sdtd['user']).to eq('rocketchat')
      expect(sdtd['group']).to eq('rocketchat')
    end

    it 'sets a installation directory' do
      expect(sdtd['install_dir']).to eq('/srv/rocketchat')
    end

    it 'has a url' do
      expect(sdtd['url']).to match(%r{https:.+(latest/download)})
    end

    it 'has contains a valid checksum' do
      expect(sdtd['checksum']).to match(/\b(?:[a-fA-F0-9][\r\n]*){64}\b/)
    end

    it 'sets some the packages arrays' do
      expect(sdtd['dependencies']).to eq(%w(graphicsmagick curl))
    end
  end
end
