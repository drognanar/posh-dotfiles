# Git aliases
function g     { git status @args }
function gist  { git status @args }
function glo   { git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit @args }
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
                         -LongDescription 'Create a git pull command' `
                         -Key Ctrl+p `
                         -ScriptBlock {
  $pulls = Get-History | ? { $_.CommandLine -like 'git pull --rebase *' }
  if ($null -ne $pulls) {
    Invoke-Shortcut -SkipAcceptLine $pulls[-1]
  } else {
    Invoke-Shortcut -SkipAcceptLine "git pull --rebase $global:SoPoshPullRemote $global:SoPoshPullBranch"
  }
}

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
