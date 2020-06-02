[![Build status](https://ci.appveyor.com/api/projects/status/c8sb6egibl30iaya?svg=true)](https://ci.appveyor.com/project/yetanotherchris/choco-chromedriver)

# Choco-chromedriver

> Developed in collaboration with the Chromium team, ChromeDriver is a standalone server which implements WebDriver's wire protocol.
> https://chocolatey.org/packages/chromedriver

This Chocolatey package downloads and installs the latest Chromedriver.

This repository does everything by magic via Appveyor, the only part that needs manual intervention is updating the `CHROMEDRIVER_VERSION_NUMBER` variable in the `appveyor.yml` file.

### Updating

A [Github action](https://github.com/yetanotherchris/Choco-chromedriver/blob/master/.github/workflows/main.yml#L9) checks http://chromedriver.chromium.org/ every four hours. If the version there doesn't match the one in appveyor.yml, appveyor.yml is updated which triggers a new Chocolatey package.
