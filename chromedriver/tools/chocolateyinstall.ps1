$ErrorActionPreference = 'Stop';

$packageName = 'chromedriver'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$chromedriverVersion = (wget http://chromedriver.storage.googleapis.com/LATEST_RELEASE).Content
$url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_win32.zip"
$url64 = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
}

Install-ChocolateyZipPackage $packageName $url $toolsDir