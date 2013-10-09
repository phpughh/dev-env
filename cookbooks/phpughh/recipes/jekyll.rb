#
# Cookbook Name:: phpughh
# Recipe:: jekyll
#
# Copyright 2012-2013, phpughh
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

#
# install decadency ruby
#
execute "install ruby package" do
  command "apt-get -y install #{node['phpughh']['package_name']}"
  user "root"
  action :run
end

#
# install decadency ruby dev
#
execute "install ruby dev package" do
  command "apt-get -y install #{node['phpughh']['package_name_dev']}"
  user "root"
  action :run
end

#
# install jekyll via gem
#
execute "install jekyll package" do
  command "gem install jekyll"
  not_if do
    File.exists?("/var/opt/phpughh-jekyll-installed")
  end
  user "root"
  action :run
end

# set lock file so jekyll will only install while building the machine
execute "set lock file" do
  command "touch /var/opt/phpughh-jekyll-installed"
  user "root"
  action :run
end

# DOES NOT WORK NEED TO CHECK WHAT CAUSES THE ISSUE LATER

#execute "start jekyll" do
#  command "jekyll serve --port 80 --watch --detach --source /var/www/phpughh.github.com"
#  user "root"
#  action :run
#end
