$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'chromedriver-latest' # arbitrary name for the package, used in messages
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$chromedriverVersion = (wget http://chromedriver.storage.googleapis.com/LATEST_RELEASE).Content
$url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_win32.zip"
$url64 = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64
}

Install-ChocolateyZipPackage $packageName $url $toolsDir