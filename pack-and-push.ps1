# When a new Chromedriver appears:
# 1. Update the nuspec file with the version number
# 2. Update chocolateyinstall.ps1 with the version number
# 3. Update chocolateyinstall.ps1 with the new SHA1 for the zip file.

del *.nupkg

Write-Host "Packing..." -ForegroundColor Green
choco pack .\chromedriver\chromedriver.nuspec

Write-Host "Pushing..." -ForegroundColor Green
$apiKey  = Read-Host "What is your API key?"
choco push --api-key=$apiKey