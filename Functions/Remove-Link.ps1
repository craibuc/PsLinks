<#
.DESCRIPTION
Remove a Window's Explorer link (a .LNK file in C:\Users\<user>\Links directory).

.PARAMETER TargetPath
The link to be removed.

.EXAMPLE
Remove-Link 'baz'

.NOTES
None
#>
function Remove-Link {

    [CmdletBinding()]
    param([string]$Link)

    $LinkPath = Join-Path $env:USERPROFILE -ChildPath 'Links' | Join-Path -ChildPath "$Link.lnk"
    Write-Debug $LinkPath
    rm $LinkPath
}

New-Alias rl Remove-Link
