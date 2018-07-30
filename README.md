[![Build status](https://ci.appveyor.com/api/projects/status/c8sb6egibl30iaya?svg=true)](https://ci.appveyor.com/project/yetanotherchris/choco-chromedriver)

# Choco-chromedriver

> Developed in collaboration with the Chromium team, ChromeDriver is a standalone server which implements WebDriver's wire protocol.
> https://chocolatey.org/packages/chromedriver

This Chocolatey package downloads and installs the latest Chromedriver.

This repository does everything by magic via Appveyor, the only part that needs manual intervention is updating the `CHROMEDRIVER_VERSION_NUMBER` variable in the `appveyor.yml` file.

### Updating

The page https://chromedriver.storage.googleapis.com/LATEST_RELEASE is watched via https://www.followthatpage.com/.

When a new version is released, `CHROMEDRIVER_VERSION_NUMBER: 2.xxx` inside `appveyor.yml` is updated.
