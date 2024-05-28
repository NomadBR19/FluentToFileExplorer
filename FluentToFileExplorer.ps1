# Define the path to Fluent Terminal executable
$fluentPath = "C:\Users\Matthieu\AppData\Local\Microsoft\WindowsApps\53621FSApps.FluentTerminal_87x1pks76srcp\flute.exe"
# Function to create registry key if it doesn't exist
function New-RegistryKey {
    param (
        [string]$keyPath
    )
    if (-not (Test-Path $keyPath)) {
        New-Item -Path $keyPath -Force | Out-Null
    }
}

# Function to set registry value
function Set-RegistryValue {
    param (
        [string]$keyPath,
        [string]$name,
        [string]$value
    )
    Set-ItemProperty -Path $keyPath -Name $name -Value $value -Force
}

# Define registry paths
$cmdKeyPath = "HKCU:\Software\Classes\Directory\Background\shell\FluentTerminal"
$commandKeyPath = "HKCU:\Software\Classes\Directory\Background\shell\FluentTerminal\command"
$folderCmdKeyPath = "HKCU:\Software\Classes\Directory\shell\FluentTerminal"
$folderCommandKeyPath = "HKCU:\Software\Classes\Directory\shell\FluentTerminal\command"

# Ensure registry keys exist
New-RegistryKey -keyPath $cmdKeyPath
New-RegistryKey -keyPath $commandKeyPath
New-RegistryKey -keyPath $folderCmdKeyPath
New-RegistryKey -keyPath $folderCommandKeyPath

# Set registry values to point to Fluent Terminal
Set-RegistryValue -keyPath $cmdKeyPath -name "(Default)" -value "Open Fluent Terminal Here"
Set-RegistryValue -keyPath $commandKeyPath -name "(Default)" -value "`"$fluentPath`""
Set-RegistryValue -keyPath $folderCmdKeyPath -name "(Default)" -value "Open Fluent Terminal Here"
Set-RegistryValue -keyPath $folderCommandKeyPath -name "(Default)" -value "`"$fluentPath`""

# Change the default shell for command prompt
$defaultCmdPath = "HKCU:\Software\Microsoft\Command Processor"
New-RegistryKey -keyPath $defaultCmdPath
Set-RegistryValue -keyPath $defaultCmdPath -name "AutoRun" -value ""

Write-Host "Fluent Terminal has been set as the default terminal for File Explorer."

# Just delete the RegisterKeys to set the CMD by default