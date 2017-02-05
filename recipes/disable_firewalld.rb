#
# Cookbook Name:: iptables-wrapper
# Recipe:: disable_firewalld
#
# Copyright (c) 2017 Alexander Merkulov, All Rights Reserved.

if platform_family?('rhel') && node['platform_version'].to_f >= 7
  service 'firewalld' do
    action [:stop]
  end
  %w(
    /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service
    /etc/systemd/system/basic.target.wants/firewalld.service
  ).each do |name|
    file name do
      action :disable
    end
  end
end
