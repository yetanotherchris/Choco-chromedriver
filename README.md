# Choco-chromedriver-latest
Chocolatey package that downloads and installs the latest Chromedriver

https://chocolatey.org/packages/chromedriver-latest

### Creating or updating the new package

    choco new packagename # creates the boiler plate nuspec, ps1 files
    (edit the nuspec and ps1 files)
    choco install .\chromedriver-latest\chromedriver-latest.nuspec
    choco push .\chromedriver-latest.1.0.xyz.nupkg  --api-key={apikey}
