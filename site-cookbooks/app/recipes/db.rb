#
# Cookbook Name:: app
# Recipe:: db
#
#

# Create database if it doesn't exist
ruby_block "create_#{node['app']['name']}_db" do
    block do
        %x[mysql -uroot -e "CREATE DATABASE #{node['app']['db_name']};"]
    end
    not_if "mysql -uroot -e \"SHOW DATABASES LIKE '#{node['app']['db_name']}'\" | grep #{node['app']['db_name']}";
    action :create
end

# Load default database if database dump file existing and database is empty
if File.exist?("#{node['app']['db_dump']}")
    ruby_block "seed #{node['app']['name']} database" do
        block do
            %x[mysql -u root #{node['app']['db_name']} < #{node['app']['db_dump']}]
        end
        not_if "mysql -u root -e \"SHOW TABLES FROM #{node['app']['db_name']}\" | \
            grep 1"
        action :create
    end
end
