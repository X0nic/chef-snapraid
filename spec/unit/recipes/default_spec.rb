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

    it 'creates the correct configuration file' do
      expect(chef_run).to create_template('/etc/snapraid.conf')
      expect(chef_run).to render_file('/etc/snapraid.conf').with_content { |content|
        expect(content).to match(%r{parity /mnt/virtual/snapraid.parity})
        expect(content).to match(%r{content /mnt/virtual/snapraid.content})
        expect(content).to match(%r{disk d1 /mnt/virtual})
        expect(content).to match(/block_size 512/)
      }
    end
  end

  context 'On Windows 2012R2' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'windows',
                                        version: '2012R2',
                                        file_cache_path: 'C:\chef\cache') do |node|
        node.set['snapraid']['content_files'] = ['D:\\']
        node.set['snapraid']['parity_disks'] = ['D:\\']
        node.set['snapraid']['data_disks'] = ['D:\\']
        node.set['snapraid']['block_size'] = '512'
        node.set['snapraid']['install_directory'] = 'D:\SnapRaid'
        node.set['snapraid']['config_directory'] = 'D:\SnapRaid\Config'
        node.set['snapraid']['url'] = 'https://github.com/amadvance/snapraid/releases/download/v9.1/snapraid-9.1-windows-x64.zip'
      end

      runner.converge(described_recipe)
    end

    it 'downloads snapraid' do
      expect(chef_run).to create_remote_file('C:\chef\cache\snapraid-9.1-windows-x64.zip')
      resource = chef_run.remote_file('C:\chef\cache\snapraid-9.1-windows-x64.zip')
      expect(resource).to notify('windows_zipfile[D:\SnapRaid]').to(:unzip).immediately
    end

    it 'defines unzip of snapraid with action nothing' do
      expect(chef_run).to_not unzip_windows_zipfile_to('D:\SnapRaid')
    end

    it 'creates directories' do
      expect(chef_run).to create_directory('D:\SnapRaid')
      expect(chef_run).to create_directory('D:\SnapRaid\Config')
    end

    it 'creates the correct configuration file' do
      expect(chef_run).to create_template('D:\SnapRaid\Config/snapraid.conf')
      expect(chef_run).to render_file('D:\SnapRaid\Config/snapraid.conf').with_content { |content|
        expect(content).to match(/parity D:\\\\snapraid.parity/)
        expect(content).to match(/content D:\\\\snapraid.content/)
        expect(content).to match(/disk d1 D:\\/)
        expect(content).to match(/block_size 512/)
      }
    end
  end
end
