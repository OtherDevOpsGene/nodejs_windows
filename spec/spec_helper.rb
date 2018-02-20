# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

Chef::Config[:chef_gem_compile_time] = false
ChefSpec::Coverage.start!
