# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
# Set-PoshPrompt capr4n
# $omp_config = Join-Path $PSScriptRoot ".\divinurised.omp.json"

# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'divinurised.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# PSReadLine
# Set-PSReadLineOption -EditMode Emacs
# Set-PSReadLineOption -BellStyle None
# Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
# Set-PsFzfOption PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias gg search-google
Set-Alias ss browser-url
Set-Alias cr Clear-RecycleBin -Force
Set-Alias dev cdd
Set-Alias work cdw
Set-Alias pwsconfig pwsc

# Functions
Function search-google {
  $query = 'https://www.google.com/search?q='
  $args | % { $query = $query + "$_+" }
  $url = $query.Substring(0, $query.Length - 1)
  start "$url"
}

Function browser-url {
  $baseURL = 'https://'
  $args | % { $baseURL = $baseURL + "$_+" }
  $search = $baseURL.Substring(0, $baseURL.Length - 1)
  start "$search"
}


function cdd { set-location 'C:\Users\dxvia\Development\projects' }
function cdw { set-location 'C:\Users\dxvia\Development\work' }
function pwsc { 
  set-location 'C:\Users\dxvia\.config\powershell'
  code user_profile.ps1 
}

# Welcome message
$green = "green"   
$cyan = "Cyan"   
$yellow = "Yellow"   
Write-Host '
(o<
<_)
' -ForegroundColor $yellow
Write-Host 'Greetings Davi! Shall we play a game? đšī¸' -ForegroundColor $cyan;
Write-Host 'Happy hacking and coding!đ§âđģ' -ForegroundColor $green;
Write-Host ''