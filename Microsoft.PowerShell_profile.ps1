# Load posh-git module from current directory
Import-Module C:\development\utils\posh-git\posh-git.psm1

# add paths
Set-Content Env:Path "$Env:Path;$(gc 'env:ProgramFiles(x86)')\git\bin;C:\development\intern\powershell\scripts\"

# set project-path
$env:LocalProjects = "C:\development\projects"
$env:DefaultServer = "IP-ONTW05"

# some aliasses
Set-Alias build "C:\development\intern\powershell\scripts\Invoke-Build.ps1"
Set-Alias buildngo "C:\development\intern\powershell\scripts\Invoke-BuildDevelop.ps1"
Set-Alias fsi "c:\Program Files (x86)\Microsoft SDKs\F#\3.0\Framework\v4.0\fsi.exe"
Set-Alias goto "C:\development\intern\powershell\scripts\Open-Project.ps1"
Set-Alias gvim "C:\Program Files (x86)\Vim\vim74\gvim.exe"
Set-Alias iprox "C:\development\intern\powershell\scripts\Invoke-StartServer.ps1"
Set-Alias subl "C:\Program Files\Sublime Text 2\sublime_text.exe"
Set-Alias sudo "C:\development\intern\powershell\scripts\Sudo.ps1"
Set-Alias vim "C:\Program Files (x86)\Vim\vim74\gvim.exe"
Set-Alias which "Get-Command"

# a simple prompt for powershell (with use of Posh-Git)
Function prompt {
  $realLASTEXITCODE = $LASTEXITCODE
  $host.UI.RawUI.WindowTitle = Get-Location

  Write-Host ((Get-Location).Drive.Name.ToLowerInvariant() + ":" + (gi $pwd).Name) -NoNewLine
  Write-VcsStatus

  $global:LASTEXITCODE = $realLASTEXITCODE
  " $ "
}

# with this command, your editor ('gvim') will start with this file
Function profile {
  subl $profile
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

# posh-git
Enable-GitColors
Pop-Location
Start-SshAgent -Quiet
