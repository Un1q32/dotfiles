Set-Alias rm $HOME\scoop\shims\rm.exe
Set-Alias find $HOME\scoop\shims\find.exe
Set-Alias convert $HOME\scoop\apps\imagemagick\current\convert.exe
Set-Alias update topgrade
Set-Alias lg lazygit
function .. { Set-Location ".." }
function ... { Set-Location "../.." }
function .... { Set-Location "../../.." }
function ..... { Set-Location "../../../.." }

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

$env:CARGO_REGISTRIES_CRATES_IO_PROTOCOL = "sparse"
$env:PF_SOURCE = "C:\msys64\home\Joey\.config\pfetch.conf"

pfetch