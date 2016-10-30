$ErrorActionPreference = "Stop";

# http://onlinemd5.com/ to generate the SHA1
$packageName = "chromedriver"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checkSum = "D0B6BE10D4FFCE4CE338D0E31AA71F80A95B4C14"

# The latest version number can be found at http://chromedriver.storage.googleapis.com/LATEST_RELEASE
$chromedriverVersion = "2.25"
$url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_win32.zip"

Install-ChocolateyZipPackage "packageName" -url "$url" -unzipLocation "$toolsDir" -checksumType "sha1" -checksum "$checkSum"