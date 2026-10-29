<#
Read-only verification helper for the Windows Server 2016 AD security lab.
Run from an elevated PowerShell session where appropriate.
This script does not change configuration.
#>

Write-Host "=== Identity ==="
hostname
whoami

Write-Host "`n=== Network ==="
ipconfig

Write-Host "`n=== Domain DNS ==="
nslookup ashraf.local

Write-Host "`n=== Domain Secure Channel ==="
nltest /sc_verify:ashraf.local

Write-Host "`n=== Shared Folder ACL ==="
if (Test-Path 'C:\SHARED') {
    Get-Acl 'C:\SHARED' | Format-List Owner,AccessToString
} else {
    Write-Warning 'C:\SHARED was not found on this system.'
}

Write-Host "`n=== MRKTG ACL ==="
if (Test-Path 'C:\SHARED\MRKTG') {
    Get-Acl 'C:\SHARED\MRKTG' | Format-List Owner,AccessToString
}

Write-Host "`n=== SALES.TXT ACL ==="
if (Test-Path 'C:\SHARED\MRKTG\SALES.TXT') {
    Get-Acl 'C:\SHARED\MRKTG\SALES.TXT' | Format-List Owner,AccessToString
}

Write-Host "`n=== SMB Share Check ==="
Get-SmbShare -Name SHARED -ErrorAction SilentlyContinue

Write-Host "`nVerification complete."
