<#
.SYNOPSIS
    Downloads and silently installs the latest version of Google Chrome from Google's official source.

.DESCRIPTION
    This script is designed to be packaged as an Intune Win32 app and deployed via Microsoft Endpoint Manager
    (Microsoft Intune) Company Portal. It fetches the most current Chrome installer directly from Google's
    official CDN URL, which always points to the latest available version. The installer runs silently
    with no user interaction required, and the installer file is cleaned up after installation.

    By using the dynamic Google CDN URL instead of a static versioned installer, this approach ensures
    that every device enrollment or app deployment always receives the latest secure version of Chrome,
    eliminating the need for manual Intune app updates each time a new Chrome version is released.

    Intended usage:
      - Install Command : powershell.exe -ExecutionPolicy Bypass -File InstallChrome.ps1
      - Uninstall Command: powershell.exe -ExecutionPolicy Bypass -File UninstallChrome.ps1
      - Detection Rule  : File or registry rule confirming chrome.exe presence in Program Files\Google\Chrome

.NOTES
    Author:      Souhaiel Morhag
    Company:     MSEndpoint.com
    Blog:        https://msendpoint.com
    Academy:     https://app.msendpoint.com/academy
    LinkedIn:    https://linkedin.com/in/souhaiel-morhag
    GitHub:      https://github.com/Msendpoint
    License:     MIT

.EXAMPLE
    # Run locally or via Intune Win32 install command:
    powershell.exe -ExecutionPolicy Bypass -File InstallChrome.ps1

.EXAMPLE
    # Run uninstall script via Intune Win32 uninstall command:
    powershell.exe -ExecutionPolicy Bypass -File UninstallChrome.ps1
#>

[CmdletBinding()]
param()

#region --- INSTALL SCRIPT ---

# Define the official Google CDN URL that always resolves to the latest Chrome installer
$chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"

# Define a temporary staging folder and full path for the downloaded installer
$installerFolder = "C:\Temp"
$installerPath   = Join-Path -Path $installerFolder -ChildPath "chrome_installer.exe"

try {
    # Ensure the temporary staging folder exists; create it silently if it does not
    if (-Not (Test-Path -Path $installerFolder)) {
        Write-Verbose "Staging folder '$installerFolder' not found. Creating it now."
        New-Item -ItemType Directory -Path $installerFolder -Force | Out-Null
    }

    # Download the latest Chrome installer from the official Google source
    Write-Verbose "Downloading Chrome installer from: $chromeInstallerUrl"
    Invoke-WebRequest -Uri $chromeInstallerUrl -OutFile $installerPath -UseBasicParsing

    # Verify the installer was downloaded successfully before proceeding
    if (-Not (Test-Path -Path $installerPath)) {
        throw "Installer download failed. File not found at '$installerPath'."
    }

    # Execute the Chrome installer silently with no user prompts
    Write-Verbose "Starting silent Chrome installation..."
    $process = Start-Process -FilePath $installerPath -ArgumentList "/silent /install" -Wait -PassThru

    if ($process.ExitCode -ne 0) {
        throw "Chrome installer exited with non-zero exit code: $($process.ExitCode)."
    }

    Write-Output "Google Chrome installed successfully."
}
catch {
    Write-Error "An error occurred during Chrome installation: $_"
    exit 1
}
finally {
    # Always attempt to clean up the installer file regardless of success or failure
    if (Test-Path -Path $installerPath) {
        Write-Verbose "Removing installer file: $installerPath"
        Remove-Item -Path $installerPath -Force -ErrorAction SilentlyContinue
    }
}

#endregion --- INSTALL SCRIPT ---
