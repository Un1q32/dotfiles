Set-Alias lg lazygit
Set-Alias ls real_ls
function .. { Set-Location ".." }
function ... { Set-Location "../.." }
function .... { Set-Location "../../.." }
function ..... { Set-Location "../../../.." }
function real_ls { busybox ls --color --group-directories-first -AA $args }
function l { real_ls -lh $args }

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -EditMode vi

function promptpath {
    $path = Get-Location
    $path = $path.Path
    $path = $path.Replace($HOME, '~')
    $path = $path.Replace('\', '/')
    return $path
}

function prompt {
    Write-Host "$($env:username)@$(hostname) " -ForegroundColor Green -NoNewLine
    Write-Host "$(promptpath) `$" -ForegroundColor Blue -NoNewLine
    return ' '
}

pfetch
