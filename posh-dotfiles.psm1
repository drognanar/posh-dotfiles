Import-Module so-posh -Global

# Load all other ps1 files in this directory.
# Besides `install.ps1` which is used when installing a module.
try {
  pushd $PSScriptRoot
  foreach ($script in (ls *.ps1 -Exclude "install.ps1")) {
    . $script
  }
}
finally {
  popd
}

Export-ModuleMember `
  -Function @(
    'Test-Internet'
    'g'
    'gist'
    'glo'
    'gcam'
    'gca'
    'gd'
    'gp'
    'gpu'
    'py2'
    'py3'
    'l'
    'which'
    'unix'
    'rmrf'
    'lines'
    's.'
    'o.'
    'wallpapers'
    'c.'
  ) `
  -Alias @(
    'open'
    'o'
    's'
    'code'
    'c'
    'z'
    'up'
  )
