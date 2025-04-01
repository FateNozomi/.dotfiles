function ho { cd $home }
function hc {
    Clear-Content (Get-PSReadlineOption).HistorySavePath
    Clear-History
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
