Invoke-Expression (&starship init powershell)

function ho { cd $home }
function hc {
    Clear-Content (Get-PSReadlineOption).HistorySavePath
    Clear-History
}
function lfcd {
    lf -print-last-dir $args | Set-Location
}
function fd {
    $fzPath = $(fzf)
    if ($fzPath -ne $null) {
        Set-Location (Get-Item $fzPath).Directory.FullName
    }
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
