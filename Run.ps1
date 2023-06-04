# $cpuCores = (Get-WmiObject -Class Win32_ComputerSystem).NumberOfLogicalProcessors  # Number of total threads, not just physical cores
$cpuCores = (Get-WmiObject -Class Win32_Processor | Select-Object -Property NumberOfCores).NumberOfCores

# Create a PowerShell custom object with the CPU cores value
$cpuObject = [PSCustomObject]@{
    "cpu_cores" = $cpuCores
}

# Convert the custom object to JSON
$jsonContent = $cpuObject | ConvertTo-Json

# Save the JSON content to a file
$jsonContent | Out-File -FilePath "vagrant_config.json" -Encoding UTF8

vagrant up

Write-Host "Cleaning up..."
vagrant destroy -f
Remove-Item -Recurse .vagrant

Write-Host "WSA build done"
pause