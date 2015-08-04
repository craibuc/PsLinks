<#
.DESCRIPTION
List all Window's Explorer links (all .LNK files in C:\Users\<user>\Links directory).

.EXAMPLE
Get-Links

.NOTES
None
#>
function  Get-Links {

    [CmdletBinding()]

    $LinkPath = Join-Path $env:USERPROFILE -ChildPath 'Links'

    $items = Get-ChildItem -Path $LinkPath #-Include '*.lnk'
    foreach ($item in $items) {
        Write-Host $item
    }
}

New-Alias ll Get-Links
