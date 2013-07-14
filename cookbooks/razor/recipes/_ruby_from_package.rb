#
# Cookbook Name:: razor
# Recipe:: ruby_from_package
#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
#
# Copyright 2012, Blue Box Group, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# mixin helpers for this recipe
self.extend(Chef::Razor::RecipeHelpers)

Array(node['razor']['ruby_system_packages']).each do |pkg|
  package pkg
end

include_recipe "razor::_rubygems_from_source" if lucid?

gem_package "bundler"
