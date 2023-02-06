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

function prompt {
    Write-Host "$($env:username)@$(hostname) " -ForegroundColor Green -NoNewLine
    Write-Host "$(Get-Location) `$" -ForegroundColor Blue -NoNewLine
    return ' '
}
