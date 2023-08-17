$ErrorActionPreference = "Stop";

$packageName = "chromedriver"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checkSum = "{CHECKSUM}"
$chromedriverVersion = "{VERSION}"
$desiredPlatform = "win32"

$desiredVersionParsed = [version]$chromedriverVersion
$firstNewApiVersion = [version]"115.0.5763.0" # for now the first version which shows chromedriver download urls 
# check if we need to use the old style fetch or the new api
if ($desiredVersionParsed -lt $firstNewApiVersion) {
  # The latest version number for the old api can be found at http://chromedriver.storage.googleapis.com/LATEST_RELEASE
  $chromedriverVersion = "{VERSION}"
  $url = "https://chromedriver.storage.googleapis.com/$chromedriverVersion/chromedriver_$desiredPlatform.zip"
  Install-ChocolateyZipPackage "packageName" -url "$url" -unzipLocation "$toolsDir" -checksumType "sha256" -checksum "$checkSum"
} else {
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
}
