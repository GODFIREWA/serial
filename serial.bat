@echo off
title by godfirewa
echo [Disk Serials]
wmic diskdrive get SerialNumber
echo.

echo [Disk VolumeID - C Drive Only]
wmic volume where "DriveLetter='C:'" get DriveLetter, SerialNumber
echo.

echo [SMBIOS]
wmic bios get SMBIOSBIOSVersion
echo.

echo [MotherBoard Serial]
wmic baseboard get SerialNumber
echo.

echo [MotherBoard UUID]
wmic csproduct get UUID
echo.

echo [MotherBoard IdentifyingNumber]
wmic baseboard get Product
echo.

echo [CPU Serial]
wmic cpu get ProcessorId
echo.

echo [Memory Serial]
wmic memorychip get SerialNumber
echo.

echo [TPM module]
wmic /namespace:\\root\CIMv2\Security\MicrosoftTpm path Win32_Tpm get IsEnabled_InitialValue, IsActivated_InitialValue
echo.

echo [Mac address]
wmic nic where "NetEnabled=True" get MACAddress
echo.

echo [Real-Time Protection State]
powershell -Command "Get-MpPreference | ForEach-Object {if ($_.DisableRealtimeMonitoring -eq $true) {Write-Output 'Real-Time Protection: Off'} else {Write-Output 'Real-Time Protection: On'}}"
echo.

pause
