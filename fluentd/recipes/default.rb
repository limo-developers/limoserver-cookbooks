#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2011, Treasure Data, Inc.
#

# Chef::Recipe.send(:include, TdAgent::Version)
# Chef::Provider.send(:include, TdAgent::Version)

# group 'td-agent' do
#   group_name 'td-agent'
#   gid node["td_agent"]["gid"] if node["td_agent"]["gid"]
#   system true
#   action     [:create]
# end

# user 'td-agent' do
#   comment  'td-agent'
#   uid node["td_agent"]["uid"] if node["td_agent"]["uid"]
#   system true
#   group    'td-agent'
#   home     '/var/run/td-agent'
#   shell    '/bin/false'
#   password nil
#   supports :manage_home => true
#   action   [:create, :manage]
# end

# directory '/var/run/td-agent/' do
#   owner  'td-agent'
#   group  'td-agent'
#   mode   '0755'
#   action :create
# end

# directory '/etc/td-agent/' do
#   owner  'td-agent'
#   group  'td-agent'
#   mode   '0755'
#   action :create
# end

# case node['platform']
# when "ubuntu"
#   dist = node['lsb']['codename']
#   source =
#     if major.nil? || major == '1'
#       # version 1.x or no version
#       if dist == 'precise'
#         'http://packages.treasuredata.com/precise/'
#       else
#         'http://packages.treasuredata.com/debian/'
#       end
#     else
#       # version 2.x or later
#       "http://packages.treasuredata.com/#{major}/ubuntu/#{dist}/"
#     end

#   apt_repository "treasure-data" do
#     uri source
#     distribution dist
#     components ["contrib"]
#     key "http://packages.treasuredata.com/GPG-KEY-td-agent"
#     action :add
#   end
# when "centos", "redhat", "amazon"
#   source =
#     if major.nil? || major == '1'
#       "http://packages.treasuredata.com/redhat/$basearch"
#     else
#       # version 2.x or later
#       "http://packages.treasuredata.com/2/redhat/$releasever/$basearch"
#     end

#   yum_repository "treasure-data" do
#     url source
#     gpgkey "http://packages.treasuredata.com/GPG-KEY-td-agent"
#     action :add
#   end
# end

template "/etc/fluent/fluent.conf" do
  mode "0644"
  source "fluent.conf.erb"
  notifies :restart, "service[fluent]"
end

# package "fluentd" do
#   if node["fluentd"]["pinning_version"]
#     action :install
#     version node["fluentd"]["version"]
#   else
#     action :upgrade
#   end
# end

execute "install fluentd and plugins" do
  command "sudo gem install fluentd"
  command "sudo fluent-gem install fluent-plugin-s3"
end

service "fluentd" do
  action [ :enable, :start ]
end
