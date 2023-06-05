Set-Alias rm $HOME\scoop\shims\rm.exe
Set-Alias find $HOME\scoop\shims\find.exe
Set-Alias convert $HOME\scoop\apps\imagemagick\current\convert.exe
Set-Alias lg lazygit
Set-Alias ls real_ls
Set-Alias cat real_cat
Set-Alias objdump llvm-objdump
Set-Alias strip llvm-strip
Set-Alias sudo gsudo
function .. { Set-Location ".." }
function ... { Set-Location "../.." }
function .... { Set-Location "../../.." }
function ..... { Set-Location "../../../.." }
function real_ls { busybox ls --color --group-directories-first -AA $args }
function l { busybox ls --color --group-directories-first -AAlh $args }
function real_cat { bat --theme=ansi -P $args }
function ln { sudo New-Item -ItemType SymbolicLink -Path $args[1] -Target $args[0] }
function tree { tree.exe -aCI .git --dirsfirst $args }
function server { ssh joey@192.168.1.232 -p2222 }
function pcserver { ssh joey@192.168.1.233 }

Import-Module gsudoModule
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
