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
        [Parameter(Mandatory=$True,Position=1)]
        [string]$LinkPath, 

        [Parameter(Mandatory=$True,Position=2)]
        [string]$TargetPath, 

        [Parameter(Mandatory=$False,Position=3)]
        [string]$Arguments
    )

    BEGIN {
        $WshShell = New-Object -comObject WScript.Shell
        Write-Verbose $WshShell

        Write-Verbose "LinkPath: $LinkPath"
        Write-Verbose "TargetPath: $TargetPath"
        Write-Verbose "Arguments: $Arguments"
    }
    PROCESS {
        $Shortcut = $WshShell.CreateShortcut($LinkPath)
        $Shortcut.TargetPath = $TargetPath
        $Shortcut.Arguments = $Arguments
        $Shortcut.Save()
    }

}
