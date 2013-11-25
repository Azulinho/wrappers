

include_recipe 'windows'

windows_package "#{Chef::Config[:file_cache_path]}/#{node['mysql']['installer_file']}" do
  package_name "MySQL Installer"
  source node['mysql']['url']
  checksum node['mysql']['checksum']
  options "/quiet"
  action :install
  notifies :run , "windows_batch[Install mySQL]"
end


windows_batch "Install mySQL" do
  code <<-EOH
  cd \\Program\ Files\ (x86)\\mysql\\MySql\ Installer
MySQLInstallerConsole.exe --config=mysql-server-5.6-winx64:passwd=root --product=mysql-server-5.6-winx64 --catalog=mysql-5.6-winx64 --action=install --type=full --nowait
  EOH
  action :nothing
end

