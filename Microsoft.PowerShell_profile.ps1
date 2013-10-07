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
Set-Alias which "Get-Command"

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
