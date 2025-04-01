<#
.SYNOPSIS
    Adds port forwarding for WSL2.
.DESCRIPTION
    This PowerShell script adds port forwarding and firewall rules for WSL2. Administrator rights are required.
.PARAMETER Port
    Specifies the SSH server port required for port forwarding.
.EXAMPLE
    PS> ./wsl2-sshd.ps1 -Port 22
#>

#Requires -RunAsAdministrator

param(
    [UInt16]$Port = 0
)

if ($Port -eq 0) {
    $Port = Read-Host "Enter SSH server Port (Enter 0 to display v4tov4 portproxy parameters)"
    if ($Port -eq 0) {
        netsh interface portproxy show v4tov4
        exit 0
    }
}

# Port forwarding via netsh interface portproxy
$HostAddress = (Test-Connection -ComputerName $env:COMPUTERNAME -IPv4 -Count 1).Address.IPAddressToString
$ConnectAddress = Invoke-Expression "wsl hostname -I"

# To reset all portproxy: netsh interface portproxy reset all
Write-Host "Deleting portproxy"
Invoke-Expression "netsh interface portproxy delete v4tov4 listenaddress=$HostAddress listenport=$Port"

Write-Host "Adding portproxy"
Invoke-Expression "netsh interface portproxy add v4tov4 listenaddress=$HostAddress listenport=$Port connectaddress=$ConnectAddress connectport=$Port"

Write-Host "Listing portproxy"
Invoke-Expression "netsh interface portproxy show v4tov4"

# Re-create NetFireWallRule
Write-Host "Deleting inbound firewall rule 'wsl2-sshd'`n"
Remove-NetFireWallRule -DisplayName 'wsl2-sshd'

Write-Host "Adding inbound firewall rule"
New-NetFirewallRule -DisplayName 'wsl2-sshd' -Direction Inbound -Action Allow -Protocol TCP -LocalPort $Port