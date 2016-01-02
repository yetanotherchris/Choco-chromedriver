# Choco-chromedriver
Chocolatey package that downloads and installs the latest Chromedriver

https://chocolatey.org/packages/chromedriver

### Creating or updating the new package

	# creates the boiler plate nuspec, ps1 files
    choco new packagename 
    # Now edit the nuspec and ps1 files
    choco pack .\chromedriver\chromedriver.nuspec

    # Test it works
    choco install .\chromedriver.1.0.0.nupkg
    choco uninstall chromedriver

    # Publish on Chocolatey.org
    choco push .\chromedriver.1.0.0.nupkg --api-key={apikey}
