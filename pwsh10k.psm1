#requires -Version 2 -Modules posh-git
# Powerlevel10k theme for powershell! Used AgnosterPlus as the base and then turned it into this theme
function Write-Theme {
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    # path
    $sPath = "$(Get-FullPath -dir $pwd) "
    If ($sPath -eq "~ ") {
        $sPath = $sl.PromptSymbols.HomeIcon
        $sPath += " ~ "
    }
    # check for elevated prompt
    $sAdmin = ""
    If (Test-Administrator) {
        $sAdmin = "$($sl.PromptSymbols.ElevatedSymbol) ╱ "
    }

    # timestamp and battery level
    $BatteryLevel = (Get-CimInstance -ClassName Win32_battery).EstimatedChargeRemaining[0]
    $batterysymbol = ""
    If (($BatteryLevel -gt -1) -and ($BatteryLevel -lt 20)) {
        $batterysymbol = $sl.PromptSymbols.batteryzeroq
    } elseif (($BatteryLevel -gt 20) -and ($BatteryLevel -lt 40)) {
        $batterysymbol = $sl.PromptSymbols.batteryoneq
    } elseif (($BatteryLevel -gt 40) -and ($BatteryLevel -lt 60)) {
        $batterysymbol = $sl.PromptSymbols.batterytwoq
    } elseif (($BatteryLevel -gt 60) -and ($BatteryLevel -lt 80)) {
        $batterysymbol = $sl.PromptSymbols.batterythreeq
    } elseif (($batteryLevel -gt 80) -and ($BatteryLevel -lt 101)) {
        $batterysymbol = $sl.PromptSymbols.batteryfourq
    }
    $sTime = "$BatteryLevel "
    $sTime += $batterysymbol
    $sTime += " ╱ $(Get-Date -Format HH:mm:ss) "
    $sTime += $sl.PromptSymbols.clock

    # check the last command state and indicate if failed
    $sFailed = ""
    If ($lastCommandFailed) {
        $sFailed = "$($sl.PromptSymbols.FailedCommandSymbol) ╱ "
    }

    # virtualenv
    $sVenv = ""
    If (Test-VirtualEnv) {
        $sVenv = "$(Get-VirtualEnvName) ╱ "
    }

    # with
    $sWith = ""
    If ($with) {
        $sWith = "$($with.ToUpper()) ╱ "
    }
    # Right segment
    $rightPrompt = $sl.PromptSymbols.SegmentSlantBackward
    $rightPrompt += " $sFailed$sWith$sVenv$sAdmin$sTime "
    $rightPrompt += $sl.PromptSymbols.SegmentSlantForward
    $prompt = ""
    $prompt += Set-CursorForRightBlockWrite -textLength $rightPrompt.Length
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentSlantBackward -ForegroundColor DarkGray
    $prompt += Write-Prompt " " -BackgroundColor DarkGray
    $prompt += Write-Prompt -Object $sFailed -ForegroundColor $sl.Colors.CommandFailedIconForegroundColor -BackgroundColor DarkGray
    $prompt += Write-Prompt -Object $sWith   -ForegroundColor $sl.Colors.WithForegroundColor -BackgroundColor DarkGray

    $prompt += Write-Prompt -Object $sVenv   -ForegroundColor $sl.Colors.VirtualEnvForegroundColor -BackgroundColor DarkGray
    $prompt += Write-Prompt -Object $sAdmin  -ForegroundColor $sl.Colors.AdminIconForegroundColor -BackgroundColor DarkGray
    $prompt += Write-Prompt -Object $sTime   -ForegroundColor $sl.colors.TimestampForegroundColor -BackgroundColor DarkGray
    $prompt += Write-Prompt " " -BackgroundColor DarkGray
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentSlantForward -ForegroundColor DarkGray
    $prompt += Write-Prompt -Object "`r"

    $lastColor = $sl.Colors.PromptBackgroundColor
    $prompt += Write-Prompt  -ForegroundColor $sl.Colors.SessionInfoForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentSlantBackward -ForegroundColor $lastColor
    $prompt += Write-Prompt " " -BackgroundColor $lastColor
    $prompt += Write-Prompt -Object $sl.PromptSymbols.WindowsSymbol = [char]::ConvertFromUtf32(0xE0B0) -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $lastColor
    $prompt += Write-Prompt " " -BackgroundColor $lastColor
    $prompt += Write-Prompt "╱ " -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $lastColor
    $prompt += Write-Prompt -Object "$($sPath)" -ForegroundColor $sl.Colors.DriveForegroundColor -BackgroundColor $lastColor
    

    # git info
    $vcsStatus = Get-VCSStatus
    if ($vcsStatus) {
        $vcsInfo = Get-VcsInfo -status $vcsStatus
        $lastColor = $vcsInfo.BackgroundColor
        
        $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentSlantForward -ForegroundColor $sl.Colors.PromptBackgroundColor -BackgroundColor $lastColor

        if (!$sl.ColorizeVcInfoItems) {
            $prompt += Write-Prompt -Object " $($vcsInfo.VcInfo) " -ForegroundColor $sl.Colors.GitForegroundColor -BackgroundColor $lastColor
        }
        else {
            $settings = $global:GitPromptSettings

            # Get the GIT Status Items
            $prompt2 = ""
            if ($settings.DefaultPromptWriteStatusFirst) {
                $prompt2 += Write-Prompt $settings.PathStatusSeparator -BackgroundColor $lastColor
            }
    
            $prompt2 += Write-Prompt -Object " $($sl.GitSymbols.BranchSymbol) " -ForegroundColor $sl.Colors.GitForegroundColor -BackgroundColor $lastColor
            $prompt2 += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $lastColor -BackgroundColor $global:settings.BranchColor.BackgroundColor
    
            $prompt2 += Write-GitBranchName $vcsStatus
            $prompt2 += Write-GitBranchStatus $vcsStatus
            $prompt2 += Write-Prompt $settings.BeforeIndex
            if ($settings.EnableFileStatus) {
                if ($vcsStatus.HasIndex) {
                    $prompt2 += Write-GitIndexStatus $vcsStatus
                }
                
                if ($vcsStatus.HasWorking) {
                    $prompt2 += Write-Prompt $settings.DelimStatus.Text -ForegroundColor $sl.Colors.GitForegroundColor
                    $prompt2 += Write-GitWorkingDirStatus $vcsStatus
                }
            }
    
            $prompt2 += Write-GitWorkingDirStatusSummary $vcsStatus
    
            if ($settings.EnableStashStatus -and ($vcsStatus.StashCount -gt 0)) {
                $prompt2 += Write-GitStashCount $vcsStatus
            }
    
            # When status is first, place the separator after the status summary
            if (!$settings.DefaultPromptWriteStatusFirst) {
                $prompt2 += Write-Prompt $settings.PathStatusSeparator -BackgroundColor $lastColor
            }
    
            $prompt += Write-Prompt -Object $prompt2 -BackgroundColor $lastColor
        }
    }
    # Self explanatory
    If ($sl.DoubleCommandLine) {
        $prompt += Set-Newline
    }

    # Writes the postfixes to the prompt
    $indicatorColor = If ($lastCommandFailed) { $sl.Colors.CommandFailedIconForegroundColor } Else { $lastColor }
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentSlantForward -ForegroundColor $indicatorColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    $prompt += ' '
    # $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol
    $prompt
}

$sl = $global:ThemeSettings #local settings

# All of the special icons
$sl.PromptSymbols.WindowsSymbol = [char]::ConvertFromUtf32(0xF17A)
$sl.PromptSymbols.HomeIcon = [char]::ConvertFromUtf32(0xF015)
$sl.PromptSymbols.SegmentSlantForward = [char]::ConvertFromUtf32(0xE0BC)
$sl.PromptSymbols.SegmentSlantBackward = [char]::ConvertFromUtf32(0xE0BA)
$sl.PromptSymbols.batteryzeroq = [char]::ConvertFromUtf32(0xF244)
$sl.PromptSymbols.batteryoneq = [char]::ConvertFromUtf32(0xF243)
$sl.PromptSymbols.batterytwoq = [char]::ConvertFromUtf32(0xF242)
$sl.PromptSymbols.batterythreeq = [char]::ConvertFromUtf32(0xF241)
$sl.PromptSymbols.batteryfourq = [char]::ConvertFromUtf32(0xF240)
$sl.PromptSymbols.clock = [char]::ConvertFromUtf32(0xF017)
$sl.Colors.DriveForegroundColor = [ConsoleColor]::Cyan
$sl.Colors.GitDefaultColor = [ConsoleColor]::DarkGreen
$sl.Colors.GitLocalChangesColor = [ConsoleColor]::DarkYellow
$sl.Colors.GitNoLocalChangesAndAheadAndBehindColor = [ConsoleColor]::DarkRed
$sl.Colors.GitNoLocalChangesAndAheadColor = [ConsoleColor]::DarkMagenta
$sl.Colors.GitNoLocalChangesAndBehindColor = [ConsoleColor]::DarkRed
$sl.Colors.PromptHighlightColor = [ConsoleColor]::DarkBlue
$sl.Colors.PromptSymbolColor = [ConsoleColor]::White
$sl.Colors.SessionInfoBackgroundColor = [ConsoleColor]::Black
$sl.Colors.SessionInfoForegroundColor = [ConsoleColor]::White
$sl.Colors.WithBackgroundColor = [ConsoleColor]::DarkRed
$sl.Colors.VirtualEnvBackgroundColor = [ConsoleColor]::Red

$sl.Colors.PromptForegroundColor = [ConsoleColor]::White
$sl.Colors.WithForegroundColor = [ConsoleColor]::White
$sl.Colors.VirtualEnvForegroundColor = [System.ConsoleColor]::White
$sl.Colors.TimestampForegroundColor = [ConsoleColor]::DarkCyan
$sl.Colors.CommandFailedIconForegroundColor = [ConsoleColor]::DarkRed
$sl.Colors.PromptBackgroundColor = [ConsoleColor]::DarkGray

if ($sl.ColorizeVcInfoItems) {
    $sl.Colors.GitForegroundColor = [ConsoleColor]::Black
    $sl.Colors.AdminIconForegroundColor = [ConsoleColor]::White
}
else {
    $sl.Colors.GitForegroundColor = [ConsoleColor]::Cyan
    $sl.Colors.AdminIconForegroundColor = [ConsoleColor]::DarkYellow
}

$global:GitPromptSettings.EnableStashStatus = $true

$sl | Add-Member -NotePropertyName DoubleCommandLine -NotePropertyValue 0 -Force
$sl | Add-Member -NotePropertyName ColorizeVcInfoItems -NotePropertyValue 0 -Force