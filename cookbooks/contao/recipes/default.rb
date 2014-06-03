
remote_file "/tmp/2.11.17.tar.gz" do
    action "create_if_missing"
    source "https://github.com/contao/core/archive/2.11.17.tar.gz"
    not_if do
        File.exist?("/usr/share/nginx/www/contao")
    end
end

bash "extract_contao" do
    code <<-EOF
tar xzf /tmp/2.11.17.tar.gz -C /tmp/
mv /tmp/core-2.11.17 /usr/share/nginx/www/contao
rm -f /tmp/2.11.17.tar.gz
EOF
    not_if do
        File.exist?("/usr/share/nginx/www/contao")
    end
end


directory "/usr/share/nginx/www" do
  user "www-data"
  group "www-data"
  mode "0755"
  recursive true
end


#file "/usr/share/nginx/www/wordpress/wp-config-sample.php" do
#    action "delete"
#end

#cookbook_file "/usr/share/nginx/www/wordpress/wp-config.php" do
#    source "wp-config.php"
#    user "nobody"
#    group "nogroup"
#    mode "0644"
#end

bash "create_contao_mysql_database" do
    code <<-EOF
mysql -u root -e 'CREATE DATABASE IF NOT EXISTS `contao`;'
EOF
end