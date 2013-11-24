include_recipe 'windows'

powershell "Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server' -Name fDenyTSConnections -Value 0'" do
  action :run
end

powershell "Set-NetFirewallRule -DisplayGroup 'Remote Desktop' -Enabled True" do
  action :run
end