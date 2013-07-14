#
# Cookbook Name:: razor
# Recipe:: default
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

images = node['razor']['images'] || Hash.new

images.each_pair do |name, image|
  razor_image name do
    %w[type url version checksum iso_path].each do |attr|
      send(attr, image[attr]) if attr
    end

    action image['action'].to_sym if image['action']
  end
end
