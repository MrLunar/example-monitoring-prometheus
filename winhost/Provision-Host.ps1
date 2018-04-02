$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls11 -bor [System.Net.SecurityProtocolType]::Tls12
$url = "https://github.com/martinlindhe/wmi_exporter/releases/download/v0.2.10/wmi_exporter-0.2.10-amd64.msi"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, "$env:Temp\wmi_exporter-0.2.10-amd64.msi")

$p = Start-Process "msiexec.exe" "/i `"$env:Temp\wmi_exporter-0.2.10-amd64.msi`" /quiet" -Wait -PassThru
if ($p.ExitCode) {
    Write-Error "Error installing WMI Exporter..."
    exit 1
}


