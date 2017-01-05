$ErrorActionPreference = "Stop";

$packageName = "chromedriver"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checkSum = "{CHECKSUM}"

# The latest version number can be found at http://chromedriver.storage.googleapis.com/LATEST_RELEASE
$chromedriverVersion = "{VERSION}"
$url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_win32.zip"

Install-ChocolateyZipPackage "packageName" -url "$url" -unzipLocation "$toolsDir" -checksumType "sha256" -checksum "$checkSum"
