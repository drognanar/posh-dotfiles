# Git aliases
function g     { git status @args }
function gist  { git status @args }
function glo   { git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -- }
function gcam  { git commit -a -m "$args" }
function gcmt  { git commit -m "$args" }
function gca   { git commit -a @args }
function gd    { git diff @args }
function gb    { git branch @args }
function gup   { git push @args }
function gpu   { git pull @args }

Set-PSReadlineKeyHandler -BriefDescription GitPush `
                         -LongDescription 'Execute git push' `
                         -Key Ctrl+Shift+P `
                         -ScriptBlock { Invoke-Shortcut 'git push' }

Set-PSReadlineKeyHandler -BriefDescription GitPull `
                         -LongDescription 'Execute git pull' `
                         -Key Ctrl+p `
                         -ScriptBlock { Invoke-Shortcut 'git pull --rebase' }

Set-PSReadlineKeyHandler -BriefDescription GitCommit `
                         -LongDescription 'Execute git commit' `
                         -Key Ctrl+Shift+C `
                         -ScriptBlock {
  $message = Read-Host 'commit message'
  if ($message -ne '') {
    Invoke-Shortcut "git commit -m `"$message`""
  } else {
    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
  }
}
