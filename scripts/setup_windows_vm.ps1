# Blue Team Windows VM Setup Script
# Run as Administrator in PowerShell
# Usage: .\setup_windows_vm.ps1

Write-Host "Starting Blue Team Windows VM Setup..." -ForegroundColor Cyan

# 1. Sysmon
Write-Host "[1/4] Installing Sysmon..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://download.sysinternals.com/files/Sysmon.zip" -OutFile "C:\Sysmon.zip"
Expand-Archive -Path "C:\Sysmon.zip" -DestinationPath "C:\Sysmon" -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml" -OutFile "C:\Sysmon\sysmonconfig.xml"
C:\Sysmon\Sysmon64.exe -accepteula -i C:\Sysmon\sysmonconfig.xml

# 2. Splunk Universal Forwarder
Write-Host "[2/4] Installing Splunk Universal Forwarder..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://download.splunk.com/products/universalforwarder/releases/9.2.1/windows/splunkforwarder-9.2.1-78803f08aabb-x64-release.msi" -OutFile "C:\splunkforwarder.msi"
Start-Process msiexec.exe -ArgumentList '/i C:\splunkforwarder.msi SPLUNKUSERNAME=admin SPLUNKPASSWORD=TempPass123! AGREETOLICENSE=Yes /quiet' -Wait

# 3. Configure Splunk inputs
Write-Host "[3/4] Configuring Splunk inputs..." -ForegroundColor Yellow
$inputsConf = @"
[WinEventLog://Security]
index = windows
sourcetype = WinEventLog:Security
disabled = false

[WinEventLog://System]
index = windows
sourcetype = WinEventLog:System
disabled = false

[WinEventLog://Microsoft-Windows-Sysmon/Operational]
index = windows
sourcetype = XmlWinEventLog:Microsoft-Windows-Sysmon/Operational
disabled = false
renderXml = true

[WinEventLog://Windows PowerShell]
index = windows
sourcetype = WinEventLog:PowerShell
disabled = false
"@
$inputsConf | Out-File -FilePath "C:\Program Files\SplunkUniversalForwarder\etc\system\local\inputs.conf" -Encoding ASCII

# 4. Start forwarder
Write-Host "[4/4] Starting Splunk Forwarder..." -ForegroundColor Yellow
Start-Service SplunkForwarder
Set-Service SplunkForwarder -StartupType Automatic

Write-Host "Setup complete! Install splunkclouduf.spl credentials next." -ForegroundColor Green
Write-Host "Then create 'windows' index in Splunk Cloud." -ForegroundColor Green
