# for the editor
Set-Alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"

# for build-tools
Set-Alias build "C:\develop\infoprojects\powershell\scripts\Invoke-Build.ps1"
Set-Alias buildngo "C:\develop\infoprojects\powershell\scripts\Invoke-BuildDevelop.ps1"
Set-Alias forms "C:\develop\infoprojects\powershell\scripts\Invoke-Forms.ps1"
Set-Alias iprox "C:\develop\infoprojects\powershell\scripts\Invoke-StartServer.ps1"

# for F#
Set-Alias fsi "c:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\IDE\CommonExtensions\Microsoft\FSharp\fsi.exe"

# Environment variables
${env:artifact.dir} = "c:\develop\archive"
${env:StartServer_ServerOnly} = "true"

Function Bar {
  dotnet "C:\tools\TwijgIT.Bar\TwijgIT.Bar.dll" $args
}
