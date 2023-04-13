Import-Module "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell de590238 -DevCmdArguments '-arch=x64' > NUL

Set-Alias rm $HOME\scoop\shims\rm.exe
Set-Alias find $HOME\scoop\shims\find.exe
Set-Alias convert $HOME\scoop\apps\imagemagick\current\convert.exe
Set-Alias lg lazygit
Set-Alias ls real_ls
Set-Alias cat real_cat
function .. { Set-Location ".." }
function ... { Set-Location "../.." }
function .... { Set-Location "../../.." }
function ..... { Set-Location "../../../.." }
function real_ls { C:\Users\Joey\scoop\shims\ls.exe --color --group-directories-first -A $args }
function l { C:\Users\Joey\scoop\shims\ls.exe --color --group-directories-first -Alh $args }
function real_cat { bat --theme=ansi -P $args }

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
$env:PF_SOURCE = "$HOME\.config\pfetch.conf"

pfetch
