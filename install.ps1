New-Item -Path $HOME\.vimrc -ItemType SymbolicLink -Value $HOME\.dotfiles\.vimrc
New-Item -Path $PROFILE -ItemType SymbolicLink -Value $HOME\.dotfiles\Microsoft.PowerShell_profile.ps1

New-Item -Path $HOME\vimfiles\pack -ItemType SymbolicLink -Value $HOME\.vim\pack
