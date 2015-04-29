<#
.DESCRIPTION
Creates a shortcut to target (file or directory).

.PARAMETER LinkPath
path/to/file/or/directory

.PARAMETER TargetPath
path/to/file/or/directory

.PARAMETER Arguments
values to be passed to TargetPath (.EXE)

.EXAMPLE
Set-Shortcut 'C:\Users\<user>\Desktop\baz.lnk' c:\foo\bar\baz'

.NOTES
None
#>
function Set-Shortcut {

    param ( 
        [string]$LinkPath, 
        [string]$TargetPath, 
        [string]$Arguments
    )

    $WshShell = New-Object -comObject WScript.Shell

    $Shortcut = $WshShell.CreateShortcut($LinkPath)
    $Shortcut.TargetPath = $TargetPath
    $Shortcut.Arguments = $Arguments
    $Shortcut.Save()

}

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

    param([string]$TargetPath)

    # c:\foo\bar\baz -> baz
    $leaf = Split-Path $TargetPath -Leaf
    Write-Debug $leaf

    # C:\Users\<username>\Links\baz.lnk
    $LinkPath = Join-Path $env:USERPROFILE -ChildPath 'Links' | Join-Path -ChildPath "$leaf.lnk"
    Write-Debug $LinkPath

    # Set-Shortcut -LinkPath 'C:\Users\<username>\Links\baz.lnk' -TargetPath 'c:\foo\bar\baz'
    Set-Shortcut -LinkPath $LinkPath -TargetPath $TargetPath

}

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
    param([string]$Link)

    $LinkPath = Join-Path $env:USERPROFILE -ChildPath 'Links' | Join-Path -ChildPath "$Link.lnk"
    Write-Debug $LinkPath
    rm $LinkPath
}

<#
.DESCRIPTION
List all Window's Explorer links (all .LNK files in C:\Users\<user>\Links directory).

.EXAMPLE
List-Links

.NOTES
None
#>
function  List-Links {

    $LinkPath = Join-Path $env:USERPROFILE -ChildPath 'Links'

    $items = Get-ChildItem -Path $LinkPath #-Include '*.lnk'
    foreach ($item in $items) {
        Write-Host $item
    }
}

New-Alias al Add-Link
New-Alias rl Remove-Link
New-Alias ll List-Links