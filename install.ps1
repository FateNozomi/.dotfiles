# vim
New-Item -ItemType SymbolicLink -Path $HOME\.vimrc -Target $HOME\.dotfiles\.vimrc
New-Item -ItemType SymbolicLink -Path $HOME\vimfiles\autoload -Target $HOME\.vim\autoload

# nvim
New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim\init.lua -Target $HOME\.dotfiles\nvim\init.lua
New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim\lua -Target $HOME\.dotfiles\nvim\lua
New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim\after -Target $HOME\.dotfiles\nvim\after

# pwsh profile
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $HOME\.dotfiles\Microsoft.PowerShell_profile.ps1

# vscode
New-Item -ItemType SymbolicLink -Path $env:APPDATA\Code\User\settings.json -Target $HOME\.dotfiles\vscode\settings.json
New-Item -ItemType SymbolicLink -Path $env:APPDATA\Code\User\keybindings.json -Target $HOME\.dotfiles\vscode\keybindings.json

# mpv
New-Item -ItemType SymbolicLink -Path $env:APPDATA\mpv\mpv.conf -Target $HOME\.dotfiles\mpv\mpv.conf
$PICTURES = [environment]::getfolderpath("mypictures")
New-Item -ItemType SymbolicLink -Path $env:APPDATA\mpv\screenshots -Target $PICTURES\screenshots

