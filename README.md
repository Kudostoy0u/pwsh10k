# Pwsh10k - A powershell theme based off of Powerlevel10k


![PWSH10k PREVIEW](https://storage.googleapis.com/replit/images/1612640247356_32bc32bef8fece01d93f1565b52abf53.png)<space><space>
Preview
 
![badge](https://img.shields.io/github/issues/Kudostoy0u/pwsh10k)
![badge](https://img.shields.io/github/forks/Kudostoy0u/pwsh10k)
![badge](https://img.shields.io/github/stars/Kudostoy0u/pwsh10k)<space><space>
 
## Steps

1. [Configure MesloLGS NF for your terminal](https://github.com/romkatv/powerlevel10k#manual-font-installation)

2. Install `oh-my-posh` - `Install-Module posh-git -Scope CurrentUser`, `Install-Module oh-my-posh -Scope CurrentUser`, and `Update-Module -Name oh-my-posh -AllowPrerelease -Scope CurrentUser`

3. Create a powershell profile if you haven't already: `New-Item -ItemType File -Path $PROFILE`

4. Open up the file `$profile` in your text editor of choice (VScode: `code $profile`, Notepad: `notepad $profile`)

5. Add these lines: 

```powershell
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme  ~/pwsh10k.omp.json
```
## Installation steps

1. Run `git clone https://github.com/Kudostoy0u/pwsh10k`

2. Run `Copy-Item -Path pwsh10k/pwsh10k.omp.json -Destination $HOME`

3. Restart terminal and you should see a pretty prompt!

## Customize my theme

Fork the project, edit the `pwsh10k.omp.json` file as you see fit, and run the installation instructions, replacing the link in the first step with your own repo.
