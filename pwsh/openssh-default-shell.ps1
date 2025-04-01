<#
.SYNOPSIS
    Sets the default shell for OpenSSH.
.DESCRIPTION
    This PowerShell script sets the default shell for OpenSSH.
.PARAMETER Shell
    Specifies the default shell. [pwsh|wsl]
.EXAMPLE
    PS> ./openssh-default-shell.ps1 -Shell pwsh
#>

#Requires -RunAsAdministrator

param(
    [String]$Shell
)

if (([string]::IsNullOrEmpty($Shell))) {
    $Shell = Read-Host "Enter OpenSSH default shell [pwsh|wsl]"
    if (([string]::IsNullOrEmpty($Shell))) {
        exit 0
    }
}

if ($Shell -eq "pwsh") {
    New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Program Files\PowerShell\7\pwsh.exe" -PropertyType String -Force
}
elseif ($Shell -eq "wsl") {
    New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Program Files\WSL\wsl.exe" -PropertyType String -Force
}
else {
    Write-Host "Invalid shell specified."
    exit 1
}
