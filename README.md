# An Oh-My-Posh theme for those who want Powerlevel10k theme on Powershell

## Preview

![Pwsh10k preview](https://i.ibb.co/DGGY219/pwsh10k.png)

## Prerequisites

1. Windows Terminal ([How to install](https://docs.microsoft.com/en-us/windows/terminal/get-started "Install Windows Terminal"))

2. Download the MesloLGS NF font:
Download these four ttf files:
[MesloLGS NF Regular.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf)
<br>
[MesloLGS NF Bold.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold.ttf)
<br>
[MesloLGS NF Italic.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Italic.ttf)
<br>
[MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold%20Italic.ttf)
<br>
Double-click on each file and press "Install". This will make MesloLGS NF font available to all applications on your system. Configure your Windows Terminal to use this font:
Open Settings  `(Ctrl+,)`, search for fontFace and set value to MesloLGS NF for every profile.

3. Run `Install-Module posh-git -Scope CurrentUser` and `Install-Module oh-my-posh -Scope CurrentUser`

4. Create a powershell profile if you haven't already: `New-Item -ItemType File -Path $PROFILE`

5. Open up the file `$profile` in your text editor of choice (VScode: `code $profile`, Notepad: `notepad $profile`)

6. Add these lines: 

```powershell
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme pwsh10k
```

## Installation steps

1. Run `git clone https://github.com/Kudostoy0u/pwsh10k`

2. Run `cd pwsh10k`

3. Run `.\install.ps1`

4. Restart terminal and you should see a great terminal!

## Use the correct font for VScode integrated terminal

* Visual Studio Code: Open File → Preferences → Settings, enter terminal.integrated.fontFamily in the search box and set the value to MesloLGS NF
