# Pwsh10k - A powershell theme based off of Powerlevel10k


![PWSH10K PREVIEW](https://user-images.githubusercontent.com/69732000/146661494-f046ca6c-824a-4acd-8d04-c97de085f78d.gif)
 
![badge](https://img.shields.io/github/issues/Kudostoy0u/pwsh10k)
![badge](https://img.shields.io/github/forks/Kudostoy0u/pwsh10k)
![badge](https://img.shields.io/github/stars/Kudostoy0u/pwsh10k)<space><space>
 
## Steps

1. [Install and configure a compatible font](https://github.com/romkatv/powerlevel10k#manual-font-installation)

2. (Windows users only) Allow all powershell scripts to be run (Note: This will prevent Powershell from stopping you from running (potentially harmful) scripts) - `Set-ExecutionPolicy -Scope "CurrentUser" -ExecutionPolicy "Unrestricted"`
 
3. Install `posh-git` - `Install-Module posh-git -Scope CurrentUser`
 
4. Install `oh-my-posh` - `winget install JanDeDobbeleer.OhMyPosh -s winget`.
(Note: if you've previously installed `oh-my-posh` using the powershell module, [you will need to migrate](https://ohmyposh.dev/docs/migrating))

5. Open up the file `$profile` in your text editor of choice (VScode: `code $profile`, Notepad: `notepad $profile`)

6. Add these lines: 
 
```powershell
Import-Module posh-git
oh-my-posh init pwsh --config ~/pwsh10k.omp.json | Invoke-Expression
```
 
1. Run `curl https://raw.githubusercontent.com/Kudostoy0u/pwsh10k/master/pwsh10k.omp.json --output pwsh10k.omp.json` (Windows users replace `curl` with `curl.exe`)
 
1. Run `Copy-Item -Path pwsh10k.omp.json -Destination $HOME`

1. Restart terminal and you should see a pretty prompt!

## Customize my theme

Edit `pwsh10k.omp.json` (Notepad: `notepad ~/pwsh10k.omp.json`, VScode: `code ~/pwsh10k.omp.json`) and change as you see fit ([how to configure a theme?](https://ohmyposh.dev/docs/configuration/general))
