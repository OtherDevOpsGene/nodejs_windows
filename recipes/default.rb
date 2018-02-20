#
# Cookbook:: nodejs_windows
# Recipe:: default
#
# Copyright:: 2018, Gene Gotimer, All Rights Reserved.

# Create a temporary directory to download to
directory node['nodejs_windows']['tmpdir'] do
  rights :full_control, 'Everyone'
  inherits false
  action :create
end

# Download nodejs if needed
nodejs_file = "node-#{node['nodejs_windows']['version']}-#{node['nodejs_windows']['platform']}.msi"
nodejs_destination = "#{node['nodejs_windows']['tmpdir']}\\#{nodejs_file}"
nodejs_source = "#{node['nodejs_windows']['site']}/#{node['nodejs_windows']['version']}/#{nodejs_file}"
remote_file nodejs_destination do
  source nodejs_source
  action :create_if_missing
end

# Install the msi package
windows_package 'Node.js' do
  installer_type :msi
  source nodejs_source
  action :install
end
