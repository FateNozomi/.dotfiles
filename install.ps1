# vim
New-Item -Path $HOME\.vimrc -ItemType SymbolicLink -Value $HOME\.dotfiles\.vimrc
New-Item -Path $HOME\vimfiles\pack -ItemType SymbolicLink -Value $HOME\.vim\pack

# nvim
New-Item -Path $env:LOCALAPPDATA\nvim\init.lua -ItemType SymbolicLink -Value $HOME\.dotfiles\nvim\init.lua
New-Item -Path $env:LOCALAPPDATA\nvim\lua\config\settings.lua -ItemType SymbolicLink -Value $HOME\.dotfiles\nvim\config\settings.lua
New-Item -Path $env:LOCALAPPDATA\nvim\lua\config\lazy.lua -ItemType SymbolicLink -Value $HOME\.dotfiles\nvim\config\lazy.lua
New-Item -Path $env:LOCALAPPDATA\nvim\lua\plugins\colorscheme.lua -ItemType SymbolicLink -Value $HOME\.dotfiles\nvim\plugins\colorscheme.lua

# pwsh profile
New-Item -Path $PROFILE -ItemType SymbolicLink -Value $HOME\.dotfiles\Microsoft.PowerShell_profile.ps1

# vscode
New-Item -Path $env:APPDATA\Code\User\settings.json -ItemType SymbolicLink -Value $HOME\.dotfiles\vscode\settings.json
New-Item -Path $env:APPDATA\Code\User\keybindings.json -ItemType SymbolicLink -Value $HOME\.dotfiles\vscode\keybindings.json

# mpv
New-Item -Path $env:APPDATA\mpv\mpv.conf -ItemType SymbolicLink -Value $HOME\.dotfiles\mpv\mpv.conf
$PICTURES = [environment]::getfolderpath("mypictures")
New-Item -Path $env:APPDATA\mpv\screenshots -ItemType SymbolicLink -Value $PICTURES\screenshots

