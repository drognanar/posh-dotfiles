# Python aliases
function py2   { py -2.7 @args }
function py3   { py -3.5 @args }

# Msys/unix aliases
function l     { ls.exe -F --color=always @args }
function which { where.exe @args }
function unix  { C:\Windows\System32\bash.exe @args  }
function rmrf  { rm -Recurse -Force @args }

# Return a sorted line count for files specified by `$args`.
function lines($dir) { bash -c "find $dir -name '$args' | xargs wc -l | sort" }

# Start (Windows)/open (macos) related aliases commands
Set-Alias open Start-Process
Set-Alias o Start-Process
Set-Alias s Start-Process
function s.    { start . }
function o.    { start . }
function wallpapers { start "~\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState" }

# Application aliases
Set-Alias code Invoke-VsCode
Set-Alias c code
Set-Alias z Set-JumpLocation
function c.    { code . }

# Misc aliases
Set-Alias up Test-Internet

# Helper functions.

<#
.SYNOPSIS
  Does a ping to check if you are connected to internet.
#>
function Test-Internet($address='www.bing.com') {
  ping $address -t
}
