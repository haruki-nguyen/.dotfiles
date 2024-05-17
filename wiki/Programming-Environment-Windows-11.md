# Setting Up Programming Environments on Windows 11

> Note that Powershell must be run in Administrator mode.

First, install Chocolatey package manager for Windows:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Secondly, install these packages with Chocolatey:

- `arduino-cli`.
- `notepadplusplus`.
- `git`.
- `pandoc`: for using with Obsidian.

```powershell
choco install arduino-cli notepadplusplus git pandoc
```