# Pwsh10k - Oh-my-posh theme for my favorite configuration of Powerlevel10k
![badge](https://img.shields.io/github/issues/Kudostoy0u/pwsh10k)
![badge](https://img.shields.io/github/forks/Kudostoy0u/pwsh10k)
![badge](https://img.shields.io/github/stars/Kudostoy0u/pwsh10k)<space><space>
<br>
![PWSH10k PREVIEW](https://storage.googleapis.com/replit/images/1612640247356_32bc32bef8fece01d93f1565b52abf53.png)<space><space>

Preview

* I would like to note that this is for Windows, anyone on Unix who wants this just create a pull request asking.

* This is Oh-my-posh version 3 beta

* There's a bug for Oh-My-Posh: Working in git repositories can be a little laggy

## Prerequisites

1. Windows Terminal ([How to install](https://docs.microsoft.com/en-us/windows/terminal/get-started "Install Windows Terminal"))

2. (Optional but recommended) Update to Powershell core 7 if not already ([Update!](https://docs.microsoft.com/en-us/powershell/scripting/install/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.1))

3. Download the MesloLGS NF font:
Download these four ttf files:

* [MesloLGS NF Regular.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf)

* [MesloLGS NF Bold.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold.ttf)

* [MesloLGS NF Italic.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Italic.ttf)

* [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold%20Italic.ttf)

Double-click on each file and press "Install". This will make MesloLGS NF font available to all applications on your system. Configure your Windows Terminal to use this font:
Open Settings  `(Ctrl+,)`, search for fontFace and set value to MesloLGS NF for every profile.

4. Run `Install-Module posh-git -Scope CurrentUser`, `Install-Module oh-my-posh -Scope CurrentUser`, and `Update-Module -Name oh-my-posh -AllowPrerelease -Scope CurrentUser`

5. Create a powershell profile if you haven't already: `New-Item -ItemType File -Path $PROFILE`

6. Open up the file `$profile` in your text editor of choice (VScode: `code $profile`, Notepad: `notepad $profile`)

7. Add these lines: 

```powershell
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme  ~/pwsh10k.omp.json
```
## Installation steps

1. Run `git clone https://github.com/Kudostoy0u/pwsh10k`

2. Run `cd pwsh10k`

3. Run `.\install.ps1`

4. Restart terminal and you should see a pretty prompt!

## Use the correct font for VScode integrated terminal

* Visual Studio Code: Open File → Preferences → Settings, enter terminal.integrated.fontFamily in the search box and set the value to MesloLGS NF
