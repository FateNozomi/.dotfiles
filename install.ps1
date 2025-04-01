# vim
New-Item -Path $HOME\.vimrc -ItemType SymbolicLink -Value $HOME\.dotfiles\.vimrc
New-Item -Path $HOME\vimfiles\pack -ItemType SymbolicLink -Value $HOME\.vim\pack

# nvim
New-Item -Path $env:LOCALAPPDATA\nvim\init.lua -ItemType SymbolicLink -Value $HOME\.dotfiles\nvim\init.lua

# pwsh profile
New-Item -Path $PROFILE -ItemType SymbolicLink -Value $HOME\.dotfiles\Microsoft.PowerShell_profile.ps1

# vscode
New-Item -Path $env:APPDATA\Code\User\settings.json -ItemType SymbolicLink -Value $HOME\.dotfiles\vscode\settings.json

# mpv
New-Item -Path $env:APPDATA\mpv\mpv.conf -ItemType SymbolicLink -Value $HOME\.dotfiles\mpv\mpv.conf
$PICTURES = [environment]::getfolderpath("mypictures")
New-Item -Path $env:APPDATA\mpv\screenshots -ItemType SymbolicLink -Value $PICTURES\screenshots

# komorebi
New-Item -Path $HOME\komorebi.json -ItemType SymbolicLink -Value $HOME\.dotfiles\komorebi\komorebi.json
