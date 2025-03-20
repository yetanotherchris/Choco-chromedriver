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

pushd ./chromedriver/tools

# Download the version
# URL of the JSON file
$jsonUrl = "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json"

# Fetch JSON content
$jsonContent = Invoke-RestMethod -Uri $jsonUrl
$url32 = $jsonContent.channels.Stable.downloads.chromedriver | Where-Object { $_.platform -eq $win32Platform } | Select-Object -ExpandProperty url
$url64 = $jsonContent.channels.Stable.downloads.chromedriver | Where-Object { $_.platform -eq $win64Platform } | Select-Object -ExpandProperty url

Write-Host "Downloading $url32"
wget "$url32" -OutFile chromedriver_win32.zip

# Get its checksum
$hash32 = Get-FileHash chromedriver_win32.zip
$hash32 = $hash32.Hash
Write-Host "Hash is: $hash32"
rm chromedriver_win32.zip

Write-Host "Downloading $url64"
wget "$url64" -OutFile chromedriver_win64.zip

# Get its checksum
$hash64 = Get-FileHash chromedriver_win64.zip
$hash64 = $hash64.Hash
Write-Host "Hash is: $hash64"
rm chromedriver_win64.zip

# Replace the checksum and version in the chocolateyinstall.ps1 file
$pwd = pwd
$content = [IO.File]::ReadAllText("$pwd\chocolateyinstall.template.ps1")
$content = $content.Replace("{CHECKSUM32}", $hash32)
$content = $content.Replace("{CHECKSUM64}", $hash64)
$content = $content.Replace("{VERSION}", $versionNumber)

[IO.File]::WriteAllText("$pwd\chocolateyinstall.ps1", $content)
rm "$pwd\chocolateyinstall.template.ps1"

# Push to chocolatey.org
popd
pushd ./chromedriver/
rm *.nupkg
choco pack chromedriver.nuspec --version $versionNumber$chocoMinorVersionNumber
choco push --api-key=$apiKey
popd
