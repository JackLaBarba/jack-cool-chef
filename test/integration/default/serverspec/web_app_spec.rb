require 'spec_helper'

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  xit { should be_listening }
end

nginx_sites_enabled_path = "/etc/nginx/sites-enabled/"

describe file(nginx_sites_enabled_path) do
  it { should be_directory }
end

describe command("ls #{nginx_sites_enabled_path}") do
  its(:stdout) { should eq "" }
end

jlabarba_groups = ["jack_cool", "sysadmin"]
jlabarba_groups.each do |group_name|
  describe group(group_name) do
    it { should exist}
  end
end

describe user("jlabarba") do
  it { should exist }
  jlabarba_groups.each do |group_name|
    it { should belong_to_group(group_name)}
  end
end
