$ErrorActionPreference = "Stop";

$packageName = "chromedriver"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checkSum = "128F4EA29870D5F7C1235403E2DEED13DC0903A7"

# The latest version number can be found at http://chromedriver.storage.googleapis.com/LATEST_RELEASE
$chromedriverVersion = "2.23"
$url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_win32.zip"

Install-ChocolateyZipPackage "packageName" -url "$url" -unzipLocation "$toolsDir" -checksumType "sha1" -checksum "$checkSum"