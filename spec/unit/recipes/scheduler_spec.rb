require 'spec_helper'

describe 'snapraid::scheduler' do
  context 'On Ubuntu 14.04' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.set['snapraid']['scheduler']['script_directory'] = '/opt/script_directory'
        node.set['snapraid']['scheduler']['config_file'] = '/opt/script_directory/snapraid_runner.conf'
        node.set['snapraid']['scheduler']['deletion_abort_threshold'] = '3'
        node.set['snapraid']['scheduler']['scrub_after_sync'] = 'false'
        node.set['snapraid']['scheduler']['scrub_percentage'] = '100'
        node.set['snapraid']['scheduler']['scrub_older_than'] = '5'
      end

      runner.converge(described_recipe)
    end

    it 'installs python' do
      expect(chef_run).to install_package('python')
    end

    it 'creates directories' do
      expect(chef_run).to create_directory('/opt/script_directory')
    end

    it 'creates script file' do
      expect(chef_run).to create_remote_file('/opt/script_directory/snapraid-runner.py')
    end

    it 'creates the correct configuration file' do
      expect(chef_run).to create_template('/opt/script_directory/snapraid_runner.conf')
      expect(chef_run).to render_file('/opt/script_directory/snapraid_runner.conf').with_content { |content|
        expect(content).to match(/deletethreshold = 3/)
        expect(content).to match(/enabled = false/)
        expect(content).to match(/percentage = 100/)
        expect(content).to match(/older-than = 5/)
      }
    end

    it 'creates cron job' do
      expect(chef_run).to create_cron('snapraid-runner')
    end
  end

  context 'On Windows 2012R2' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'windows', version: '2012R2') do |node|
        node.set['snapraid']['install_directory'] = 'C:\SnapRaid'
        node.set['snapraid']['scheduler']['script_directory'] = 'C:\snapraid_runner'
        node.set['snapraid']['scheduler']['config_file'] = 'C:\snapraid_runner/snapraid_runner.conf'
        node.set['snapraid']['scheduler']['deletion_abort_threshold'] = '3'
        node.set['snapraid']['scheduler']['scrub_after_sync'] = 'false'
        node.set['snapraid']['scheduler']['scrub_percentage'] = '100'
        node.set['snapraid']['scheduler']['scrub_older_than'] = '5'
      end

      runner.converge(described_recipe)
    end

    it 'installs python' do
      expect(chef_run).to install_windows_package('python2.7')
    end

    it 'creates directories' do
      expect(chef_run).to create_directory('C:\snapraid_runner')
    end

    it 'creates script file' do
      expect(chef_run).to create_remote_file('C:\snapraid_runner/snapraid-runner.py')
    end

    it 'creates the correct configuration file' do
      expect(chef_run).to create_template('C:\snapraid_runner/snapraid_runner.conf')
      expect(chef_run).to render_file('C:\snapraid_runner/snapraid_runner.conf').with_content { |content|
        expect(content).to match(/executable = C:\\SnapRaid\\snapraid.exe/)
        expect(content).to match(/deletethreshold = 3/)
        expect(content).to match(/enabled = false/)
        expect(content).to match(/percentage = 100/)
        expect(content).to match(/older-than = 5/)
      }
    end

    it 'creates scheduld task' do
      expect(chef_run).to create_windows_task('SnapRaid Runner')
    end
  end
end
