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

    [CmdletBinding()]
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
