param(
	[Parameter(Mandatory=$true)]
	[String]
	$apiKey,
	[Parameter(Mandatory=$true)]
	[String]
	$versionNumber,
	[Parameter(Mandatory=$false)]
	[String]
	$chocoMinorVersionNumber
)

$ErrorActionPreference = "Stop"
$win32Platform = "win32"
$win64Platform = "win64"
$win32Filename = "chromedriver_win32.zip"
$win64Filename = "chromedriver_win64.zip"

Push-Location ./chromedriver/tools

# Download the version
# URL of the JSON file
$jsonUrl = "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json"

# Fetch JSON content
$jsonContent = Invoke-RestMethod -Uri $jsonUrl -DisableKeepAlive
$url32 = $jsonContent.channels.Stable.downloads.chromedriver | Where-Object { $_.platform -eq $win32Platform } | Select-Object -ExpandProperty url
$url64 = $jsonContent.channels.Stable.downloads.chromedriver | Where-Object { $_.platform -eq $win64Platform } | Select-Object -ExpandProperty url

Get-ChildItem
Write-Host "Downloading $url32"
Invoke-WebRequest "$url32" -OutFile "$win32Filename"
Get-ChildItem

# Get its checksum
$hash32 = Get-FileHash "$win32Filename"
$hash32 = $hash32.Hash
Write-Host "Hash is: $hash32"
Remove-Item "$win32Filename"

Write-Host "Downloading $url64"
Invoke-WebRequest "$url64" -OutFile "$win64Filename"
Get-ChildItem

# Get its checksum
$hash64 = Get-FileHash "$win64Filename"
$hash64 = $hash64.Hash
Write-Host "Hash is: $hash64"
Remove-Item "$win64Filename"

# Replace the checksum and version in the chocolateyinstall.ps1 file
$currentDir = Get-Location
$content = [IO.File]::ReadAllText("$pwd\chocolateyinstall.template.ps1")
$content = $content.Replace("{CHECKSUM32}", $hash32)
$content = $content.Replace("{CHECKSUM64}", $hash64)
$content = $content.Replace("{VERSION}", $versionNumber)

[IO.File]::WriteAllText("$currentDir\chocolateyinstall.ps1", $content)
Remove-Item "$currentDir\chocolateyinstall.template.ps1"

# Push to chocolatey.org
Pop-Location
Push-Location ./chromedriver/
Remove-Item *.nupkg
choco pack chromedriver.nuspec --version $versionNumber$chocoMinorVersionNumber
choco push --api-key=$apiKey
Pop-Location
