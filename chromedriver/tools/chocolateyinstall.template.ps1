$ErrorActionPreference = "Stop";

$packageName = "chromedriver"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checkSum = "{CHECKSUM}"
$chromedriverVersion = "{VERSION}"
$desiredPlatform = "win32"

# Use the new google API
# URL to fetch JSON content from
$jsonUrl = "https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json"
# Fetch the JSON content from the URL
$jsonContent = Invoke-RestMethod -Uri $jsonUrl
# Find the desired versioninfo
$desiredVersionInfo = $jsonContent.versions | Where-Object { $_.version -eq $chromedriverVersion }

# Find the Chromedriver download URL for the desired platform
$chromedriverUrl = $desiredVersionInfo.downloads.$packageName | 
    Where-Object { $_.platform -eq $desiredPlatform } | 
    Select-Object -ExpandProperty url

Install-ChocolateyZipPackage "packageName" -url "$chromedriverUrl" -unzipLocation "$toolsDir" -checksumType "sha256" -checksum "$checkSum"
