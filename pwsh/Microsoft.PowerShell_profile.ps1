Invoke-Expression (&starship init powershell)

Set-Alias -Name lg -Value lazygit.exe
Set-Alias -Name nvd -Value neovide

function hc {
    Clear-Content (Get-PSReadLineOption).HistorySavePath
    Clear-History
}

function Invoke-Starship-PreCommand {
    $loc = $executionContext.SessionState.Path.CurrentLocation;
    $prompt = "$([char]27)]9;12$([char]7)"
    if ($loc.Provider.Name -eq "FileSystem") {
        $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    $host.ui.Write($prompt)
}

function zcd {
    $fzPath = $(fzf)
    if ($fzPath -ne $null) {
        Set-Location (Get-Item $fzPath).Directory.FullName
    }
}

function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
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

$env:GIT_SSH = "$env:SystemRoot\System32\OpenSSH\ssh.exe"
