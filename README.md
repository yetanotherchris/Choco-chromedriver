[![CI status](https://github.com/yetanotherchris/Choco-chromedriver/actions/workflows/check-version-and-push.yml/badge.svg)](https://github.com/yetanotherchris/Choco-chromedriver/actions/workflows/check-version-and-push.yml)

# Choco-chromedriver

> Developed in collaboration with the Chromium team, ChromeDriver is a standalone server which implements WebDriver's wire protocol.
> https://chocolatey.org/packages/chromedriver

This Chocolatey package downloads and installs the latest Chromedriver.

This repository does everything by magic via Github actions, writing its last pushed version to "version.txt".

### Updating

A [Github action](https://github.com/yetanotherchris/Choco-chromedriver/blob/master/.github/workflows/check-version-and-push.yml) checks https://googlechromelabs.github.io every four hours. 
If the version there doesn't match the one in version.txt then a new Chocolatey package is built.
