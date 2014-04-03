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
Set-Alias fsi "c:\Program Files (x86)\Microsoft SDKs\F#\3.1\Framework\v4.0\fsi.exe"
Set-Alias fsx "c:\Program Files (x86)\Microsoft SDKs\F#\3.1\Framework\v4.0\fsi.exe"
Set-Alias goto "C:\development\intern\powershell\scripts\Open-Project.ps1"
Set-Alias gt goto
Set-Alias gvim_exe "C:\Program Files (x86)\Vim\vim74\gvim.exe"
Set-Alias run "C:\development\intern\powershell\scripts\Invoke-StartServer.ps1"
Set-Alias ll "Get-ChildItem"
Set-Alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"
Set-Alias sudo "C:\development\intern\powershell\scripts\Sudo.ps1"
Set-Alias tc_exe "c:\totalcmd\TOTALCMD64.EXE"
Set-Alias vim gvim
Set-Alias which "Get-Command"

Function tc {
  if($args) {
    $resolved = resolve-path $args
    tc_exe "/o" $resolved
  }
  else {
    tc_exe "/o"
  }
}

Function gvim {
  if($args) {
    gvim_exe --remote-silent $args
  }
  else {
    gvim_exe
  }
}

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
  sudo "C:\Program Files (x86)\Vim\vim74\gvim.exe" "C:\Windows\System32\drivers\etc\hosts"
}

# gets the powershell version
Function version {
  $host.version
}

# posh-git
Enable-GitColors
Pop-Location
Start-SshAgent -Quiet
