<#
.DESCRIPTION
Creates a Window's Explorer link to target (a .LNK file in C:\Users\<user>\Links directory).

.PARAMETER TargetPath
path/to/file/or/directory

.EXAMPLE
Add-Link 'c:\foo\bar\baz'

.NOTES
None
#>

function Add-Link {

    [CmdletBinding()]
    param([string]$TargetPath)

    # c:\foo\bar\baz -> baz
    $leaf = Split-Path $TargetPath -Leaf

    # C:\Users\<username>\Links\baz.lnk
    $LinkPath = Join-Path $env:USERPROFILE -ChildPath 'Links' | Join-Path -ChildPath "$leaf.lnk"

    # Set-Shortcut -LinkPath 'C:\Users\<username>\Links\baz.lnk' -TargetPath 'c:\foo\bar\baz'
    Set-Shortcut -LinkPath $LinkPath -TargetPath $TargetPath

}

New-Alias al Add-Link