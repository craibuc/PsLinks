Write-Host "Importing module PsLinks..."

#
# load (dot-source) *.PS1 files, excluding unit-test scripts (*.Tests.*), and disabled scripts (__*)
#
Get-ChildItem "$PSScriptRoot\Functions\*.ps1" | 
    Where-Object { $_.Name -like '*.ps1' -and $_.Name -notlike '__*' -and $_.Name -notlike '*.Tests*' } | 
    % { . $_ }

# commands
Export-ModuleMember Add-Link, Get-Links, Remove-Link, Set-Shortcut

# aliases
Export-ModuleMember -Alias al, ll, rl