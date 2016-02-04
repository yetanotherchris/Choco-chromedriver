$ErrorActionPreference = 'Stop';

$packageName = 'chromedriver'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$webClient = New-Object System.Net.WebClient
$chromedriverVersion = $webClient.DownloadString("http://chromedriver.storage.googleapis.com/LATEST_RELEASE").Trim()
$url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_win32.zip"

Install-ChocolateyZipPackage $packageName $url $toolsDir
