#
# Cookbook:: nodejs_windows
# Attributes:: default
#
# Copyright:: 2018, Gene Gotimer, All Rights Reserved.

node.default['nodejs_windows']['version'] = 'v8.9.4'
node.default['nodejs_windows']['platform'] = 'x64'

node.default['nodejs_windows']['tmpdir'] = 'C:\\temp'

node.default['nodejs_windows']['site'] = 'https://nodejs.org/dist'
