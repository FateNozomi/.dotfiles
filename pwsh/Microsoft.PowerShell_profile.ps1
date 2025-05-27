Invoke-Expression (&starship init powershell)

Set-Alias -Name lg -Value lazygit.exe
Set-Alias -Name nvd -Value neovide

function hc {
    Clear-Content (Get-PSReadlineOption).HistorySavePath
    Clear-History
}
function zcd {
    $fzPath = $(fzf)
    if ($fzPath -ne $null) {
        Set-Location (Get-Item $fzPath).Directory.FullName
    }
}
function lfcd {
    lf -print-last-dir $args | Set-Location
}
function ju {
    cd C:\SC4\BFG.Jump
}
function mpva {
    param (
        [string]$Link
    )
    mpv `
    --ytdl-format='ba' `
    --ytdl-raw-options="yes-playlist=" `
    --term-playing-msg='Title: ${media-title}' `
    $Link
}
