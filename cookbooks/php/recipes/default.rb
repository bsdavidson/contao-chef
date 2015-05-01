package 'php5-fpm'

package 'php5-cli'

package 'php5-mysql' do
  notifies 'restart', 'service[php5-fpm]'
end

service 'php5-fpm' do
  action %w(enable start)
  supports reload: true, restart: true, status: true
end
