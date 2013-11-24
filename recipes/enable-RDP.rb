include_recipe 'windows'
include_recipe 'powershell'


%w(RDS-RD-Server)
   .each do |f|
      windows_feature f do
        action :install
      end
   end

powershell "Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server' -Name fDenyTSConnections -Value 0'" do
  action :run
end

powershell "Set-NetFirewallRule -DisplayGroup 'Remote Desktop' -Enabled True" do
  action :run
end


