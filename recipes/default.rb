#
# Cookbook Name:: iptables-wrapper
# Recipe:: default
#
# Copyright (c) 2015 Alexander Merkulov, All Rights Reserved.

include_recipe 'iptables::default'

if platform_family?('rhel') && node['platform_version'].to_f >= 7
  service 'firewalld' do
    action [:stop]
  end
  %w(
    /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service 
    /etc/systemd/system/basic.target.wants/firewalld.service
  ).each do |name|
    file name do
      action :delete
    end  
  end
  %(iptables ip6tables).each do |name|
    service name do
      action [:enable, :start]
    end
  end
end
