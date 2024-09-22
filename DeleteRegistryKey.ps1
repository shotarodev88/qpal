$keyPath = 'HKLM:\SYSTEM\CurrentControlSet\Services\bam\state'

echo "Attempting to delete the entire registry key '$keyPath'..."

if (Test-Path $keyPath) {
    Remove-Item $keyPath -Recurse -Force
    echo "Successfully deleted the 'state' registry key."
} else {
    echo "The key does not exist."
}

# Query to check if the key still exists
if (Test-Path $keyPath) {
    echo "'state' still exists in the registry."
} else {
    echo "'state' does not exist in the registry."
}

pause
