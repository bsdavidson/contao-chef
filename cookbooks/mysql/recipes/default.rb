package "mysql-server" do
    action "install"
end

service "mysql" do
  action ["enable", "start"]
  provider Chef::Provider::Service::Upstart
  supports :reload => true, :restart => true, :status => true
end