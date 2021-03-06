#
# Chrome Enterprise x86 snapshot setup file
# https://github.com/turboapps/turbome/tree/master/google/chrome
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0

$rootDir = $(Get-Item $PSScriptRoot).Parent.FullName
. "$rootDir\Resources\shared_snapshot.ps1"

Download-Browser 'install.msi' 'en'
$tag = Get-Version '.\install.msi'

Write-Host "Chrome version $tag"
"google/chrome:$tag" | Set-Content "image.txt"

# Silent install arguments: /quiet
