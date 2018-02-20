#
# Cookbook:: nodejs_windows
# Spec:: default
#
# Copyright:: 2018, Gene Gotimer, All Rights Reserved.

require 'spec_helper'

describe 'nodejs_windows::default' do
  platforms = {
    'windows' => {
      versions: %w(2012R2 2016),
    },
  }

  platforms.each do |platform, values|
    values[:versions].each do |version|
      context "When all attributes are default, on #{platform} #{version}" do
        let(:chef_run) { ChefSpec::SoloRunner.new(platform: platform, version: version).converge(described_recipe) }

        it 'converges successfully' do
          expect { chef_run }.to_not raise_error
        end

        it 'creates a directory with windows rights' do
          expect(chef_run).to create_directory('C:\\temp')
        end

        it 'downloads the nodejs distribution' do
          expect(chef_run).to create_remote_file_if_missing('C:\\temp\\node-v8.9.4-x64.msi')
        end

        it 'installs nodejs' do
          expect(chef_run).to install_windows_package('Node.js')
        end
      end
    end
  end
end
