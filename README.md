![CI status](https://github.com/yetanotherchris/Choco-chromedriver/actions/workflows/chocolatey.yml/badge.svg)

# Choco-chromedriver

> Developed in collaboration with the Chromium team, ChromeDriver is a standalone server which implements WebDriver's wire protocol.
> https://chocolatey.org/packages/chromedriver

This Chocolatey package downloads and installs the latest Chromedriver.

This repository does everything by magic via Github actions, writing its last pushed version to "version.txt".

### Updating

A [Github action](https://github.com/yetanotherchris/Choco-chromedriver/blob/master/.github/workflows/main.yml#L9) checks http://chromedriver.chromium.org/ every four hours. 
If the version there doesn't match the one in version.txt then a new Chocolatey package is built.
