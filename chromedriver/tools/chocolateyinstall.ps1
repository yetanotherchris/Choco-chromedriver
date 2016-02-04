$ErrorActionPreference = 'Stop';

$packageName = 'chromedriver'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$chromedriverVersion = (wget -UseBasicParsing http://chromedriver.storage.googleapis.com/LATEST_RELEASE).Content
$url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_win32.zip"

Install-ChocolateyZipPackage $packageName $url $toolsDir
