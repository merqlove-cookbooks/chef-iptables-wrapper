#
# Cookbook Name:: stunnel-wrapper
# Recipe:: default
#
# Copyright (c) 2015 Alexander Merkulov, All Rights Reserved.

include_recipe 'iptables::default'

if platform_family?('rhel') && node['platform_version'].to_f >= 7
  service 'firewalld' do
    action [:stop, :mask]
  end
  service 'iptables' do
    action [:enable, :start]
  end
end
