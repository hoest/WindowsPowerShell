# profile folder
$profileFolder = split-path $profile

# save last 100 history items on exit; with the 'exit' command
$historyPath = Join-Path $profileFolder "ps_history.xml"

# hook powershell's exiting event and hide the registration with -supportevent.
Register-EngineEvent -SourceIdentifier powershell.exiting -SupportEvent -Action {
  Get-History -Count 100 | Export-Clixml (Join-Path $profileFolder "ps_history.xml") }

# load previous history, if it exists
if((Test-Path $historyPath)) {
  Import-Clixml $historyPath | ? { $count++; $true } | Add-History
  Write-Host -Fore Green "Loaded $count history item(s).`n"
}

# add paths
Set-Content Env:Path "$Env:Path;C:\Users\jelle\Dropbox\InfoProjects\Workspace\powershell\scripts\"

# some aliasses
Set-Alias vim "C:\Program Files (x86)\Vim\vim73\gvim.exe"
Set-Alias gvim "C:\Program Files (x86)\Vim\vim73\gvim.exe"
Set-Alias subl "C:\Program Files\Sublime Text 2\sublime_text.exe"
Set-Alias build "C:\Users\jelle\Dropbox\InfoProjects\Workspace\powershell\scripts\Invoke-Build.ps1"
Set-Alias buildngo "C:\Users\jelle\Dropbox\InfoProjects\Workspace\powershell\scripts\Invoke-BuildDevelop.ps1"
Set-Alias sudo "C:\Users\jelle\Dropbox\InfoProjects\Workspace\powershell\scripts\Sudo.ps1"
Set-Alias fsi "C:\Program Files (x86)\FSharp-2.0.0.0\bin\fsi.exe"

# a simple prompt for powershell
Function prompt {
  $host.UI.RawUI.WindowTitle = Get-Location; "$ "
}

# with this command, your editor ('gvim') will start with this file
Function profile {
  gvim $profile
}

# with this command, your editor ('gvim') will start with the hostsfile
# you need to run it from an elevated powershell
Function hostsfile {
  sudo gvim "C:\Windows\System32\drivers\etc\hosts"
}

# gets the powershell version
Function version {
  $host.version
}
