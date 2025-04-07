# pwsh profile
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $HOME\.dotfiles\pwsh\Microsoft.PowerShell_profile.ps1

# wezterm
New-Item -ItemType SymbolicLink -Path $HOME\.config\wezterm -Target $HOME\.dotfiles\wezterm

# vim
New-Item -ItemType SymbolicLink -Path $HOME\.vimrc -Target $HOME\.dotfiles\vim\.vimrc
New-Item -ItemType SymbolicLink -Path $HOME\vimfiles\autoload -Target $HOME\.vim\autoload

# nvim
New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim -Target $HOME\.dotfiles\vscode\nvim

# vscode
New-Item -ItemType SymbolicLink -Path $env:APPDATA\Code\User\settings.json -Target $HOME\.dotfiles\vscode\settings.json
New-Item -ItemType SymbolicLink -Path $env:APPDATA\Code\User\keybindings.json -Target $HOME\.dotfiles\vscode\keybindings.json

# mpv
New-Item -ItemType SymbolicLink -Path $env:APPDATA\mpv\mpv.conf -Target $HOME\.dotfiles\mpv\mpv.conf
$PICTURES = [environment]::getfolderpath("mypictures")
New-Item -ItemType SymbolicLink -Path $env:APPDATA\mpv\screenshots -Target $PICTURES\screenshots

