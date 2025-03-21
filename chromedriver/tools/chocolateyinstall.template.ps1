$ErrorActionPreference = "Stop";

$packageName = "chromedriver"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checkSum32 = "{CHECKSUM32}"
$checkSum64 = "{CHECKSUM64}"
$chromedriverVersion = "{VERSION}"
$win32Platform = "win32"
$win64Platform = "win64"

# Use the new google API
# URL to fetch JSON content from
$jsonUrl = "https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json"

# Fetch the JSON content from the URL
$jsonContent = Invoke-RestMethod -Uri $jsonUrl

# Find the desired download links
$desiredVersionInfo = ($jsonContent.versions | Where-Object { $_.version -eq $chromedriverVersion }).downloads.$packageName

# Find the Chromedriver download URL for the desired platforms
$win32Url = $desiredVersionInfo | Where-Object { $_.platform -eq $win32Platform } | Select-Object -ExpandProperty url
$win64Url = $desiredVersionInfo | Where-Object { $_.platform -eq $win64Platform } | Select-Object -ExpandProperty url

Install-ChocolateyZipPackage "packageName" `
    -Url "$win32Url" `
    -Url64bit "$win64Url" `
    -UnzipLocation "$toolsDir" `
    -ChecksumType "sha256" `
    -Checksum "$checkSum32" `
    -ChecksumType64 "sha256" `
    -Checksum64 "$checkSum64"
