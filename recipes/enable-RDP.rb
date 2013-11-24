include_recipe 'windows'
include_recipe 'powershell'


%w(Remote-Desktop-Services)
   .each do |f|
      windows_feature f do
        action :install
      end
   end

powershell "Hack the registry" do
  code <<-EOH
    Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server' -Name fDenyTSConnections -Value 0
  EOH
  action :run
end

