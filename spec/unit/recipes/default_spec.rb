require 'spec_helper'

describe 'snapraid::default' do
  context 'On Ubuntu 14.04' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.set['snapraid']['content_files'] = ['/mnt/virtual']
        node.set['snapraid']['parity_disks'] = ['/mnt/virtual']
        node.set['snapraid']['data_disks'] = ['/mnt/virtual']
        node.set['snapraid']['block_size'] = '512'
      end

      runner.converge(described_recipe)
    end

    it 'installs snapraid' do
      expect(chef_run).to install_with_make_ark('snapraid')
    end

    it 'creates directories' do
      expect(chef_run).to create_directory('/etc/snapraid')
      expect(chef_run).to create_directory('/var/snapraid')
    end

    it 'creates the correct configuration file' do
      expect(chef_run).to create_template('/etc/snapraid.conf')
      expect(chef_run).to render_file('/etc/snapraid.conf').with_content(%r{
        .*parity\s/mnt/virtual/snapraid.parity.*}x).with_content(%r{
        content\s/mnt/virtual/snapraid.content.*}x).with_content(%r{
        disk\sd1\s/mnt/virtual.*}x)
        .with_content(/
        block_size\s512.*/x)
    end
  end
end
