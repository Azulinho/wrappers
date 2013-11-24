

include_recipe 'windows'


cookbook_file "C:/Windows/temp/install-mysql.bat" do
  source "install-mysql.bat"
  action :create
end

windows_package "#{Chef::Config[:file_cache_path]}/#{node['mysql']['installer_file']}" do
  package_name "MySQL Installer"
  source node['mysql']['url']
  checksum node['mysql']['checksum']
  options "/quiet"
  action :install
  notifies :run , "execute[Install mySQL]"
end


execute "Install mySQL" do
  command "C:/Windows/temp/install-mysql.bat"
  action :nothing
end

