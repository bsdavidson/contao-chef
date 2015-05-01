
remote_file '/tmp/2.11.17.tar.gz' do
  action 'create_if_missing'
  source 'https://github.com/contao/core/archive/2.11.17.tar.gz'
  not_if do
    File.exist?('/usr/share/nginx/www/contao')
  end
end

bash 'extract_contao' do
  code <<-EOF
tar xzf /tmp/2.11.17.tar.gz -C /tmp/
mv /tmp/core-2.11.17 /usr/share/nginx/www/contao
rm -f /tmp/2.11.17.tar.gz
EOF
  not_if do
    File.exist?('/usr/share/nginx/www/contao')
  end
end

bash 'set_permissions' do
  code <<-EOF
chown -R www-data.www-data /usr/share/nginx/www
EOF
end

bash 'create_contao_mysql_database' do
  code <<-EOF
mysql -u root -e 'CREATE DATABASE IF NOT EXISTS `contao`;'
EOF
end
