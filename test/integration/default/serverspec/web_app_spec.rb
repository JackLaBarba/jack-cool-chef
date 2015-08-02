require 'spec_helper'

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

nginx_sites_enabled_path = "/etc/nginx/sites-enabled/"

describe file(nginx_sites_enabled_path) do
  it { should be_directory }
end

describe command("ls #{nginx_sites_enabled_path}") do
  its(:stdout) { should eq "" }
end
