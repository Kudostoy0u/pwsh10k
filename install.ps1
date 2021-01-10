# C:\Users\kudos\Documents\PowerShell\Modules\oh-my-posh\2.0.492\Themes\powerlevel.psm1
$versionpath = "PowerShell"
if (!((Get-Host | Select-Object Version).Version.Major -eq 7)) {
$versionpath = "WindowsPowerShell"
Write-Host "Why aren't you on Powershell 7? This may or may not work."
}
Move-Item -Path ./pwsh10k.psm1 -Destination ~/Documents/$versionpath/Modules/oh-my-posh/*/Themes/pwsh10k.psm1