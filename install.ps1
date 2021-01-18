if (!((Get-Host | Select-Object Version).Version.Major -eq 7)) {
Write-Host "I told you to use PowerShell 7 -_-. Fine, I'll give you a pass."
}
Copy-Item -Path pwsh10k.omp.json -Destination $HOME
