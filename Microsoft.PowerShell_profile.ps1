Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module C:\tools\poshgit\dahlbyk-posh-git-e415a03\posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
  $realLASTEXITCODE = $LASTEXITCODE

  Write-Host($pwd.ProviderPath) -nonewline
  Write-VcsStatus
  Write-Host

  $global:LASTEXITCODE = $realLASTEXITCODE
  return "$ "
}

Function gvim {
  if($args) {
    gvim_exe --remote-silent $args
  }
  else {
    gvim_exe
  }
}

Pop-Location
Start-SshAgent -Quiet

# some aliasses for the shell
Set-Alias ll "Get-ChildItem"
Set-Alias which "Get-Command"

# for the editor
Set-Alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"
Set-Alias gvim_exe "c:\Program Files\Vim\vim80\gvim.exe"
Set-Alias vim gvim

# for build-tools
Set-Alias build "C:\develop\infoprojects\powershell\scripts\Invoke-Build.ps1"
Set-Alias buildngo "C:\develop\infoprojects\powershell\scripts\Invoke-BuildDevelop.ps1"
Set-Alias forms "C:\develop\infoprojects\powershell\scripts\Invoke-Forms.ps1"
Set-Alias iprox "C:\develop\infoprojects\powershell\scripts\Invoke-StartServer.ps1"
Set-Alias sudo "C:\develop\infoprojects\powershell\scripts\Sudo.ps1"

# for F#
Set-Alias fsi "C:\Program Files (x86)\Microsoft SDKs\F#\4.1\Framework\v4.0\fsi.exe"

# Environment variables
${env:artifact.dir} = "c:\develop\archive"
