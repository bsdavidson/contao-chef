package "nginx"

service "nginx" do
    action ["start", "enable"]
end


cookbook_file "/etc/nginx/sites-available/default" do
    source "nginx.conf"
    notifies "restart", "service[nginx]"
end

link "/etc/nginx/sites-enabled/default" do
    to "/etc/nginx/sites-available/default"
    notifies "restart", "service[nginx]"
end
