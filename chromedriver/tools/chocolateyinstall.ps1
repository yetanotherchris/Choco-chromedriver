$ErrorActionPreference = "Stop";

$packageName = "chromedriver"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checkSum = "2EE59A8047EC345F886D5B90656DBEA1469B7E44"

# The latest version number can be found at http://chromedriver.storage.googleapis.com/LATEST_RELEASE
$chromedriverVersion = "2.21"
$url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_win32.zip"

Install-ChocolateyZipPackage "packageName" -url "$url" -unzipLocation "$toolsDir" -checksumType "sha1" -checksum "$checkSum"