@echo off

echo Attempting to delete the entire registry key "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\state"...

powershell -Command "Remove-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\bam\state' -Recurse -Force"

if %errorlevel% equ 0 (
    echo Successfully deleted the "state" registry key.
) else (
    echo Failed to delete the "state" registry key or it does not exist.
)

echo Querying the registry to check if "state" still exists...
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\state"

if %errorlevel% equ 0 (
    echo "state" still exists in the registry.
) else (
    echo "state" does not exist in the registry.
)

pause
