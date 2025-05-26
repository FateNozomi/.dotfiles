# pwsh profile
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $HOME\.src\.dotfiles\pwsh\Microsoft.PowerShell_profile.ps1

# wezterm
New-Item -ItemType SymbolicLink -Path $HOME\.config\wezterm\wezterm.lua -Target $HOME\.src\.dotfiles\wezterm\wezterm.lua

# vim
New-Item -ItemType SymbolicLink -Path $HOME\.vimrc -Target $HOME\.src\.dotfiles\vim\.vimrc
New-Item -ItemType SymbolicLink -Path $HOME\vimfiles\autoload -Target $HOME\.vim\autoload

# nvim
New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim -Target $HOME\.src\.dotfiles\vscode\nvim

# vscode
New-Item -ItemType SymbolicLink -Path $env:APPDATA\Code\User\settings.json -Target $HOME\.src\.dotfiles\vscode\settings.json
New-Item -ItemType SymbolicLink -Path $env:APPDATA\Code\User\keybindings.json -Target $HOME\.src\.dotfiles\vscode\keybindings.json

# mpv
New-Item -ItemType SymbolicLink -Path $env:APPDATA\mpv\mpv.conf -Target $HOME\.src\.dotfiles\mpv\mpv.conf
$PICTURES = [environment]::getfolderpath("mypictures")
New-Item -ItemType SymbolicLink -Path $env:APPDATA\mpv\screenshots -Target $PICTURES\screenshots
