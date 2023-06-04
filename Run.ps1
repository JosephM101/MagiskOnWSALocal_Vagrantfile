vagrant up

Write-Host "Cleaning up..."
vagrant destroy -f
Remove-Item -Recurse .vagrant

Write-Host "WSA build done"
pause